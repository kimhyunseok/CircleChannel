/**
 * 1. 프로젝트명 : test
 * 2. 패키지명(또는 디렉토리 경로) : com.test.project.Controller
 * 3. 파일명 : LoginController.java
 * 4. 작성일 : 2018. 6. 26. 오후 5:46:20
 * 5. 작성자 : KHS
 * 6. 설명 :
 */

package com.test.project.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.test.project.NaverLoginBO;
import com.test.project.Dto.MenuBean;
import com.test.project.Dto.UserBean;
import com.test.project.Service.MenuService;
import com.test.project.Service.UserService;

/**
 * @패키지 com.test.project.Controller
 * @파일이름 LoginController.java
 * @작성자 KHS
 * @작성날짜 2018. 6. 26. 오후 5:46:20
 * @설명:
 */
@Controller
public class LoginController {
  /* NaverLoginBO */
  private NaverLoginBO naverLoginBO;
  private static Logger logger = LogManager.getLogger(LoginController.class);
  String apiResult = null;
  @Autowired
  UserService service;
  @Autowired
  private MenuService MService;
  
  @Autowired
  private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
    this.naverLoginBO = naverLoginBO;
  }
  
  /**
   * @메소드명 : login
   * @작성일 : 2018. 6. 28. 오후 10:06:25
   * @작성자 : KHS
   * @설명 :
   */
  @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
  public ModelAndView login(ModelAndView model, HttpSession session) {
    logger.info("================login Start=================");
    /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
    String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
    System.out.println("네이버:" + naverAuthUrl);
    // 네이버
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.addObject("url", naverAuthUrl);
    model.setViewName("main/Login");
    /* 생성한 인증 URL을 View로 전달 */
    return model;
  }
  
  /**
   * 
   * @메소드명 : loginChk
   * @작성일 : 2018. 6. 20. 오후 7:54:59
   * @작성자 : KHS
   * @설명 : login check
   */
  @ResponseBody
  @RequestMapping("/LoginChk.ajax")
  public HashMap<String, Object> loginChk(UserBean user, HttpServletRequest request) {
    logger.info("================Login Start=================");
    final int LOGIN_ID_FAIL = 3;
    final int LOGIN_PW_FAIL = 4;
    final Boolean LOGIN_SUCCESS = true;
    final Boolean LOGIN_FAIL = false;
    
    String user_id = user.getUser_id();
    String user_nm = user.getUser_nm();
    String user_pw = user.getUser_pw();
    HttpSession session = request.getSession();
    HashMap<String, Object> map = new HashMap<String, Object>();
    
    if (user_id.equals("") && user_id.isEmpty() == true) {
      map.put("chk", LOGIN_ID_FAIL);
    } else if (user_pw.equals("") && user_pw.isEmpty() == true) {
      map.put("chk", LOGIN_PW_FAIL);
    } else {
      int loginChk = service.LoginChk(user);
      if (loginChk == 1) {/* 로그인 성공시 */
        session.setAttribute("ss_id", user_id);
        session.setAttribute("ss_nm", user_nm);
        map.put("chk", LOGIN_SUCCESS);
      } else {
        map.put("chk", LOGIN_FAIL);
      }
    }
    logger.info("================Login End=================");
    return map;
  }
  
  /**
   * @메소드명 : loginOut
   * @작성일 : 2018. 6. 28. 오후 9:16:42
   * @작성자 : KHS
   * @설명 : 로그아웃시
   */
  @RequestMapping("/logout")
  public ModelAndView loginOut(HttpServletRequest request, HttpSession session, ModelAndView model) {
    session = request.getSession();
    session.removeAttribute("ss_id");
    session.removeAttribute("ss_nm");
    model.setViewName("redirect:http://localhost:8080/");
    return model;
  }
  
  /**
   * @메소드명 : callback
   * @작성일 : 2018. 6. 28. 오후 9:16:49
   * @작성자 : KHS
   * @설명 : 네이버 로그인처리
   */
  @RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
  public ModelAndView callback(ModelAndView model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
    logger.info("================callback Start=================");
    UserBean user = new UserBean();
    OAuth2AccessToken oauthToken;
    oauthToken = naverLoginBO.getAccessToken(session, code, state);
    // 로그인 사용자 정보를 읽어온다.
    apiResult = naverLoginBO.getUserProfile(oauthToken);
    JsonParser parser = new JsonParser();
    JsonElement element = parser.parse(apiResult);
    HashMap<String, Object> map = new HashMap<String, Object>();
    String msg = element.getAsJsonObject().get("message").getAsString();
    JsonObject list = element.getAsJsonObject().get("response").getAsJsonObject();
    String nick = list.get("nickname").getAsString();
    String name = list.get("name").getAsString();
    String id = "Uid_" + list.get("id").getAsString();
    String email = list.get("email").getAsString();
    int idx = email.indexOf("@");
    String mail1 = email.substring(0, idx);
    String mail2 = email.substring(idx + 1);
    logger.info(id);
    int idchk = service.UserCnt(id);
    if (idchk != 0) {
      if (msg.equals("success")) {
        logger.info("success");
        session.setAttribute("ss_nm", nick);
        session.setAttribute("ss_id", id);
        model.setViewName("index");
      }
    } else {
      UserBean bean = new UserBean();
      model.addObject("user", 1);
      map.put("user_nm", name);
      map.put("user_id", id);
      map.put("user_email_1", mail1);
      map.put("user_email_2", mail2);
      model.addObject("list", map);
    }
    model.setViewName("redirect:http://localhost:8080/member");
    
    return model;
  }
}
