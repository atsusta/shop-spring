<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<title>�������� ����</title>
</head>
<body>
<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>�н����� �������</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name" action="/Shop-spring/customerUpdate" method="post">

			<c:choose>
				<c:when test="${sessionScope.customerId == null}">
					<fieldset>
						<legend>
							"<font color="red">${sessionScope.customerId}</font>" 
								ȸ������ ��й�ȣ ������<br>�Ϸ���� ���߽��ϴ�.<br>
								���� ��й�ȣ�� ��Ȯ�� �Է����ּ���;<br>		
						</legend>
					</fieldset>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<hr>
								<input type="button" value="��й�ȣ ����" id="pw_modify" onclick="location.href='/Shop-spring/pwModifyForm.do?id='${sessionScope.customerId}">
								<input type="button" value="Ȩ����" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
							</div>
			  			</div>
					</fieldset>
				</c:when>
				
				<c:when test="${sessionScope.customerId != null}">
					<fieldset>
						<legend>
							<b>"
								<font color="red">${sessionScope.customerId}</font>" 
								ȸ������ ��й�ȣ ������<br>
								�Ϸ�Ǿ����ϴ�.			
							</b>	
						</legend>
					</fieldset>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<input type="hidden" name="id" value="${sessionScope.customerId }"/>
								<input type="button" value="������ Ȯ��" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='/Shop-spring/myDetail.do?id=${sessionScope.customerId}'"/>
								<input type="button" value="Ȩ����" name="goshop" class="btn btn-success" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
							</div>
						</div>
					</fieldset>
				</c:when>
			</c:choose>
			</form>
			</div>
		</div>	
	</div>
</body>
</html>