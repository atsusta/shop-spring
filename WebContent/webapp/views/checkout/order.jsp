<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$(function () {
	    // �ֹ� ������ ���� �� ��� ����ϱ�
		setSubtotal();
		
	    // �ֹ� ������ ���� �� ��� ����ϱ�(��ۺ� ����)
		$("#quantity").change(function () {
			setSubtotal();
		})
		
	    // ���� ����� Ŭ������ �� button�� text�� �ٲ��
		$(".dropdown-menu > li > a").click(function (event) {
		    // a href="#" �̺�Ʈ ����
		    event.preventDefault();
		    $("#paymentDropdownMenu").html($( this ).text() + ' <span class="caret"></span>');
		    $("#paymentType").val( $( this ).attr("id") );
		})
		
		// submit ���� ä������ ���� ��Ŀ� ���� ��� �޽��� ǥ��
	    $("#addOrderButton").click(function () {
			var isAllChecked = checkReqiredInput();
			console.log( isAllChecked )
			
			if ( isAllChecked ) {
			    $("#orderForm").submit();
			}
	    })
	    
	})

	// �� ��� ��� �Լ� (��ۺ� ����)
	function setSubtotal() {
	    var newSubtotal = $("#price").text() * $("#quantity").val();
		$("#subtotalValue").text("�� " + newSubtotal);
		$("#subtotalInput").val(newSubtotal);
	}
	
 	// ä������ ���� ����� ã�� �Լ�
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
<title>�ֹ��� �ۼ�</title>
</head>
<body class="checkout">
	<div class="container">
		<!-- form -->
		<form class="form-horizontal" action="payment.do" method="post" id="orderForm">
			<fieldset>
				<div class="row">
					<!-- �ֹ��� ��ǰ -->
					<div class="well container">
						<h3>�ֹ� ��ǰ</h3>
						<div class="col-md-3 container-fluid">
							<img src="img/${product.image }" class="img-responsive" alt="��ǰ�̹���">
						</div>
						<div class="col-md-9 container-fluid">
							<table class="table">
								<tr>
									<th colspan="2">��ǰ</th>
									<th>����</th>
									<th>����</th>
									<th>�� ����</th>
								</tr>
								<tr>
									<td id="name" colspan="2">${product.name }</td>
									<td id="price" rowspan="2">${product.price }</td>
									<td rowspan="2" class="col-sm-3">
										<input type="number" class="form-control input-sm" id="quantity"
											name="orderQuantity" value="${orderQuantity }" min="1" max="10">
									</td>
									<td rowspan="2" id="subtotalValue" class="col-sm-3">��</td>
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
					</div><!-- /.�ֹ��� ��ǰ -->
				</div>
				<div class="row">
					<!-- �ֹ��� ����(����) -->
					<div class="well col-sm-6">
						<h3>�ֹ��� ����</h3>
							<div class="form-group">
								<!-- product number -->
								<input type="hidden" name="productNo" value="${product.no }"><!-- /.product number -->
								<label class="col-md-3 control-label">�̸�</label>
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
					</div><!-- /.�ֹ��� ����(����) -->
				</div>
				<div class="row">
					<!-- ����� ���� -->
					<div class="well">
						<h3>����� ����</h3>
						<div class="form-group">
							<label class="col-md-2 control-label" for="receiverName">�̸�</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="receiverName" 
									name="receiverName" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="phoneNumber">��ȭ��ȣ	</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="phoneNumber"
									name="phoneNumber" pattern="\d*" required>
							</div>
						</div>
						<div class="col-xs-12">
							<h4>�ּ�</h4>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="zipCode">���� ��ȣ</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" 
									id="zipCode" size="3" name="zipCode" pattern="\d*" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="address">�⺻ �ּ�</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md"
									id="address" size="30" name="address" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="address2">������ �ּ�</label>
							<div class="col-md-8">
								<input type="text" class="form-control input-md" id="address2" 
									name="address2" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="shippingMessage">��� �޽���<br>(100�� �̳�)</label>
							<div class="col-md-8">
								<textarea class="form-control input-lg" id="shippingMessage"
									rows="5" cols="60" name="shippingMessage"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-2 control-label" for="paymentType">���� ���</label>
							<div class="col-md-8">
								<div class="dropdown">
									<button class="btn btn-info btn-block dropdown-toggle" type="button" 
										id="paymentDropdownMenu" data-toggle="dropdown" aria-expanded="true">
										���� ����� �����ϼ��� <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu" aria-labelledby="paymentDropdownMenu">
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payCard">�ſ� ī��</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payAccount">���� ��ü</a>
										</li>
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="#" 
												id="payPhone">�޴��� ����</a>
										</li>
									</ul>
									<!-- payment type -->
									<input type="hidden" name="paymentType" id="paymentType" value="payCard"><!-- /.payment type -->
								</div>
							</div>
						</div>
					</div><!-- /.����� ���� -->
				</div>
				<div class="row">
					<div class="col-xs-12 text-right">
						<hr>
						<button type="button" class="btn btn-default btn-lg" id="cancelOrderButton">�ֹ� ���</button>
						<button type="button" class="btn btn-success btn-lg" id="addOrderButton">�ֹ��ϱ�</button> 
					</div>
				</div>
			</fieldset>
		</form><!-- /.form -->
	</div>
</body>
</html>