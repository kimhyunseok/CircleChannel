<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<jsp:include page="/WEB-INF/view/admin/include/head.jsp" />


<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">${title}</div>
      <div class="card-body">
        <form id="menu_form">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
              <label for="firstName">�޴���ȣ</label>
                  <input type="text" id="firstName" name="menu_no" class="form-control" value="${param.menu_no}" required="required" readonly="readonly" autofocus="autofocus">
              </div>
            </div>
          </div>
          <div class="form-group">
              <label for="menu_code1">�޴��ڵ�</label>
              <input type="text" name="menu_code1" id="inputEmail" class="form-control" readonly="readonly" value="${param.menu_code1}">
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                  <label for="menu_nm">�޴��̸�</label>
                  <input type="text" name="menu_nm" id="menu_nm" class="form-control"  required="required">
              </div>
            </div>
          </div>
        </form>
        <div class="text-center">
         <button type="button" id="menu_btn" class="btn btn-block btn-info " >���</button>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function() {
	$("#menu_btn").click(function(){
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/admin/Menu_InsertOk.ajax",
			async : false,
			data : $("#menu_form").serialize(),
			dataType : "json",
			cache : false,
			success : function(data) {
				alert("����Ǿ����ϴ�.");
				window.close();
				opener.parent.location.reload();
			},
			error : function(data) {
				alert('�˼��մϴ�. ��� �� �ٽ� �õ����ּ���.');
				return false;
			}
		});		
	});
});

</script>
 
</body>

</html>
