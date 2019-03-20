package com.test.project.Dto;

import lombok.Data;
import lombok.ToString;

/**
 * @패키지 com.test.project.Dto
 * @파일이름 BoardBean.java
 * @작성자 김현석
 * @작성날짜 2019. 2. 5. 오전 3:17:31
 * @설명:
 */
@Data
@ToString
public class BoardBean {
  private int board_no;
  private String board_nm;
  private String board_title;
  private String board_content;
  private String board_in_date;
  private int board_view_cnt;
  private int board_fileNo;
  private String next_no;
  private String pre_no;
  private String next_nm;
  private String pre_nm;
  private String next_date;
  private String pre_date;
  private String board_del_chk;
  
}
