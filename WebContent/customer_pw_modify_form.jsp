<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>

<title>��й�ȣ ����</title>
<script type="text/javascript">
	$(function () {
		$('#pw_confirm').keyup(function () {
			var resultpw = "";
			if( $('#modifyPassword').val() != $('#pw_confirm').val() ) {
				resultpw = "�н����尡 ��ġ���� �ʽ��ϴ�.";
				$('#pw_result').text(resultpw).css("color", "red");
			} else {
				resultpw = "�н����尡 ��ġ�մϴ�.";
				$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})
	
	$(function () {
		$('#reset').click(function(){
			$('#id_result').text('')
			$('#pw_result').text('');
		})
	})
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>��й�ȣ ����</h1>
			</div>
			<div class="well well-lg">
				<form class="form-horizontal" action="/Shop-spring/customerPwModify.do" method="POST"> 
					<fieldset>
						<legend><b>��й�ȣ�� �Է����ּ���</b></legend>
						<div class="form-group">
							<label class="col-lg-3 control-label" for="id">���̵�</label>
							<div class="col-lg-9">
								<input class="form-control" type="text" name="id" id="id" value="${requestScope.id}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label" for="comparePassword">���� �н�����</label>
							<div class="col-lg-9">
								<input class="form-control" type="password" name="comparePassword" id="comparePassword">
							</div>
						</div>
						<hr class="divider">
						<div class="form-group">
							<label class="col-lg-3 control-label" for="modifyPassword">������ �н�����</label>
							<div class="col-lg-9">
								<input class="form-control" type="password" name="modifyPassword" id="modifyPassword">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-3 control-label" for="pw_confirm">������ �н�����</label>
							<div class="col-lg-9">
								<input class="form-control" type="password" name="pw_confirm" id="pw_confirm">
							</div>
							<div class="col-lg-4 col-lg-offset-2">
								<span id="pw_result" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-9 col-lg-offset-3">
								<button type="reset" class="btn btn-default" name="reset" id="reset">�ٽ� �ۼ�</button>
								<button type="submit" class="btn btn-primary" name="submit">����</button>
								<input type="hidden" name="type" value="passwordModify"/>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>