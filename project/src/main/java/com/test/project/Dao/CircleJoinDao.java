package com.test.project.Dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.CircleJoinBean;

@Mapper
public interface CircleJoinDao {
  
  public int CircleJoin_Chk(HashMap<String, Object> map);
  
  public void CircleJoin_Apply(CircleJoinBean map);
  
}
