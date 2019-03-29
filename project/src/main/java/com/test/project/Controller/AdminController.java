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

import com.test.project.Dto.MenuBean;
import com.test.project.Dto.UserBean;
import com.test.project.Dto.pagingBean;
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
public class AdminController {
  
  private static Logger logger = LogManager.getLogger(AdminController.class);
  private pagingBean test;
  @Autowired
  private UserService UService;
  @Autowired
  private MenuService MService;
  
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
  
}

/*
 * @ResponseBody
 * 
 * @RequestMapping("/LoginChk") public HashMap<String, Object> loginChk( HttpServletRequest request) { logger.info("================Login Start================="); HashMap<String, Object> map = new HashMap<String, Object>(); , logger.info("================Login End=================");
 * 
 * return map; }
 */
