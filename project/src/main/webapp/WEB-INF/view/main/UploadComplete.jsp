<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<script src="https://cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
 
<script type = "text/javascript">
window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${filePath}', '업로드완료');
</script>
