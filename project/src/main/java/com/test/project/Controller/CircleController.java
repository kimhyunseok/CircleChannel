package com.test.project.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.Marker;
import org.apache.logging.log4j.MarkerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.test.project.CommonMathod.CFileUploadMathod;
import com.test.project.Dto.CircleBean;
import com.test.project.Dto.CircleGroupBean;
import com.test.project.Dto.CircleReplyBean;
import com.test.project.Dto.CodeBean;
import com.test.project.Dto.FileBean;
import com.test.project.Dto.MenuBean;
import com.test.project.Dto.pagingBean;
import com.test.project.Service.CircleGroupService;
import com.test.project.Service.CircleService;
import com.test.project.Service.CodeService;
import com.test.project.Service.FileService;
import com.test.project.Service.MenuService;

/**
 * @패키지 com.test.project.Controller
 * @파일이름 CircleController.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 12:06:57
 * @설명:동아리 컨트롤러
 */

@Controller
public class CircleController {
  private static Logger logger = LogManager.getLogger(CircleController.class);
  private static final Marker GENERAL_USER = MarkerManager.getMarker("GENERAL");
  @Autowired
  private FileService service;
  @Autowired
  private CircleService cService;
  @Autowired
  CircleGroupService CGService;
  @Autowired
  private CFileUploadMathod method = new CFileUploadMathod();
  @Autowired
  private CodeService CodeService;
  @Autowired
  private MenuService MService;
  
  private pagingBean test;
  
  /**
   * @메소드명 : Cricle
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :동아리리스트
   */
  @RequestMapping("circle/circleList")
  public ModelAndView circleList(HttpServletRequest req) {
    logger.info("동아리리스트-start");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<CircleBean> list;
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    
    int listCnt = cService.Circle_Cnt();
    // 전체리스트 개수
    int curNum = Integer.parseInt(req.getParameter("pageNum"));
    // 현재 페이지
    test = new pagingBean(listCnt, curNum, 12);
    map.put("start", test.getStartIndex());
    list = cService.Circle_List(map);
    model.addObject("list", list);
    model.addObject("pagination", test);
    model.setViewName("circle/circleList");
    model.addObject("title", "동아리목록");
    logger.info("동아리리스트-end");
    return model;
  }
  
  /**
   * @메소드명 : circleInsert
   * @작성일 : 2018. 7. 3. 오후 7:15:42
   * @작성자 : KHS
   * @설명 :동아리등록
   */
  @RequestMapping("circle/circleInsert")
  public ModelAndView circleInsert(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView model = new ModelAndView();
    logger.info("circleInsert-start");
    ArrayList<CodeBean> list = CodeService.Code_List();
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    model.setViewName("circle/circleInsert");
    model.addObject("list", list);
    model.addObject("title", "동아리개설");
    logger.info("circleInsert-End");
    return model;
  }
  
  /**
   * @메소드명 : circleInsert_ok
   * @작성일 : 2018. 8. 17. 오전 12:40:21
   * @작성자 : KHS
   * @설명 :동아리 등록처리
   */
  @RequestMapping("circle/circleInsert_ok")
  public ModelAndView circleInsert_ok(HttpSession session, HttpServletRequest request, HttpServletResponse response, @ModelAttribute("CircleBean") CircleBean bean, @ModelAttribute("CircleGroupBean") CircleGroupBean cgbean, @RequestParam(value = "logo", required = false) MultipartFile img) {
    logger.info("동아리등록처리-start");
    ArrayList<HashMap<String, Object>> glist = new ArrayList<HashMap<String, Object>>();
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    String user_id = "";
    // 1.아이디불러오기
    user_id = (String) session.getAttribute("ss_id");
    // 2.파일저장
    map = method.file_upload(img, response, request, "circle");
    FileBean FBean = (FileBean) map.get("vo");
    bean.setFile_no(FBean.getFile_no());
    bean.setUser_id(user_id);
    // 3.동아리저장
    cService.Circle_insert(bean);
    int circle_no = bean.getCircle_No();
    logger.info(cgbean.toString());
    String c_group1[] = cgbean.getC_groupTitle().split(",");
    String c_group2[] = cgbean.getC_groupCnt().split(",");
    String c_group3[] = cgbean.getC_groupPay().split(",");
    
    if (c_group3 != null) {
      for (int i = 0; i < c_group1.length; i++) {
        HashMap<String, Object> map1 = new HashMap<String, Object>();
        map1.put("circle_no", circle_no);
        map1.put("c_groupTitle", c_group1[i]);
        map1.put("c_groupCnt", c_group2[i]);
        map1.put("c_groupPay", c_group3[i]);
        map1.put("c_group_PFchk", cgbean.getC_group_PFchk());
        glist.add(map1);
        logger.info(">>>>>>>>" + glist.toString());
      }
    } else {
      for (int i = 0; i < c_group1.length; i++) {
        HashMap<String, Object> map1 = new HashMap<String, Object>();
        map1.put("circle_no", circle_no);
        map1.put("c_groupTitle", c_group1[i]);
        map1.put("c_groupCnt", c_group2[i]);
        map1.put("c_group_PFchk", cgbean.getC_group_PFchk());
        glist.add(map1);
        logger.info(">>>>>>>>" + glist.toString());
      }
    }
    
    logger.warn("Just testing a log message with priority set to WARN");
    CGService.CircleGroup_ins(glist);
    logger.warn("Just testing a log message with priority set to WARN");
    
    try {
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('동아리를 등록되었습니다.');</script>");
      out.println("<script>location.replace('http://localhost:8080/circle/circleList?pageNum=1')</script>");
      out.flush();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    model.setViewName("redirect:http://localhost:8080/circle/circleList?pageNum=1");
    logger.info("동아리등록처리-finish");
    return model;
  }
  
  /**
   * @메소드명 : circleView
   * @작성일 : 2018. 7. 3. 오후 7:15:42
   * @작성자 : KHS
   * @설명 :동아리등록
   */
  @RequestMapping("circle/circleView")
  public ModelAndView circleView(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
    logger.info("circleView-시작");
    ModelAndView model = new ModelAndView();
    
    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    String user_id = (String) session.getAttribute("ss_id");
    if (user_id == null) {
      try {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인해주세요.');</script>");
        out.println("<script>location.replace('http://localhost:8080/circle/circleList?pageNum=1')</script>");
        out.flush();
        return model;
      } catch (IOException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    } else {
      model.addObject("title", "이벤트목록");
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("pageNum", pageNum);
      CircleBean view = cService.Circle_View(map);
      ArrayList<CircleGroupBean> glist = CGService.CircleGroup_List(map);
      logger.info(glist.toString());
      ArrayList<CircleReplyBean> RView = cService.Circle_ReplyView(map);
      model.addObject("glist", glist);
      model.addObject("view", view);
      model.addObject("RView", RView);
      model.setViewName("redirect:http://localhost:8080/circle/circleList?pageNum=1");
      logger.info("circleInsert-끝");
    }
    ArrayList<MenuBean> menu = MService.menu_List();
    ArrayList<MenuBean> Smenu = MService.menu_SubList();
    model.addObject("menu", menu);
    model.addObject("Smenu", Smenu);
    return model;
  }
  
  /**
   * @메소드명 : circleReply_Insert
   * @작성일 : 2019. 3. 15. 오후 11:11:31
   * @작성자 : 김현석
   * @설명 :
   */
  @ResponseBody
  @RequestMapping("circle/circleReply_Ins")
  public HashMap<String, Object> circleReply_Insert(HttpSession session, CircleReplyBean bean, HttpServletRequest request, HttpServletResponse response) {
    logger.info("circleReply_Insert-시작");
    ModelAndView model = new ModelAndView();
    HashMap<String, Object> map = new HashMap<String, Object>();
    logger.info(bean.toString());
    String user_id = (String) session.getAttribute("ss_id");
    
    map.put("bean", bean);
    map.put("user_id", user_id);
    cService.Circle_Reply_Ins(map);
    logger.info("circleReply_Insert-끝");
    return map;
  }
  
  /**
   * @메소드명 : imgUpload
   * @작성일 : 2018. 8. 12. 오후 12:06:59
   * @작성자 : KHS
   * @설명 : 이미지업로드
   */
  @ResponseBody
  @RequestMapping(value = "/img_upload")
  public HashMap<String, Object> imgUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile img) {
    HashMap<String, Object> map = method.edtImg_Upload(img, response, request, "circle");
    FileBean bean = (FileBean) map.get("vo");
    logger.info("----------chkEditor_이미지등록" + bean.toString() + "-------------");
    service.file_Insert(bean);
    return map;
  }
  
  /**
   * @throws UnsupportedEncodingException
   * @메소드명 : mapPosition
   * @작성일 : 2018. 8. 16. 오후 9:53:52
   * @작성자 : KHS
   * @설명 :맵 경도위도 얻는 api
   */
  @ResponseBody
  @RequestMapping(value = "/mapPosition_ajax")
  public HashMap<String, Object> mapPosition(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
    HashMap<String, Object> map = new HashMap<String, Object>();
    StringBuilder html = new StringBuilder();
    String addr = request.getParameter("address");
    String url = "https://openapi.naver.com/v1/map/geocode?query=" + URLEncoder.encode(addr, "UTF-8");
    String clientId = "30acVBn_RNTBZdDAcwhu";
    String clientSecret = "Si1F3zLXWa";
    HttpClient client = HttpClientBuilder.create().build();
    HttpGet request1 = new HttpGet(url);
    request1.addHeader("X-Naver-Client-Id", clientId); // 해더에 Clinet Id와 Client Secret을 넣습니다
    request1.addHeader("X-Naver-Client-Secret", clientSecret);
    try {
      HttpResponse response1 = client.execute(request1);
      BufferedReader reader = new BufferedReader(new InputStreamReader(response1.getEntity().getContent(), "UTF-8"));
      String current = "";
      while ((current = reader.readLine()) != null) {
        html.append(current);
      }
      reader.close();
    } catch (ClientProtocolException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    map.put("map", html.toString());
    return map;
  }
}
