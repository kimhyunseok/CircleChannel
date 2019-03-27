<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
						<div class="form-group">
							<button type="button" class="btn btn-primary">��ȭ</button>
							<button type="button" class="btn btn-primary">����</button>
							<button type="button" class="btn btn-primary">���͵�</button>
							<button type="button" class="btn btn-primary">���</button>
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
						<button type="button" class="btn btn-success">�ֽż�</button>
						<button type="button" class="btn btn-success">�α��</button>
					</div>
				</div>
			</div>
			<!-- row --/// -->
		</div>
		<div class="container-fluid">
			<div class="container ">
				<div class="row">
					<table class="table ">
						<thead class="thead-dark">
							<tr>
								<th scope="col" width="5%"  class="text-center"><input type="checkbox" id="checkall"></th>
								<th scope="col" width="5%"  class="text-center">No</th>
								<th scope="col" width="45%" >������</th>
								<th scope="col" width="15%" class="text-center">�ۼ���</th>
								<th scope="col" width="15%" class="text-center">������</th>
								<th scope="col" width="15%" class="text-center"></th>
							</tr>
						</thead>
						<tbody class="table table-bordered">
							<form action="" id="formdata">
								<input type="hidden" id="no">
								<c:if test="${null ne list}">
									<c:forEach var="list" items="${list}">
									
											<tr>
												<td scope="row"class="text-center"><input type="checkbox" name="chk" class="chk" value="${list.circle_No}"></td>
												<td scope="row" class="text-center">${list.circle_No}</td>
												<td><a class="btn btn-default" href="http://localhost:8080/board/event/eventView?pageNum=${list.circle_No}">${list.circle_Nm}</a></td>
												<td class="text-center">������</td>
												<td class="text-center">${fn:substring(list.circle_in_date,0,11)}</td>
												<td class="text-center"><button type="button" class="btn btn-primary" onclick="fn_apply(${list.circle_No});">��û�ڰ���</button>&nbsp;<button class="btn btn-primary" >����</button></td>
											</tr>
									</c:forEach>
								</c:if>
							<c:if test="${empty list}">
								<tr>
									<td scope="row" colspan="6" align="center">��ϵ� ���� �����ϴ�</td>
								</tr>
							</c:if>

							</form>
						</tbody>
						<tfoot>
							<tr>
								<td scope="row" align="right" colspan="6">
									
									<button type="button" class="btn" id="del_btn">����</button>
								</td>
							</tr>
						</tfoot>
					</table>
					</div>
					<div class="container ">
						<div class="form-row  justify-content-md-center ">
							<ul class="pagination">
								<c:if test="${pagination.curRange ne 1 }">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=1">[ó��]</a>
									</li>
								</c:if>
								<c:if test="${pagination.curPage ne 1}">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.prevPage}">[����]</a>
									</li>
								</c:if>
								<c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
									<c:choose>
										<c:when test="${pageNum eq  pagination.curPage}">
											<li class="page-item active">
												<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pageNum}">${pageNum }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pageNum}">${pageNum}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.nextPage}">[����]</a>
									</li>
								</c:if>
								<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.pageCnt}">[��]</a>
									<li class="page-item">
								</c:if>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/include/footer.jsp" />
		</div>
</body>
</html>
<script type="text/javascript">
function fn_apply(test){
    var windowW = 600;  // â�� ���� ����
    var windowH = 500;  // â�� ���� ����
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);
    window.open("./ApplyPeopleList?circle_no="+test,"pop_01","top="+top+", left="+left+", height="+windowH+", width="+windowW+"scrollbars=no");
}
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
