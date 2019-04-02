package com.test.project.Dto;

import lombok.Data;
import lombok.ToString;

/**
 * @패키지 com.test.project.Dto
 * @파일이름 CircleBean.java
 * @작성자 김현석
 * @작성날짜 2019. 2. 5. 오전 3:17:25
 * @설명:
 */
@Data
@ToString
public class SlideBean {
  private String slide_No;
  private String circle_No;
  private String circle_Nm;
  private String circle_Kind;
  private String circle_href;
}
