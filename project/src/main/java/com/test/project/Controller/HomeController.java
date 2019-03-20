package com.test.project.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.test.project.Dto.MenuBean;
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
  UserService service;
  @Autowired
  private MenuService MService;
  
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
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.setViewName("index");
    return model;
  }
  
  @RequestMapping("include/menu")
  public ModelAndView menu(String name, ModelAndView model) {
    logger.info("Menu_start 시작");
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("list", menu);
    model.addObject("Slist", Smenu);
    model.setViewName("include/menu");
    logger.info("Menu_start 끝");
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
  
}

/*
 * @ResponseBody
 * 
 * @RequestMapping("/LoginChk") public HashMap<String, Object> loginChk( HttpServletRequest request) { logger.info("================Login Start================="); HashMap<String, Object> map = new HashMap<String, Object>();
 * 
 * logger.info("================Login End=================");
 * 
 * return map; }
 */
