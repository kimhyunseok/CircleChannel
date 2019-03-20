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
public class CodeBean {
  private int code_No;
  private int code_Kind;
  private String code_Nm;
  private String code_Val_1;
  private String code_Val_2;
  private String code_in_date;
  private String code_del_date;
}
