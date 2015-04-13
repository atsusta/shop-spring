<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �Ϸ�</title>
</head>

<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>ȸ������ ���</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name" action="/Shop-spring/customerUpdate" method="post">

			<c:choose>
				<c:when test="${customerId == null }">
					<fieldset>
						<legend>
							<b>����ó���� �� �Ǿ����ϴ�. �ٽ��Է��ϼ���.<br>
								writing fail...</b>			
						</legend>
					</fieldset>
					<br>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<hr>
								<input type="button" value="ȸ������ ��������"  name="goregisterForm" class="btn btn-success" onclick="location.href='/Shop-spring/registForm.do'">
							</div>
			  			</div>
					</fieldset>
				</c:when>
				
				<c:otherwise>
					<fieldset>
						<legend>
							ȸ�� ������ �Ϸ�Ǿ����ϴ�.
						</legend>
					</fieldset>	
						<c:choose>
							<c:when test="${sessionScope.customerId != admin }">
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<input type="button" value="������ Ȯ��" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='customerDetail.do?id=${sessionScope.customerId }'">
										<input type="button" value="Ȩ����" name="goshop" class="btn btn-success" id="home" onclick="location.href='product.do'">
									</div>
								</div>
							</c:when>	
							<c:otherwise>
								<div class="form-group">	
									<div class="col-lg-10 col-lg-offset-2">
										<input type="button" value="������ Ȯ��" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='customerDetail.do?id=${sessionScope.customerId }'">
										<input type="button" value="������Ʈ" name="goCustomerList" class="btn btn-default" id="home" onclick="location.href='customerList.do?page=1'">
									</div>
								</div>
							</c:otherwise>
						</c:choose>		
				</c:otherwise>
			</c:choose>	

			</form>
			</div>
		</div>
	</div>
</body>
</html>