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
					<table class="table ">
						<thead class="thead-dark">
							<tr>
								<th scope="col" width="5%"><input type="checkbox" id="checkall"></th>
								<th scope="col" width="5%">No</th>
								<th scope="col" width="60%">글제목</th>
								<th scope="col" width="15%">작성자</th>
								<th scope="col" width="15%">작성일</th>
							</tr>
						</thead>
						<tbody class="table table-bordered">
							<form action="" id="formdata">
								<input type="hidden" id="no">
								<c:if test="${null ne list}">
									<c:forEach var="list" items="${list}">
										<c:if test="${'Y' eq list.board_del_chk}">
											<tr>
												<td colspan="5">이 글은 삭제되었습니다</td>
											</tr>
										</c:if>
										<c:if test="${'Y' ne list.board_del_chk}">
											<tr>
												<td scope="row"><input type="checkbox" name="chk" class="chk" value="${list.board_no}"></td>
												<td scope="row">${list.board_no}</td>
												<td><a class="btn btn-default" href="http://localhost:8080/board/event/eventView?pageNum=${list.board_no}">${list.board_nm}</a></td>
												<td>관리자</td>
												<td>${fn:substring(list.board_in_date,0,11)}</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							<c:if test="${empty list}">
								<tr>
									<td scope="row" colspan="4" align="center">등록된 글이 없습니다</td>
								</tr>
							</c:if>

							</form>
						</tbody>
						<tfoot>
							<tr>
								<td scope="row" align="right" colspan="5">
									<button type="button" class="btn" id="b_Insert">등록</button>
									<button type="button" class="btn" id="upt_btn">수정</button>
									<button type="button" class="btn" id="del_btn">삭제</button>
								</td>
							</tr>
						</tfoot>
					</table>

					<div class="container ">
						<div class="form-row  justify-content-md-center ">
							<ul class="pagination">
								<c:if test="${pagination.curRange ne 1 }">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=1">[처음]</a>
									</li>
								</c:if>
								<c:if test="${pagination.curPage ne 1}">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.prevPage}">[이전]</a>
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
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.nextPage}">[다음]</a>
									</li>
								</c:if>
								<c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
									<li class="page-item">
										<a class="page-link" href="http://localhost:8080/board/event/eventList?pageNum=${pagination.pageCnt}">[끝]</a>
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
      //클릭되었으면
      if ($("#checkall").prop("checked")) {
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $("input[name=chk]").prop("checked", true);
        //클릭이 안되있으면
      } else {
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $("input[name=chk]").prop("checked", false);
      }
    });
    //수정처리-시작
    $("#upt_btn").click(function() {
     var Clength= $('input:checkbox[name=chk]:checked').length;
     if(Clength!=1){
       alert("하나만 선택하세요.");
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
     //수정처리-끝
    });
    
    //삭제처리-시작
    $("#del_btn").click(function() {
      var con_test = confirm("삭제하시겠습니까?");
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
  //삭제처리-끝
  })
</script>