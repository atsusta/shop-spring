<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>

<script type="text/javascript">
var customerId;
function modify_pw(){
	form = document.form_name;
	customerId = document.getElementById("id").value;
	alert(customerId);
	form.action = "/Shop-spring/pwModifyForm.do?id="+id;
}
</script>
<title>�������� ����</title>
</head>
<body>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>������ �������</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name">
			
			<c:choose>
				<c:when test="${requestScope.id == null}">
					<fieldset>
						<legend><b>
							"<font color="red">${requestScope.id}</font>" 
								ȸ������ ���� ������<br>�Ϸ���� ���߽��ϴ�.<br>
								���� ��й�ȣ�� ��Ȯ�� �Է����ּ���;</b>
						</legend>
					</fieldset>
				
				</c:when>
				
				<c:otherwise>
					<fieldset>
						"<font color="red">${requestScope.id}</font>"
							ȸ������ ���� ������<br>
							�Ϸ�Ǿ����ϴ�.<br>
						</fieldset>
						<hr>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<input type="button" value="������ Ȯ��" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='/Shop-spring/myDetail.do?id=${requestScope.id}'"/>
								<input type="button" value="Ȩ����" name="goshop" class="btn btn-success" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
							</div>
						</div>
				</c:otherwise>
			</c:choose>
			</form>
			</div>	
		</div>
	</div>
</body>
</html>