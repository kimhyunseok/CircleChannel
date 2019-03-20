<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<body>
	<div id="wrapper" class="animate">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />
		<div class="container-fluid">
			<nav aria-label="breadcrumb">
			<ol class="breadcrumb ">
				<li class="breadcrumb-item active" aria-current="page">Home/${requestScope.title}</li>
			</ol>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4 mx-auto">

							<!-- form card login -->
							<div class="card rounded-0">
								<div class="card-header">
									<h3 class="mb-0">
										<c:choose>
											<c:when test="${user eq 1}">회원가입</c:when>
											<c:otherwise>회원정보수정</c:otherwise>
										</c:choose>
									</h3>
								</div>
								<div class="card-body">
									<c:choose>
										<c:when test="${user eq 1}">
											<form id="join" method="post" action="http://localhost:8080/UserJoin">

												<div class="form-row">
													<div class="col-sm-8 form-group">
														<label>아이디 </label><span class="regForm text-danger">*</span> <input name="user_id" type="text" id="user_id" class="form-control" placeholder="" required <c:if test="${null ne list.user_id}"> value="${list.user_id}" readonly</c:if>>
													</div>
													<!-- form-id end.// -->
													<div class="col form-group">
														<label>&nbsp; </label>
														<button type="button" class="btn btn-info btn-block" id="idchk">중복확인</button>
													</div>
													<!-- form-group end.// -->
												</div>
												<div class="form-row">
													<div class="col-sm-12 form-group">
														<label>이름 </label><span class="regForm text-danger">*</span> <input name="user_nm" type="text" id="user_nm" class="form-control" placeholder="" required <c:if test="${null ne list.user_nm}"> value="${list.user_nm}" readonly</c:if>>
													</div>
												</div>
												<div class="form-row">
													<div class="col-sm-12 form-group">
														<label>핸드폰</label><span class="regForm text-danger">*</span> <input name="user_phone" type="text" id="user_nm" class="form-control" placeholder="" required>
													</div>
												</div>
												<div class="form-group">
													<label>패스워드</label><span class="regForm text-danger">*</span> <input name="user_pw" id="user_pw" class="form-control pwd1" type="password" required>
												</div>
												<div class="form-group">
													<label>패스워드 확인</label><span class="regForm text-danger">*</span> <input class="form-control pwd2" type="password" required>
												</div>
												<div class="form-group">
													<font name="check"><br /></font>
												</div>			
												<div class="form-row">
													<div class="form-group col-md-12">
														<label>이메일</label><span class="regForm text-danger">*</span>
														<div class="form-inline">
															<input type="text" name="user_email_1" class="form-control col-md-5" required id="user_email" <c:if test="${null ne list.user_email_1}"> value="${list.user_email_1}" readonly   </c:if>> <span class="col-md-1">@</span> <select name="user_email_2" id="selectMail" class="form-control col-md-6" <c:if test="${null ne list.user_email_2}"> readonly  disabled </c:if>>
																<option <c:if test="${'gmail.com' eq list.user_email_2}"> selected    </c:if> value="gmail.com">gmail.com</option>
																<option <c:if test="${'nate.com' eq list.user_email_2}"> selected    </c:if> value="nate.com">nate.com</option>
																<option <c:if test="${'naver.com' eq list.user_email_2}"> selected    </c:if> value="naver.com">naver.com</option>
																<option <c:if test="${'hanmail.net' eq list.user_email_2}"> selected  </c:if> value="hanmail.net">hanmail.net</option>
															</select>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label>주소</label>
													<div class="form-group form-inline">
														<input class="form-control" style="width: 100px;" placeholder="우편번호" name="user_post" id="addr1" type="text" readonly="readonly" required="required">
													</div>
													<div class="form-group">
														<input class="form-control" placeholder="도로명 주소" name="user_addr1" id="addr2" type="text" readonly="readonly" required="required" /> <input class="form-control" placeholder="상세주소" name="user_addr2" id="addr3" type="text" required="required" />
													</div>
													<div class=" form-inline">
														<button type="button" class='form-control ' id="search">찾기</button>
													</div>
												</div>
												<div class="form-row  justify-content-md-center ">
													<div class="row">
														<div class="form-group">
															<button type="button" id="JoinBtn" class="btn btn-primary join">가입하기</button>
															&nbsp;
															<button type="reset" class="btn btn-secondary">취소</button>
														</div>
													</div>
													<!-- form-group// -->
												</div>
											</form>
										</c:when>
										<c:otherwise>
											<form id="join" method="post" action="http://localhost:8080/UserUpdate">
												<div class="form-group">
													<label>아이디 </label><span class="regForm text-danger">*</span> 
													<input name="user_id" type="text" id="user_id" class="form-control " value="${user_info.user_id}" placeholder="" readonly>
												</div>
												<div class="form-group">
													<label>패스워드</label><span class="regForm text-danger">*</span> 
													<input id="user_b_pw" value="${user_info.user_pw}" class="form-control" type="password" readonly>
												</div>
												<div class="form-group">
													<label>새로운 패스워드 </label><span class="regForm text-danger">*</span> 
													<input class="form-control pwd1" type="password" required>
												</div>
												<div class="form-group">
													<label>새로운 패스워드 확인</label><span class="regForm text-danger">*</span> 
													<input name="user_pw" type="password" id="user_pw" value="" class="form-control pwd2">
												</div>
												<div class="form-row">
													<div class="col-sm-12 form-group">
														<label>핸드폰</label><span class="regForm text-danger">*</span> 
														<input name="user_phone" type="text" value="${user_info.user_phone}"  id="user_nm" class="form-control" placeholder="" required>
													</div>
												</div>
												<div class="form-row">
													<div class="form-group col-md-12">
														<label>이메일</label><span class="regForm text-danger">*</span>
														<div class="form-inline">
															<input type="text" name="user_email_1" class="form-control col-md-5" required id="user_email" <c:if test="${null ne user_info.user_email_1}"> value="${user_info.user_email_1}" readonly   </c:if>> <span class="col-md-1">@</span> <select name="user_email_2" <c:if test="${null ne user_info.user_email_2}"> readonly  disabled </c:if> id="selectMail" class="form-control col-md-6">
																<option value="naver.com" <c:if test="${'naver.com' eq user_info.user_email_2}"> selected  </c:if>>naver.com</option>
																<option value="gmail.com" <c:if test="${'gmail.com' eq user_info.user_email_2}"> selected  </c:if>>gmail.com</option>
																<option value="nate.com" <c:if test="${'nate.com' eq user_info.user_email_2}"> selected  </c:if>>nate.com</option>
																<option value="hanmail.net" <c:if test="${'hanmail.net' eq user_info.user_email_2}"> selected  </c:if>>hanmail.net</option>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label>주소</label>
													<div class="form-group form-inline">
														<input class="form-control" style="width: 100px;" placeholder="우편번호" name="user_post" id="addr1" type="text" readonly="readonly" required="required">
													</div>
													<div class="form-group">
														<input class="form-control" placeholder="도로명 주소" name="user_addr1" id="addr2" type="text" readonly="readonly" required="required" /> <input class="form-control" placeholder="상세주소" name="user_addr2" id="addr3" type="text" required="required" />
													</div>
													<div class=" form-inline">
														<button type="button" class='form-control ' id="search">찾기</button>
													</div>
												</div>
												<div class="form-group">
													<font name="check"><br /></font>
												</div>

												<div class="form-row  justify-content-md-center ">
													<div class="row">
														<div class="form-group">
															<button type="submit" class="btn btn-primary update">정보수정</button>
															&nbsp;
															<button type="reset" class="btn btn-secondary">취소</button>
														</div>
													</div>
													<!-- form-group// -->
												</div>
											</form>
										</c:otherwise>
									</c:choose>

									<form action=""></form>
								</div>
								<!--/card-block-->
							</div>
							<!-- /form card login -->
						</div>
					</div>
					<!--/row-->
				</div>
				<!--/col-->
			</div>
			<!--/row--> </nav>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
  $(document).ready(function() {
    var db_idchk = 0;
    var idchk = 0;
    var pwdchk = false;
    
    $("#search").click(function() {
      var width=500;
      var height=650;
      new daum.Postcode({
        oncomplete : function(data) {
          // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
         
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          console.log(data.zonecode);
          console.log(fullRoadAddr);
          
          $("#addr1").val(data.zonecode);
          $("#addr2").val(fullRoadAddr);
          //검색된 주소를 비동기통신을 통해서 좌표를 얻는다
          $.ajax({
            type : 'post',
            url : 'http://localhost:8080/mapPosition_ajax',
            data : {
              'address' : fullRoadAddr
            }, //encodeURIComponent로 인코딩하여 넘깁니다.

            dataType : 'json',
            timeout : 10000,
            cache : false,
            error : function(x, e) {
              alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
            },
            success : function(data) {
              var myObj = JSON.parse(data.map);
              var lng = myObj.result.items[0].point.x;
              var lat = myObj.result.items[0].point.y;
              $("#point").val(lat+","+lng);
              point(lat, lng);
            }
          });
        }
        }).open({
        left:(window.screen.width/2)-(width/2),
        top:(window.screen.height/2)-(height/2)
      });
    });
    
    $("#idchk").click(function() {
      if ($("#user_id").val() == "") {
        alert("아이디를 입력해주세요");
      } else {
        var id = $("#user_id").val();
        $.ajax({
        type : 'POST',
        url : "http://localhost:8080/IdChk.ajax",
        data : {
          "user_id" : id
        },
        success : function(msg) {
          db_idchk = msg.idchk;
          if (db_idchk == 1) {
            idchk = 1;
            alert("이미 존재하는 아이디입니다");
          } else if (db_idchk == 0) {
            alert("사용가능한 아이디입니다");
            idchk = 2;
            $("#user_id").attr('readonly', 'readonly');
            $("#idchk").attr('readonly', 'readonly');
          }
        }
        });
      }
    });
    /* 중복확인 end// */

    $('.pwd1').keyup(function() {
      $('font[name=check]').html('<br>');
    });

    $('.pwd2').keyup(function() {
      if ($('.pwd1').val() == $('.pwd2').val()) {
        $('font[name=check]').html('<br>');
        $('font[name=check]').html("비밀번호가 일치합니다");
        $('font[name=check]').css("color", "blue");
        pwdchk = false;
      } else {
        $('font[name=check]').html('<br>');
        $('font[name=check]').html("비밀번호가 틀림니다.");
        $('font[name=check]').css("color", "red");
        pwdchk = true;
      }
    });
    /* 비번체크 end// */
    $("#JoinBtn").click(function() {
      if (idchk == false) {
        alert("중복확인을 해주세요");
        return false;
      } else if (pwdchk == true) {
        alert("비밀번호가 틀림니다.");
        return false;
      } else if ($("#user_email").val() == null) {
        alert("이메일을 입력해주세요");
        return false;
      } else if ($("#user_nm").val() == null) {
        alert("이름을 입력해주세요");
        return false;
      } else if (idchk == 0) {
        alert("아이디 중복확인해주세요.");
        return false;
      } else if (idchk == 1) {
        alert("이미 존재하는 아이디입니다");
        return false;
      }
      $('#selectMail').attr('disabled', false);
      $("#join").submit();

    });
    $(".update").click(function() {
      if ($("#user_pw").val() == $("#user_b_pw").val()) {
        alert("기존비밀번호와 같습니다.");
        $(".pwd1",".pwd2").val();
        $(".pwd1").focus();
        return false;
      } else if ($("#user_email").val() == null) {
        alert("이메일을 입력해주세요");
        return false;
      }  else if (idchk == 1) {
        alert("이미 존재하는 아이디입니다");
        return false;
      }
      $('#selectMail').attr('disabled', false);
      //$("#join").submit();
      
    });
    
    
  });
</script>


<!------ Include the above in your HEAD tag ---------->