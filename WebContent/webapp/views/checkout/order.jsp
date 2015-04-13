<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(function () {
	    // 주문 수량에 따라 총 비용 계산하기
		setSubtotal();
		
	    // 주문 수량에 따라 총 비용 계산하기(배송비 제외)
		$("#quantity").change(function () {
			setSubtotal();
		})
		
	    // 결제 방식을 클릭했을 때 button의 text가 바뀌도록
		$(".dropdown-menu > li > a").click(function (event) {
		    // a href="#" 이벤트 막음
		    event.preventDefault();
		    $("#paymentDropdownMenu").html($( this ).text() + ' <span class="caret"></span>');
		    $("#paymentType").val( $( this ).attr("id") );
		})
		
		// submit 전에 채워지지 않은 양식에 대해 경고 메시지 표시
	    $("#addOrderButton").click(function () {
			var isAllChecked = checkReqiredInput();
			console.log( isAllChecked )
			
			if ( isAllChecked ) {
			    $("#orderForm").submit();
			}
	    })
	    
	})

	// 총 비용 계산 함수 (배송비 제외)
	function setSubtotal() {
	    var newSubtotal = $("#price").text() * $("#quantity").val();
		$("#subtotalValue").text("￦ " + newSubtotal);
		$("#subtotalInput").val(newSubtotal);
	}
	
 	// 채워지지 않은 양식을 찾는 함수
	function checkReqiredInput() {
	    var formChildren = $( "fieldset > *" );
    	var firstBlankInput;
		var isFirstBlankInput = true;
		var isAllInputsWrote = true; 
		console.log(formChildren)
	    
	    $( formChildren ).find(":input").each(function () {
			var id = $( this ).attr("id");
			
			if ( ($( this ).val() == "") && 
					($( this ).attr("type") != "button") &&
					($( this ).attr("id") != "shippingMessage") ) {
			    // input is blank, turn on the light
			    // (except shipping message and buttons)
			    // available on input box(element) only
				$("label").each(function () {
				    if ( $( this ).attr("for") == id ) {
				    	// add class "has-error" on parent of "label"
					    $( this ).parent().addClass("has-error");
						console.log( "add light: " + $( this ).attr("id") )
				    }
				})
				
				// find the first blank input to focus on
				if ( isFirstBlankInput ) {
					firstBlankInput = $( this );
					isFirstBlankInput = false;
				}
				
				// blank input is exist
				isAllInputsWrote = false;
				console.log($( this ))
				console.log("sucks")
				
			} else {
			    // input is wrote, turn off the light
			    // available on input box(element) only
			    $("label").each(function () {
			    	if ( $( this ).attr("for") == id ) {
			    		// remove class "has-error" on parent of "label" 
			    		$( this ).parent().removeClass("has-error");
			    		console.log( "remove light: " + $( this ).attr("id") )
			    	}
			    })
			    
			}
			
			// focus on the first blank input
			$( firstBlankInput ).focus();
			
	    })
	    
		return isAllInputsWrote;
	}
	
	
</script>
<title>주문서 작성</title>
</head>
<body class="checkout">
	<div class="container">
		<!-- form -->
		<form class="form-horizontal" action="payment.do" method="post" id="orderForm">
			<fieldset>
				<div class="row">
					<!-- 주문한 상품 -->
					<div class="well container">
						<h3>주문 상품</h3>
						<div class="col-md-3 container-fluid">
							<img src="img/${product.image }" class="img-responsive" alt="제품이미지">
						</div>
						<div class="col-md-9 container-fluid">
							<table class="table">
								<tr>
									<th colspan="2">제품</th>
									<th>가격</th>
									<th>수량</th>
									<th>총 가격</th>
								</tr>
								<tr>
									<td id="name" colspan="2">${product.name }</td>
									<td id="price" rowspan="2">${product.price }</td>
									<td rowspan="2" class="col-sm-3">
										<input type="number" class="form-control input-sm" id="quantity"
											name="orderQuantity" value="${orderQuantity }" min="1" max="10">
									</td>
									<td rowspan="2" id="subtotalValue" class="col-sm-3">￦</td>
								</tr>
								<tr>
									<td id="size">Size:</td>
									<td>${productSize }</td>
								</tr>
							</table>
							<!-- subtotal price -->
							<input type="hidden" name="subtotalInput" id="subtotalInput"><!-- /.subtotal price -->
							<!-- product size -->
							<input type="hidden" name="productSize" value="${productSize }"><!-- /.product size -->
						</div>
					</div><!-- /.주문한 상품 -->
				</div>
				<div class="row">
					<!-- 주문자 정보(결제) -->
					<div class="well col-sm-6">
						<h3>주문자 정보</h3>
							<div class="form-group">
								<!-- product number -->
								<input type="hidden" name="productNo" value="${product.no }"><!-- /.product number -->
								<label class="col-md-3 control-label">이름</label>
								<div class="col-md-8">
									<c:if test="${not empty sessionScope.customerId }">
										<p class="form-control-static">${customerName }</p>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">E-mail</label>
								<div class="col-md-8">
									<c:if test="${not empty sessionScope.customerId }">
										<p class="form-control-static">${customerEmail }</p>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label">Phone</label>
								<div class="col-md-8">
									<c:if test="${not empty sessionScope.customerId }">
										<p class="form-control-static">${customerPhone }</p>
									</c:if>
								</div>
							</div>
					</div><!-- /.주문자 정보(결제) -->
				</div>
				<div class="row">
					<!-- 배송지 정보 -->
					<div class="well">
						<h3>배송지 정보</h3>
						<div class="form-group">
							<label class="col-md-2 control-label" for="receiverName">이름</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="receiverName" 
									name="receiverName" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="phoneNumber">전화번호	</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="phoneNumber"
									name="phoneNumber" pattern="\d*" required>
							</div>
						</div>
						<div class="col-xs-12">
							<h4>주소</h4>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="zipCode">우편 번호</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" 
									id="zipCode" size="3" name="zipCode" pattern="\d*" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="address">기본 주소</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md"
									id="address" size="30" name="address" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="address2">나머지 주소</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="address2" 
									name="address2" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="shippingMessage">배송 메시지<br>(100자 이내)</label>
							<div class="col-md-8">
								<textarea class="form-control input-lg" id="shippingMessage"
									rows="5" cols="60" name="shippingMessage"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="paymentType">결제 방식</label>
							<div class="col-md-8">
								<div class="dropdown">
									<button class="btn btn-info btn-block dropdown-toggle" type="button" 
										id="paymentDropdownMenu" data-toggle="dropdown" aria-expanded="true">
										결제 방식을 선택하세요 <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu" aria-labelledby="paymentDropdownMenu">
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payCard">신용 카드</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payAccount">계좌 이체</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payPhone">휴대폰 결제</a>
										</li>
									</ul>
									<!-- payment type -->
									<input type="hidden" name="paymentType" id="paymentType" value="payCard"><!-- /.payment type -->
								</div>
							</div>
						</div>
					</div><!-- /.배송지 정보 -->
				</div>
				<div class="row">
					<div class="col-xs-12 text-right">
						<hr>
						<button type="button" class="btn btn-default btn-lg" id="cancelOrderButton">주문 취소</button>
						<button type="button" class="btn btn-success btn-lg" id="addOrderButton">주문하기</button> 
					</div>
				</div>
			</fieldset>
		</form><!-- /.form -->
	</div>
</body>
</html>