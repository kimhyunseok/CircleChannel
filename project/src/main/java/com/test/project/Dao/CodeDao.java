package com.test.project.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.CodeBean;

/**
 * @패키지 com.test.project.Dao
 * @파일이름 CodeDao.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 18. 오후 9:34:03
 * @설명:
 */
@Mapper
public interface CodeDao {
  ArrayList<CodeBean> Code_List();
}
