<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(function () {
	 	// ���� ����� Ŭ������ �� button�� text�� �ٲ��
		$(".dropdown-menu > li > a").click(function (event) {
		    // a href="#" �̺�Ʈ ����
		    event.preventDefault();
		    $("#cardCompanyDropdownMenu").html($( this ).text() + ' <span class="caret"></span>');
// 		    $("#paymentType").val( $( this ).attr("id") );
		})
	    
	})
</script>
<title>���� ���� ȭ��</title>
</head>
<body class="checkout">
	<div class="container">
		<div class="page-header">
			<h2>���� Ȯ��</h2>
<!-- 			<div class="col-sm-4 col-sm-offset-8"> -->
				<!-- 							<span class="card">���� ������...</span> -->
<!-- 				<div class="animation-square"></div> -->
<!-- 			</div> -->
		</div>
		<form action="result.do" method="post">
			<div class="row">
				<fieldset id="payment-summary">
					<div class="col-xs-12 col-sm-6 col-sm-offset-6 text-right">
						<dl class="dl-horizontal">
							<blockquote>
								<dt>��ǰ ����</dt>
								<dd>��${requestScope.subtotal }</dd>
								<dt>��ۺ�</dt>
								<dd>��${requestScope.shippingPrice }</dd>
								<hr>
								<dt>�� ����</dt>
								<dd>��${requestScope.subtotal + requestScope.shippingPrice }</dd>
							</blockquote>
						</dl>
					</div>
					<div class="col-xs-12 col-sm-12">
						<hr>
						<div class="row">
							<div class="col-xs-12 col-md-4 col-md-offset-2">
								<div class="form-group">
									<label for="cardNumber">ī�� ��ȣ</label>
									<input type="text" class="form-control" name="cardNumber" id="cardNumber"
										placeholder="ī�� ��ȣ" data-stripe="number">
								</div>
							</div>
							<div class="col-xs-12 col-md-4">
								<div class="form-group">
									<label for="cardCompany">ī���</label>
									<div class="dropdown">
										<button class="btn btn-info btn-block dropdown-toggle" type="button" 
											id="cardCompanyDropdownMenu" data-toggle="dropdown" aria-expanded="true">
											ī��縦 �����ϼ��� <span class="caret"></span>
										</button>
										<ul class="dropdown-menu" role="menu" aria-labelledby="cardCompanyDropdownMenu">
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="wooriCard">�츮ī��</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="standardChartedCard">Standard Charted</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="hanaCard">�ϳ�ī��</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="nhCard">NH����ī��</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="ibkCard">IBK�������</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="kbCard">KB����ī��</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="dgCard">�뱸����</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="BNKbusanCard">BNK�λ�����</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="BNKgyungnamCard">BNK�泲����</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="citibankCard">Citibank</a>
											</li>
											<li role="presentation">
												<a role="menuitem" tabindex="-1" href="#"
													id="shinhanCard">����ī��</a>
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
<!-- 										<option>�츮ī��</option> -->
<!-- 										<option>Standard Charted</option> -->
<!-- 										<option>�ϳ�ī��</option> -->
<!-- 										<option>NH����ī��</option> -->
<!-- 										<option>IBK�������</option> -->
<!-- 										<option>KB����ī��</option> -->
<!-- 										<option>�뱸����</option> -->
<!-- 										<option>BNK�λ�����</option> -->
<!-- 										<option>BNK�泲����</option> -->
<!-- 										<option>Citibank</option> -->
<!-- 										<option>����ī��</option> -->
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
									<label for="expiration">�Ⱓ ������</label>
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
						<button type="button" class="btn btn-default btn-lg">���� ���</button>
						<button type="submit" class="btn btn-success btn-lg">���� Ȯ��</button>
					</div>
				</section>
			</div>
		</form>
	</div>
</body>
</html>