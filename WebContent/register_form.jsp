<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<title>ȸ�� ����</title>
<script type="text/javascript">
	// 'ȸ������' ��ư�� ������ ��
	$(function(){
		$('form').submit(function(){
			if($('#id').val() == ''){
				alert("id�� �Է��ϼ���");
				$('#id').focus();
				return false;	//submit �̺�Ʈ ���۱�� ����
			}
			if($('#password').val() == ''){
				alert("pw�� �Է��ϼ���");
				$('#password').focus();
				return false;
			}
			if($('#pw_confirm').val() == ''){
				alert("pw�� ���Է��ϼ���");
				$('#pw_confirm').focus();
				return false;
			}
			if($('#name').val() == ''){
				alert("�̸��� �Է��ϼ���");
				$('#name').focus();
				return false;
			}
			if($('#phone').val() == ''){
				alert("��ȭ��ȣ�� �Է��ϼ���");
				$('#phone').focus();
				return false;
			}
			if($('#email').val() == ''){
				alert("�̸����� �Է��ϼ���");
				$('#email').focus();
				return false;
			}
			if($('#address').val() == ''){
				alert("�ּҸ� �Է��ϼ���");
				$('#address').focus();
				return false;
			}
			if($('#id_result').is(':contains("����")')){
// 			    alert("��밡�� ���̵��Դϴ�.");
			    $('#id_result').text("��밡�� ���̵��Դϴ�.").css("color", "blue");
			    return true;
			}
			if($('#id_result').val() == '' ){
				$('#customerId').focus();
				alert("id �ߺ��˻�� �ʼ��Դϴ�.");
				return false;
			}

		    $('form').submit(); // �� �ԷµǾ����� �� ������
		    
 		})
	})
	
	// ID �ߺ� �˻�
		$(function(){
		$('#check_id').click(function(){
			$.ajax({
				type: "GET",
				url: "http://localhost:8089/Shop-spring/idCheckAjax.do",
				data: "check_id="+$('#id').val(),
				dataType: "text",
				success: function(data, request, status, error){
					var result = "";
					if(data == 'id_duplication'){
						result = "�ߺ��� ���̵��Դϴ�.";
						$('#id_result').text(result).css("color", "red");
						$('#id').val("");
						$('#id').focus();
						return false;
					}else if(data == 'id_ok'){
						result = "��밡�� ���̵��Դϴ�.";
						$('#id_result').text(result).css("color", "blue");
						$('#password').focus();
						return;
					}
					 alert("success code:"+request.status+"\t"+"message:"+request.responseText+"\t"+"error:"+error);
				},
				error: function(request, status, error){
					 alert("error code:"+request.status+"\t\t"+"message:"+request.responseText+"\t\t"+"error:"+error);
				}
			})
		})
	})
	
	$(function(){
		$('#pw_confirm').keyup(function(){
			var resultpw = "";
			if($('#password').val() != $('#pw_confirm').val()){
					resultpw = "�н����尡 ��ġ���� �ʽ��ϴ�.";
					$('#pw_result').text(resultpw).css("color", "red");
			}else{
					resultpw = "�н����尡 ��ġ�մϴ�.";
					$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})
	
	// ----  reset�Ҷ� �ߺ�üũ, ���üũ �޼��� ���ֱ� ----
	$(function(){
		$('#reset').click(function(){
			$('#id_result').text('')
			$('#pw_result').text('');
		})
	})
	
	// ----  id ���� �Է� �Ҷ� �ߺ�üũ �޼��� ���ֱ� ----
	$(function(){
		$('#id').click(function(){
			$('#id_result').text('')
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="page-header">
				<h1>ȸ����� <small>(<span class="text-danger">*</span> ǥ�� ������ �ݵ�� �Է��Ͻʽÿ�)</small></h1>
			</div>
			<div class="well well-lg">
				<form class="form-horizontal" action="regist.do" method="post">
					<fieldset>
						<legend><b>ȸ�� ���� �Է�</b></legend>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerId">���̵�</label>
							<div class="col-lg-5">
								<input class="form-control" name="id" id="id" placeholder="ID" type="text">
							</div>
							<div class="col-lg-3">
								<button class="btn btn-default" id="check_id">�ߺ��˻�</button> 
								<span id="id_result" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="password">�н�����</label>
							<div class="col-lg-8">
								<input class="form-control" name="password" id="password" placeholder="Password" type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="pw_confirm">�н����� Ȯ��</label>
							<div class="col-lg-8">
								<input class="form-control" name="pw_confirm" id="pw_confirm" placeholder="Confirm Password" type="password">
							</div>
							<div class="col-lg-4 col-lg-offset-2">
								<span id="pw_result" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="name">�̸�</label>
							<div class="col-lg-8">
								<input class="form-control" name="name" id="name" placeholder="Name" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="phone">�޴��� ��ȣ</label>
							<div class="col-lg-8">
								<input class="form-control" name="phone" id="phone" placeholder="Phone" type="tel">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerEmail">�̸���</label>
							<div class="col-lg-8">
								<input class="form-control" name="email" id="email" placeholder="Email" type="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerAddr1">�ּ�</label>
							<div class="col-lg-8">
								<input class="form-control" name="addr1" id="addr1" placeholder="Address 1" type="text">
							</div>
							<div class="col-lg-8 col-lg-offset-2">
								<input class="form-control" name="addr2" id="addr2" placeholder="Address 2" type="text">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default" id="reset">�ٽ� �ۼ�</button>
								<button type="submit" class="btn btn-primary" id="submit">ȸ�� ����</button>
							</div>
		  				</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>