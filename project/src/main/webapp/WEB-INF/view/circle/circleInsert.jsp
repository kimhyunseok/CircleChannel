<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script src="http://localhost:8080/js/plugin.js"></script>
<link href="http://localhost:8080/css/circle.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<script src="https://cdn.ckeditor.com/4.10.0/full/ckeditor.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=30acVBn_RNTBZdDAcwhu"></script>
<body>

	<div id="wrapper" class="animate">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />

		<nav aria-label="breadcrumb">
		<ol class="breadcrumb ">
			<li class="breadcrumb-item active" aria-current="page">Home/${requestScope.title}</li>
		</ol>
		</nav>
		<div class="container-fluid">
			<div class="col-md-8 mx-auto">

				<!-- form card login -->
				<div class="card rounded-0">

					<div class="card-body">
						<form class="form" method="Post" action="http://localhost:8080/circle/circleInsert_ok" enctype="multipart/form-data">
							<input type="hidden" name="circle_Point" id="point">
							<div class="form-group row">
								<label for="example-text-input" class="col-2 col-form-label bg-light font-weight-bold">동아리구분</label>
								<div class="col-10 form-inline">
									<select id="kind1" name="circle_Kind" class="form-control">
										<c:forEach items="${list}" var="view">
											<c:if test="${view.code_Val_2==0}">
												<option value="${view.code_Val_1}">${view.code_Nm}</option>
											</c:if>
										</c:forEach>
									</select> <select id="kind2" name="circle_Kind" class="form-control">
										<c:forEach items="${list}" var="view">
											<c:if test="${view.code_Val_2 != 0}">
												<option class="${view.code_Val_1}" value="${view.code_Val_2}">${view.code_Nm}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" class="col-2 col-form-label bg-light font-weight-bold">동아리이름</label>
								<div class="col-10">
									<input class="form-control" maxlength="25" type="text" name="circle_Nm" value="" id="example-text-input" placeholder="ex)홍길동" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-text-input" class="col-2 col-form-label bg-light font-weight-bold">동아리소개</label>
								<div class="col-10">
									<textarea class="form-control" name="circle_Summary" rows="5" id="comment"></textarea>
								</div>
							</div>

							<div class="form-group row">
								<label for="example-url-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 내용</label>
								<div class="col-10">
									<textarea name="circle_Content" id="editor"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 모임기간</label>
								<div class="col-sm-10 form-inline">
									<input type="text" name="circle_Date1" class="form-control col-sm-3" id="datepicker1" required="required"> <input type="hidden" name="circle_Date1_week" id="week1"> ~<input type="text" class="form-control col-sm-3" name="circle_Date2" id="datepicker2" > <input type="hidden" name="circle_Date2_week" id="week2">
									<div class="input-group md-3">
										<span class="input-group-text"><i class="fas fa-clock"></i></span> <input type="text" class="form-control clockpicker  " name="circle_Time" value="" required="required">
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 신청기간</label>
								<div class="col-sm-10 form-inline">
									<input type="text" name="circle_AplyDate1" class="form-control col-sm-3" id="datepicker3" required="required"> ~<input type="text" name="circle_AplyDate2" class="form-control col-sm-3" id="datepicker4" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="example-url-input" class="col-2 col-form-label bg-light font-weight-bold">유료/무료 체크</label>
								<div class="col-10">
									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio" class="form-check-input" id="free_chk" name="c_group_PFchk" value="1" checked="checked">무료
										</label>
									</div>
									<div class="form-check-inline">
										<label class="form-check-label"> <input type="radio" class="form-check-input" id="pay_chk" name="c_group_PFchk" value="2">유료
										</label>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 그룹</label>
								<div class="col-sm-10 ">
									<table class="table table-bordered" id="group_area">
										<thead>
											<tr>
												<th>그룹명</th>
												<th>모집정원</th>
												<th>비용</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr class="content">
												<td><input type="text" name="c_groupTitle" class="form-control" required></td>
												<td><input type="number" name="c_groupCnt" class="form-control" min="0" required></td>
												<td><input type="text" name="c_groupPay" class="form-control circle_pay" value=0 readonly="readonly"></td>
												<td><button type="button" class="btn btn-primary btn-lg del_group">x</button></td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="4"><button type="button" id="add_group" class="btn btn-danger btn-block">+그룹추가</button></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>


							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 위치</label>
								<div class="col-10">
									<div class="form-group form-inline">
										<input class="form-control" style="width: 100px;" placeholder="우편번호" name="circle_PostNum" id="addr1" type="text" readonly="readonly" required="required">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="도로명 주소" name="circle_Addr1" id="addr2" type="text" readonly="readonly" required="required" /> <input class="form-control" placeholder="상세주소" name="circle_Addr2" id="addr3" type="text" required="required" />
									</div>
									<div class=" form-inline">
										<button type="button" class='form-control ' id="search">찾기</button>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 지도</label>
								<div class="col-10">
									<div id="map" style="width: 100%; height: 400px;"></div>
								</div>
							</div>
							<div class="form-group row">
								<label for="example-time-input" class="col-2 col-form-label bg-light font-weight-bold">동아리 로고</label>
								<div class="col-10">
									<input type="file" name="logo" class="form-control" accept=" .jpg, .png">
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
    $("#kind2").chained("#kind1");
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
	// 텍스트에디터영역 시작
	
    CKEDITOR.replace('editor', {//해당 이름으로 된 textarea에 에디터를 적용
    width : '100%',
    height : '400px',
  
    disallowedContent: 'img{width,height};',
  
    filebrowserUploadUrl : 'http://localhost:8080/img_upload?CKEditor=contents&CKEditorFuncNum=1&langCode=ko'
    });
 	// 텍스트에디터영역 시작
 	// 시간선택영역 시작
    $('.clockpicker').clockpicker({
    placement : 'top',
    align : 'left',
    donetext : 'Done'
    });
 	// 시간선택영역 끝
    $("#datepicker1").datepicker({
    dateFormat : 'yy-mm-dd',
    minDate : 0,
    nextText: '다음 달', // next 아이콘의 툴팁.
    prevText: '이전 달', // prev 아이콘의 툴팁.
    numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
    stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
    yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
    showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
    currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
    closeText: '닫기',  // 닫기 버튼 패널
    dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
    showAnim: "slide", //애니메이션을 적용한다.
    showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
    dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
    altField: "#week1",
    altFormat: "DD"
    });
    $('.clockpicker').clockpicker({
      placement : 'top',
      align : 'left',
      donetext : 'Done'
      });
   	// 시간선택영역 끝
      $(" #datepicker2").datepicker({
      dateFormat : 'yy-mm-dd',
      minDate : 0,
      nextText: '다음 달', // next 아이콘의 툴팁.
      prevText: '이전 달', // prev 아이콘의 툴팁.
      numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
      stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
      yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
      showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
      currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
      closeText: '닫기',  // 닫기 버튼 패널
      dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
      showAnim: "slide", //애니메이션을 적용한다.
      showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
      dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
      monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
      altField: "#week2",
      altFormat: "DD"
      });

      $(" #datepicker3,#datepicker4").datepicker({
        dateFormat : 'yy-mm-dd',
        minDate : 0,
        nextText: '다음 달', // next 아이콘의 툴팁.
        prevText: '이전 달', // prev 아이콘의 툴팁.
        numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
        stepMonths: 3, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
        currentText: '오늘 날짜' , // 오늘 날짜로 이동하는 버튼 패널
        closeText: '닫기',  // 닫기 버튼 패널
        dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
        showAnim: "slide", //애니메이션을 적용한다.
        showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
        dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], // 요일의 한글 형식.
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월의 한글 형식.
     
        });
   
   	$('#group_area > tbody').on("click",'button', function() {
      $(this).closest("tr").remove()
    });
      var append_html='';
	  $("#free_chk").click(function(){
	     $("#group_area > tbody >tr *").remove();  
		  append_html='<tr class="content"><td><input type="text" name="c_groupTitle" class="form-control"></td><td><input type="number" name="c_groupCnt" class="form-control" min="0"></td><td><input  type="text" name="c_groupPay"  class="form-control" value=0 readonly></td><td><button type="button" class="btn btn-primary btn-lg del_group">x</button></td></tr>'
	  });
	  $("#pay_chk").click(function(){
		 $("#group_area > tbody >tr *").remove();
	     append_html='<tr class="content"><td><input type="text"  name="c_groupTitle" class="form-control"></td><td><input type="number" name="c_groupCnt" class="form-control" min="0"></td><td><input type="text"  name="c_groupPay"  class="form-control" value=0></td><td><button type="button" class="btn btn-primary btn-lg del_group">x</button></td></tr>'
	  });
	  $("#add_group").click(function(){
	    if(append_html=="")
	      append_html='<tr class="content"><td><input type="text" name="c_groupTitle" class="form-control"></td><td><input type="number" name="c_groupCnt" class="form-control" min="0"></td><td><input type="text"  name="c_groupPay"  class="form-control" value=0 readonly></td><td><button type="button" class="btn btn-primary btn-lg del_group">x</button></td></tr>'
	 	
	      $('#group_area  tbody').append(append_html);
	  });
	
  });
</script>
