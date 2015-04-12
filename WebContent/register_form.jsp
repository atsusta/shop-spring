<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/Shop-spring/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="js/bootstrap.js"></script>
<title>회원 가입</title>
<script type="text/javascript">
	// '회원가입' 버튼을 눌렀을 때
	$(function(){
		$('form').submit(function(){
			if($('#id').val() == ''){
				alert("id를 입력하세요");
				$('#id').focus();
				return false;	//submit 이벤트 전송기능 막음
			}
			if($('#password').val() == ''){
				alert("pw를 입력하세요");
				$('#password').focus();
				return false;
			}
			if($('#pw_confirm').val() == ''){
				alert("pw를 재입력하세요");
				$('#pw_confirm').focus();
				return false;
			}
			if($('#name').val() == ''){
				alert("이름을 입력하세요");
				$('#name').focus();
				return false;
			}
			if($('#phone').val() == ''){
				alert("전화번호를 입력하세요");
				$('#phone').focus();
				return false;
			}
			if($('#email').val() == ''){
				alert("이메일을 입력하세요");
				$('#email').focus();
				return false;
			}
			if($('#address').val() == ''){
				alert("주소를 입력하세요");
				$('#address').focus();
				return false;
			}
			if($('#id_result').is(':contains("가능")')){
// 			    alert("사용가능 아이디입니다.");
			    $('#id_result').text("사용가능 아이디입니다.").css("color", "blue");
			    return true;
			}
			if($('#id_result').val() == '' ){
				$('#customerId').focus();
				alert("id 중복검사는 필수입니다.");
				return false;
			}

		    $('form').submit(); // 다 입력되었으면 폼 전송함
		    
 		})
	})
	
	// ID 중복 검사
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
						result = "중복된 아이디입니다.";
						$('#id_result').text(result).css("color", "red");
						$('#id').val("");
						$('#id').focus();
						return false;
					}else if(data == 'id_ok'){
						result = "사용가능 아이디입니다.";
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
					resultpw = "패스워드가 일치하지 않습니다.";
					$('#pw_result').text(resultpw).css("color", "red");
			}else{
					resultpw = "패스워드가 일치합니다.";
					$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})
	
	// ----  reset할때 중복체크, 비번체크 메세지 없애기 ----
	$(function(){
		$('#reset').click(function(){
			$('#id_result').text('')
			$('#pw_result').text('');
		})
	})
	
	// ----  id 새로 입력 할때 중복체크 메세지 없애기 ----
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
				<h1>회원등록 <small>(<span class="text-danger">*</span> 표시 사항은 반드시 입력하십시오)</small></h1>
			</div>
			<div class="well well-lg">
				<form class="form-horizontal" action="regist.do" method="post">
					<fieldset>
						<legend><b>회원 정보 입력</b></legend>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerId">아이디</label>
							<div class="col-lg-5">
								<input class="form-control" name="id" id="id" placeholder="ID" type="text">
							</div>
							<div class="col-lg-3">
								<button class="btn btn-default" id="check_id">중복검사</button> 
								<span id="id_result" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="password">패스워드</label>
							<div class="col-lg-8">
								<input class="form-control" name="password" id="password" placeholder="Password" type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="pw_confirm">패스워드 확인</label>
							<div class="col-lg-8">
								<input class="form-control" name="pw_confirm" id="pw_confirm" placeholder="Confirm Password" type="password">
							</div>
							<div class="col-lg-4 col-lg-offset-2">
								<span id="pw_result" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="name">이름</label>
							<div class="col-lg-8">
								<input class="form-control" name="name" id="name" placeholder="Name" type="text">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="phone">휴대폰 번호</label>
							<div class="col-lg-8">
								<input class="form-control" name="phone" id="phone" placeholder="Phone" type="tel">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerEmail">이메일</label>
							<div class="col-lg-8">
								<input class="form-control" name="email" id="email" placeholder="Email" type="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label" for="customerAddr1">주소</label>
							<div class="col-lg-8">
								<input class="form-control" name="addr1" id="addr1" placeholder="Address 1" type="text">
							</div>
							<div class="col-lg-8 col-lg-offset-2">
								<input class="form-control" name="addr2" id="addr2" placeholder="Address 2" type="text">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default" id="reset">다시 작성</button>
								<button type="submit" class="btn btn-primary" id="submit">회원 가입</button>
							</div>
		  				</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>