package com.test.project.Dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.FileBean;

/**
 * @패키지 com.test.project.Dao
 * @파일이름 FileDao.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 9. 오후 10:55:13
 * @설명:
 */
@Mapper
public interface FileDao {
  
  /**
   * @메소드명 : file_Insert
   * @작성일 : 2019. 3. 9. 오후 10:55:20
   * @작성자 : 김현석
   * @설명 :
   */
  public void file_Insert(FileBean file);
  
  /**
   * @메소드명 : file_Select
   * @작성일 : 2019. 3. 9. 오후 10:55:24
   * @작성자 : 김현석
   * @설명 :
   */
  public FileBean file_Select(int fileNO);
  
  /**
   * @메소드명 : file_Update
   * @작성일 : 2019. 3. 9. 오후 10:55:26
   * @작성자 : 김현석
   * @설명 :
   */
  public void file_Update(HashMap<String, Object> map);
  
  /**
   * @메소드명 : file_Delete
   * @작성일 : 2019. 3. 9. 오후 10:55:28
   * @작성자 : 김현석
   * @설명 :
   */
  public int file_Delete();
}
