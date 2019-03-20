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
public class MenuBean {
  private int menu_no;
  private String menu_nm;
  private String menu_code1;
  private String menu_code2;
  private String menu_icon;
  private String menu_href;
}
