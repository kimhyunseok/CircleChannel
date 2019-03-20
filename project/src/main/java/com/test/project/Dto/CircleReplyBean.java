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
public class CircleReplyBean {
  private String reply_id;
  private int circle_no;
  private int reply_no;
  private int reply_level;
  private String user_nm;
  private String reply_content;
  private String reply_in_date;
  private String reply_del_date;
  private String reply_upt_date;
}
