<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=30acVBn_RNTBZdDAcwhu"></script>
<body>
	<style>
</style>
	<div id="wrapper" class="animate">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />

		<nav aria-label="breadcrumb">
		<ol class="breadcrumb ">
			<li class="breadcrumb-item active" aria-current="page">Home/${requestScope.title}</li>
		</ol>
		</nav>
		<div class="container-fluid">

			<div class="col-md-10 mx-auto">

				<!-- form card login -->
				<div class="card rounded-0">

					<div class="card-body">
						<form class="form" method="Post" action="http://localhost:8080/circle/circleInsert_ok" enctype="multipart/form-data">
							<ul class="list-group">
								<li class="list-group-item bg-warning">
									<div class="container-fluid">
										<div class="row">
											<div class="col-sm-2">
											<span class="text-black h3  ">글제목:</span> <span class="text-white h3  ">${View.board_nm}</span>
											</div>
											<div class="col-sm-10 text-right">
												<span class="text-white h3">${fn:substring(View.board_in_date,0,11)}</span>
											</div>
										</div>
									</div>
								</li>
								<li class="list-group-item text-right">
									첨부파일:
									<a href="${File.file_url}${File.file_name}" download> ${File.file_o_name}</a>
									<i class="fas fa-download"></i>
								</li>
								<li class="list-group-item">${View.board_content}</li>
							</ul>
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
function point(lat,lng){
  var mapOptions = {
      center: new naver.maps.LatLng(lat, lng),
  };
  var map = new naver.maps.Map('map', mapOptions); 
  
  var marker = new naver.maps.Marker({
    position: new naver.maps.LatLng(lat, lng),
    map: map
});
}
  $(function() {
    $("#crops2").chained("#kind1");
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

   

    CKEDITOR.replace('editor', {//해당 이름으로 된 textarea에 에디터를 적용
    width : '100%',
    height : '400px',
    filebrowserUploadUrl : 'http://localhost:8080/img_upload?CKEditor=contents&CKEditorFuncNum=1&langCode=ko'
    });
    $('.clockpicker').clockpicker({
    placement : 'top',
    align : 'left',
    donetext : 'Done'
    });
    $("#datepicker").datepicker({
    dateFormat : 'yy-mm-dd',
    minDate : 0
    });

  });
</script>
