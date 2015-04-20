<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 주문 정보</title>
</head>
<body>
	<div class="container">
		<div class="col-xs-12">
			<c:choose>
				<c:when test="${empty customerOrderInfoPage.orderInfoList }">
					<div class="alert alert-warning text-center">
						주문 내역이 없습니다.
					</div>
				</c:when>
				<c:otherwise>
					<div class="panel panel-info">
						<div class="panel-heading">
							나의 주문 정보
						</div>
						<table class="table table-striped table-hover">
							<thead>
								<tr class="active">
									<th>주문 날짜</th>
									<th>주문 수량</th>
									<th>제품명</th>
									<th>제품 사이즈</th>
									<th>결제 방식</th>
									<th>결제 여부</th>
									<th>배송 메시지</th>
									<th>배송 상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${customerOrderInfoPage.orderInfoList }" var="orderInfo" varStatus="status">
									<tr>
										<td>${orderInfo.orderDate }</td>
										<td>${orderInfo.orderQuantity }</td>
										<td>${customerOrderInfoPage.productList[status.index].name }</td>
										<td>${orderInfo.productSize }</td>
										<td>${orderInfo.paymentType }</td>
										<td>
											<c:choose>
												<c:when test="${orderInfo.paymentCheck == true}">
													결제 완료
												</c:when>
												<c:otherwise>
													결제 대기
												</c:otherwise>
											</c:choose>
										<td>${orderInfo.shippingMessage }</td>
										<td>${orderInfo.shippingStatus }</td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row text-center">
						<ul class="pagination">
							<c:if test="${customerOrderInfoPage.startPage > 1 }">
								<li><a href="myOrders.do?page=${customerOrderInfoPage.requestPage - 1 }"><<</a></li>
							</c:if>
							<c:forEach begin="${customerOrderInfoPage.startPage }" 
									end="${customerOrderInfoPage.endPage }" var = "i">
								<c:choose>
									<c:when test="${i == customerOrderInfoPage.requestPage }">
										<li class="active"><a href="#">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="myOrders.do?page=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${customerOrderInfoPage.endPage < customerOrderInfoPage.totalPages }">
								<li><a href="myOrders.do?page=${customerOrderInfoPage.requestPage + 1 }">>></a></li>
							</c:if>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>