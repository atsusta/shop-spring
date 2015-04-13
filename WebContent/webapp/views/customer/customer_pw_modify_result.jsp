<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<title>개인정보 수정</title>
</head>
<body>
<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>패스워드 수정결과</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name" action="/Shop-spring/customerUpdate" method="post">

			<c:choose>
				<c:when test="${sessionScope.customerId == null}">
					<fieldset>
						<legend>
							"<font color="red">${sessionScope.customerId}</font>" 
								회원님의 비밀번호 변경이<br>완료되지 못했습니다.<br>
								기존 비밀번호를 정확히 입력해주세요;<br>		
						</legend>
					</fieldset>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<hr>
								<input type="button" value="비밀번호 변경" id="pw_modify" onclick="location.href='/Shop-spring/pwModifyForm.do?id='${sessionScope.customerId}">
								<input type="button" value="홈으로" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
							</div>
			  			</div>
					</fieldset>
				</c:when>
				
				<c:when test="${sessionScope.customerId != null}">
					<fieldset>
						<legend>
							<b>"
								<font color="red">${sessionScope.customerId}</font>" 
								회원님의 비밀번호 변경이<br>
								완료되었습니다.			
							</b>	
						</legend>
					</fieldset>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<input type="hidden" name="id" value="${sessionScope.customerId }"/>
								<input type="button" value="내정보 확인" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='/Shop-spring/myDetail.do?id=${sessionScope.customerId}'"/>
								<input type="button" value="홈으로" name="goshop" class="btn btn-success" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
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