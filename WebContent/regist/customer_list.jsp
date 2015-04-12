<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="vo.Customer"%>
<%@ page session="true" %>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="/PJShop/common_style/u3.css" type=text/css rel=STYLESHEET>
<LINK href="/PJShop/css/customer.css" type=text/css rel=STYLESHEET>
<script type="text/javascript" src="/PJShop/js/customer.js"></script>
<title>게시판 글목록</title>
<script type="text/javascript">

	function checkDelete(){
		form = document.view_form;
		form.action = "/Day08/bookInfo/book_delete_form.jsp";
// 		/PJShop/custRegister?type=customerInfo&customerId=${customerVO.customerId}
		form.submit();
	}

</script>

<style>
	body {
		width:700px; margin: 0 auto; 
 		height:100%; 
	}
	div#page-wrap {
/* 		margin: 0px; padding: 0px; */
		width:700px; margin: 0 auto;
		height:100%;
	}
	div#selectbox {
		width:700px; text-align: center;
/*  		margin:0px; padding: 0px;  */
	}
	div.selectbox {
		width:700px; text-align: center;
 		margin:0px; padding: 0px; 
	}
	table#table-top{ margin-top:20px;}
	table#table-bottom{position:absolute;}
</style>
</head>
<%
	request.setCharacterEncoding("euc-kr");
// 	int articlePage = request.getParameter("articlePage");  이 작업을 대신해서 EL이 한다.
	Customer customer = (Customer)session.getAttribute("customer");
%>
<body>
<div id="page-wrap">
	<div id="selectbox" >
		<table id="table-top">
		<tr id="titleContent" valign="middle" align="center" bgcolor="#7AAAD5"  height="30">
			<td width="50">ID</td>
			<td width="100">회원이름</td>
			<td width="100">전화번호</td>
			<td width="100">이메일</td>
			<td width="300">주소</td>
		</tr>
		<tr height="10"><td><tr></tr> 
		<c:choose>
		<c:when test="${requestScope.customerListPage.totalPage == 0 }">
			<tr>
				<td colspan="5">회원이 존재하지 않습니다.</td>
			</tr>
		</c:when>
		
		<c:otherwise>
			
			<c:forEach items="${requestScope.customerListPage.customerList}" var="customerVO">
				<tr align="center" onClick="goView(${customerVO.customerId})" onMouseOver="javascript:changeColor(this, '#FFFFFF', '#CDD8FC')" style="cursor:pointer;">
					<td>${customerVO.customerId}</td>
					<td align="left"><a href="/PJShop/custRegister?type=customerInfo&customerId=${customerVO.customerId}">${customerVO.customerName}	</a> 
					</td>		
					<td>${customerVO.customerPhone }</td>
					<td>${customerVO.customerEmail }</td>
					<td>${customerVO.customerAddress}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		</table>
	</div>
					
	<div class="selectbox">
		<table id="table-bottom" bgcolor="" width="700" border="0" cellspacing="-1" cellpadding="0" >
			<tr bgcolor="#7AAAD5" height="30" valign="middle">
				<td colspan ="5" align="center">
					<c:choose>
						<c:when test="${requestScope.customerListPage.startPage == null || requestScope.customerListPage.endPage == null  }">
							<b><a href="/PJShop/custRegister?type=list&page=1">[1]</a></b>
						</c:when>
						<c:otherwise>
							<c:forEach begin="${requestScope.customerListPage.startPage}" end="${requestScope.customerListPage.endPage}" var = "i">
								<b><a href="/PJShop/custRegister?type=list&page=${i}">[${i}]</a></b>  
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		<tr>
			<td colspan ="5">
			<br>
				<a href="#">  총회원수 :  ${sessionScope.totalCustomer}</a>  <br>
			</td>
		</tr>
		</table>
	</div>
</div>
</body>
</html>