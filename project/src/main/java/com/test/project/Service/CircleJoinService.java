package com.test.project.Service;

import java.util.HashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.CircleJoinDao;
import com.test.project.Dto.CircleJoinBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 FileService.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:02:07
 * @설명:
 */
@Service
public class CircleJoinService implements CircleJoinDao {
  
  private static Logger logger = LogManager.getLogger(CircleJoinService.class);
  @Autowired
  private CircleJoinDao mapper;
  
  @Override
  public int CircleJoin_Chk(HashMap<String, Object> map) {
    // TODO Auto-generated method stub
    return mapper.CircleJoin_Chk(map);
  }
  
  @Override
  public void CircleJoin_Apply(CircleJoinBean bean) {
    // TODO Auto-generated method stub
    mapper.CircleJoin_Apply(bean);
  }
  
}
