<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="/PJShop/common_style/u3.css" type=text/css rel=STYLESHEET>
<script src="js/jquery-2.1.3.min.js"></script>
<Link rel="stylesheet" type="text/css" href="./css/u3.css">
<style type="text/css">
	body {
		width:400px; margin-top:200px; margin:0 auto;
		height: 100%;
		padding-bottom: 30px;
	}
	div#page-wrap{background-color: #F3F1E9; width:100%; margin-top: 40px; 
		padding-bottom: 30px;
		border: 1px solid green;
	}
	.input {	FONT-SIZE: 10pt; FONT-FAMILY: 굴림,굴림체, Arial }
	.submitBtn{width:100%; text-align:center; margin-top:20px; height:20px;}
	
	FONT.c {	FONT-SIZE: 10px; COLOR: #000000; FONT-FAMILY: 굴림,굴림체, Arial}
	.unnamed1 {  font-family: "바탕"; font-size: 16px; color: #DD4800; text-decoration: blink}
	.unnamed2 {  font-family: "바탕"; font-size: 18px; color: #DD4800; text-decoration: blink}
	.tohama {  font-family: "tohama"; font-size: 18px; color: #DD4800; text-decoration: blink}
	
	fieldset {
/* 		width:600px; */
		padding-left: 50px;
		margin-bottom: 5px;
 		font-size: 13px;	 
	}
	legend {
		text-indent:10px;
		text-align:left;
		width: 170px;
		color: green;
	}
	label {
		display: inline-block;
		width: 120px;
		line-height: 25px;
	}
	input{
		display: inline-block;
		width: 80px;
	}
/* 	div.submitBtn{ */
/* 		padding-left: 50px; */
/* 		position:inherit; margin:0 auto; */
/* 	} */

</style>

<script src="js/jquery-2.1.3.min.js"></script>

<title>&gt;회원 탈퇴&lt;</title>

</head>
<body>

<div id="page-wrap">
	<form action="/PJShop/customerDelete.do" method="post">
	<table>
		<tr>
		<td colspan="2" bgcolor="#9BC3FF" height=28 width=400 align="center">
		<b><font size=3><font color="white">회원 탈퇴 </font></b></td>
		</tr>
		<tr>
		<td>
		<fieldset>
			<br>
			<legend>   회원 탈퇴를 하시겠습니까?</legend>
			<br>
			<br>
			<label for="withdrawPassword">비밀번호 입력 : </label>
			<input type="password" name="withdrawPassword" id="withdrawPassword"/>
			<br>
			<br>
			
		</fieldset>
		</td>
		</tr>
		</table>
	<div class="submitBtn">
		<input type="submit" value="탈퇴"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="홈으로" id="home" onclick="location.href='/PJShop/index.do'"/><br>
		<input type="hidden" name="customerId" value="${sessionScope.customerId}" /><br>
<!-- 		<input type="button" name="goshop" value="쇼핑하러가기"  style="width:120px;"onclick="location.href='/PJShop/productView.do'"/> -->
    </div>
	</form>
</div>
</body>
</html>