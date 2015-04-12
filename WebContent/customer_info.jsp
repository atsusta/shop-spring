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
<title>�� ���� Ȯ��</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>�� ����</h1>
			</div>
			<table class="table table-striped table-hover">
				<thead/>
				<tbody>
					<tr>
						<td>���̵�</td>
						<td id="id">${requestScope.customer.id }</td>
					</tr>
					<tr>
						<td>ȸ����</td>
						<td>${requestScope.customer.name }</td>
					</tr>
					<tr>
						<td>�޴���</td>
						<td>${requestScope.customer.phone }</td>
					</tr>
					<tr>
						<td>e-����</td>
						<td>${requestScope.customer.email }</td>
					</tr>
					<tr>
						<td>�ּ�</td>
						<td>${requestScope.customer.address }</td>
					</tr>
				</tbody>
			</table>
			<hr class="divider">
			<c:choose>
				<c:when test='${sessionScope.customerId != "admin" }'>
					<div class="btn-group btn-group-justified" aria-label="Justified button group" role="group">
						<a class="btn btn-primary" role="button" href="customerUpdateForm.do?id=${requestScope.customer.id }">�����ϱ�</a>		<!-- &articleId=${requestScope.article.articleId}"�߰� -->		
						<a class="btn btn-warning" role="button" href="customerDeleteForm.do?id=${requestScope.customer.id }">ȸ�� Ż���ϱ�</a>
						<a class="btn btn-success" role="button" href="product.do">�����Ϸ� ����</a>
					</div>
				</c:when>	
				<c:otherwise>	
					<a class="btn btn-info btn-block" href="customerList.do?page=1">������ - ȸ�� ��� ����</a>
				</c:otherwise>
			</c:choose>		
		</div>
	</div>
</body>
</html>