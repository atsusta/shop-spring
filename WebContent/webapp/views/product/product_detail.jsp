<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ �� ����</title>
<script type="text/javascript">
	$(function () {
	    // �����ϱ� ��ư�� ������ ��
	    $("#orderButton").click(function () {
			if ($("#customerId").val() == "") {
			    // session�� id�� ���� ���, �� �α����� �ȵ� ���
			    $("#loginAlertModal").modal('show');
			} else {
			    $("#passOrderForm").submit();
			}
	    })
	    
	    // �α������� ���� ���¿��� �ֹ��ϱ�
// 	    $("#ananymousOrder").click(function () {
// 			$("#passOrderForm").submit();
// 	    })
		
	    // �α��� ��� modal���� '�α���' ��ư�� ������ ��� 
	    $("#loginModalOpener").click(function () {
			// �α��� ��� modal�� �����
			$("#loginAlertModal").modal('hide');
			
			// �α��� ��� modal�� ����
			$("#loginModal").modal('show');
	    })

	    // �α��� ��� modal�� �������� ��
	    $("#loginModal").on('shown.bs.modal', function () {
			// 2�� modal�� �θ��鼭 ����� bug fix
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
	      	<h4 class="modal-title" id="loginAlertModalLabel">�α��� �Ǿ����� �ʽ��ϴ�!</h4>
	      </div>
	      <div class="modal-body">
	      	<p>��ǰ�� ������ �� �����ϴ�.</p>
	      </div>
	      <div class="modal-footer">
      		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="ananymousOrder">�ݱ�</button>
      		<button type="button" class="btn btn-primary btn-sm" id="loginModalOpener">�α���</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-5 col-md-offset-1 text-center">
				<!-- �۵���: �Ʒ� product.productImage -> product.image�� ����. -->
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
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>&nbsp;&nbsp;�������</a>
							<button type="button" class="btn btn-primary" id="orderButton"><span 
								class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;&nbsp;�����ϱ�</button>
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