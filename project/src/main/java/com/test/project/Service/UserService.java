package com.test.project.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.UserDao;
import com.test.project.Dto.UserBean;

@Service
public class UserService implements UserDao {
  @Autowired
  private UserDao mapper;
  
  @Override
  public int UserCnt(String user_id) {
    // TODO Auto-generated method stub
    return mapper.UserCnt(user_id);
  }
  
  @Override
  public int LoginChk(UserBean user) {
    // TODO Auto-generated method stub
    return mapper.LoginChk(user);
  }
  
  @Override
  public int UserJoin(UserBean user) {
    // TODO Auto-generated method stub
    return mapper.UserJoin(user);
  }
  
  @Override
  public int UserUpdate(UserBean user) {
    // TODO Auto-generated method stub
    return mapper.UserUpdate(user);
  }
  
  @Override
  public UserBean SelectUserInfo(String user_id) {
    // TODO Auto-generated method stub
    return mapper.SelectUserInfo(user_id);
  }
  
}
