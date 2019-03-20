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

import com.test.project.Dao.CodeDao;
import com.test.project.Dto.CodeBean;

/**
 * @패키지 com.test.project.Service
 * @파일이름 CodeService.java
 * @작성자 김현석
 * @작성날짜 2019. 3. 18. 오후 9:33:54
 * @설명:
 */
@Service
public class CodeService implements CodeDao {
  private static Logger logger = LogManager.getLogger(CodeService.class);
  @Autowired
  private CodeDao mapper;
  
  @Override
  public ArrayList<CodeBean> Code_List() {
    // TODO Auto-generated method stub
    return mapper.Code_List();
  }
  
}
