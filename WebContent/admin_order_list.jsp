<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ǹ��� ����������</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h3>���ſ�û ���</h3>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">	
				<c:choose>
					<c:when test="${orderInfoList == null }">
						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>���� �ֹ� ��û�� ��ǰ�� �����ϴ�.
						</div>
					</c:when>
					<c:otherwise>
						<form action="shipping.do"></form>
							<table class="table">
								<tr>
									<td><input type="checkbox" value=""></td>
									<td>�����̵�</td>
									<td>�ֹ���ȣ</td>
									<td>��ǰ��ȣ</td>
									<td>��ǰ������</td>
									<td>�ֹ���¥</td>
									<td>������Ȳ</td>
									<td>��ۻ�Ȳ</td>
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
												<option value="false">��������</option>
												<option value="true">�����Ϸ�</option>
											</select>
										</td>	
										<td>
											<select name="shipment" id="shipping">
												<option value="��۴��">��۴��
												<option value="�����">�����
												<option value="��ۿϷ�">��ۿϷ�
											</select>
										</td>
										<td>
											<input type="submit" value = "����">
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