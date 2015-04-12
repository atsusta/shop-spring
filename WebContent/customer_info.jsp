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
<title>내 정보 확인</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>고객 정보</h1>
			</div>
			<table class="table table-striped table-hover">
				<thead/>
				<tbody>
					<tr>
						<td>아이디</td>
						<td id="id">${requestScope.customer.id }</td>
					</tr>
					<tr>
						<td>회원명</td>
						<td>${requestScope.customer.name }</td>
					</tr>
					<tr>
						<td>휴대폰</td>
						<td>${requestScope.customer.phone }</td>
					</tr>
					<tr>
						<td>e-메일</td>
						<td>${requestScope.customer.email }</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${requestScope.customer.address }</td>
					</tr>
				</tbody>
			</table>
			<hr class="divider">
			<c:choose>
				<c:when test='${sessionScope.customerId != "admin" }'>
					<div class="btn-group btn-group-justified" aria-label="Justified button group" role="group">
						<a class="btn btn-primary" role="button" href="customerUpdateForm.do?id=${requestScope.customer.id }">수정하기</a>		<!-- &articleId=${requestScope.article.articleId}"추가 -->		
						<a class="btn btn-warning" role="button" href="customerDeleteForm.do?id=${requestScope.customer.id }">회원 탈퇴하기</a>
						<a class="btn btn-success" role="button" href="product.do">쇼핑하러 가기</a>
					</div>
				</c:when>	
				<c:otherwise>	
					<a class="btn btn-info btn-block" href="customerList.do?page=1">관리자 - 회원 목록 보기</a>
				</c:otherwise>
			</c:choose>		
		</div>
	</div>
</body>
</html>