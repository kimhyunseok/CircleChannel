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
					<form action="http://localhost:8080/admin/Slide_insert" method="post">
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
								<tbody id="data">
								 <c:forEach var="list" items="${list}" varStatus="step">
										<tr>
											<td></td>
											<td>${list.circle_Nm}<input type="hidden" name="slide_No" value="${list.slide_No}" ></td>
											<td>${list.circle_No}<input type="hidden" class="form-control" name="circle_No" value="${list.circle_No}" ></td>
											<td>
												<button type="button" class="btn btn-secondary btn-sm " onclick="fn_DelBtn('${list.slide_No}');">삭제</button>
											</td>
										</tr>
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
					 "paging":   false,
				        "ordering": false,
				        "info":     false,
				buttons: [
			        { extend: 'create', editor: table },
			        { extend: 'edit',   editor: table },
			        { extend: 'remove', editor: table }
			    ]
				});
				
				$('#example tbody').on( 'click', '.del_btn', function (){
				    table.row($(this).parents('tr')).remove().draw();
				} );
				
				table.on('order.dt search.dt', function() {
					table.column(0, {
						search : 'applied',
						order : 'applied'
					}).nodes().each(function(cell, i) {
						cell.innerHTML = i + 1;
					});
				}).draw();
			   //메뉴추가_Area{
				$('#addRow').on('click',function() {
					table.row.add(
					[  '', 
						'<span class="circle_nm" ></span>',
						'<input type="text" class="form-control"name="circle_no" id="circle_no" onclick="fn_MenuIns();" required="required">','<button type="button" class="btn btn-secondary btn-sm del_btn">삭제</button>'
						 ]).draw(false);
							counter++;
				});
				//}
				
			
});
	//서브메뉴등록
	function fn_MenuIns() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 500; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);
		window.open("http://localhost:8080/admin/WCircleList?pageNum=1","pop_01","top=" + top + ", left="
				+ left + ", height=" + windowH + ", width=" + windowW
				+ "scrollbars=no");
	}
	//서브메뉴등록
	//메뉴삭제
	function fn_DelBtn(no) {
	
	var chk = confirm('삭제하시겠습니까?');
		if (chk == true) {
			var data = {
				"slide_No" : no
			};
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/admin/Slide_Delete.Ajax",
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
