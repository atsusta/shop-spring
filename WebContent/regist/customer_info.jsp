<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="/PJShop/common_style/u3.css" type=text/css rel=STYLESHEET>
<style type="text/css">
	tr td#id{ color: red; font-weight: bold}
	tr td {font-size: 14px;	padding: 5px;}
	tr td#id-title{ color: red; font-weight: bold; font-size:20px;}
</style>

<title>내 정보 확인</title>
</head>
<body>
<TABLE border="0" cellspacing="-1" cellpadding="5" align="center">
	<TR height="10">
		<TD id="id-title" colspan="2" align="center">고 객 정 보<br>
		</TD>
		
	</TR>
	<tr height="10"><td colspan="2"></td></tr>
	<TR><TD>
	<table bgcolor="#9BC3FF" width="300" border="0" cellspacing="0" cellpadding="0" align="center">
	
		<tr>
			<td>아이디</td>
			<td id="id">${customerVO.customerId}</td>
		</tr>
		<tr>
			<td>회원명</td>
			<td>${customerVO.customerName}</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>${customerVO.customerPhone}</td>
		</tr>
		<tr>
			<td>e-메일</td>
			<td>${customerVO.customerEmail}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${customerVO.customerAddress}</td>
		</tr>
		<tr height="10"><td></td></tr>
	</table>
	</TD>
	</TR>
		<tr>
			<td colspan="2"> 
			<hr>
				<c:choose>
				<c:when test="${customerVO.customerId == admin}">
					<a href="/PJShop/customerUpdateForm.do?customerId=${customerVO.customerId}">[수정하기]</a>		<!-- &articleId=${requestScope.article.articleId}"추가 -->		
					<a href="/PJShop/customerDeleteForm.do?customerId=${customerVO.customerId}">[회원탈퇴하기]</a>
					<a href="/PJShop/index.do">[홈으로]</a>
					세션확인용 : customerVO customerId= ${customerVO.customerId}
				</c:when>	
				<c:otherwise >	
					<a href = "/PJShop/customerList.do?page=1">[관리자:회원목록보기]</a>
				</c:otherwise>
			</c:choose>		
			</td>
		</tr>
</TABLE>	
</body>
</html>