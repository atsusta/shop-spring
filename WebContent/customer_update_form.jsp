<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>

<title>ȸ�� ���� ����</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>ȸ�� ���� ����</h1>
			</div>
			<div class="well well-lg">
				<form class="form-horizontal" name="form_name" action="/Shop-spring/customerUpdate.do" method="post">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="id">���̵�</label>
							<div class="col-lg-10">
								<input class="form-control" type="text" name="id" id="id" value="${requestScope.customer.id }" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="password">��й�ȣ</label>
							<div class="col-lg-10">
								<input class="form-control" type="password" name="password" id="password" value="${requestScope.customer.password }" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="name">ȸ����</label>
							<div class="col-lg-10">
								<input class="form-control" type="text" name="name" id="name" value="${requestScope.customer.name }" placeholder="Name">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="phone">�޴���</label>
							<div class="col-lg-10">
								<input class="form-control" type="tel" name="phone" id="phone"value="${requestScope.customer.phone }" placeholder="Phone">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerEmail">e-����</label>
							<div class="col-lg-10">
								<input class="form-control" type="email" name="email" id="email" value="${requestScope.customer.email }" placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="address">�ּ�</label>
							<div class="col-lg-10">
								<input class="form-control" type="text" name="address" id="address" value="${requestScope.customer.address }" placeholder="Address">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button class="btn btn-default" type="reset">�ٽþ���</button>
								<input class="btn btn-default" id="pw_modify" value="��й�ȣ����" onclick="location.href='/Shop-spring/customerPwModifyForm.do?id='+document.getElementById('id').value">
								<button class="btn btn-primary" type="submit" id="submit_btn" name="submit_btn">����</button>
<!-- 								<button class="btn btn-default" id="pw_modify" onclick="location.href='/Shop-spring/customerPwModifyForm.do?id='+document.getElementById('id').value">��й�ȣ ����</button> -->
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>