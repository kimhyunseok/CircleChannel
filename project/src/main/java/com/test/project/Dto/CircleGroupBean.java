package com.test.project.Dto;

import java.util.ArrayList;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CircleGroupBean {
  private ArrayList<CircleGroupBean> list;
  private int c_groupNo;
  private int circle_No;
  private String c_groupTitle;
  private String c_groupCnt;
  private String c_groupPay;
  private String c_groupin_cnt;
  private String c_group_in_date;
  private String c_group_upt_date;
  private String c_group_del_date;
  private int c_group_PFchk;
}
