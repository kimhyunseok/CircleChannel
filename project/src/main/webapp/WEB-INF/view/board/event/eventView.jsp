<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="http://localhost:8080/css/style.css" rel="stylesheet">
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
							<div id="container">
								<!-- 게시물 읽기 시작 { -->
								<article id="bo_v" style="width:100%"> <header>
								<h2 id="bo_v_title">
									<h3>${View.board_nm}</h3>
								</h2>
								</header> <section id="bo_v_info">
								<h2>페이지 정보</h2>
								<span class="sound_only">작성자:관리자</span> </span> </span> </strong> <span class="sound_only">댓글</span> <strong> <i class="fas fa-comment"></i> 3건
								</strong> <span class="sound_only">조회</span> <strong><i class="fa fa-eye" aria-hidden="true"></i> 79회</strong> <strong class="if_date"><span class="sound_only">작성일</span>&nbsp;<i class="far fa-calendar-alt"></i> 18-12-20 11:07</strong> </section> <section id="bo_v_atc">
								<h2 id="bo_v_atc_title">본문</h2>

								<div id="bo_v_img"></div>

								<!-- 본문 내용 시작 { -->
								<div id="bo_v_con">
									<p>dddddddddd</p>
								</div>
								<!-- } 본문 내용 끝 --> <!--  추천 비추천 시작 { --> <!-- }  추천 비추천 끝 --> </section> <!-- 게시물 상단 버튼 시작 { -->
								<div id="bo_v_top">

									<ul class="bo_v_left">
										<li>
											<a href="./password.php?w=u&amp;bo_table=sorigyeol&amp;wr_id=77&amp;page=" class="btn_b01 btn">
												<i class="fas fa-user-edit"></i> 수정
											</a>
										</li>
										<li>
											<a href="./password.php?w=d&amp;bo_table=sorigyeol&amp;wr_id=77&amp;page=" class="btn_b01 btn" onclick="del(this.href); return false;">
												<i class="fas fa-trash-alt"></i> 삭제
											</a>
										</li>
									</ul>

									<ul class="bo_v_com">
										<li>
											<a href="http://localhost:8080/board/event/eventList?pageNum=1" class="btn btn-default">
												<i class="fa fa-list" aria-hidden="true"></i> 목록
											</a>
										</li>
										<li>
											<a href="./write.php?w=r&amp;bo_table=sorigyeol&amp;wr_id=77" class="btn_b01 btn">
												<i class="fa fa-reply" aria-hidden="true"></i> 답변
											</a>
										</li>
										<li>
											<a href="http://localhost:8080/board/event/eventInsert" class="btn_b02 btn">
												<i class="fas fa-edit"></i> 글쓰기
											</a>
										</li>
									</ul>

									<ul class="bo_v_nb">
										<li class="btn_prv">
											<span class="nb_tit"><i class="fa fa-caret-up" aria-hidden="true"></i> 이전글</span>
											<c:if test="${null  ne  View.pre_no}">
												<a href="http://localhost:8080/board/event/eventView?pageNum=${View.pre_no}">${View.pre_nm}</a>
											</c:if>
											<c:if test="${null  eq View.pre_no}">${View.pre_nm}</c:if>
											<span class="nb_date">${fn:substring(View.pre_date,0,11)}</span>
										</li>
										<li class="btn_next">
											<span class="nb_tit"><i class="fa fa-caret-down" aria-hidden="true"></i> 다음글</span>
											<c:if test="${null  ne  View.next_no}">
												<a href="http://localhost:8080/board/event/eventView?pageNum=${View.next_no}">${View.next_nm}</a>
											</c:if>
											<c:if test="${null  eq View.next_no}">${View.next_nm}</c:if>
											<span class="nb_date">${fn:substring(View.next_date,0,11)}</span>
										</li>
									</ul>
								</div>

								<button type="button" class="cmt_btn">
									<i class="fas fa-comments"></i> 댓글목록
								</button>
								<!-- 댓글 시작 { --> <section id="bo_vc">
								<h2>댓글목록</h2>
								<c:forEach var="list" begin="0" items="${Reply}" varStatus="status">

									<article class="c_1822" <c:if test="${1 ne list.reply_level}"> style="margin-left:50px;border-top-color:#e0e0e0" </c:if>>

									<div class="container-fluid">
										<div class="row">
											<div class="col-sm-12">
												<span class="sv_wrap">
													<noscript class="sv_nojs">
														<span class="sv"> ${list.reply_id}님 </span>
													</noscript>
												</span> ${list.reply_id}님 <span class="bo_vc_hdinfo"><i class="far fa-calendar-alt"></i> <time datetime="2019-01-10">${fn:substring(list.reply_in_date,0,11)}</time></span>
												<!-- 댓글 출력 -->
											</div>
										</div>
									</div>

									<div class="cmt_contents ">
										<p>${list.reply_content}</p>
										<ul class="bo_vc_act">
											<li>
												<c:if test="${1 ne list.reply_level}">
												</c:if>
												<c:if test="${1 eq list.reply_level}">
													<button type="button" class="btn reply" data-count="${status.index}">답변</button>
												</c:if>

											</li>
											<li>
												<button type="button" class="btn reply_upt" id="" data-type="All" data-id="${list.reply_no}" data-count="${status.index}">수정</button>
											</li>
											<li>
												<c:if test="${1 eq list.reply_level}">
													<button type="button" class="btn reply_del" id="" data-type="All" data-id="${list.reply_no}" data-count="${status.index}">삭제</button>
												</c:if>
												<c:if test="${1 ne list.reply_level}">
													<button type="button" class="btn reply_del" id="" data-id="${list.reply_no}" data-count="${status.index}">삭제</button>
												</c:if>
											</li>
										</ul>
									</div>

									<div class="container-fluid " id="reply_area${status.index}" style="display: none">
										<input type="hidden" name="board_no" class="board_no" value="${list.board_no}"> <input type="hidden" name="reply_no" class="reply_no" value="${list.reply_no}"> <input type="hidden" name="reply_level" class="reply_level" value="${list.reply_level}">
										<div class="row">
											<div class="col-sm-12">
												<textarea class="reply_content form-control" name="reply_content" maxlength="10000" title="내용" placeholder="댓글내용을 입력해주세요" style="resize: none;"></textarea>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-12 text-right">
												<button type="button" class="btn btn-danger Rereply_btn" title="등록" data-count="${status.index}">등록</button>
											</div>
										</div>
									</div>
									<div class="container-fluid " id="reply_Udtarea${status.index}" style="display: none">
										<input type="hidden" name="reply_no" class="reply_no" value="${list.reply_no}">
										<div class="row">
											<div class="col-sm-12">
												<textarea class="reply_content form-control" name="reply_content" maxlength="10000" title="내용" placeholder="댓글내용을 입력해주세요" style="resize: none;"></textarea>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-12 text-right">
												<button type="button" class="btn btn-danger Rereply_Ubtn" title="수정" data-count="${status.index}">수정</button>
											</div>
										</div>
									</div>
						</form>
						</article>
						</c:forEach>
						</section>
						<!-- style="margin-left:50px;border-top-color:#e0e0e0 -->
						<!-- 댓글 끝 } -->
						<!-- } 댓글 끝 -->
						<!-- 댓글 쓰기 시작 { -->
						<form name="fviewcomment" id="fview" action="">
							<div class="container-fluid">
								<div class="row">
									<div class="col-sm-12">
										<textarea class="form-control reply_content" name="reply_content" maxlength="10000" required="" class="required" title="내용" placeholder="댓글내용을 입력해주세요" style="resize: none;"></textarea>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-12 text-right">
										<button type="button" class="btn btn-danger" title="등록" id="reply_btn">등록</button>
									</div>
								</div>
							</div>
						</form>
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
var save_before = '';

function good_and_write()
{
    var f = document.fviewcomment;
    if (fviewcomment_submit(f)) {
        f.is_good.value = 1;
        f.submit();
    } else {
        f.is_good.value = 0;
    }
}

function comment_delete()
{
    return confirm("이 댓글을 삭제하시겠습니까?");
}


$(function() {
  $("#bo_v_atc").viewimageresize();
});

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
    $( ".reply" ).click(function() {
    var jquery= $("#reply_area"+$(this).data("count"));
      $( jquery).toggle(  );
    });
    $( ".reply_upt" ).click(function() {
      var jquery= $("#reply_Udtarea"+$(this).data("count"));
        $( jquery).toggle( "slow" );
      });
    $(".Rereply_btn").click(function(){
      var content = "";
      content=$("#reply_area"+$(this).data("count"));
      var data ={
          "board_no":$("#reply_area"+$(this).data("count")+" .board_no").val(),
          "reply_no":$("#reply_area"+$(this).data("count")+" .reply_no").val(),
          "reply_level":$("#reply_area"+$(this).data("count")+" .reply_level").val(),
          "reply_content":$("#reply_area"+$(this).data("count")+" .reply_content").val()
          };
      $.ajax({
        type : "POST",
        url : "http://localhost:8080/board/event/eventReReply_Ins.ajax",
        async : false,
        data:  data,
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("저장되었습니다.");
         location.reload();
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
    });
    //답글수정시작
    $(".Rereply_Ubtn").click(function(){
      var content = "";
      content=$("#reply_Udtarea"+$(this).data("count"));
      var data ={
          "reply_no":$("#reply_Udtarea"+$(this).data("count")+" .reply_no").val(),
          "reply_content":$("#reply_Udtarea"+$(this).data("count")+" .reply_content").val()
          };
      $.ajax({
        type : "POST",
        url : "http://localhost:8080/board/event/Reply_Upt.ajax",
        async : false,
        data:  data,
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("수정하셨습니다.");
         location.reload();
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
    });
    //답글수정끝
  //답글삭제시작
    $(".reply_del").click(function(){
      var content = "";
      var data ={
          "reply_no":$(this).data("id"),
          "del_type":$(this).data("type"),
          };
      $.ajax({
        type : "POST",
        url : "http://localhost:8080/board/event/Reply_Del.ajax",
        async : false,
        data:  data,
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("삭제하셨습니다.");
         location.reload();
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
    });
    
    //답글수정 끝
    $(".Rereply_btn").click(function(){
      var content = "";
      content=$("#reply_area"+$(this).data("count"));
      var data ={
          "board_no":$("#reply_area"+$(this).data("count")+" .board_no").val(),
          "reply_no":$("#reply_area"+$(this).data("count")+" .reply_no").val(),
          "reply_level":$("#reply_area"+$(this).data("count")+" .reply_level").val(),
          "reply_content":$("#reply_area"+$(this).data("count")+" .reply_content").val()
          };
      $.ajax({
        type : "POST",
        url : "http://localhost:8080/board/event/eventReReply_Ins.ajax",
        async : false,
        data:  data,
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("저장되었습니다.");
         location.reload();
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
    });
    
    
    
    $("#reply_btn").click(function(){
      var content = "";
      content=$(".reply_content").val();
      $.ajax({
        type : "POST",
        url : "http://localhost:8080/board/event/eventReply_Ins.ajax",
        async : false,
        data: {
          "board_no": ${View.board_no},
          "content": content
      },
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("저장되었습니다.");
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
    });
    
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
