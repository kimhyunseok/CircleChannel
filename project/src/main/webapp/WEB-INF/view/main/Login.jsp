<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<body>

	<div id="wrapper" class="animate" >

		<jsp:include page="/WEB-INF/view/include/menu.jsp" flush="true"/>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4 mx-auto">

							<!-- form card login -->
							<div class="card rounded-0">
								<div class="card-header bg-info text-center">
									<br>
									<h3 class="mb-0 text-white" >LOGIN</h3>
									<br>
								</div>
								<div class="card-body">
									<form class="form" action="http://localhost:8080/LoginChk" role="form" autocomplete="off" id="formLogin" novalidate="" method="POST">
										<div class="form-group">
											<label for="uname1">아이디</label> <input type="text" name="user_id" class="form-control form-control-lg rounded-0" id="user_id" required="">
											<div class="invalid-feedback">Oops, you missed this one.</div>
										</div>
										<div class="form-group">
											<label>패스워드</label> <input type="password" name="user_pw" class="form-control form-control-lg rounded-0" id="user_pw" required="" autocomplete="new-password">
											<div class="invalid-feedback">Enter your password too!</div>
										</div>
										<div class="row">
											<label class="custom-control custom-checkbox"> <input type="checkbox" class="custom-control-input"> <span class="custom-control-indicator"></span> <span class="custom-control-description small text-dark">Remember me on this computer</span>
											</label>
										</div>
										<div class="row">
											<div class="col-sm-6">
												<button type="button" class="btn btn-info btn-lg btn-block" id="btnLogin1">Login</button>
											</div>
											<div class="col-sm-6" id="naver_id_login" style="text-align: center">
												<a href="${url}">
													<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
												</a>
											</div>
										</div>
									</form>
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
			<!--/row-->
		</div>
		
</body>
</html>
<script type="text/javascript">
  $(document).ready(function() {
    $("#btnLogin1").click(function() {
      if ($("#user_id").val() == "") {
        alert("아이디를 입력해주세요");
      } else if ($("#user_pw").val() == "") {
        alert("비밀번호를 입력해주세요");
      } else {
        var id = $("#user_id").val();
        var pw = $("#user_pw").val();
        $.ajax({
        type : 'POST',
        url : "http://localhost:8080/LoginChk.ajax",
        data : {
        "user_id" : id,
        "user_pw" : pw
        },
        success : function(msg) {
          if (msg.chk == 3)
            alert("아이디를 입력해주세요.");
          else if (msg.chk == 4)
            alert("비밀번호를 입력해주세요.");
          else if (msg.chk == true) {
            location.href = 'http://localhost:8080/';
          }
          if (msg.chk == false) {
            alert("아이디 혹은 비밀번호를 확인해주세요.");
          }
        },
        error : function(request, status, error) {
          alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
        });
      }
    });
  });
</script>


<!------ Include the above in your HEAD tag ---------->