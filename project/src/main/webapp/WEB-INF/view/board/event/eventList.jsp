<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<link href="http://localhost:8080/css/circle.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
								<th scope="col" width="5%"><input type="checkbox" id="checkall"></th>
								<th scope="col" width="5%">No</th>
								<th scope="col" width="60%">������</th>
								<th scope="col" width="15%">�ۼ���</th>
								<th scope="col" width="15%">�ۼ���</th>
							</tr>
						</thead>
						<tbody class="table table-bordered">
							<form action="" id="formdata">
								<input type="hidden" id="no">
								<c:if test="${null ne list}">
									<c:forEach var="list" items="${list}">
										<c:if test="${'Y' eq list.board_del_chk}">
											<tr>
												<td colspan="5">�� ���� �����Ǿ����ϴ�</td>
											</tr>
										</c:if>
										<c:if test="${'Y' ne list.board_del_chk}">
											<tr>
												<td scope="row"><input type="checkbox" name="chk" class="chk" value="${list.board_no}"></td>
												<td scope="row">${list.board_no}</td>
												<td><a class="btn btn-default" href="http://localhost:8080/board/event/eventView?pageNum=${list.board_no}">${list.board_nm}</a></td>
												<td>������</td>
												<td>${fn:substring(list.board_in_date,0,11)}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							<c:if test="${empty list}">
								<tr>
									<td scope="row" colspan="4" align="center">��ϵ� ���� �����ϴ�</td>
								</tr>
							</c:if>

							</form>
						</tbody>
						<tfoot>
							<tr>
								<td scope="row" align="right" colspan="5">
									<button type="button" class="btn" id="b_Insert">���</button>
									<button type="button" class="btn" id="upt_btn">����</button>
									<button type="button" class="btn" id="del_btn">����</button>
								</td>
							</tr>
						</tfoot>
					</table>

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
  $(function() {
    $('#b_Insert').click(function() {
      location.replace('http://localhost:8080/board/event/eventInsert');
    });

    $("#checkall").click(function() {
      //Ŭ���Ǿ�����
      if ($("#checkall").prop("checked")) {
        //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
        $("input[name=chk]").prop("checked", true);
        //Ŭ���� �ȵ�������
      } else {
        //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
        $("input[name=chk]").prop("checked", false);
      }
    });
    //����ó��-����
    $("#upt_btn").click(function() {
     var Clength= $('input:checkbox[name=chk]:checked').length;
     if(Clength!=1){
       alert("�ϳ��� �����ϼ���.");
       $("input[name=chk]").prop("checked", false);
     }else{
       var DATA = '';
       $('input:checkbox[name=chk]').each(function() {
         if ($(this).is(':checked'))
           DATA += "|" + ($(this).val());
       });
       $("#formdata").attr("action", "http://localhost:8080/board/event/eventUpdate");
       $("#formdata").submit();
     }
     //����ó��-��
    });
    
    //����ó��-����
    $("#del_btn").click(function() {
      var con_test = confirm("�����Ͻðڽ��ϱ�?");
      var DATA = '';
      if (con_test == true) {
        $('input:checkbox[name=chk]').each(function() {
          if ($(this).is(':checked'))
            DATA += "|" + ($(this).val());
        });
        $("#formdata").attr("action", "http://localhost:8080/board/event/eventDelete");
        $("#formdata").submit();
      }
    });
  //����ó��-��
  })
</script>