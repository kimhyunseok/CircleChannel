package com.test.project.CommonMathod;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.test.project.Dto.FileBean;
import com.test.project.Service.FileService;

/**
 * @패키지 com.test.project.CommonMathod
 * @파일이름 CommonMethod.java
 * @작성자 KHS
 * @작성날짜 2018. 8. 12. 오후 1:07:26
 * @설명:
 */
@Service
public class CFileUploadMathod {
  
  private static Logger logger = LogManager.getLogger(CFileUploadMathod.class);
  @Autowired
  private FileService service;
  
  /**
   * @메소드명 : edtImg_Upload
   * @작성일 : 2019. 3. 9. 오후 9:27:26
   * @작성자 : 김현석
   * @설명 :
   */
  
  public HashMap<String, Object> edtImg_Upload(MultipartFile img, HttpServletResponse response, HttpServletRequest request, String location) {
    // TODO Auto-generated method stub
    response.setContentType("image/pjpeg");
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    HashMap<String, Object> map = new HashMap<String, Object>();
    FileBean vo = new FileBean();
    String filePath;
    while (iterator.hasNext()) {
      img = multipartHttpServletRequest.getFile(iterator.next());
      if (img.isEmpty() == false) {
        logger.info("------------- file start -------------");
        logger.info("name : " + img.getContentType());
        logger.info("filename : " + img.getOriginalFilename());
        logger.info("size : " + img.getSize());
        vo.setFile_size(img.getSize());
        logger.info("-------------- file end --------------\n");
      }
      
    }
    // String filePath = "\\upload_img\\";
    // 파일 기본경로
    String defaultPath = request.getSession().getServletContext().getRealPath("/");
    // 파일 기본경로 _ 상세경로
    filePath = defaultPath + "resources" + File.separator + "upload_img" + File.separator + location + File.separator;
    System.out.println("----------" + filePath);
    String originalFileName = img.getOriginalFilename();
    String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
    
    UUID uuid = UUID.randomUUID();
    String fileName = RandomStringUtils.randomAlphanumeric(15) + originalFileExtension;
    File file1 = new File(filePath + fileName);
    if (file1.isFile()) {
      logger.info("파일존재");
      fileName = RandomStringUtils.randomAscii(15) + originalFileExtension;
      logger.info("파일존재" + fileName);
    }
    
    // 저장경로 폴더 생성
    File file = new File(filePath);
    if (file.isDirectory() == false) {
      file.mkdirs();
    }
    
    // 서버에 파일 write
    file = new File(filePath + fileName);
    try {
      img.transferTo(file);
      map.put("uploaded", 1);
      map.put("fileName", fileName);
      map.put("url", "http://localhost:8080/resources/upload_img/" + location + "/" + fileName);
    } catch (IllegalStateException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    logger.debug("서버전송 완료");
    filePath = "http://localhost:8080/resources/upload_img/" + location + "/";
    vo.setFile_o_name(originalFileName);
    vo.setFile_url(filePath);
    vo.setFile_name(fileName);
    
    map.put("vo", vo);
    service.file_Insert(vo);
    
    // DB에 파일내역 insert
    return map;
  }
  
  /**
   * @메소드명 : file_upload
   * @작성일 : 2018. 8. 12. 오후 1:07:29
   * @작성자 : KHS
   * @설명 :파일 업로드
   */
  
  public HashMap<String, Object> file_upload(MultipartFile img, HttpServletResponse response, HttpServletRequest request, String location) {
    // TODO Auto-generated method stub
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    String filname = img.getOriginalFilename();
    String extand = filname.substring(filname.lastIndexOf(".") + 1, filname.length());
    HashMap<String, Object> map = new HashMap<String, Object>();
    FileBean vo = new FileBean();
    String defaultPath = null;
    String filePath = null;
    
    while (iterator.hasNext()) {
      img = multipartHttpServletRequest.getFile(iterator.next());
      
      if (img.isEmpty() == false) {
        
        logger.info("------------- file start -------------");
        logger.info("name : " + img.getContentType());
        logger.info("filename : " + img.getOriginalFilename());
        logger.info("size : " + img.getSize());
        vo.setFile_size(img.getSize());
        logger.info("-------------- file end --------------\n");
      }
      
    }
    
    // *파일 기본경로*
    defaultPath = request.getSession().getServletContext().getRealPath("/");
    /* 파일 기본경로 _ 상세경로 */
    if (extand.equals("jpg") || extand.equals("png")) {
      filePath = defaultPath + "resources" + File.separator + "upload_img" + File.separator + location + File.separator;
    } else if (extand.equals("hwp") || extand.equals("xlsx")) {
      filePath = defaultPath + "resources" + File.separator + "upload_file" + File.separator + location + File.separator;
    }
    String originalFileName = img.getOriginalFilename();// 원본파일이름
    String originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));// 원본파일확장자
    String fileName = RandomStringUtils.randomAlphanumeric(15) + originalFileExtension;
    // 저장경로 폴더 생성
    File file = new File(filePath);
    if (file.exists() == true) {
      file.mkdirs();
    }
    file = new File(filePath + fileName);
    try {
      img.transferTo(file);
    } catch (IllegalStateException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    filePath = "http://localhost:8080/resources/upload_img/" + location + "/";
    vo.setFile_o_name(originalFileName);
    vo.setFile_name(fileName);
    vo.setFile_url(filePath);
    vo.setFile_location(location);
    service.file_Insert(vo);
    map.put("vo", vo);
    
    return map;
  }
  
}
