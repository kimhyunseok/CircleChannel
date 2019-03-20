<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<link href="http://localhost:8080/css/circle.css" rel="stylesheet">
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
		<div class="container-fluid">
			<div class="container ">
				<div class="row">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">이름</th>
								<th scope="col">성</th>
								<th scope="col">아이디</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>Larry</td>
								<td>the Bird</td>
								<td>@twitter</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
			<jsp:include page="/WEB-INF/view/include/footer.jsp" />
		</div>
</body>
</html>
<script type="text/javascript">
  
</script>
