<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="./common_style/u3.css" type=text/css rel=STYLESHEET>
<style type="text/css">
 	div {width:400px; margin:0 auto; border:1px solid blue;
 		text-align: center;
 		margin-top: 20px;
 	} 
 	table#table-big {
  		position: relative; left:80px;
 	} 
  	div#table-small {width:400px; margin:0 auto;
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
<script type="text/javascript">
// $(function(){
// 	$('#pw_modify').click(function(){
// 		var id = document.getElementById('customerId').value;
// 		alert(id);
// 		form.action = "/Project2/custRegister?type=passwordModifyForm&customerId="+id;
// 		$('form').submit();
// 	})
// })
var customerId;
function modify_pw(){
	form = document.form_name;
	customerId = document.getElementById("customerId").value;
	alert(customerId);
	form.action = "/PJShop/pwModifyForm.do?customerId="+customerId;
}
</script>
<title>�������� ����</title>
</head>
<body>
<form name="form_name" action="/PJShop/" method="post">
<div id="table">
<TABLE  id="table-big">
	<TR height="10" bgcolor="#9BC3FF" >
		<TD id="id-title" colspan="2" align="center">���� ���� ���<br>
		</TD>
		
	</TR>
	<tr height="10"><td colspan="2"></td></tr>
	<TR><TD>
	<table id="table-small">

		<tr>
			<c:choose>
				<c:when test="${requestScope.customerId == null}">
				<td class="alert_text">"<font color="red">${requestScope.customerId}</font>" ȸ������ ���� ������<br>�Ϸ���� ���߽��ϴ�.<br>
					���� ��й�ȣ�� ��Ȯ�� �Է����ּ���;<br>
					
				</td>
				</c:when>
				
				<c:when test="${requestScope.customerId != null}">
				<td class="alert_text"><p>"<font color="red">${requestScope.customerId}</font>" ȸ������ ���� ������</p>
				<p>�Ϸ�Ǿ����ϴ�.</p>
					
				</td>
				
				</c:when>
			</c:choose>	
		</tr>
	
		<tr height="10"><td></td></tr>
	</table>
	</TD>
	</TR>

	<tr>
		<td>
			<a href = "/PJShop/product/">[�����Ϸ�����]</a><br>
			<a href = "/PJShop/customerInfo.do?customerId=${requestScope.customerId }">[ ������ Ȯ���ϱ�]</a>
			<a href = "/PJShop/loginForm.do">[ Ȩ����]</a>
		</td>
	</tr>
	<tr height="10"><td></td></tr>
</TABLE>
</div>
</form>
</body>
</html>