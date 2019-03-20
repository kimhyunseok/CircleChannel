package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.CircleGroupBean;

@Mapper
public interface CircleGroupDao {
  public void CircleGroup_ins(ArrayList<HashMap<String, Object>> map);
  
  public ArrayList<CircleGroupBean> CircleGroup_List(HashMap<String, Object> map);
}
