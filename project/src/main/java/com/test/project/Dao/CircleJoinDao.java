package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.CircleJoinBean;

@Mapper
public interface CircleJoinDao {
  
  public int CircleJoin_Chk(HashMap<String, Object> map);
  
  public void CircleJoin_Apply(CircleJoinBean map);
  
  public ArrayList<CircleJoinBean> CircleApply_list(int circle_No);
  
  public void CircleJoin_Cancel(HashMap<String, Object> map);
}
