<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<body>

	<div id="wrapper" class="animate">

		<jsp:include page="/WEB-INF/view/include/menu.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8">
					<div class="card">
						<div class="card-body">
							<!--Carousel Wrapper-->
							<div id="carousel-example-1z"
								class="carousel slide carousel-fade" data-ride="carousel">
								<!--Indicators-->
								<ol class="carousel-indicators">
									<li data-target="#carousel-example-1z" data-slide-to="0"
										class="active"></li>
									<li data-target="#carousel-example-1z" data-slide-to="1"></li>
									<li data-target="#carousel-example-1z" data-slide-to="2"></li>
								</ol>
								<!--/.Indicators-->
								<!--Slides-->
								<div class="carousel-inner" role="listbox">
									<!--First slide-->
									<div class="carousel-item active">
										<img class="d-block w-100"
											src="https://mdbootstrap.com/img/Photos/Slides/img%20(130).jpg"
											alt="First slide">
									</div>
									<!--/First slide-->
									<!--Second slide-->
									<div class="carousel-item">
										<img class="d-block w-100"
											src="https://mdbootstrap.com/img/Photos/Slides/img%20(129).jpg"
											alt="Second slide">
									</div>
									<!--/Second slide-->
									<!--Third slide-->
									<div class="carousel-item">
										<img class="d-block w-100"
											src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg"
											alt="Third slide">
									</div>
									<!--/Third slide-->
								</div>
								<!--/.Slides-->
								<!--Controls-->
								<a class="carousel-control-prev" href="#carousel-example-1z"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="sr-only">Previous</span>
								</a> <a class="carousel-control-next" href="#carousel-example-1z"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon" aria-hidden="true"></span> <span
									class="sr-only">Next</span>
								</a>
								<!--/.Controls-->
							</div>
							<!--/.Carousel Wrapper-->
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">ÀÌ ¸ù</h5>
							<h6 class="card-subtitle mb-2 text-muted">Bootstrap 4.0.0
								Snippet by pradeep330</h6>
							<p class="card-text"></p>
							<a href="https://bootsnipp.com/pradeep330" class="card-link">link</a>
							<a href="http://websitedesigntamilnadu.com" class="card-link">Another
								link</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">¿À´ÃÀÇ ¸ðÀÓ</h5>
							<!-- container -->
							<div class="container-fluid">
								<!-- row -->
								<c:forEach var="list" items="${list}" varStatus="stat">
									<c:if test="${ (stat.index)%4 eq 0}">
										<div class="row">
									</c:if>
									<div class="col-sm-2">
									<c:set var="kind" value="${fn:split(list.circle_Kind,',')}"></c:set>

										<a href="http://localhost:8080/circle/circleList?pageNum=1&Kind1=${kind[0]}&Kind2=${kind[1]}" >
										<div class="card">
											<div class="card-block text-center">
												<figure > <img
													src="${list.file_url}/${list.file_name}" height="250px" width="250px"alt="image"> </figure>
												<h1 class="card-title mt-3">${list.circle_Nm}</h1>
												<div class="meta text-left">
													<a>ÀÎ¿ø:${list.circle_Cnt}¸í</a>
												</div>
												<div class="card-text text-left">${list.circle_Addr1}<br>${list.circle_Addr2}</div>
												<div class="card-text text-left">
													${list.circle_Date1}.${list.circle_Date1_week}
													<c:if test="${list.circle_Date2!=null}">~${list.circle_Date2}.${list.circle_Date2_week}</c:if>
												</div>
											</div>
											<div class="card-footer">
												<small></small>
												<button
													class="btn btn-secondary float-right btn-sm CirView_btn">show</button>
											</div>
										</div>
										</a>
										<c:if test="${ (stat.count)%4 eq 0}">
									</div>
									</c:if>
								</c:forEach>
								<!-- row -->
							</div>
							<!-- container -->
						</div>

					</div>
				</div>
			</div>
			<!-- row3 -->

		</div>
	</div>
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />


</body>
</html>


<!------ Include the above in your HEAD tag ---------->