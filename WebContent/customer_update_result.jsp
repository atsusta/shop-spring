<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>

<script type="text/javascript">
var customerId;
function modify_pw(){
	form = document.form_name;
	customerId = document.getElementById("id").value;
	alert(customerId);
	form.action = "/Shop-spring/pwModifyForm.do?id="+id;
}
</script>
<title>개인정보 수정</title>
</head>
<body>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>고객정보 수정결과</h1>
			</div>
			<div class="well well-lg">
			<form class="form-horizontal" name="form_name">
			
			<c:choose>
				<c:when test="${requestScope.id == null}">
					<fieldset>
						<legend><b>
							"<font color="red">${requestScope.id}</font>" 
								회원님의 정보 변경이<br>완료되지 못했습니다.<br>
								기존 비밀번호를 정확히 입력해주세요;</b>
						</legend>
					</fieldset>
				
				</c:when>
				
				<c:otherwise>
					<fieldset>
						"<font color="red">${requestScope.id}</font>"
							회원님의 정보 변경이<br>
							완료되었습니다.<br>
						</fieldset>
						<hr>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<input type="button" value="내정보 확인" name="goMydetail" class="btn btn-primary" id="home" onclick="location.href='/Shop-spring/myDetail.do?id=${requestScope.id}'"/>
								<input type="button" value="홈으로" name="goshop" class="btn btn-success" id="home" onclick="location.href='/Shop-spring/product.do'"/><br>
							</div>
						</div>
				</c:otherwise>
			</c:choose>
			</form>
			</div>	
		</div>
	</div>
</body>
</html>