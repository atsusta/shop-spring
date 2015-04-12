<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="/PJShop/common_style/u3.css" type=text/css rel=STYLESHEET>
<style type="text/css">
 	#div_update_form{width:400px; margin:0 auto;
 		text-align: center;
 		margin-top: 20px;
 	} 
 	table#table-big {
  		position: relative; left:80px;
 	} 
/*  	div#table-small {width:400px; margin:0 auto;}  */
	tr td#id{ color: red; font-weight: bold}
	tr td {font-size: 14px;	padding: 5px;}
	tr td#id-title{ color: red; font-weight: bold; font-size:20px;}
</style>
<script src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">

</script>
<title>개인정보 수정</title>
</head>
<body>
<div id="div_update_form">
<form name="form_name" action="/PJShop/customerUpdate.do" method="post">
<TABLE  id="table-big">
	<TR height="10" bgcolor="#9BC3FF" >
		<TD id="id-title" colspan="2" align="center">고객 정보 수정<br>
		</TD>
		
	</TR>
	<tr height="10"><td colspan="2"></td></tr>
	<TR><TD>
	<table id="table-small">
	
		<tr>
			<td>아이디</td>
			<td><input type="text" id="customerId" name="customerId" value="${requestScope.customerVO.customerId}" size="20"  readonly="readonly"/><br></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="customerPassword" value="${requestScope.customerVO.customerPassword}" size="20"  readonly="readonly"/><br>
			</td>
		</tr>
		
		<tr>
			<td>회원명</td>
			<td><input type="text" name="customerName" value="${requestScope.customerVO.customerName}" size="20"/><br></td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td><input type="tel" name="customerPhone" value="${requestScope.customerVO.customerPhone}" size="20"/><br></td>
		</tr>
		<tr>
			<td>e-메일</td>
			<td><input type="email" name="customerEmail" value="${requestScope.customerVO.customerEmail}" size="20"/><br></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="customerAddress" value="${requestScope.customerVO.customerAddress}"/><br></td>
		</tr>
		<tr height="10"><td></td></tr>
	</table>
	</TD>
	</TR>

	<tr><td>
			<input type="submit" value="수정" id="submit_btn" name="submit_btn"/>  	
			<input type="reset" value="다시쓰기" />
			<input type="button" value="비밀번호 변경" id="pw_modify" onclick="location.href='/PJShop/customerPwModifyForm.do?customerId='+document.getElementById('customerId').value">
			<input type="button" value="홈으로" id="home" onclick="location.href='/PJShop/index.do'"/><br>
			<%-- customerId 을 hidden으로 하면 customerId 값이 2번 찍힌다.	<input type="hidden" name="customerId" value="${requestScope.customerVO.customerId }"/> --%>
	</td></tr>
	<tr height="10"><td></td></tr>
</TABLE>
</form>
</div>
</body>
</html>