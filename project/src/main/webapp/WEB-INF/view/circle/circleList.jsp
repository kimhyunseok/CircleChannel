<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="http://localhost:8080/css/circle.css" rel="stylesheet">

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<body>

	<div id="wrapper" class="animate">
		<jsp:include page="/WEB-INF/view/include/menu.jsp" />
		<div class="container-fluid ">
			<nav aria-label="breadcrumb">
			<ol class="breadcrumb ">
				<li class="breadcrumb-item active" aria-current="page">Home/${requestScope.title}</li>
			</ol>
			</nav>
			<div class="container">
				<!-- row --/// -->
				<div class="row">
					<div class="card card-body bg-light">
						<div class="card-title">
							<h4>카테고리</h4>
						</div>
						<div class="form-group">
							<c:forEach items="${menu}" var="menu" varStatus="start">
							<a href="${menu.menu_href}&Kind1=${menu.menu_code1}&Kind2=1"><button type="button" class="btn btn-primary"><i class="${menu.menu_icon}"></i> ${menu.menu_nm} </button></a>
							</c:forEach>
						</div>
					</div>
					<!-- row --/// -->

				</div>
			</div>
		</div>
		<form action="http://localhost:8080/circle/circleList?pageNum=${param.pageNum}&Kind1=${param.Kind1}&Kind2=${param.Kind2}"  method="post">
			<div class="container ">
				<!-- row --/// -->
				<div class="row">

					<div class="card card-body bg-light">
						<div class="form-group">
							<div class="input-group">
								<input type="hidden" name="pageNum" value="${param.pageNum}">
								<input type="hidden" name="Kind1" value="${param.Kind1}">
								<input type="hidden" name="Kind2" value="${param.Kind2}">

								<input type="text" class="form-control" placeholder="Search"
									name="form_search"> <br>
								<div class="input-group-btn">
									<button class="btn btn-danger" type="submit">
										<i class="fa fa-search fa-w-16 fa-2x"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="form-group form-inline">
							<select class="form-control col-sm-3" name="code">
								<option value="">선택</option>
								<c:forEach items="${code1}" var="code">
								    <c:if test="${code.code_Val_2 eq 0}">
									<option value="${code.code_Val_1}" <c:if test="${param.code eq code.code_Val_1}">selected</c:if>>${code.code_Nm}</option>  >${code.code_Nm}</option>
									</c:if>
								</c:forEach>
							</select> 
							<select class="form-control col-sm-3" name="location">
							<option value="">선택</option>
								<c:forEach items="${code2}" var="code">
									<option value="${code.code_Val_1}" <c:if test="${param.location eq code.code_Val_1}">selected</c:if>>${code.code_Nm}</option>>
								</c:forEach>
							</select> <select class="form-control col-sm-3" name="pay">
							<option value="">선택</option>
								<option value="1" <c:if test="${param.pay eq 1}">selected</c:if>>무료</option>
								<option value="2" <c:if test="${param.pay eq 2}">selected</c:if>>유료</option>
								<option value="3" <c:if test="${param.pay eq 3}">selected</c:if>>오전</option>
								<option value="4" <c:if test="${param.pay eq 4}">selected</c:if>>오후</option>
							</select> <input type="text" name="date" id="datepicker" class="form-control" value="${param.date}">
						</div>
					</div>
				</div>
		</form>
		<!-- row --/// -->
	</div>
	<!--게시판 empty-->
	<c:if test="${empty list}">
		<div class="container ">
			<div class="row">
				<div class="card card-body bg-light text-center">등록된 글이 없습니다.
				</div>
			</div>
		</div>
	</c:if>
	<!--게시판 empty-->
	<!--게시판 -->
	<c:if test="${null ne list}">
		<div class="container-fluid">
			<div class="container ">
				<c:forEach var="list" items="${list}" varStatus="stat">

					<!-- row --/// -->
					<c:if test="${ (stat.index)%4 eq 0}">
						<div class="row">
					</c:if>
					<div class="col-sm-3 ">

						<div class="card">
							<div class="card-block">
								<figure> <img src="${list.file_url}/${list.file_name}"
									height="250px" alt="image" style="width: 100%"> </figure>
								<h1 class="card-title mt-3">${list.circle_Nm}</h6>
									<div class="meta">
										<a>인원:${list.circle_Cnt}명</a>
									</div>
									<div class="card-text">${list.circle_Addr1}<br>${list.circle_Addr2}</div>
									<div class="card-text">
										${list.circle_Date1}.${list.circle_Date1_week}
										<c:if test="${list.circle_Date2!=null}">~${list.circle_Date2}.${list.circle_Date2_week}</c:if>
									</div>
							</div>
							<div class="card-footer">
								<small></small>
								<button class="btn btn-secondary float-right btn-sm CirView_btn"
									data-num="${list.circle_No}">show</button>
							</div>
						</div>


					</div>
					<c:if test="${ (stat.count)%4 eq 0}">
			</div>
	</c:if>
	</c:forEach>
	</div>
	</div>
	</c:if>
	<!--게시판 -->
	<div class="container ">
		<div class="col-sm-12">
			<div class="form-row  justify-content-md-center ">
				<ul class="pagination">
					<c:if test="${pagination.curRange ne 1 }">
						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/circle/circleList?pageNum=1">[처음]</a>
						</li>
					</c:if>
					<c:if test="${pagination.curPage ne 1}">
						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/circle/circleList?pageNum=${pagination.prevPage}">[이전]</a>
						</li>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPage }"
						end="${pagination.endPage}">
						<c:choose>
							<c:when test="${pageNum eq  pagination.curPage}">
								<li class="page-item active"><a class="page-link"
									href="http://localhost:8080/circle/circleList?pageNum=${pageNum}">${pageNum }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="http://localhost:8080/circle/circleList?pageNum=${pageNum}">${pageNum}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if
						test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/circle/circleList?pageNum=${pagination.nextPage}">[다음]</a>
						</li>
					</c:if>
					<c:if
						test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
						<li class="page-item"><a class="page-link"
							href="http://localhost:8080/circle/circleList?pageNum=${pagination.pageCnt}">[끝]</a>
						<li class="page-item">
					</c:if>
				</ul>
			</div>
		</div>

		<c:if test="${sessionScope.ss_id ne null}">
			<div class="col-sm-12 text-right">
				<button type="button" class="btn" id="b_Insert">등록</button>
				<button type="button" class="btn" id="del_btn">삭제</button>
			</div>
		</c:if>
	</div>

	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	</div>
	</div>


	</div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		$('#b_Insert').click(function() {
			location.replace('http://localhost:8080/circle/circleInsert');
		});
		$('.CirView_btn').click(function() {
			var num = $(this).data("num");
		    location.replace('http://localhost:8080/circle/circleView?pageNum='+ num+ '&Kind1=${param.Kind1}&Kind2=${param.Kind2}');
		});
		 "option", "showAnim", $( this ).val()
		 $(" #datepicker").datepicker({
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
		        showAnim:"slideDown"
		        });
		
	});
</script>
