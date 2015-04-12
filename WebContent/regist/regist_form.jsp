<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="js/jquery-2.1.3.min.js"></script>
<Link rel="stylesheet" type="text/css" href="css/u3.css">
<style type="text/css">
	body {
		width:500px; margin-top:200px; margin:0 auto;
		height: 100%;
	}
	div#page-wrap{background-color: #F3F1E9; width:500px; margin-top: 40px;}
	.input {	FONT-SIZE: 10pt; FONT-FAMILY: 굴림,굴림체, Arial }
	.submitBtn{width:490px; margin-top:20px; margin:0 auto;}
	
	FONT.c {	FONT-SIZE: 10px; COLOR: #000000; FONT-FAMILY: 굴림,굴림체, Arial}
	.unnamed1 {  font-family: "바탕"; font-size: 16px; color: #DD4800; text-decoration: blink}
	.unnamed2 {  font-family: "바탕"; font-size: 18px; color: #DD4800; text-decoration: blink}
	.tohama {  font-family: "tohama"; font-size: 18px; color: #DD4800; text-decoration: blink}
	fieldset#right { margin-left: 10px; width:100px; margin-top: -78px;}
	fieldset#right > legend { clear:both;  width: 40px; text-indent:10px;}
	fieldset#right > legend > label{ clear:both; width: 40px;}
	fieldset {
/* 		width:600px; */
		margin-bottom: 5px;
 		font-size: 13px;	 
	}
	legend {
		text-indent:15px;
		text-align:left;
		width: 125px;
		color: green;
	}
	label {
		display: inline-block;
		width: 90px;
		line-height: 25px;
	}
	input{
		display: inline-block;
		width: 80px;
	}
	input#customerAddr1{ width: 250px;}
	input#customerAddr2{ width: 120px;}
	input#email{ width: 120px;}
	 
	.idCheckSuccess{ color: blue; }
	.idCheckFail{ color: red; }
	
/* 	input:not([type="text"]){ */
/* 		width:140px; */
/* 		border:1px solid #000; */
/* 	} */
 	div.submitBtn{ 
 		width:350px; margin:0 auto; text-align:center;
 		padding:10px; 
 		border:0px solid #000; 
 	} 

 div img{ 
 	width: 90px; 
/*  	heigth: 30px;  */
 	position: relative; 
 	animation: 10 myanim; 
 	animation-iteration-count:10; 
 } 
 div#anitest{ 
/*  	width: 150px; */
/*  	heigth: 30px;  */
/*  	background-color: yellow;  */
 	position: relative; 
 	animation: 10s myanim; 
 	animation-iteration-count:10; 
 } 

@keyframes myanim{
	0% {left:0px; top:0px;}
	5% {left:5px; top:5px;}
	10% {left:10px; top:10px;}
	20% {left:20px; top:20px;}
	30% {left:40px; top:30px;}
	40% {left:80px; top:40px;}
	45% {left:120px; top:30px;}
	50% {left:150px; top:20px;}
	55% {left:120px; top:10px;}
	60% {left:80px; top:0px;}
	70% {left:40px; top:10px;}
	80% {left:20px; top:20px;}
	90% {left:10px; top:30px;}
	100% {left:0px; top:40px;}
}
</style>
<script type="text/javascript">
<!-- ---------- login check perfect ----------- -->
	$(function(){
		$('form').submit(function(){
			if($('#customerId').val() == ''){
				alert("id를 입력하세요");
				$('#customerId').focus();
				return false;	//submit 이벤트 전송기능 막음
			}
			if($('#customerPassword').val() == ''){
				alert("pw를 입력하세요");
				$('#customerPassword').focus();
				return false;
			}
			if($('#pw_confirm').val() == ''){
				alert("pw를 재입력하세요");
				$('#pw_confirm').focus();
				return false;
			}
			if($('#customerName').val() == ''){
				alert("이름을 입력하세요");
				$('#customerName').focus();
				return false;
			}
			if($('#customerPhone').val() == ''){
				alert("전화번호를 입력하세요");
				$('#customerPhone').focus();
				return false;
			}
			if($('#customerEmail').val() == ''){
				alert("이메일을 입력하세요");
				$('#customerEmail').focus();
				return false;
			}
			if($('#customerAddress').val() == ''){
				alert("주소를 입력하세요");
				$('#customerAddress').focus();
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

// ----  id duplication check perfect ---- 
	$(function(){
		$('#check_id').click(function(){
			$.ajax({
				type: "GET",
				url: "http://localhost:8089/PJShop/idCheckAjax.do",
				data: "check_id="+$('#customerId').val(),
				dataType: "text",
				success: function(data, request, status, error){
					var result = "";
					if(data == 'id_duplication'){
						result = "중복된 아이디입니다.";
						$('#id_result').text(result).css("color", "red");
						$('#customerId').val("");
						$('#customerId').focus();
						return false;
					}else if(data == 'id_ok'){
						result = "사용가능 아이디입니다.";
						$('#id_result').text(result).css("color", "blue");
						$('#customerPassword').focus();
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
			if($('#customerPassword').val() != $('#pw_confirm').val()){
					resultpw = "패스워드가 일치하지 않습니다.";
					$('#pw_result').text(resultpw).css("color", "red");
			}else{
					resultpw = "패스워드가 일치합니다.";
					$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})

	// ----  사진 밑에 이름 넣기 ---- 	
	$(function(){
		$('#customerName').blur(function(){
			if($('#customerName').val() != ''){
				$('#name_result').text($('#customerName').val()).css("color", "blue");
				$('#customerPhone').focus();
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
		$('#customerId').click(function(){
			$('#id_result').text('')
		})
	})
	function addr(){
		customerAddress = document.getElementById('customerAddr1').value +" 222 "+ document.getElementById('customerAddr2').value
		alert(customerAddress);
	}

</script>

</head>
<body>
<div id="page-wrap">
	<form name="regist_form" action="/PJShop/regist.do" method="post" >
	<table >
		<tr>
		<td colspan="3" bgcolor="#9BC3FF" height=28 width=500 align="center">
		<b><font size=3><font color="white">회원등록 </font>(<font color="red">*</font> 표시항목은 반드시 입력하십시오)</font></b></td>
		</tr>
		<tr>
		<td>
		<fieldset id="left_field">
			<br>
			<legend>   회원정보입력</legend>
			<br>
			<label for="customerId">아이디</label>
			<input type="text" name="customerId" id="customerId" size="8"/>
			<input type="button" value="중복검사" style="width:80px" id="check_id"/>
			<span id="id_result"></span>
			<br>
			<label for="customerPassword">패스워드</label>
			<input type="password" name="customerPassword" id="customerPassword"/>
			<br>
			<label for="pw_confirm">패스워드확인</label>
			<input type="password" name="pw_confirm" id="pw_confirm"/>
			<span id="pw_result"></span>
			<br>
			<label for="customerName">이름</label>
			<input type="text" name="customerName" id="customerName"/>
			<br>
			<label for="customerPhone">휴대폰 번호</label>
			<input type="text" name="customerPhone" id="customerPhone"/>
			<br>
			<label for="customerEmail">이메일</label>
			<input type="email" name="customerEmail" id="email"/>
			<br>
			<label for="customerAddress">주소</label>
			<input type="text" name="customerAddress" id="customerAddress" style="width:250px" /><br>
			
<!-- 			value=document.getElementById('customerAddr1').value +" "+ document.getElementById('customerAddr2').value/> -->
<!-- 			"location.href='/PJShop/customerPwModifyForm.do?customerId='+document.getElementById('customerId').value" -->
			<br>
		</fieldset>
		</td>
		</tr>
		</table>
	<div class="submitBtn">
		<input type="submit" name="sumbit" value="회원가입"/>
		<input type="reset" name="reset" value="다시작성" id="reset"/>
		<input type="button" value="홈으로" id="home" onclick="location.href='/PJShop/loginForm.do'"/><br>
<!--         <a href="http://img.echosting.cafe24.com/guide/suio/description/button.html">SUIO Module</a> -->
    </div>
    <div id="anitest"><img src="/PJShop/img/Wooseok.gif" width="200px"></img></div>
	</form>
</div>
</body>
</html>

