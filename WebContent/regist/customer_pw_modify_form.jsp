<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ����������</title>
<script src="js/jquery-2.1.3.min.js"></script>
<Link rel="stylesheet" type="text/css" href="./css/u3.css">
<style type="text/css">
/* 	body { */
/* 		width:500px; margin-top:200px; margin:0 auto; */
/* 		height: 100%; */
/* 	} */
	div#page-wrap{background-color: #F3F1E9; width:500px; margin:0 auto;}
	.input {	FONT-SIZE: 10pt; FONT-FAMILY: ����,����ü, Arial }
	.submitBtn{width:490px; margin-top:20px; margin:0 auto;}
	
	FONT.c {	FONT-SIZE: 10px; COLOR: #000000; FONT-FAMILY: ����,����ü, Arial}
	.unnamed1 {  font-family: "����"; font-size: 16px; color: #DD4800; text-decoration: blink}
	.unnamed2 {  font-family: "����"; font-size: 18px; color: #DD4800; text-decoration: blink}
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
	div.submitBtn{
		padding-left: 50px;
	}

</style>
<script type="text/javascript">
<!-- --------------------------------------------- -->
	
	$(function(){
		$('#pw_confirm').keyup(function(){
			var resultpw = "";
			if($('#modifyPassword').val() != $('#pw_confirm').val()){
					resultpw = "�н����尡 ��ġ���� �ʽ��ϴ�.";
					$('#pw_result').text(resultpw).css("color", "red");
			}else{
					resultpw = "�н����尡 ��ġ�մϴ�.";
					$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})
	
	$(function(){
		$('#reset').click(function(){
			$('#id_result').text('')
			$('#pw_result').text('');
		})
	})


</script>

</head>
<body>
<div id="page-wrap">
	<form action="/PJShop/customerPwModify.do" method="post">
	<table>
		<tr>
		<td colspan="2" bgcolor="#9BC3FF" height=28 width=500 align="center">
		<b><font size=3><font color="white">��й�ȣ ���� </font></b></td>
		</tr>
		<tr>
		<td>
		<fieldset>
			<br>
			<legend>   ��й�ȣ�� �Է��� �ּ���</legend>
			<br>
			<label for="customerId">���̵�</label>
			<input type="text" name="customerId" id="customerId" value="${requestScope.customerId }" size="8"/>
			<span id="id_result"></span>
			<br>
			<label for="comparePassword">���� �н�����</label>
			<input type="password" name="comparePassword" id="comparePassword"/>
			<br>
			<br>
			<label for="modifyPassword">������ �н�����</label>
			<input type="password" name="modifyPassword" id="modifyPassword"/>
			<br>
			<label for="pw_confirm">�н�����Ȯ��</label>
			<input type="password" name="pw_confirm" id="pw_confirm"/>
			<span id="pw_result"></span>
			<br>
		</fieldset>
		</td>
		</tr>
		</table>
	<div class="submitBtn">
		<input type="submit" name="sumbit" value="����" onclick=""/>
<!-- 		<input type="hidden" name="type" value="passwordModify"/> -->
<%-- 		<input type="hidden" name="customerId" value="${requestScope.customerId}" /> --%>
<%-- 									${requestScope.customerVO.customerId }											 --%>
		<input type="reset" name="reset" value="�ٽ��ۼ�" id="reset"/>
		<input type="button" value="Ȩ����" id="home" onclick="location.href='/PJShop/index.do'"/><br>
<!--         <a href="http://img.echosting.cafe24.com/guide/suio/description/button.html">SUIO Module</a> -->
    </div>
	</form>
</div>
</body>
</html>