package com.test.project.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.SlideDao;
import com.test.project.Dto.SlideBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 FileService.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:02:07
 * @설명:
 */
@Service
public class SlideService implements SlideDao {
  
  private static Logger logger = LogManager.getLogger(SlideService.class);
  @Autowired
  private SlideDao mapper;
  
  @Override
  public ArrayList<SlideBean> Slide_List(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.Slide_List(map);
  }
  
  @Override
  public void Slide_Insert(ArrayList<HashMap<String, Object>> map) {
    // TODO Auto-generated method stub
    mapper.Slide_Insert(map);
  }
  
  @Override
  public void Slide_Delete(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    mapper.Slide_Delete(map);
  }
  
}
