<!DOCTYPE html><%@ page language="java"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html lang="en">
<jsp:include page="/WEB-INF/view/admin/include/head.jsp" />
<body id="page-top">
	<jsp:include page="/WEB-INF/view/admin/include/menu.jsp" />
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/admin/include/menu2.jsp" />
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- Breadcrumbs-->
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">기본관리</a></li>
					<li class="breadcrumb-item active">${title}</li>
				</ol>
				<!-- Area Chart Example-->
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> 메뉴목록 -메뉴수정시 서브메뉴 삭제해주세요.

					</div>
					<form action="http://localhost:8080/admin/Menu_insert" method="post">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="example" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>No</th>
										<th>메뉴이름</th>
										<th>코드1</th>
										<th>아이콘</th>
										<th></th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>No</th>
										<th>메뉴이름</th>
										<th>코드1</th>
										<th>아이콘</th>
										<th></th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="list" items="${list}" varStatus="step">
										<tr>
											<td></td>
											<td>${list.menu_nm}<div class="udt_area"><input type="text" class="form-control"
												name="menu_nm" value="${list.menu_nm}"></div></td>
											<td>${list.menu_code1}<div class="udt_area"><input type="text" class="form-control"
												name="menu_code1" value="${list.menu_code1}"></div></td>
											<td>${list.menu_icon}<div class="udt_area"><input type="text" class="form-control"
												name="menu_icon" value="${list.menu_icon}"></div></td>
											<td>
												<button type="button" class="btn btn-primary btn-sm"
													onclick="fn_MenuIns('${list.menu_no}','${list.menu_code1}');">등록</button>
												<button type="button" class="btn btn-info btn-sm test">수정</button>
												<button type="button" class="btn btn-secondary btn-sm"
													onclick="fn_DelBtn('${list.menu_no}','${list.menu_code1}');">삭제</button>
											</td>
										</tr>
										<c:forEach var="sublist" items="${sublist}" varStatus="t">
											<c:if test="${list.menu_code1==sublist.menu_code1}">
												<tr>
													<td></td>
													<td>ㄴ${sublist.menu_nm}<div class="udt_area"><input type="text" class="form-control"
														name="menu_nm" value="${sublist.menu_nm}"></div></td>
													<td>${sublist.menu_code1}<div class="udt_area"><input type="text" class="form-control"
														name="menu_code1" value="${sublist.menu_code1}"
														readonly="readonly" ></div></td>
													<td><input type="hidden" class="form-control"
												name="menu_icon" value=" "></td>
													<td>
													<button type="button" class="btn btn-info btn-sm test">수정</button>
														<button type="button" class="btn btn-secondary btn-sm"
															onclick="fn_DelBtn('${sublist.menu_no}','empty');">삭제</button>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						<div class="container text-center">
							<button type="submit" class="btn btn-danger btn-xl">메뉴등록</button>
							<button type="button" id="addRow" class="btn btn-info btn-xl">메뉴추가</button>
							
						</div>
						</div>
					</div>
							</form> 
					
				</div>
			</div>
			<!-- /.container-fluid -->
			<!-- Sticky Footer -->
			<jsp:include page="/WEB-INF/view/admin/include/footer.jsp" />
		</div>
		<!-- /.content-wrapper -->
	</div>
	<!-- /#wrapper -->

</body>
<script type="text/javascript">
	$(document).ready(
			
			function() {
				var counter = 1;
				var table = $('#example').DataTable({
					"columnDefs" : [ {
						"searchable" : false,
						"orderable" : false,
						"targets" : 0
					} ],
					"order" : [ [ 1, 'asc' ] ],
					"lengthMenu" : [ [ 30, 50, -1 ], [ 30, 50, "All" ] ],
					 "paging":   false,
				        "ordering": false,
				        "info":     false,
				buttons: [
			        { extend: 'create', editor: table },
			        { extend: 'edit',   editor: table },
			        { extend: 'remove', editor: table }
			    ]
				});

				table.on('order.dt search.dt', function() {
					table.column(0, {
						search : 'applied',
						order : 'applied'
					}).nodes().each(function(cell, i) {
						cell.innerHTML = i + 1;
					});
				}).draw();
			
				$('#addRow').on('click',function() {
					table.row.add(
					['', 
						'<input type="text" class="form-control"name="menu_nm" required="required">',
						'<input type="text" class="form-control"name="menu_code1" required="required">', 
						'<input type="text" class="form-control"name="menu_icon" required="required" >',
						'<button type="button" id="delRow" class="btn btn-info btn-xl">x</button>' ]).draw(false);
							counter++;
				});
				
				$('#example').on( 'click', '#delRow', function () {
					 $('#example > tbody:last > tr:last').remove();
				});
				
				$(".udt_area").hide();//수정영역숨기기
				$('.test').click(function () {
				var test1= $(this).parent().parent().children("td").eq(1).find("div ");
				var test2= $(this).parent().parent().children("td").eq(2).find("div ");
				var test3= $(this).parent().parent().children("td").eq(3).find("div ");
				$(test1).toggle();
				$(test2).toggle();
				$(test3).toggle();
				});
				
});
	//서브메뉴등록
	function fn_MenuIns(no, code) {
		var windowW = 600; // 창의 가로 길이
		var windowH = 500; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("http://localhost:8080/admin/Menu_Insert?menu_no=" + no
				+ "&menu_code1=" + code, "pop_01", "top=" + top + ", left="
				+ left + ", height=" + windowH + ", width=" + windowW
				+ "scrollbars=no");
	}
	//서브메뉴등록
	//메뉴삭제
	function fn_DelBtn(no, code1) {
		var chk = confirm('삭제하시겠습니까?');
		if (chk == true) {
			var data = {
				"menu_no" : no,
				"menu_code1" : code1
			};
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/admin/Menu_Delete.ajax",
				async : false,
				data : data,
				dataType : "json",
				cache : false,
				success : function(data) {
					alert("저장되었습니다.");
					location.reload()
				},
				error : function(data) {
					alert('죄송합니다. 잠시 후 다시 시도해주세요.');
					return false;
				}
			});
		}
	}
</script>
</html>
