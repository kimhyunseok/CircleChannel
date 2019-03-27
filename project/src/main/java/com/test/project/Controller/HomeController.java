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
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project.Dto.CircleBean;
import com.test.project.Dto.CircleJoinBean;
import com.test.project.Dto.MenuBean;
import com.test.project.Dto.pagingBean;
import com.test.project.Service.CircleJoinService;
import com.test.project.Service.CircleService;
import com.test.project.Service.MenuService;
import com.test.project.Service.UserService;

/**
 * @패키지 com.test.project.Controller
 * @파일이름 HomeController.java
 * @작성자 KHS
 * @작성날짜 2018. 6. 20. 오후 7:39:20
 * @설명:
 */
@Controller
@SpringBootApplication
public class HomeController {
  
  private static Logger logger = LogManager.getLogger(HomeController.class);
  @Autowired
  private CircleService cService;
  @Autowired
  UserService service;
  @Autowired
  private MenuService MService;
  @Autowired
  private CircleJoinService CJService;
  private pagingBean test;
  private pagingBean page;
  
  /**
   * @메소드명 : index
   * @작성일 : 2018. 6. 20. 오후 7:54:19
   * @작성자 : KHS
   * @설명 :
   */
  @RequestMapping("/")
  public ModelAndView index(String name, ModelAndView model) {
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<CircleBean> list = cService.circle_mainList(map);
    model.addObject("list", list);
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.setViewName("index");
    return model;
  }
  
  /**
   * @메소드명:menu(HomeController.java)
   * @작성자:김현석
   * @작성일:2019. 3. 21.:오후 6:03:18
   * @작성일:
   */
  @RequestMapping("/include/menu")
  public ModelAndView menu(String name, ModelAndView model) {
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.setViewName("index");
    return model;
  }
  
  @RequestMapping("/main/UploadComplete")
  public ModelAndView test(HttpSession session) {
    logger.info("================memberUpdate Start=================");
    ModelAndView model = new ModelAndView();
    model.setViewName("main/UploadComplete");
    logger.info("================memberUpdate End=================");
    return model;
  }
  
  /**
   * @메소드명 : index
   * @작성일 : 2018. 6. 20. 오후 7:54:19
   * @작성자 : KHS
   * @설명 :
   */
  @RequestMapping("/main/Mycircle")
  public ModelAndView myCircle(HttpSession session, ModelAndView model, HttpServletRequest req, HttpServletResponse response) {
    logger.info("================memberUpdate Start=================");
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    HashMap<String, Object> map = new HashMap<String, Object>();
    String user_id = (String) session.getAttribute("ss_id");
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    // 1.비로그인시 검사 시작
    if (user_id == null) {
      try {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인해주세요.');</script>");
        out.println("<script>location.replace('http://localhost:8080/main/login')</script>");
        out.flush();
        return model;
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
      
    } else {
      
      int listCnt = cService.Circle_Cnt(map);
      // 전체리스트 개수
      int curNum = Integer.parseInt(req.getParameter("pageNum"));
      // 현재 페이지
      test = new pagingBean(listCnt, curNum, 12);
      map.put("start", test.getStartIndex());
      map.put("user", user_id);
      ArrayList<CircleBean> list = cService.MyCircleList(map);
      model.addObject("list", list);
      model.addObject("pagination", test);
      model.setViewName("main/Mycircle");
      model.addObject("title", "내 동아리관리");
    }
    // 1.비로그인시 검사 끝
    logger.info("================memberUpdate End=================");
    return model;
  }
  
  /**
   * @메소드명:AdminPage(HomeController.java)
   * @작성자:김현석
   * @작성일:2019. 3. 25.:오전 2:53:00
   * @작성일:
   */
  @RequestMapping("/admin")
  public ModelAndView AdminPage(String name, ModelAndView model) {
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.setViewName("admin/index");
    return model;
  }
  
  /**
   * @메소드명:ApplyPeopleList(HomeController.java)
   * @작성자:김현석
   * @작성일:2019. 3. 25.:오전 2:52:52
   * @작성일:
   */
  @RequestMapping("/main/ApplyPeopleList")
  public ModelAndView ApplyPeopleList(ModelAndView model, HttpServletRequest req) {
    logger.info("신청자리스트-시작");
    int circle_no = Integer.parseInt(req.getParameter("circle_no"));
    ArrayList<CircleJoinBean> list = CJService.CircleApply_list(circle_no);
    model.addObject("list", list);
    model.setViewName("main/ApplyPeopleList");
    logger.info("신청자리스트-끝");
    return model;
  }
  
  @ResponseBody
  
  @RequestMapping("/main/ApplyPeopleCancel.ajax")
  public HashMap<String, Object> loginChk(HttpServletRequest request) {
    logger.info("================Login Start=================");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String num = request.getParameter("CircleJoin_no");
    String circle_No = request.getParameter("circle_No");
    map.put("CircleJoin_no", num);
    map.put("circle_No", circle_No);
    CJService.CircleJoin_Cancel(map);
    logger.info(num);
    logger.info("================Login End=================");
    return map;
  }
}

/*
 * @ResponseBody
 * 
 * @RequestMapping("/LoginChk") public HashMap<String, Object> loginChk( HttpServletRequest request) { logger.info("================Login Start================="); HashMap<String, Object> map = new HashMap<String, Object>(); , logger.info("================Login End=================");
 * 
 * return map; }
 */
