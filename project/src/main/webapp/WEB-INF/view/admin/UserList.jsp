<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
          <li class="breadcrumb-item">
            <a href="#">기본관리</a>
          </li>
          <li class="breadcrumb-item active">${title}</li>
        </ol>

        <!-- Area Chart Example-->
    
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
              회원리스트</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>아이디[이름]</th>
                    <th>이메일</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>가입일</th>
                    <th></th>
                  </tr>
                </thead>
              
                <tbody>
                <c:forEach var="list"  items="${list}" varStatus="step">
                  <tr>
                    <td>${step.count}</td>
                    <td>${list.user_id}[${list.user_nm}]</td>
                    <td>${list.user_email_1}@${list.user_email_2}</td>
                    <td>[${list.user_post}]${list.user_addr1}-${list.user_addr2}</td>
                    <td>${list.user_phone}</td>
                    <td>${list.user_in_date}</td>
                    <td><button type="button" class="btn btn-light btn-sm" onclick="del_btn('${list.user_id}');">삭제</button></td>
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
    <jsp:include page="/WEB-INF/view/admin/include/footer.jsp" />

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>



</body>


<script type="text/javascript">
function del_btn(num){
	var chk= confirm('삭제하시겠습니까?');
	if(chk==true){
	var data={"User_id":num};
	$.ajax({
        type : "POST",
        url : "http://localhost:8080/admin/UserDelete.ajax",
        async : false,
        data:  data,
        dataType : "json",
        cache: false,
        success: function(data){    
         alert("저장되었습니다.");
         location.reload()
         },
        error : function (data) {
         alert('죄송합니다. 잠시 후 다시 시도해주세요.');
         return false;
        }  
       }); 
	}
}


</script>
</html>
