<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<link href="http://localhost:8080/css/circle.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=30acVBn_RNTBZdDAcwhu"></script>
<body>

	<div id="wrapper" class="animate">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />

		<nav aria-label="breadcrumb">
		<ol class="breadcrumb ">
			<li class="breadcrumb-item active" aria-current="page">Home/동아리등록</li>
		</ol>
		</nav>
		<div class="container-fluid">
			<div class="col-md-10 mx-auto">

				<!-- form card login -->
				<div class="card rounded-0">

					<div class="card-body">
						<form class="form" method="Post" action="http://localhost:8080/circle/circleInsert_ok" enctype="multipart/form-data">
							<div class="form-group row">
								<label for="example-text-input" class="col-2 col-form-label bg-light font-weight-bold">이벤트제목</label>
								<div class="col-10">
									<input class="form-control" type="text" name="circle_Nm" value="" id="example-text-input" placeholder="ex)홍길동" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-url-input" class="col-2 col-form-label bg-light font-weight-bold">이벤트내용</label>
								<div class="col-10">
									<textarea name="circle_Content" id="editor"></textarea>
								</div>
							</div>
							<div class="form-row  justify-content-md-center ">
								<div class="form-group">
									<button type="submit" class="btn btn-primary join">등록</button>
									&nbsp;
									<button type="reset" class="btn btn-secondary">취소</button>
								</div>
								<!-- form-group// -->
							</div>
						</form>
					</div>
					<!--/card-block-->
				</div>
				<!-- /form card login -->
			</div>

		</div>
</body>
</html>

<script>
  $(function() {
    CKEDITOR.replace('editor', {//해당 이름으로 된 textarea에 에디터를 적용
    width : '100%',
    height : '400px',
    filebrowserUploadUrl : 'http://localhost:8080/img_upload?CKEditor=contents&CKEditorFuncNum=1&langCode=ko'
    });

  });
</script>
