<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<title>회원 탈퇴</title>

<script type="text/javascript">

	$(function(){
		$('submitBtn').click(function(){
			if($('#withdrawPassword').val() == ''){
				alert("비밀번호를 입력하세요");
				$('withdrawPassword').focus();
				return false;
			}
			
			$('form').submit();
		})
	})
	
</script>

</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>회원 탈퇴</h1>
			</div>
			<div class="well well-lg">
				<form class="form-horizontal" action="/Shop-spring/customerDelete.do" method="post">
					<fieldset>
						<legend><b>회원 탈퇴를 하시겠습니까?</b></legend>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="withdrawPassword">비밀번호 입력</label>
							<div class="col-lg-10">
								<input class="form-control" type="password" name="withdrawPassword" id="withdrawPassword"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<input type="button" name="goshop" class="btn btn-default" onclick="location.href='/Shop-spring/product.do'" id="goshop" value=" HOME "/> 
<!-- 								<button name="goshop" class="btn btn-default" onclick="location.href='/Shop-spring/product.do'" id="goshop"> HOME </button> -->
								<button type="submit" class="btn btn-primary" name="submit" id="submitBtn">탈퇴</button>
								<input type="hidden" name="id" value="${sessionScope.id}" />
							</div>
		  				</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>