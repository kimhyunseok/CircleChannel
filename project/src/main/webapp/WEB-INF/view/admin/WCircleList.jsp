<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<jsp:include page="/WEB-INF/view/admin/include/head.jsp" />


<body class="bg-dark">

	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">${title}</div>
			<!--게시판 -->
			<c:if test="${null ne list}">
				<div class="container-fluid">
					<div class="container ">
						<div class="card mb-4">
							
							<form action="http://localhost:8080/admin/Menu_insert"
								method="post">
								<div class="card-body">
									<div class="table-responsive">
										<table class="table table-bordered" id="example" width="100%"
											cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>동아리이름</th>
													<th>동아리코드</th>
													<th></th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th>No</th>
													<th>동아리이름</th>
													<th>동아리코드</th>
													<th></th>
												</tr>
											</tfoot>
											<tbody>
												<c:forEach var="list" items="${list}" varStatus="step">
													<tr>
														<td></td>
														<td>${list.circle_Nm}</td>
														<td>${list.circle_No}<input type="hidden"
															name="circle_No" value="${list.circle_No}"></td>

														<td>
															<button type="button" class="btn btn-primary btn-sm"
																onclick="fn_MenuIns('${list.circle_No}','${list.slide_No}');">선택</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class="container text-center">
											<button type="submit" class="btn btn-danger btn-xl">메뉴등록</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</c:if>
			<!--게시판 -->
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var counter = 1;
			var table = $('#example').DataTable({
				"columnDefs" : [ {
					"searchable" : false,
					"orderable" : false,
					"targets" : 0
				} ],
				"order" : [ [ 1, 'asc' ] ],
				"lengthMenu" : [ [ 30, 50, -1 ], [ 30, 50, "All" ] ],
				"paging" : false,
				"ordering" : false,
				"info" : false,
				buttons : [ {
					extend : 'create',
					editor : table
				}, {
					extend : 'edit',
					editor : table
				}, {
					extend : 'remove',
					editor : table
				} ]
			});

			table.on('order.dt search.dt', function() {
				table.column(0, {
					search : 'applied',
					order : 'applied'
				}).nodes().each(function(cell, i) {
					cell.innerHTML = i + 1;
				});
			}).draw();
		});
		//서브메뉴등록
		function fn_MenuIns(num,no) {
			var data= {
					"circle_No":num,
					"slide_No":no
			}
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/admin/Slide_insert.Ajax",
				async : false,
				data : data,
				dataType : "json",
				cache : false,
				success : function(data) {
					alert("저장되었습니다.");
					opener.location.reload();
					window.close();
				},
				error : function(data) {
					alert('죄송합니다. 잠시 후 다시 시도해주세요.');
					return false;
				}
			});
			
		}
		//서브메뉴등록
	</script>

</body>

</html>
