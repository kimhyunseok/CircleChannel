package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.SlideBean;

/**
 * @패키지 com.test.project.Dao
 * @파일이름 CodeDao.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 18. 오후 9:34:03
 * @설명:
 */
@Mapper
public interface SlideDao {
  
  public ArrayList<SlideBean> Slide_List(HashMap<String, Object> map);
  
  public void Slide_Insert(ArrayList<HashMap<String, Object>> map);
  
  public void Slide_Delete(HashMap<String, Object> map);
}
