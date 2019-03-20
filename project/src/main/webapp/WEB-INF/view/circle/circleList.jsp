<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
							<button type="button" class="btn btn-primary">문화</button>
							<button type="button" class="btn btn-primary">여행</button>
							<button type="button" class="btn btn-primary">스터디</button>
							<button type="button" class="btn btn-primary">취미</button>
						</div>
					</div>
					<!-- row --/// -->

				</div>
			</div>
		</div>

		<div class="container ">
			<!-- row --/// -->
			<div class="row">
				<div class="card card-body bg-light">
					<div class="form-group">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search" name="search"> <br>
							<div class="input-group-btn">
								<button class="btn btn-danger" type="submit">
									<i class="fa fa-search fa-w-16 fa-2x"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-success">최신순</button>
						<button type="button" class="btn btn-success">인기순</button>
					</div>
				</div>
			</div>
			<!-- row --/// -->
		</div>
		<!--게시판 empty-->
		<c:if test="${empty list}">
			<div class="container ">
				<div class="row">
					<div class="card card-body bg-light text-center">
						등록된 글이 없습니다.
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
									<figure> <img src="${list.file_url}/${list.file_name}" height="250px" alt="image" style="width: 100%"> </figure>
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
									<button class="btn btn-secondary float-right btn-sm CirView_btn" data-num="${list.circle_No}">show</button>
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
						<li class="page-item">
							<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=1">[처음]</a>
						</li>
					</c:if>
					<c:if test="${pagination.curPage ne 1}">
						<li class="page-item">
							<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=${pagination.prevPage}">[이전]</a>
						</li>
					</c:if>
					<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage}">
						<c:choose>
							<c:when test="${pageNum eq  pagination.curPage}">
								<li class="page-item active">
									<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=${pageNum}">${pageNum }</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=${pageNum}">${pageNum}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
						<li class="page-item">
							<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=${pagination.nextPage}">[다음]</a>
						</li>
					</c:if>
					<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
						<li class="page-item">
							<a class="page-link" href="http://localhost:8080/circle/circleList?pageNum=${pagination.pageCnt}">[끝]</a>
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
      location.replace('http://localhost:8080/circle/circleView?pageNum=' + num);
    });
  });
</script>
