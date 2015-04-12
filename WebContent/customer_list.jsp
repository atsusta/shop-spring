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

<title>고객 리스트</title>
<script type="text/javascript">

</script>

</head>
<%
	request.setCharacterEncoding("euc-kr");
// 	int articlePage = request.getParameter("articlePage");  이 작업을 대신해서 EL이 한다.
	Customer customer = (Customer)session.getAttribute("customer");
%>
<body>

	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="page-header">
				<h1>고객 리스트</h1>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr class="info">
						<th>ID</th>
						<th>회원이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>주소</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${requestScope.customerPage.totalPage == 0 }">
							<tr>
								<td colspan="5">회원이 존재하지 않습니다.</td>
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
				<p class="text-danger">총회원수 <span class="badge">${sessionScope.totalCustomer}</span></p>
			</div>
		</div>
	</div>
</body>
</html>