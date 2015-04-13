<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(function () {
	 	// 결제 방식을 클릭했을 때 button의 text가 바뀌도록
		$(".dropdown-menu > li > a").click(function (event) {
		    // a href="#" 이벤트 막음
		    event.preventDefault();
		    $("#cardCompanyDropdownMenu").html($( this ).text() + ' <span class="caret"></span>');
// 		    $("#paymentType").val( $( this ).attr("id") );
		})
	    
	})
</script>
<title>가상 결제 화면</title>
</head>
<body class="checkout">
	<div class="container">
		<div class="page-header">
			<h2>결제 확인</h2>
<!-- 			<div class="col-sm-4 col-sm-offset-8"> -->
				<!-- 							<span class="card">결제 진행중...</span> -->
<!-- 				<div class="animation-square"></div> -->
<!-- 			</div> -->
		</div>
		<form action="result.do" method="post">
			<div class="row">
				<fieldset id="payment-summary">
					<div class="col-xs-12 col-sm-6 col-sm-offset-6 text-right">
						<dl class="dl-horizontal">
							<blockquote>
								<dt>제품 가격</dt>
								<dd>￦${requestScope.subtotal }</dd>
								<dt>배송비</dt>
								<dd>￦${requestScope.shippingPrice }</dd>
								<hr>
								<dt>총 가격</dt>
								<dd>￦${requestScope.subtotal + requestScope.shippingPrice }</dd>
							</blockquote>
						</dl>
					</div>
					<div class="col-xs-12 col-sm-12">
						<hr>
						<div class="row">
							<div class="col-xs-12 col-md-4 col-md-offset-2">
								<div class="form-group">
									<label for="cardNumber">카드 번호</label>
									<input type="text" class="form-control" name="cardNumber" id="cardNumber"
										placeholder="카드 번호" data-stripe="number">
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<div class="form-group">
									<label for="cardCompany">카드사</label>
									<div class="dropdown">
										<button class="btn btn-info btn-block dropdown-toggle" type="button" 
											id="cardCompanyDropdownMenu" data-toggle="dropdown" aria-expanded="true">
											카드사를 선택하세요 <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="cardCompanyDropdownMenu">
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="wooriCard">우리카드</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="standardChartedCard">Standard Charted</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="hanaCard">하나카드</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="nhCard">NH농협카드</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="ibkCard">IBK기업은행</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="kbCard">KB국민카드</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="dgCard">대구은행</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="BNKbusanCard">BNK부산은행</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="BNKgyungnamCard">BNK경남은행</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="citibankCard">Citibank</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="shinhanCard">신한카드</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="bcCard">BCcard</a>
											</li>
										</ul>
									</div>
<!-- 									<input type="text" class="form-control" name="cardCompany" id="cardCompany" -->
<!-- 										list="cardCompanies"> -->
<!-- 									<datalist id="cardCompanies"> -->
<!-- 										<option>우리카드</option> -->
<!-- 										<option>Standard Charted</option> -->
<!-- 										<option>하나카드</option> -->
<!-- 										<option>NH농협카드</option> -->
<!-- 										<option>IBK기업은행</option> -->
<!-- 										<option>KB국민카드</option> -->
<!-- 										<option>대구은행</option> -->
<!-- 										<option>BNK부산은행</option> -->
<!-- 										<option>BNK경남은행</option> -->
<!-- 										<option>Citibank</option> -->
<!-- 										<option>신한카드</option> -->
<!-- 										<option>BCcard</option> -->
<!-- 									</datalist> -->
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-4 col-md-offset-2">
								<div class="form-group">
									<label for="cvc">CVC</label> <input type="text"
										class="form-control" name="cvc" id="cvc"
										placeholder="CVC" data-numeric>
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<div class="form-group">
									<label for="expiration">기간 만료일</label>
									<input type="text" class="form-control" name="expiration" id="expiration"
										placeholder="MM / YYYY">
								</div>
							</div>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="row">
				<section id="button">
					<div class="col-xs-12">
						<hr>
					</div>
					<div class="col-xs-12 text-right">
						<button type="button" class="btn btn-default btn-lg">결제 취소</button>
						<button type="submit" class="btn btn-success btn-lg">결제 확인</button>
					</div>
				</section>
			</div>
		</form>
	</div>
</body>
</html>