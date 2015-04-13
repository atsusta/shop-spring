<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 완료</title>
</head>

<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>회원가입 결과</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name" action="/Shop-spring/customerUpdate" method="post">

			<c:choose>
				<c:when test="${customerId == null }">
					<fieldset>
						<legend>
							<b>가입처리가 안 되었습니다. 다시입력하세요.<br>
								writing fail...</b>			
						</legend>
					</fieldset>
					<br>
					<fieldset>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<hr>
								<input type="button" value="회원가입 페이지로"  name="goregisterForm" class="btn btn-success" onclick="location.href='/Shop-spring/registForm.do'">
							</div>
			  			</div>
					</fieldset>
				</c:when>
				
				<c:otherwise>
					<fieldset>
						<legend>
							회원 가입이 완료되었습니다.
						</legend>
					</fieldset>	
						<c:choose>
							<c:when test="${sessionScope.customerId != admin }">
								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<input type="button" value="내정보 확인" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='customerDetail.do?id=${sessionScope.customerId }'">
										<input type="button" value="홈으로" name="goshop" class="btn btn-success" id="home" onclick="location.href='product.do'">
									</div>
								</div>
							</c:when>	
							<c:otherwise>
								<div class="form-group">	
									<div class="col-lg-10 col-lg-offset-2">
										<input type="button" value="내정보 확인" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='customerDetail.do?id=${sessionScope.customerId }'">
										<input type="button" value="고객리스트" name="goCustomerList" class="btn btn-default" id="home" onclick="location.href='customerList.do?page=1'">
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