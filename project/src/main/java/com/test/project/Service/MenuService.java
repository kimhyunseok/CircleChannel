/**
* 1. 프로젝트명 : project
* 2. 패키지명(또는 디렉토리 경로) : com.test.project.Service
* 3. 파일명 : CodeService.java
* 4. 작성일 : 2019. 3. 18. 오후 9:33:54
* 5. 작성자 : 김현석
* 6. 설명 :
*/

package com.test.project.Service;

import java.util.ArrayList;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.project.Dao.MenuDao;
import com.test.project.Dto.MenuBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 CodeService.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 18. 오후 9:33:54
 * @설명:
 */
@Service
public class MenuService implements MenuDao {
  private static Logger logger = LogManager.getLogger(MenuService.class);
  @Autowired
  private MenuDao mapper;
  
  @Override
  public ArrayList<MenuBean> menu_List() {
    // TODO Auto-generated method stub
    return mapper.menu_List();
  }
  
  @Override
  public ArrayList<MenuBean> menu_SubList() {
    // TODO Auto-generated method stub
    return mapper.menu_SubList();
  }
  
}
