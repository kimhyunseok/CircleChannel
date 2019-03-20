package com.test.project.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.test.project.CommonMathod.CFileUploadMathod;
import com.test.project.Dto.BRelplyBean;
import com.test.project.Dto.BoardBean;
import com.test.project.Dto.FileBean;
import com.test.project.Dto.pagingBean;
import com.test.project.Service.BReplyService;
import com.test.project.Service.BoardService;
import com.test.project.Service.FileService;

/**
 * @패키지 com.test.project.Controller
 * @파일이름 BoardController.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 12:06:57
 * @설명:동아리 컨트롤러
 */

/**
 * @패키지 com.test.project.Controller
 * @파일이름 BoardController.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 10. 오후 10:11:38
 * @설명:
 */

@Controller
public class BoardController {
  private static Logger logger = LogManager.getLogger(BoardController.class);
  @Autowired
  private BoardService BSevice;
  @Autowired
  private BReplyService BReSevice;
  
  private CFileUploadMathod method;
  private ModelAndView model = new ModelAndView();
  private pagingBean test;
  @Autowired
  private FileService Fservice;
  
  /**
   * @메소드명 : eventList
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트목록
   */
  @RequestMapping("board/event/eventList")
  public ModelAndView eventList(HttpServletRequest req) {
    logger.info("이벤트목록-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    ArrayList<BoardBean> list;
    int listCnt = BSevice.board_Cnt("tb_event_board");
    // 전체리스트 개수
    int curNum = Integer.parseInt(req.getParameter("pageNum"));
    test = new pagingBean(listCnt, curNum);
    map.put("db_table", "tb_event_board");
    map.put("start", test.getStartIndex());
    list = BSevice.board_List(map);
    model.setViewName("board/event/eventList");
    model.addObject("pagination", test);
    model.addObject("list", list);
    model.addObject("title", "이벤트목록");
    logger.info("이벤트목록-end");
    return model;
  }
  
  /**
   * @메소드명 : eventView
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트보기
   */
  @RequestMapping("board/event/eventView")
  public ModelAndView eventView(HttpServletResponse rep, HttpServletRequest req) {
    logger.info("이벤트보기-start");
    String pageNum = req.getParameter("pageNum");
    HashMap<String, Object> map1 = new HashMap<String, Object>();
    HashMap<String, Object> map2 = new HashMap<String, Object>();
    BoardBean view = null;
    FileBean bean = null;
    map1.put("db_table", "tb_event_board");
    map1.put("board_No", pageNum);
    view = BSevice.board_View(map1);
    bean = Fservice.file_Select(view.getBoard_fileNo());
    
    map2.put("db_table", "tb_event_board_reply");
    map2.put("board_No", pageNum);
    ArrayList<BRelplyBean> list = BReSevice.reply_List(map2);
    
    model.setViewName("board/event/eventView");
    model.addObject("title", "이벤트보기");
    model.addObject("View", view);
    model.addObject("Reply", list);
    model.addObject("File", bean);
    logger.info("이벤트보기-end");
    return model;
  }
  
  /**
   * @메소드명 : eventReply_Ins
   * @작성일 : 2019. 3. 10. 오후 10:11:48
   * @작성자 : 김현석
   * @설명 :
   */
  @ResponseBody
  @RequestMapping("board/event/eventReply_Ins.ajax")
  public HashMap<String, Object> eventReply_Ins(HttpServletResponse rep, HttpServletRequest request, @RequestParam(value = "content") String content) {
    logger.info("이벤트댓글-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String board_no = request.getParameter("board_no");
    map.put("board_no", board_no);
    map.put("db_table", "tb_event_board_reply");
    map.put("board_content", content);
    BReSevice.reply_Insert(map);
    
    // map.put("content", "succes");
    logger.info("이벤트댓글-end");
    return map;
  }
  
  /**
   * @메소드명 : eventReReply_Ins
   * @작성일 : 2019. 3. 10. 오후 10:11:48
   * @작성자 : 김현석
   * @설명 :
   */
  @ResponseBody
  @RequestMapping("board/event/eventReReply_Ins.ajax")
  public HashMap<String, Object> eventReReply_Ins(HttpServletResponse rep, HttpServletRequest request, BRelplyBean bean) {
    logger.info("이벤트댓글-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String board_no = request.getParameter("board_no");
    String board_level = request.getParameter("board_level");
    String reply_no = request.getParameter("reply_no");
    
    map.put("board_no", bean.getBoard_no());
    map.put("reply_no", bean.getReply_no());
    map.put("db_table", "tb_event_board_reply");
    map.put("reply_content", bean.getReply_content());
    int max = BReSevice.reply_max(map);
    map.put("reply_level", BReSevice.reply_max(map));
    BReSevice.Rereply_Insert(map);
    
    // map.put("content", "succes");
    logger.info("이벤트댓글-end");
    return map;
  }
  
  /**
   * @메소드명 : eventReReply_Udt
   * @작성일 : 2019. 3. 10. 오후 10:11:48
   * @작성자 : 김현석
   * @설명 :
   */
  @ResponseBody
  @RequestMapping("board/event/Reply_Upt.ajax")
  public HashMap<String, Object> Reply_Udt(HttpServletResponse rep, HttpServletRequest request, BRelplyBean bean) {
    logger.info("이벤트댓글-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    
    String reply_no = request.getParameter("reply_no");
    
    map.put("reply_no", bean.getReply_no());
    map.put("db_table", "tb_event_board_reply");
    map.put("reply_content", bean.getReply_content());
    BReSevice.reply_upt(map);
    
    // map.put("content", "succes");
    logger.info("이벤트댓글-end");
    return map;
  }
  
  /**
   * @메소드명 : Reply_Del
   * @작성일 : 2019. 3. 10. 오후 10:11:48
   * @작성자 : 김현석
   * @설명 :
   */
  @ResponseBody
  @RequestMapping("board/event/Reply_Del.ajax")
  public HashMap<String, Object> Reply_Del(HttpServletResponse rep, HttpServletRequest request, BRelplyBean bean) {
    logger.info("이벤트댓글-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String reply_no = request.getParameter("reply_no");
    String del_type = request.getParameter("del_type");
    map.put("reply_no", bean.getReply_no());
    map.put("db_table", "tb_event_board_reply");
    map.put("reply_content", bean.getReply_content());
    map.put("del_type", del_type);
    logger.info(">>>>>>>>>>>>>" + map.toString());
    BReSevice.reply_del(map);
    // map.put("content", "succes");
    logger.info("이벤트댓글-end");
    return map;
  }
  
  /**
   * @메소드명 : eventInsert
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트등록페이지
   */
  @RequestMapping("board/event/eventInsert")
  public ModelAndView eventInsert(HttpServletResponse rep, HttpServletRequest req) {
    logger.info("이벤트등록페이지-start");
    model.addObject("title", "이벤트등록");
    model.setViewName("board/event/eventInsert");
    logger.info("이벤트등록페이지-end");
    return model;
  }
  
  /**
   * @메소드명 : eventInsert_ok
   * @작성일 : 2018. 8. 18. 오전 12:31:54
   * @작성자 : KHS
   * @설명 : 이벤트등록처리
   */
  @RequestMapping("board/event/eventInsert_ok")
  public ModelAndView eventInsert_ok(ModelAndView model, HttpServletResponse rep, HttpServletRequest req, @ModelAttribute("BoardBean") BoardBean bean) {
    logger.info("이벤트등록처리-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    HashMap<String, Object> filemap = new HashMap<String, Object>();
    MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
    Iterator<String> iterator = mhsr.getFileNames();
    MultipartFile multipartFile = null;
    while (iterator.hasNext()) {
      multipartFile = mhsr.getFile(iterator.next());
      if (multipartFile.isEmpty() == false) {
        logger.debug("------------- file start -------------");
        logger.debug("name : " + multipartFile.getName());
        logger.debug("filename : " + multipartFile.getOriginalFilename());
        logger.debug("size : " + multipartFile.getSize());
        logger.debug("-------------- file end --------------\n");
      }
    }
    String orgname = multipartFile.getOriginalFilename();
    
    // 1.확장자 구하기
    String exc = orgname.substring(orgname.lastIndexOf(".") + 1, orgname.length());
    
    if (multipartFile.isEmpty() == false) {
      // 이미지 empty
      if (exc.equals("hwp") || exc.equals("jpg") || exc.equals("png") || exc.equals("xlsx")) {
        logger.info("파일저장처리-start");
        filemap = method.file_upload(multipartFile, rep, req, "event");// 파일저장
        FileBean FBean = (FileBean) filemap.get("vo");
        map.put("bean", bean);
        map.put("dbtable", "tb_event_board");
        map.put("board_fileNo", FBean.getFile_no());
        BSevice.board_Insert(map);
        // 게시판 파일번호저장
        model.setViewName("redirect:/board/event/eventList?pageNum=1");
        logger.info("파일저장처리-end");
      } else {
        try {
          rep.setContentType("text/html; charset=UTF-8");
          PrintWriter out = rep.getWriter();
          out.println("<script>alert('엑셀,한글파일,jpg,png만 됩니다.');</script>");
          out.println("<script>window.history.back();</script>");
          out.flush();
        } catch (IOException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }
      }
      // 이미지 empty
    } else {
      map.put("bean", bean);
      map.put("dbtable", "tb_event_board");
      BSevice.board_Insert(map); // db에 저장하기
      model.setViewName("redirect:/board/event/eventList?pageNum=1");
    }
    
    logger.info("이벤트등록처리-end");
    return model;
  }
  
  /**
   * @메소드명 : eventDelete
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트등록페이지
   */
  @RequestMapping("board/event/eventDelete")
  public ModelAndView eventDelete(HttpServletResponse rep, HttpServletRequest req) {
    logger.info("이벤트삭제처리-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String test[] = req.getParameterValues("chk");
    for (String num : test) {
      map.put("num", num);
      map.put("db_table", "tb_event_board");
      BSevice.board_del(map);
    }
    model.setViewName("redirect:http://localhost:8080/board/event/eventList?pageNum=1");
    logger.info("이벤트삭제처리-end");
    return model;
  }
  
  /**
   * @메소드명 : eventUpdate
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트등록페이지
   */
  @RequestMapping("board/event/eventUpdate")
  public ModelAndView eventUpdate(HttpServletResponse rep, HttpServletRequest req) {
    logger.info("이벤트수정처리-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    String num = req.getParameter("chk");
    map.put("board_No", num);
    map.put("db_table", "tb_event_board");
    BoardBean bean = BSevice.board_View(map);
    FileBean fbean = Fservice.file_Select(bean.getBoard_fileNo());
    model.addObject("list", bean);
    model.addObject("flist", fbean);
    model.addObject("title", "이벤트수정");
    model.setViewName("board/event/eventUpdate");
    logger.info("이벤트수정처리-end");
    return model;
  }
  
  /**
   * @메소드명 : eventUpdate_k
   * @작성일 : 2018. 7. 3. 오후 7:15:34
   * @작성자 : KHS
   * @설명 :이벤트등록페이지
   */
  @RequestMapping("board/event/eventUpdate_k")
  public ModelAndView eventUpdate_k(BoardBean bean, HttpServletResponse rep, HttpServletRequest req) {
    logger.info("이벤트수정처리-start");
    HashMap<String, Object> map = new HashMap<String, Object>();
    MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
    Iterator<String> iterator = mhsr.getFileNames();
    MultipartFile multipartFile = null;
    HashMap<String, Object> filemap = new HashMap<String, Object>();
    // 1.파일업로드 유무검사
    if (multipartFile.isEmpty() == false) {
      logger.info("파일저장처리-start");
      filemap = method.file_upload(multipartFile, rep, req, "event");// 파일저장
      FileBean FBean = (FileBean) filemap.get("vo");
      map.put("bean", bean);
      map.put("board_fileNo", FBean.getFile_no());
      Fservice.file_Update(filemap);
      BSevice.board_Insert(map);
      // 게시판 파일번호저장
      logger.info("파일저장처리-end");
    }
    
    map.put("db_table", "tb_event_board");
    map.put("list", bean);
    BSevice.board_upt(map);
    FileBean fbean = Fservice.file_Select(bean.getBoard_fileNo());
    model.setViewName("redirect:http://localhost:8080/board/event/eventList?pageNum=1");
    logger.info("이벤트수정처리-end");
    return model;
  }
  
}
