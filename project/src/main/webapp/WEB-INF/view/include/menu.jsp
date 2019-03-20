<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="fakeLoader"></div>
<nav class="navbar header-top fixed-top navbar-expand-lg bg-primary navbar-dark center">

	<button class="navbar-toggler text-white collapsed" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="true" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse " id="navbarText">

		<ul class="navbar-nav animate side-nav">
			<c:forEach items="${menu}" var="menu" varStatus="start">
				<li class="nav-item">
					<a class="nav-link text-white" id="navbarDropdown${start.index}" href="#" title=" ${menu.menu_nm} " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="${menu.menu_icon}"></i> ${menu.menu_nm} <i class="${menu.menu_icon} shortmenu animate" ></i>
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown${start.index}">
						<div class="list-group">
							<c:forEach items="${Smenu}" var="Smenu" varStatus="start">
								<c:if test="${menu.menu_code1==Smenu.menu_code1}">
									<a href="${Smenu.menu_href}" class="list-group-item list-group-item-action">${Smenu.menu_nm}</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</li>
			</c:forEach>

			<li class="nav-item">

				<a class="nav-link text-white" id="navbarDropdown3" href="#" title="Comment" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-building"></i> 소개 <i class="fas fa-building shortmenu animate"></i>
				</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action">회사소개</a>
						<a href="http://localhost:8080/board/event/eventList?pageNum=1" class="list-group-item list-group-item-action">이벤트</a>
					</div>
			</li>
			<c:choose>
				<c:when test="${sessionScope.ss_id ne null}">
					<li class="nav-item dropdown">
						<a class="nav-link  text-white" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fas fa-bicycle"></i>마이페이지<i class="fas fas fa-bicycle shortmenu animate"></i>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
							<div class="list-group">
								<a href="http://localhost:8080/memberUpdate" class="list-group-item list-group-item-action">정보수정</a>
								<a href="http://localhost:8080/circle/circleInsert" class="list-group-item list-group-item-action">동아리등록</a>
								<a href="http://localhost:8080/circle/circleInsert" class="list-group-item list-group-item-action">내 동아리목록</a>
							</div>
						</div>
					</li>
				</c:when>
			</c:choose>
		</ul>
		<!-- 로그인 Start -->

		<span class="navbar-toggler-icon leftmenutrigger"></span>
		<a class="navbar-brand nav-link " href="http://localhost:8080/">
			<img src="http://localhost:8080/img/logo.png" class="img-rounded" alt="Cinque Terre" width="90" height="50">
		</a>


		<div class=" container">
			<div class="row justify-content-md-center">
				<div class="col-lg-6">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" id=""> <span class="input-group-btn">
							<button class="btn btn-danger form-control" type="button" id="search_btn2">
								<i class="fas fa-search"></i>&nbsp;
							</button>
						</span>
					</div>
					<!-- /input-group -->
				</div>
			</div>
		</div>

		<ul class="navbar-nav navbar-right">
			<c:choose>
				<c:when test="${sessionScope.ss_id eq null}">
					<!-- Join Area -->
					<li class="nav-item">
						<a class="nav-link text-white" href="http://localhost:8080/member" data-toggle="tooltip" data-placement="bottom" title="가입하기">
							<i class="fas fa-users"></i>&nbsp;
						</a>
					</li>
					<!-- join Area -->
					<!-- Login Area -->
					<li class="nav-item">
						<a class="nav-link text-white" href="http://localhost:8080/login" data-toggle="tooltip" data-placement="bottom" title="로그인">
							<i class="fas fa-sign-in-alt"></i>&nbsp;
						</a>
					</li>
					<!-- Login Area -->
				</c:when>
				<c:when test="${sessionScope.ss_id ne null}">
					<li class="nav-item">
						<a class="nav-link text-white" href="http://localhost:8080/memberUpdate" data-toggle="tooltip" data-placement="bottom" title="회원정보수정">
							<i class="fas fa-address-book"></i>
							<c:out value="${sessionScope.ss_nm}" />
							님
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-white" href="http://localhost:8080/logout" data-toggle="tooltip" data-placement="bottom" title="로그아웃">
							<i class="fas fa-sign-in-alt"></i> Logout
						</a>
					</li>
				</c:when>
			</c:choose>
		</ul>

		<!-- 로그인 End -->
	</div>
</nav>
<script>
  $(document).ready(function() {
    function loading() {
      $("#fakeLoader").fakeLoader({
      timeToHide : 1000, //Time in milliseconds for fakeLoader disappear
      zIndex : 999, // Default zIndex
      spinner : "spinner2",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
      bgColor : "#dcdcdc" //Hex, RGB or RGBA colors
      });
    }

    $('[data-toggle="tooltip"]').tooltip();
    $(window).on('load', loading());
  });
</script>