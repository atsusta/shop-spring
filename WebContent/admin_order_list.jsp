<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>판매자 인증페이지</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h3>구매요청 목록</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">	
				<c:choose>
					<c:when test="${orderInfoList == null }">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>현재 주문 신청한 물품이 없습니다.
						</div>
					</c:when>
					<c:otherwise>
						<form action="shipping.do"></form>
							<table class="table">
								<tr>
									<td><input type="checkbox" value=""></td>
									<td>고객아이디</td>
									<td>주문번호</td>
									<td>제품번호</td>
									<td>제품사이즈</td>
									<td>주문날짜</td>
									<td>결제현황</td>
									<td>배송상황</td>
									<td>Submit</td>
								</tr>
								<c:forEach items="${orderInfoList }" var="list">
									<tr>
										<td>${list.customerId }</td>
										<td>${list.orderNo }</td>
										<td>${list.productNo }</td>
										<td>${list.productSize }</td>
										<td>${list.orderDate }</td>
										<td>
											<select name="payment" id="payment" onfocus="${list.paymentCheck}">
												<option value="false">결제실패</option>
												<option value="true">결제완료</option>
											</select>
										</td>	
										<td>
											<select name="shipment" id="shipping">
												<option value="배송대기">배송대기
												<option value="배송중">배송중
												<option value="배송완료">배송완료
											</select>
										</td>
										<td>
											<input type="submit" value = "수정">
										</td>
									</tr>
								</c:forEach>
							</table>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>