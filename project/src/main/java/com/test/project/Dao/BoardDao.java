package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.BoardBean;

@Mapper
public interface BoardDao {
  public int board_Insert(HashMap<String, Object> map);
  
  public int board_Cnt(String db);
  
  public void board_del(HashMap<String, Object> map);
  
  public void board_upt(HashMap<String, Object> map);
  
  public ArrayList<BoardBean> board_List(HashMap<String, Object> map);
  
  public BoardBean board_View(HashMap<String, Object> map);
  
}
