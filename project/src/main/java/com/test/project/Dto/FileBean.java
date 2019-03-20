package com.test.project.Dto;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

/**
 * @패키지 com.test.project.Dto
 * @파일이름 FileBean.java
 * @작성자 김현석
 * @작성날짜 2019. 2. 5. 오전 3:17:08
 * @설명:
 */
@Data
@ToString
public class FileBean {
  private int file_no;
  private String file_location;
  private String file_o_name;
  private String file_name;
  private String file_url;
  private Long file_size;
  private Date file_in_date;
  
}
