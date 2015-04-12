<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �Ϸ�</title>
</head>
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
<body>
<form name="form_name" action="/PJShop/customerUpdate" method="post">
<div id="table">
<TABLE  id="table-big">
	<TR height="10" bgcolor="#9BC3FF" >
		<TD id="id-title" colspan="2" align="center">ȸ������ ���<br>
		</TD>
		
	</TR>
	<tr height="10"><td colspan="2"></td></tr>
	<TR><TD>
	<table id="table-small" border="0">

		<tr>
			<c:choose>
				<c:when test="${insertedCustomerId == null }">
				<td class="alert_text">
					����ó���� �� �Ǿ����ϴ�. �ٽ��Է��ϼ���<br>
					writing fail...<br>
					 <a href = "/PJShop/registForm.do">[ȸ������ ��������]</a>
				</td>
				</c:when>
				
				<c:when test="${insertedCustomerId != null }">
				<td class="alert_text"><p>
					����ó���� �� �Ǿ����ϴ�.<br>
					writing success... <br>
				</td>
				
				</c:when>
			</c:choose>	
		</tr>
		<tr>
			<td>
			<hr>
			<c:choose>
				<c:when test="${requestScope.insertedCustomerId != admin }">
					<a href = "/PJShop/customerInfo.do?customerId=${insertedCustomerId}">[ ������ Ȯ���ϱ�]</a><!-- &isReadCount=false -->
<!-- 					<a href = "http://203.236.209.180:8089/ProductsView/ProductView/">[���ν����ϱ�]</a><br> -->
				</c:when>	
				<c:otherwise>	
					<a href = "/PJShop/customerInfo.do?customerId=${requestScope.insertedCustomerId}">[ ������ Ȯ���ϱ�]</a><!-- &isReadCount=false -->
					
<!-- 					<a href = "http://203.236.209.180:8089/ProductsView/ProductView/">[���ν����ϱ�]</a><br> -->
<!-- 					<a href = "/Project2/custRegister?type=list">[������:ȸ����Ϻ���]</a><br> -->
<!-- 					<a href = "http://203.236.209.180:8089/Port3/controlPage.jsp">[������ ������]</a><br> -->
				</c:otherwise>
			</c:choose>		
			</td>
		</tr>
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