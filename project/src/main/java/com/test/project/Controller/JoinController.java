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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
public class JoinController {
  /* NaverLoginBO */
  private static Logger logger = LogManager.getLogger(JoinController.class);
  @Autowired
  UserService service;
  @Autowired
  private MenuService MService;
  
  /**
   * @메소드명 : member
   * @작성일 : 2018. 7. 2. 오후 9:36:31
   * @작성자 : KHS
   * @설명 : 회원가입
   */
  @RequestMapping("/member")
  public ModelAndView member(String namel, HttpServletRequest request, UserBean bean) {
    logger.info("================member Start=================");
    ModelAndView model = new ModelAndView();
    // 1.메뉴불러오기
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    
    model.addObject("list", bean);
    model.addObject("user", 1);
    model.setViewName("main/member");
    model.addObject("title", "회원가입");
    logger.info("================member End=================");
    return model;
  }
  
  /**
   * @메소드명 : memberUpdate
   * @작성일 : 2018. 7. 2. 오후 9:36:11
   * @작성자 : KHS
   * @설명 : 회원정보수정
   */
  @RequestMapping("/memberUpdate")
  public ModelAndView memberUpdate(HttpSession session) {
    logger.info("================memberUpdate Start=================");
    ModelAndView model = new ModelAndView();
    // 1.메뉴불러오기
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.addObject("user", 2);
    model.setViewName("main/member");
    Object user_id = session.getAttribute("ss_id");
    UserBean user = service.SelectUserInfo(user_id.toString());
    model.addObject("user_info", user);
    model.addObject("title", "정보수정");
    logger.info("================memberUpdate End=================");
    return model;
  }
  
  /**
   * @메소드명 : joinChk
   * @작성일 : 2018. 6. 29. 오전 1:25:45
   * @작성자 : KHS
   * @설명 : 회원가입_idchk
   */
  @RequestMapping(value = "/IdChk.ajax", method = { RequestMethod.GET, RequestMethod.POST })
  @ResponseBody
  public HashMap<String, Object> IdChk(UserBean user, HttpServletRequest request) {
    logger.info("================IdChk Start=================");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String user_id = user.getUser_id();
    int idchk = service.UserCnt(user_id);
    map.put("idchk", idchk);
    logger.info("================IdChk End=================");
    return map;
  }
  
  /**
   * @메소드명 : userjoin
   * @작성일 : 2018. 7. 2. 오후 9:12:07
   * @작성자 : KHS
   * @설명 :
   */
  @RequestMapping(value = "/UserJoin", method = { RequestMethod.GET, RequestMethod.POST })
  public String userjoin(UserBean user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    logger.info("================userjoin Start=================");
    service.UserJoin(user);
    session.setAttribute("ss_id", user.getUser_id());
    session.setAttribute("ss_nm", user.getUser_nm());
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out;
    try {
      out = response.getWriter();
      out.println("<script>alert('계정이 등록 되었습니다');</script>");
      out.flush();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    logger.info("================userjoin End=================");
    return "index";
  }
  
  /**
   * @메소드명 : userUpdate
   * @작성일 : 2018. 7. 2. 오후 9:12:20
   * @작성자 : KHS
   * @설명 :
   */
  @RequestMapping(value = "/UserUpdate", method = { RequestMethod.GET, RequestMethod.POST })
  public ModelAndView userUpdate(UserBean user, HttpServletRequest request) {
    logger.info("================userUpdate Start=================");
    ModelAndView model = new ModelAndView();
    model.setViewName("redirect:http://localhost:8080/");
    service.UserUpdate(user);
    model.addObject("title", "정보수정");
    logger.info("================userUpdate End=================");
    return model;
  }
}
