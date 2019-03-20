package com.test.project.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.BReplyDao;
import com.test.project.Dto.BRelplyBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 FileService.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:02:07
 * @설명:
 */

@Service
public class BReplyService implements BReplyDao {
  
  private static Logger logger = LogManager.getLogger(BReplyService.class);
  @Autowired
  private BReplyDao mapper;
  
  @Override
  public void reply_Insert(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    mapper.reply_Insert(map);
  }
  
  @Override
  public ArrayList<BRelplyBean> reply_List(HashMap<String, Object> map) {
    return mapper.reply_List(map);
  }
  
  @Override
  public void reply_del(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    mapper.reply_del(map);
  }
  
  @Override
  public void reply_upt(HashMap<String, Object> map) {
    mapper.reply_upt(map);
  }
  
  @Override
  public void Rereply_Insert(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    mapper.Rereply_Insert(map);
  }
  
  @Override
  public int reply_max(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.reply_max(map);
  }
  
  @Override
  public int reply_Cnt(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.reply_Cnt(map);
  }
  
}
