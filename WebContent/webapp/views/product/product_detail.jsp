<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품 상세 보기</title>
<script type="text/javascript">
	$(function () {
	    // 구매하기 버튼을 눌렀을 때
	    $("#orderButton").click(function () {
			if ($("#customerId").val() == "") {
			    // session에 id가 없는 경우, 즉 로그인이 안된 경우
			    $("#loginAlertModal").modal('show');
			} else {
			    $("#passOrderForm").submit();
			}
	    })
	    
	    // 로그인하지 않은 상태에서 주문하기
// 	    $("#ananymousOrder").click(function () {
// 			$("#passOrderForm").submit();
// 	    })
		
	    // 로그인 경고 modal에서 '로그인' 버튼을 눌렀을 경우 
	    $("#loginModalOpener").click(function () {
			// 로그인 경고 modal을 숨기고
			$("#loginAlertModal").modal('hide');
			
			// 로그인 양식 modal을 꺼냄
			$("#loginModal").modal('show');
	    })

	    // 로그인 양식 modal이 꺼내졌을 때
	    $("#loginModal").on('shown.bs.modal', function () {
			// 2차 modal을 부르면서 생기는 bug fix
		    $("body").addClass("modal-open");
			$("body").css("padding-right", "17px");
		})
	    
	})
</script>
</head>
<body>
	<!-- modal -->
	<div class="modal fade" id="loginAlertModal" tabindex="-1" role="dialog" 
		aria-labelledby="loginAlertModalLabel" aria-hidden="true" data-backdrop="false">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span 
				aria-hidden="true">&times;</span></button>
	      	<h4 class="modal-title" id="loginAlertModalLabel">로그인 되어있지 않습니다!</h4>
	      </div>
	      <div class="modal-body">
	      	<p>상품을 구매할 수 없습니다.</p>
	      </div>
	      <div class="modal-footer">
      		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="ananymousOrder">닫기</button>
      		<button type="button" class="btn btn-primary btn-sm" id="loginModalOpener">로그인</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-md-offset-1 text-center">
				<!-- 송동휘: 아래 product.productImage -> product.image로 변경. -->
				<img src="webapp/img/${product.image }" class="img-responsive" width="400" />
			</div>
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-1">
				<form class="form-horizontal" id="passOrderForm" action="order.do" method="post">
					<fieldset>
						<div class="form-group">
							<h3>${product.name }</h3>
							<p class="lead">${product.content }</p>
						</div>
						<div class="form-group">
							<p>${product.price }</p>
							<p>${product.color }</p>
						</div>
						<div class="form-group">
							<select class="form-control" name="productSize">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="orderQuantity" min="1" max="10" value="1">
							<input type="hidden" name="productNo" value="${product.no }">
							<input type="hidden" id="customerId" value="${sessionScope.customerId }">
						</div>
						<div class="form-group text-right">
							<a class="btn btn-default" href="product.do?category=${category }"><span 
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>&nbsp;&nbsp;목록으로</a>
							<button type="button" class="btn btn-primary" id="orderButton"><span 
								class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;구매하기</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="row">
			<hr class="col-xs-10 col-xs-offset-1 divider">
		</div>
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1">
				${product.detail }
			</div>
		</div>
	</div>
</body>
</html>