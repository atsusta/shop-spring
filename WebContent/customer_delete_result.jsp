<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>

<title>회원탈퇴 확인</title>
</head>
<body>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>회원 탈퇴</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name">
		
				<c:choose>
					<c:when test="${requestScope.result > 0}">
							<fieldset>
								<legend><b>탈퇴처리가 완료되었습니다.</b></legend>
							</fieldset>
							<fieldset>
								<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<hr>
									<input type="button" value="HOME"  name="goshop" class="btn btn-success" onclick="location.href='/Shop-spring/product.do'">
									</div>
			  					</div>
							</fieldset>
					</c:when>
					<c:otherwise>
						<fieldset>
							<font color="red">${sessionScope.id}</font> 님 탈퇴 처리가<br>완료되지 못했습니다.<br>
								비밀번호를 정확히 입력해주세요;<br>
						</fieldset>
						<hr>
						<fieldset>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<input type="button" value="재입력" class="btn btn-default" onclick="javascript:history.go(-1)">
									<input type="button" value="로그아웃"  class="btn btn-primary" onclick="location.href='/Shop-spring/logout.do'">
									<input type="button" value="홈으로" name="goshop" class="btn btn-success" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
								</div>
			  				</div>
						</fieldset>	
					</c:otherwise>
				</c:choose>	
		</form>
		</div>
	</div>
</div>
</body>
</html>