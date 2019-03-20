package com.test.project.Dto;

import lombok.Data;
import lombok.ToString;

/**
 * @패키지 com.test.project.Dto
 * @파일이름 UserBean.java
 * @작성자 김현석
 * @작성날짜 2019. 2. 5. 오전 3:16:59
 * @설명:
 */
@Data
@ToString
public class UserBean {
  private int user_no;
  private String user_id;
  private String user_nm;
  private String user_pw;
  private String user_phone;
  private String user_email_1;
  private String user_email_2;
  private String user_addr1;
  private String user_addr2;
  private String user_post;
  private String user_in_date;
  private String user_mod_date;
  private String user_del_date;
  
}
