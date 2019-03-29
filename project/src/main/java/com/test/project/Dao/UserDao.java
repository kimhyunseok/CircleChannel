package com.test.project.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.test.project.Dto.UserBean;

@Mapper
public interface UserDao {
  public int UserCnt(String user_id);
  
  public int LoginChk(UserBean user);
  
  public int UserJoin(UserBean user);
  
  public int UserUpdate(UserBean user);
  
  public UserBean SelectUserInfo(String user_id);
  
  public ArrayList<UserBean> User_List(HashMap<String, Object> map);
  
  public void User_Delete(HashMap<String, Object> map);
}
