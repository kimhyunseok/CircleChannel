package com.test.project.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.CircleGroupDao;
import com.test.project.Dto.CircleGroupBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 FileService.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:02:07
 * @설명:
 */
@Service
public class CircleGroupService implements CircleGroupDao {
  
  private static Logger logger = LogManager.getLogger(CircleGroupService.class);
  @Autowired
  private CircleGroupDao mapper;
  
  @Override
  public void CircleGroup_ins(ArrayList<HashMap<String, Object>> map1) {
    // TODO Auto-generated method stub
    mapper.CircleGroup_ins(map1);
  }
  
  @Override
  public ArrayList<CircleGroupBean> CircleGroup_List(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.CircleGroup_List(map);
  }
  
}
