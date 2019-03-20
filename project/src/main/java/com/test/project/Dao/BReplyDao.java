package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.BRelplyBean;

@Mapper
public interface BReplyDao {
  public void reply_Insert(HashMap<String, Object> map);
  
  public void Rereply_Insert(HashMap<String, Object> map);
  
  public ArrayList<BRelplyBean> reply_List(HashMap<String, Object> map);
  
  public int reply_max(HashMap<String, Object> map);
  
  public int reply_Cnt(HashMap<String, Object> map);
  
  public void reply_del(HashMap<String, Object> map);
  
  public void reply_upt(HashMap<String, Object> map);
  
}
