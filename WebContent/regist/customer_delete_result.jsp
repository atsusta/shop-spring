<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK href="/PJShop/common_style/u3.css" type=text/css rel=STYLESHEET>
<style type="text/css">
 	div {width:400px; margin: 0 auto;
 		text-align: center; 
 		margin-top: 20px;
 	} 
 	table#table-big {
 		border: 1px solid green;
 		width:400px; margin:0 auto;
		text-align: center;
 	} 
  	#table-small {
   		width:370px; text-align: center;
   		margin:0px; left:10px;  
  	} 
  	div#table-small tr{
  		text-align: center;
  	}
  	.alert_text{
  		font-weight: bold;
  	}  
	tr td#id{ color: red; font-weight: bold}
	tr td {font-size: 14px;	padding: 5px;}
	tr td#id-title{ color: red; font-weight: bold; font-size:20px;}
</style>
<script src="js/jquery-2.1.3.min.js"></script>

<title>ȸ��Ż�� Ȯ��</title>
</head>
<body>
<form name="form_name" action="/PJShop/custRegister" method="post">
<div id="table">
<TABLE  id="table-big">
	<TR height="10" bgcolor="#9BC3FF" >
		<TD id="id-title" colspan="2" align="center">ȸ��Ż�� ���<br>
		</TD>
		
	</TR>
	<tr height="10"><td colspan="2"></td></tr>
	<TR><TD>
	<table id="table-small">

	
		<c:choose>
			<c:when test="${requestScope.result > 0}">
			<tr>	
				<td class="alert_text">
				<p> Ż��ó���� �Ϸ�Ǿ����ϴ�.</p>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
					<input type="button" value="ó������" onclick="location.href='/PJShop/index.do'">
				
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<td class="alert_text"><font color="red">${sessionScope.customerId}</font> �� Ż�� ó����<br>�Ϸ���� ���߽��ϴ�.<br>
					��й�ȣ�� ��Ȯ�� �Է����ּ���;<br>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
					<input type="button" value="���Է�" onclick="javascript:history.go(-1)">
					<input type="button" value="�α׾ƿ�" onclick="location.href='/PJShop/logout.do'">
					<input type="button" value="Ȩ����" id="home" onclick="location.href='/PJShop/loginForm.do'"/><br>
<%-- 					<input type="hidden" name="customerId" value="${requestScope.customerId }"/> --%>
				</td>
			</tr>
			</c:otherwise>
		</c:choose>	
		<tr height="10"><td></td></tr>
	</table>
	</TD>
	</TR>
	<tr height="10"><td></td></tr>
</TABLE>
</div>
</form>
</body>
</html>