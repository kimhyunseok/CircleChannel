package com.test.project.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.project.Dto.CircleBean;
import com.test.project.Dto.CodeBean;
import com.test.project.Dto.MenuBean;
import com.test.project.Dto.SlideBean;
import com.test.project.Dto.UserBean;
import com.test.project.Dto.pagingBean;
import com.test.project.Service.CircleService;
import com.test.project.Service.CodeService;
import com.test.project.Service.MenuService;
import com.test.project.Service.SlideService;
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
public class AdminController {
  
  private static Logger logger = LogManager.getLogger(AdminController.class);
  private pagingBean test;
  @Autowired
  private UserService UService;
  @Autowired
  private MenuService MService;
  @Autowired
  private CircleService cService;
  @Autowired
  private CodeService CodeService;
  @Autowired
  private SlideService SService;
  
  /**
   * @메소드명:Admin_UserList(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:45
   * @작성일:
   */
  @RequestMapping("admin/UserList")
  public ModelAndView Admin_UserList(HttpServletRequest request, HttpServletResponse response) {
    logger.info("UserList-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<UserBean> list = UService.User_List(map);
    model.addObject("list", list);
    model.addObject("title", "회원관리");
    model.setViewName("admin/UserList");
    logger.info("UserList-End");
    return model;
  }
  
  /**
   * @메소드명:UserDelete(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:42
   * @작성일:
   */
  @ResponseBody
  @RequestMapping("admin/UserDelete.ajax")
  public HashMap<String, Object> UserDelete(HttpServletRequest request, HttpServletResponse response) {
    logger.info("UserList-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("user_id", request.getParameter("User_id"));
    UService.User_Delete(map);
    
    model.setViewName("admin/UserList");
    
    logger.info("UserList-End");
    return map;
  }
  
  /**
   * @메소드명:Admin_MenuList(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:39
   * @작성일:
   */
  @RequestMapping("admin/MenuList")
  public ModelAndView Admin_MenuList(HttpServletRequest request, HttpServletResponse response) {
    logger.info("UserList-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<MenuBean> list = MService.menu_List();
    ArrayList<MenuBean> sublist = MService.menu_SubList();
    model.addObject("list", list);
    model.addObject("sublist", sublist);
    model.addObject("title", "메뉴관리");
    model.setViewName("admin/MenuList");
    logger.info("UserList-End");
    return model;
  }
  
  /**
   * @메소드명:Menu_Insert(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:36
   * @작성일:
   */
  @RequestMapping("admin/Menu_Insert")
  public ModelAndView Menu_Insert(HttpServletRequest request, HttpServletResponse response) {
    logger.info("Menu_Insert-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    model.addObject("title", "메뉴등록");
    model.setViewName("admin/Menu_Insert");
    logger.info("Menu_Insert-End");
    return model;
  }
  
  /**
   * @메소드명:Menu_InsertOk1(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:32
   * @작성일:
   */
  @ResponseBody
  @RequestMapping("admin/Menu_InsertOk.ajax")
  public HashMap<String, Object> Menu_InsertOk1(HttpServletRequest request, MenuBean bean) {
    logger.info("Menu_InsertOk-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("bean", bean);
    MService.Menu_SubInsertOk(map);
    logger.info("Menu_InsertOk-start");
    return map;
  }
  
  /**
   * @메소드명:Menu_Delete(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:28
   * @작성일:
   */
  @ResponseBody
  @RequestMapping("admin/Menu_Delete.ajax")
  public HashMap<String, Object> Menu_Delete(HttpServletRequest request, MenuBean bean) {
    logger.info("Menu_InsertOk-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("bean", bean);
    
    logger.info(map.toString());
    MService.Menu_Delete(map);
    logger.info("Menu_InsertOk-start");
    return map;
  }
  
  /**
   * @메소드명:Menu_Insert(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:26
   * @작성일:
   */
  @RequestMapping("admin/Menu_insert")
  public ModelAndView Menu_Insert(HttpServletRequest request, MenuBean bean, ModelAndView model) {
    logger.info("Menu_InsertOk-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
    String[] menu_nm = bean.getMenu_nm().split(",");
    String[] menu_code1 = bean.getMenu_code1().split(",");
    String[] menu_icon = bean.getMenu_icon().split(",");
    for (int i = 0; i < menu_nm.length; i++) {
      HashMap<String, Object> map1 = new HashMap<String, Object>();
      map1.put("menu_nm", menu_nm[i]);
      map1.put("menu_code1", menu_code1[i]);
      map1.put("menu_icon", menu_icon[i]);
      list.add(map1);
    }
    logger.info(">>>>>>>>" + list.toString());
    MService.Menu_Insert(list);
    model.setViewName("redirect:http://localhost:8080/admin/MenuList");
    logger.info("Menu_InsertOk-start");
    return model;
  }
  
  /**
   * @메소드명:Menu_Insert(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:36
   * @작성일:
   */
  @RequestMapping("admin/SlideList")
  public ModelAndView Main_slide(HttpServletRequest request, HttpServletResponse response) {
    logger.info("Menu_Insert-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    
    ArrayList<SlideBean> list = SService.Slide_List(map);
    model.addObject("list", list);
    model.addObject("title", "메뉴등록");
    model.setViewName("admin/SlideList");
    logger.info("Menu_Insert-End");
    return model;
  }
  
  @RequestMapping("admin/Slide_insert")
  public ModelAndView Slide_insert(HttpServletRequest request, HttpServletResponse response, SlideBean bean) {
    logger.info("Slide_insert-start");
    ModelAndView model = new ModelAndView();
    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
    String[] circle_no = bean.getCircle_No().split(",");
    String[] slide_No = bean.getSlide_No().split(",");
    for (int i = 0; i < circle_no.length; i++) {
      HashMap<String, Object> map1 = new HashMap<String, Object>();
      map1.put("circle_no", circle_no[i]);
      map1.put("slide_No", slide_No[i]);
      list.add(map1);
    }
    logger.info(list.toString());
    SService.Slide_Insert(list);
    model.addObject("title", "메뉴등록");
    model.setViewName("redirect:http://localhost:8080/admin/SlideList");
    logger.info("Menu_Insert-End");
    return model;
  }
  
  @ResponseBody
  @RequestMapping("admin/Slide_insert.Ajax")
  public HashMap<String, Object> Slide_insert_Ajax(HttpServletRequest request, HttpServletResponse response, SlideBean bean) {
    logger.info("Slide_insert-start");
    ModelAndView model = new ModelAndView();
    ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
    String[] circle_no = bean.getCircle_No().split(",");
    HashMap<String, Object> map = new HashMap<String, Object>();
    for (int i = 0; i < circle_no.length; i++) {
      HashMap<String, Object> map1 = new HashMap<String, Object>();
      map1.put("circle_no", circle_no[i]);
      list.add(map1);
    }
    
    SService.Slide_Insert(list);
    model.addObject("title", "메뉴등록");
    model.setViewName("admin/Slide_insert");
    logger.info("Menu_Insert-End");
    return map;
  }
  
  @ResponseBody
  @RequestMapping("admin/Slide_Delete.Ajax")
  public HashMap<String, Object> Slide_Delete(HttpServletRequest request, HttpServletResponse response, SlideBean bean) {
    logger.info("Slide_insert-start");
    ModelAndView model = new ModelAndView();
    
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("slide_No", bean.getSlide_No());
    SService.Slide_Delete(map);
    model.addObject("title", "메뉴등록");
    model.setViewName("admin/Slide_insert");
    logger.info("Menu_Insert-End");
    return map;
  }
  
  /**
   * @메소드명:WCircleList(AdminController.java)
   * @작성자:김현석
   * @작성일:2019. 4. 2.:오전 1:40:36
   * @작성일:
   */
  @RequestMapping("admin/WCircleList")
  public ModelAndView WCircleList(HttpServletRequest request, HttpServletResponse response) {
    logger.info("Menu_Insert-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    // 0.코드불러오기-시작
    map.put("Kind", 1);
    ArrayList<CodeBean> code1 = CodeService.Code_List(map);
    map.put("Kind", 2);
    ArrayList<CodeBean> code2 = CodeService.Code_List(map);
    // 0.코드불러오기-끝
    
    // 동이리목록{
    int listCnt = cService.Circle_Cnt(map);
    map.put("List_chk", "All");
    ArrayList<CircleBean> list = cService.Circle_List(map);
    // }
    model.addObject("code1", code1);
    model.addObject("code2", code2);
    model.addObject("list", list);
    model.addObject("title", "메뉴등록");
    model.setViewName("admin/WCircleList");
    logger.info("Menu_Insert-End");
    return model;
  }
  
}

/*
 * @ResponseBody
 * 
 * @RequestMapping("/LoginChk") public HashMap<String, Object> loginChk( HttpServletRequest request) { logger.info("================Login Start================="); HashMap<String, Object> map = new HashMap<String, Object>(); , logger.info("================Login End=================");
 * 
 * return map; }
 */
