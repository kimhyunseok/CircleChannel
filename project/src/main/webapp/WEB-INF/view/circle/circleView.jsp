<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2u3xz4gziq"></script>
<link href="http://localhost:8080/static.onoffmix.com/css/pc/event/event-view.css" rel="stylesheet">
<link href="http://localhost:8080/static.onoffmix.com/css/common/pc/common-pc.css" rel="stylesheet">
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="http://localhost:8080/static.onoffmix.com/js/pc/dist/common/jquery.noscroll.js"></script>
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
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

						<form class="form" method="Post" action="http://localhost:8080/circle/circleInsert_ok" enctype="multipart/form-data"></form>
						<!--내용영역 시작 -->
						<div class="content_wrapping max_width_area">
							<!-- EVENT Summary Infomation -->
							<section class="event_summary">
							<h2 class="title hidden">모임 요약 정보</h2>
							<div class="top_area">
								<div class="type_info">
									<span class="payment_type free">무료</span> <span class="category_type">문화/예술</span>
									<!-- 이벤트 공개여부 : CASE 2 -->
									<span class="event_visibility">공개</span>

								</div>

								<div class="icon_button">
									<a href="detail/ics/onoffmix-event-170556.ics">
										<span class="btn_ics" data-hasqtip="0"> ICS </span>
									</a>
									<a href="http://www.google.com/calendar/render?action=TEMPLATE&amp;text=%5B%ED%96%A5%EA%B8%B0%EC%9D%98+%EB%AF%B8%EC%88%A0%EA%B4%80%5D+145%EC%B0%A8+%EA%B0%95%EC%97%B0+%2F+...&amp;dates=20190316T070000Z%2F20190316T090000Z&amp;sprop=name%3AONOFFMIX&amp;location=%5B%EC%B9%B4%EC%9A%B0%EC%95%A4%EB%8F%85%5D%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%84%B1%EB%8F%99%EA%B5%AC+%EC%99%95%EC%8B%AD%EB%A6%AC%EB%A1%9C...&amp;details=%EC%A0%91%EC%88%98%EA%B8%B0%EA%B0%84%3A2019-03-03+23%3A00%7E2019-03-16+14%3A00%0A%EC%9C%A0%EB%A3%8C%EC%97%AC%EB%B6%80%3A%EC%9C%A0%EB%A3%8C%0AURL%3Ahttps%3A%2F%2Fwww.onoffmix.com%2Fevent%2F170556%0A" target="_blank">
										<span class="btn_calendar" data-hasqtip="1"> 구글캘린더 등록 </span>
									</a>
									<a href="javascript:window.print()">
										<span class="btn_print" data-hasqtip="2"> 프린트 </span>
									</a>
									<span class="btn_report" rel="0" data-hasqtip="3">
										<button type="button">부적절한 모임 신고</button>
									</span>
								</div>
								<!-- 부적절한 신고 버튼 클릭시 form 시작  -->
								<!-- css에서 display:none해놓은 상태 -->
								<form action="https://www.onoffmix.com/event/detail/report" class="report_form" method="POST">
									<input type="hidden" value="170556" name="evt_no">
									<h4 class="title">신고하기</h4>
									<p class="report_info">
										<strong>해당 모임의 취지가 다르거나 부적절한 모임일 경우 신고를 할 수 있습니다.</strong> 신고된 모임은 부적절한지의 여부를 결정하여 삭제 또는 경고의 조치가 주어지며 신고 기능을 악용하는 것도 위반여부를 판단하여 사용에 제한이 있을 수 있으니 주의하시기 바랍니다.
									</p>
									<h5 class="sub_title">신고 사유</h5>
									<textarea rows="3" class="report_txt" name="report_txt"></textarea>
									<div class="btn_area">
										<input type="submit" value="신고하기" class="submit_btn">
										<button type="button" class="cancel_btn">취소</button>
									</div>
								</form>
								<!-- 부적절한 신고 form  끝 -->
							</div>
							<div class="left_area">
								<!-- event img -->
								<div class="event_thumbnail main_thumbnail">
									<img alt="" src="${view.file_url}/${view.file_name}">
								</div>
								<!-- SNS share -->
								<ul class="sns">

								</ul>
								<!-- Host Infomation -->
								<div class="host_info_area">
									<h4 class="title">개설자정보</h4>
									<ul class="host_tab_menu" role="tablist">
										<li id="tabInfo" class="info_tab active" role="tab" aria-controls="hostInfo" aria-selected="true">정보</li>
									</ul>
									<!-- 정보 -->
									<ul id="hostInfo" class="host_info active " role="tabpanel" aria-labelledby="tabInfo">
										<li class="host_name">${view.user_nm}</li>

										<li class="host_mail">${view.user_email_1}@${view.user_email_2}</li>
										<li class="host_phone">${view.user_phone}</li>
										<li class="host_company">향기의 미술관</li>
									</ul>
									<!-- 다른모임 -->

									<p class="tip_txt">

										· 문의사항은 메일 / 전화 /
										<a href="#eventComment">댓글</a>
										을 이용해주세요
									</p>
								</div>
								<!-- 접속자가 관리자일 경우 관리자메뉴 -->
							</div>

							<div class="right_area">
								<h3 class="event_title" title="${view.circle_Nm}">${view.circle_Nm}</h3>
								<ul class="event_info_wrap">
									<li>
										<h4 class="label date parse_print">모임기간</h4>
										<p class="description date">${view.circle_Date1}
											(${view.circle_Date1_week})
											<c:if test="${view.circle_Date2!=null}">~${view.circle_Date1} (${view.circle_Date1_week})</c:if>${view.circle_Time}</p>
									</li>
									<li>
										<h4 class="label place parse_print">모임장소</h4>
										<p class="description place">
											<span class="adress">${view.circle_Addr1}${view.circle_Addr2}</span>
											<button type="button" id="point" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#location">지도보기</button>
										</p>
									</li>
									<li>
										<h4 class="label attend parse_print">모집정원</h4>
										<p class="description attend">
											<span class="total">총 <span class="number_txt">${view.circle_Cnt}</span>명
											</span> <span class="available"><span class="number_txt">0</span>명 신청가능</span>
										</p>
									</li>
								</ul>

								<!-- 이벤트 요약설명 : 서브 타이틀 -->
								<div class="summary_wrap">
									<p class="summary_txt">${view.circle_Summary}</p>
									<button type="button" class="btn_more">모임소개 더보기</button>
								</div>
								<div class="tags">
									<!-- <a href="https://www.onoffmix.com/event?s=%23%EB%AF%B8%EC%88%A0">#미술</a>
									<a href="https://www.onoffmix.com/event?s=%23%EC%98%88%EC%88%A0">#예술</a>
									<a href="https://www.onoffmix.com/event?s=%23%EA%B7%B8%EB%A6%BC">#그림</a>
									<a href="https://www.onoffmix.com/event?s=%23%ED%96%A5%EA%B8%B0%EC%9D%98%EB%AF%B8%EC%88%A0%EA%B4%80">#향기의미술관</a>
									<a href="https://www.onoffmix.com/event?s=%23%ED%96%A5%EC%88%98">#향수</a> -->
								</div>
								<!-- 이벤트 그룹 -->
								<form class="event_group_form" method="GET" action="https://www.onoffmix.com/rsvp/attend/170556">
									<div class="group_area">
										<div class="group_wrapping">
											<p class="reg_date">
												<span class="title">신청기간</span> <span class="date"> ${view.circle_Date1}(${view.circle_Date1_week}) <c:if test="${view.circle_Date2!=null}">~${view.circle_Date1} (${view.circle_Date1_week})</c:if>${view.circle_Time}
												</span>
											</p>
											<div class="group_scroll no_scroll">
												<ul class="group_list">
													<c:forEach var="g_view" items="${glist}">
														<li class="">
															<input type="hidden" checked="checked" id="checkbox_group_223187" class="checkbox group_choice_checkbox" name="group[]" value="223187" rel="0"> <label class="group_title" for="checkbox_group_223187">${g_view.c_groupTitle}</label>
															<div class="pay_type">

																<div class="container">
																	<div class="input-group spinner">
																		<c:if test="${g_view.c_group_PFchk==1}">
																			<span class="price_wrap"> <span class="price">무료</span>
																		</c:if>
																		<c:if test="${g_view.c_group_PFchk==2}">
																			<span class="price_wrap"> <span class="price">유료</span>
																		</c:if>
																	</div>
																</div>
															</div>
															<div class="attend_wrap">
																<span class="type">선착순</span> <span class="total">정원 <span class="number_txt">${g_view.c_groupCnt}</span>명
																</span>
																<!-- 라벨 영역 -->
																<div class="label_wrap">
																	<c:if test="${g_view.c_groupin_cnt==g_view.c_groupCnt}"><span class="badge badge-danger">마감</span></c:if>
																	<c:if test="${g_view.c_groupin_cnt!=g_view.c_groupCnt}"><span class="badge badge-primary">신청가능</span></c:if>
																</div>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>

									<!-- Buttons -->
									<div class="btn_area">
										<!-- 찜 CASE 2 -->
										<button class="btn_pin " title="찜하기" rel="170556|0">
											<span class="count">5</span>
										</button>
										<!-- 버튼 CASE 6 -->
										<input type="submit" value="신청하기" class="btn_submit">
										<!-- <input type="submit" value="추가 신청하기" class="btn_submit"> -->
										<!-- <input type="submit" value="신청하기 (외부접수)" class="btn_submit"> -->
										<!-- <input type="submit" value="본 모임은 23시간 후에 신청이 시작됩니다." class="btn_submit disabled"> -->
										<!-- <input type="submit" value="참여 신청이 완료되었습니다." class="btn_submit disabled"> -->
										<!-- <input type="submit" value="참여 신청이 마감되었습니다." class="btn_submit disabled"> -->

										<!-- 참고문구 CASE 3 -->
									</div>
								</form>
							</div>
							</section>

							<!-- event detail -->
							<section class="event_detail">
							<h2 class="title hidden">모임 상세 정보</h2>

							<ul class="tab_menu">
								<li class="active">
									<a href="#eventDetail" class="parse_print">모임상세 정보</a>
								</li>
								<li>
									<a href="#eventMap">지도 보기</a>
								</li>
								<li>
									<a href="#eventComment" class="parse_print">
										문의<span class="entities">/</span>기대평 <span class="comment_number"> <span class="entities">(</span><span class="total_number blue_txt">${view.circle_Recnt}</span><span class="entities">)</span>
										</span>
									</a>
								</li>
								<li>
									<a href="#eventTip" class="parse_print">
										참여신청<span class="entities">/</span>취소 안내
									</a>
								</li>
								<li class="btn_top">
									<button type="button">TOP</button>
								</li>
							</ul>

							<div class="tab_content">
								<!-- eventDetail -->
								<div id="eventDetail" class="description justify-content-md-center">
									<div class="row  justify-content-md-center">${view.circle_Content}</div>
								</div>

							</div>
							<!-- eventMap -->
							<div id="eventMap" class="containter-fluid text-center">
								<div class="row  justify-content-md-center">
									<div id="map1" style="width: 90%; height: 400px"></div>
									<!-- 검색후 자동 주소 입력 -->
								</div>
								<div class="row justify-content-md-center">
									<div class="place">${view.circle_Addr1}&nbsp;${view.circle_Addr2}</div>
								</div>
							</div>
							<!-- Reply_List --> <!-- eventComment -->
							<div id="eventComment" class="containter" style="padding: 40px">
								<div class="row">
									<div class="col-sm-6">
										<h3 class="title">
											문의/기대평<span class="total"> (<span class="total_number blue_txt">${view.circle_Recnt}</span>건)
											</span>
										</h3>
									</div>
									<div class="col-sm-6">
										<p class="tip_txt">기대평이나 문의사항을 댓글에 남겨주세요.</p>
									</div>
								</div>
								<!-- 댓글 폼 -->
								<div class="row">
									<form action="http://localhost:8080/circle/circleReply_Ins" method="post" class="reply_form">
										<input type="hidden" value="${view.circle_No}" name="circle_no">
										<div class="profile_img">
											<img src="../../static.onoffmix.com/images/pc/default/userPhoto_50.png" alt=" 프로필 사진">
										</div>
										<textarea title="댓글을 입력해 보세요." name="reply_content" placeholder="모임과 관련없는 글, 비방, 홍보, 도배 등의 글을 작성할 경우 이용약관에 의해 제재를 받을 수 있습니다."></textarea>
										<input type="button" class="btn_submit reply reply_write" id="reply_btn" value="등록" rel="170556">
									</form>
								</div>
								<!-- 댓글 CASE 2  -->
								<!--  댓글이 없을경우 -->


								<!-- 댓글이 있을 경우 시작 : 리스트가 보임 -->
								<!-- 댓글 리스트 -->
								<div class="row">
									<ul class="reply_list">
										<!-- 331307 -->
										<c:forEach var="RView" items="${RView}" varStatus="stat">

											<c:if test="${RView.reply_level  eq 1}">
												<li>
											</c:if>

											<div class="<c:if test="${RView.reply_level  eq 1}">reply_area</c:if> <c:if test="${RView.reply_level  ne 1}">child_reply_area</c:if> " id="comment_352218">

												<div class="profile_img">
													<!-- href="사용자 마이페이지" -->
													<a class="photo_link" href="https://www.onoffmix.com/tTpr5U12Bq4mezcGYuM7" target="_blank" title="프로필 새 창 열림">
														<!-- 사용자 프로필 이미지 50*50 -->
														<img src="../../static.onoffmix.com/images/pc/default/userPhoto_50.png" alt="노을">
													</a>
												</div>
												<div class="reply_content">
													<div class="write_info">
														<!-- 신청자일 경우 span.participant_label 붙음 -->
														<c:set var="reply_id" value="${fn:trim(RView.reply_id)}" />
														<c:set var="user_id" value="${fn:trim(view.user_id)}" />
														<c:choose>
															<c:when test="${reply_id eq user_id}">
																<span class="host_label">개설자</span>
															</c:when>
															<c:when test="${reply_id ne user_id}">
																<span class="participant_label">신청자</span>
															</c:when>
															<c:when test="${'Admin' eq user_id}">
																<span class="participant_label">관리자</span>
															</c:when>
														</c:choose>
														<span class="name">${RView.user_nm} <span class="date">${fn:substring(RView.reply_in_date,0,11)}</span></span>
													</div>
													<p class="reply_text">${RView.reply_content}</p>
													<c:if test="${RView.reply_level  eq 1}">
														<button type="button" class="btn btn-info btn-sm replyRebtn" data-index="${stat.index}">댓글쓰기</button>
													</c:if>
												</div>

												<div class="child_reply_area form-Rereply${stat.index}" style="display: none;">
													<form class="form-inline reply_data${stat.index}" id="eventComment ">
														<input type="hidden" name="reply_no" value="${RView.reply_no}"> <input type="hidden" name="reply_level" value="${RView.reply_level}"> <input type="hidden" name="circle_no" value="${view.circle_No}">
														<div class="profile_img">
															<img src="http://localhost:8080/static.onoffmix.com/images/pc/default/userPhoto_50.png" class="rounded-circle border border-light" alt="Cinque Terre">
														</div>
														<textarea title="댓글을 입력해 보세요." name="reply_content" class="form-control col-sm-9" placeholder="모임과 관련없는 글, 비방, 홍보, 도배 등의 글을 작성할 경우 이용약관에 의해 제재를 받을 수 있습니다."></textarea>
														<button type="button" class="btn btn-primary btn-lg reply_Insbtn" data-index="${stat.index}">등록</button>
													</form>
												</div>
												<!-- 대댓글 리스트 -->


											</div>

											<!-- 대댓글 영역 -->

											<!-- 답 댓글 폼 -->


											<!-- 대댓글 영역 -->

											<c:if test="${RView.reply_level  eq 1}">
												</li>
											</c:if>
											<c:if test="${RView.reply_level  ne 1}">
												<br>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								<!-- 댓글이 있을 경우 끝 -->

							</div>

							<!-- 							reply시장 --> <!-- reply끝 --> <!-- eventTip -->
							<div id="eventTip" style="padding: 40px">
								<h3 class="title">참여신청/취소 안내</h3>
								<ul class="tip_list">
									<li>
										* <strong>모임의 신청/취소/변경/환불은 참여신청 기간 내에만 가능합니다.</strong>
									</li>
									<li>
										* <strong>결제한 유료모임은 환불 시 결제 수단과 환불 시점에 따라 수수료가 부과될 수 있습니다. 자세한 사항은 <a href="https://www.onoffmix.com/legal/cancelAndRefund" target="_blank" title="새 창 열림">취소/환불약관</a>을 확인해주세요.
										</strong>
									</li>
									<li>* 결제, 환불, 참여신청 수정/취소, 참여상태 확인, 참여내역 확인은 마이페이지에서 할 수 있습니다.</li>
									<li>
										* 모임 또는 그룹의 설정, 모집정원 초과 여부에 따라 대기자로 선정될 수 있습니다. 자세한 사항은
										<a href="https://www.onoffmix.com/cs/faq/attendee#4" target="_blank" title="새 창 열림">FAQ</a>
										를 확인해주세요.
									</li>
									<li>
										* 온오프믹스 결제서비스를 이용하는 모임은 개설자의 사업자 여부에 따라 결제증빙 발행이 가능합니다. 자세한 사항은
										<a href="https://www.onoffmix.com/cs/faq/attendee#262" target="_blank" title="새 창 열림">FAQ</a>
										를 확인해 주세요.
									</li>
									<li>* 개설자 선정방식 또는 개설자 통장입금 방식의 모임 참여/결제 확인은 개설자에게 문의 바랍니다.</li>
									<li>* 온오프믹스는 참여신청 및 참가비 결제 기능을 제공하는 회사로 모임개설자(주최측)가 아닙니다. 모임 내용과 관련한 사항은 모임 개설자에게 문의 바랍니다.</li>
								</ul>
							</div>
						</div>
						</section>
					</div>
					<!--내용영역 끝 -->
					<div class="modal" id="location">
						<div class="modal-dialog ">
							<div class="modal-content ">
								<div id="map" style="width: 100%; height: 400px;"></div>
							</div>
						</div>
					</div>
					<!--/card-block-->
				</div>
				<!-- /form card login -->
			</div>

		</div>
</body>
</html>
<script>
 /*  function initMap(p1, p2, name) {
    //옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 11 레벨의 지도가 생성됩니다.

    var mapOptions = {
    center : new naver.maps.LatLng(p1, p2),
    zoom : 14, // 줌 설정 : 1~14, 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
    zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
    zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
      position : naver.maps.Position.TOP_RIGHT
    // 오른쪽 위로 설정값
    },
    mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함),
    size : new naver.maps.Size(600, 400)
    };
    var map = new naver.maps.Map(name, mapOptions);

    var marker = new naver.maps.Marker({
    position : new naver.maps.LatLng(p1, p2),
    map : map,
    icon : {
    url : 'http://localhost:8080/img/ico_pin.jpg', //50, 68 크기의 원본 이미지
    size : new naver.maps.Size(25, 34),
    scaledSize : new naver.maps.Size(25, 34),
    origin : new naver.maps.Point(0, 0),
    anchor : new naver.maps.Point(12, 34)
    }
    });
  }
  function initMap1(p1, p2, name) {
    //옵션 없이 지도 객체를 생성하면 서울 시청을 중심으로 하는 11 레벨의 지도가 생성됩니다.

    var mapOptions = {
    center : new naver.maps.LatLng(p1, p2),
    zoom : 14, // 줌 설정 : 1~14, 수치가 클수록 지도 확대(줌인), 이 옵션 생략시 기본값 9
    zoomControl : true, // 줌 컨트롤 표시 (기본값 표시안함)
    zoomControlOptions : { // 줌 컨트롤 오른쪽 위로 위치 설정
      position : naver.maps.Position.TOP_RIGHT
    // 오른쪽 위로 설정값
    },
    mapTypeControl : true, // 일반ㆍ위성 지도보기 컨트롤 표시 (기본값 표시안함),
    };
    var map = new naver.maps.Map(name, mapOptions);

    var marker = new naver.maps.Marker({
    position : new naver.maps.LatLng(p1, p2),
    map : map,
    icon : {
    url : 'http://localhost:8080/img/ico_pin.jpg', //50, 68 크기의 원본 이미지
    size : new naver.maps.Size(25, 34),
    scaledSize : new naver.maps.Size(25, 34),
    origin : new naver.maps.Point(0, 0),
    anchor : new naver.maps.Point(12, 34)
    }
    });
  } */
  $(function() {
    $("#spinner").spinner({
    min : 0,
    max : 5,
    step : 1
    });
    var point_code = "${view.circle_Point}";
    var test = point_code.split(',');
    var par1 = 0.0;
    var par2 = 0.0;
    par1 = parseFloat(test[0]);
    par2 = parseFloat(test[1]);
  //  initMap(par1, par2, 'map');
  //  initMap1(par1, par2, 'map1');

    $("#kind2").chained("#kind1");
    $(".replyRebtn").click(function() {
     
      $(".form-Rereply"+$(this).data("index")).toggle();
    });
    
    $("#reply_btn").click(function() {
      $.ajax({
      type : "POST",
      url : "http://localhost:8080/circle/circleReply_Ins",
      async : false,
      data : $(".reply_form").serialize(),
      dataType : "json",
      cache : false,
      success : function(data) {
        alert("저장되었습니다.");
        location.reload();
      },
      error : function(data) {
        alert('죄송합니다. 잠시 후 다시 시도해주세요.');
        return false;
      }
      });
    });
    $(".reply_Insbtn").click(function() {
      $.ajax({
      type : "POST",
      url : "http://localhost:8080/circle/circleReply_Ins",
      async : false,
      data : $(".reply_data"+$(this).data("index")).serialize(),
      dataType : "json",
      cache : false,
      success : function(data) {
        alert("저장되었습니다.");
        location.reload();
      },
      error : function(data) {
        alert('죄송합니다. 잠시 후 다시 시도해주세요.');
        return false;
      }
      });
    });
    
  });
</script>

