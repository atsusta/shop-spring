<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="vo.Customer"%>
<%@ page session="true" %>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>

<title>�� ����Ʈ</title>
<script type="text/javascript">

</script>

</head>
<%
	request.setCharacterEncoding("euc-kr");
// 	int articlePage = request.getParameter("articlePage");  �� �۾��� ����ؼ� EL�� �Ѵ�.
	Customer customer = (Customer)session.getAttribute("customer");
%>
<body>

	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="page-header">
				<h1>�� ����Ʈ</h1>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr class="info">
						<th>ID</th>
						<th>ȸ���̸�</th>
						<th>��ȭ��ȣ</th>
						<th>�̸���</th>
						<th>�ּ�</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${requestScope.customerPage.totalPage == 0 }">
							<tr>
								<td colspan="5">ȸ���� �������� �ʽ��ϴ�.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${requestScope.customerPage.customerList}" var="customer">
								<tr>
									<td>${customer.id }</td>
									<td align="left"><a href="customerDetail.do?id=${customer.id }">${customer.name }</a> </td>
									<td>${customer.phone }</td>
									<td>${customer.email }</td>
									<td>${customer.address }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="row text-center">
				<ul class="pagination">
					<c:if test="${customerPage.startPage > 1 }">
						<li><a href="customerList.do?page=${customerPage.requestPage - 1 }"><<</a></li>
					</c:if>
					<c:forEach begin="${customerPage.startPage }" end="${customerPage.endPage }" var = "i">
						<c:choose>
							<c:when test="${i == customerPage.requestPage }">
								<li class="active"><a href="#">${i }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="customerList.do?page=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${customerPage.endPage < customerPage.totalPage }">
						<li><a href="customerList.do?page=${customerPage.requestPage + 1 }">>></a></li>
					</c:if>
				</ul>
			</div>
			<div class="row text-center">
				<p class="text-danger">��ȸ���� <span class="badge">${sessionScope.totalCustomer}</span></p>
			</div>
		</div>
	</div>
</body>
</html>