package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.CircleBean;
import com.test.project.Dto.CircleReplyBean;

@Mapper
public interface CircleDao {
  public int Circle_insert(CircleBean bean);
  
  public int Circle_Cnt();
  
  public void Circle_del(HashMap<String, Object> map);
  
  public void Circle_upt(HashMap<String, Object> map);
  
  public ArrayList<CircleBean> Circle_List(HashMap<String, Object> map);
  
  public CircleBean Circle_View(HashMap<String, Object> map);
  
  public void Circle_Reply_Ins(HashMap<String, Object> map);
  
  public ArrayList<CircleReplyBean> Circle_ReplyView(HashMap<String, Object> map);
}
