package com.test.project.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.CircleDao;
import com.test.project.Dto.CircleBean;
import com.test.project.Dto.CircleReplyBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 FileService.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:02:07
 * @설명:
 */
@Service
public class CircleService implements CircleDao {
  
  private static Logger logger = LogManager.getLogger(CircleService.class);
  @Autowired
  private CircleDao mapper;
  
  public int Circle_insert(CircleBean bean) {
    // TODO Auto-generated method stub
    return mapper.Circle_insert(bean);
  }
  
  @Override
  public int Circle_Cnt() {
    // TODO Auto-generated method stub
    return mapper.Circle_Cnt();
  }
  
  @Override
  public void Circle_del(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    
  }
  
  @Override
  public void Circle_upt(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    
  }
  
  @Override
  public ArrayList<CircleBean> Circle_List(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.Circle_List(map);
  }
  
  @Override
  public CircleBean Circle_View(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.Circle_View(map);
  }
  
  @Override
  public ArrayList<CircleReplyBean> Circle_ReplyView(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    
    return mapper.Circle_ReplyView(map);
  }
  
  @Override
  public void Circle_Reply_Ins(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    mapper.Circle_Reply_Ins(map);
  }
  
}
