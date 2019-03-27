<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/view/include/head.jsp" />
<!DOCTYPE html>
<html>
<body>
	<div class="container">
		<h1>My First Bootstrap Page</h1>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th>�׷��</th>
					<th>����/����</th>
					<th>��û��</th>
					<th>�޴��ȣ</th>
					<th>�̸���</th>
					<th>���Ƹ�������</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="view" items="${list}" varStatus="st">
					<tr>
						<td>${view.c_groupTitle}</td>
						<td>${view.c_group_PFchk}</td>
						<td>${view.user_id}(${view.user_nm})</td>
						<td>${view.user_phone}</td>
						<td>${view.user_email_1}@${view.user_email_2}</td>
						<td>${view.circleJoin_in_date}</td>
						<td><button type="button" class="btn btn-danger"
								class="cancelBtn" onclick="cancel_btn(${view.circleJoin_No},${view.circle_No});">X</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
<script type="text/javascript">
	function cancel_btn(num,c_no){
		var data={"CircleJoin_no":num,"circle_No":c_no};
		$.ajax({
	        type : "POST",
	        url : "http://localhost:8080/main/ApplyPeopleCancel.ajax",
	        async : false,
	        data:  data,
	        dataType : "json",
	        cache: false,
	        success: function(data){    
	         alert("����Ǿ����ϴ�.");
	       
	         },
	        error : function (data) {
	         alert('�˼��մϴ�. ��� �� �ٽ� �õ����ּ���.');
	         return false;
	        }  
	       }); 
	}
$(function() {

	
});
</script>