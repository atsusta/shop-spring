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
	.input {	FONT-SIZE: 10pt; FONT-FAMILY: ����,����ü, Arial }
	.submitBtn{width:490px; margin-top:20px; margin:0 auto;}
	
	FONT.c {	FONT-SIZE: 10px; COLOR: #000000; FONT-FAMILY: ����,����ü, Arial}
	.unnamed1 {  font-family: "����"; font-size: 16px; color: #DD4800; text-decoration: blink}
	.unnamed2 {  font-family: "����"; font-size: 18px; color: #DD4800; text-decoration: blink}
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
				alert("id�� �Է��ϼ���");
				$('#customerId').focus();
				return false;	//submit �̺�Ʈ ���۱�� ����
			}
			if($('#customerPassword').val() == ''){
				alert("pw�� �Է��ϼ���");
				$('#customerPassword').focus();
				return false;
			}
			if($('#pw_confirm').val() == ''){
				alert("pw�� ���Է��ϼ���");
				$('#pw_confirm').focus();
				return false;
			}
			if($('#customerName').val() == ''){
				alert("�̸��� �Է��ϼ���");
				$('#customerName').focus();
				return false;
			}
			if($('#customerPhone').val() == ''){
				alert("��ȭ��ȣ�� �Է��ϼ���");
				$('#customerPhone').focus();
				return false;
			}
			if($('#customerEmail').val() == ''){
				alert("�̸����� �Է��ϼ���");
				$('#customerEmail').focus();
				return false;
			}
			if($('#customerAddress').val() == ''){
				alert("�ּҸ� �Է��ϼ���");
				$('#customerAddress').focus();
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
						result = "�ߺ��� ���̵��Դϴ�.";
						$('#id_result').text(result).css("color", "red");
						$('#customerId').val("");
						$('#customerId').focus();
						return false;
					}else if(data == 'id_ok'){
						result = "��밡�� ���̵��Դϴ�.";
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
					resultpw = "�н����尡 ��ġ���� �ʽ��ϴ�.";
					$('#pw_result').text(resultpw).css("color", "red");
			}else{
					resultpw = "�н����尡 ��ġ�մϴ�.";
					$('#pw_result').text(resultpw).css("color", "blue");
			}
		})
	})

	// ----  ���� �ؿ� �̸� �ֱ� ---- 	
	$(function(){
		$('#customerName').blur(function(){
			if($('#customerName').val() != ''){
				$('#name_result').text($('#customerName').val()).css("color", "blue");
				$('#customerPhone').focus();
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
		<b><font size=3><font color="white">ȸ����� </font>(<font color="red">*</font> ǥ���׸��� �ݵ�� �Է��Ͻʽÿ�)</font></b></td>
		</tr>
		<tr>
		<td>
		<fieldset id="left_field">
			<br>
			<legend>   ȸ�������Է�</legend>
			<br>
			<label for="customerId">���̵�</label>
			<input type="text" name="customerId" id="customerId" size="8"/>
			<input type="button" value="�ߺ��˻�" style="width:80px" id="check_id"/>
			<span id="id_result"></span>
			<br>
			<label for="customerPassword">�н�����</label>
			<input type="password" name="customerPassword" id="customerPassword"/>
			<br>
			<label for="pw_confirm">�н�����Ȯ��</label>
			<input type="password" name="pw_confirm" id="pw_confirm"/>
			<span id="pw_result"></span>
			<br>
			<label for="customerName">�̸�</label>
			<input type="text" name="customerName" id="customerName"/>
			<br>
			<label for="customerPhone">�޴��� ��ȣ</label>
			<input type="text" name="customerPhone" id="customerPhone"/>
			<br>
			<label for="customerEmail">�̸���</label>
			<input type="email" name="customerEmail" id="email"/>
			<br>
			<label for="customerAddress">�ּ�</label>
			<input type="text" name="customerAddress" id="customerAddress" style="width:250px" /><br>
			
<!-- 			value=document.getElementById('customerAddr1').value +" "+ document.getElementById('customerAddr2').value/> -->
<!-- 			"location.href='/PJShop/customerPwModifyForm.do?customerId='+document.getElementById('customerId').value" -->
			<br>
		</fieldset>
		</td>
		</tr>
		</table>
	<div class="submitBtn">
		<input type="submit" name="sumbit" value="ȸ������"/>
		<input type="reset" name="reset" value="�ٽ��ۼ�" id="reset"/>
		<input type="button" value="Ȩ����" id="home" onclick="location.href='/PJShop/loginForm.do'"/><br>
<!--         <a href="http://img.echosting.cafe24.com/guide/suio/description/button.html">SUIO Module</a> -->
    </div>
    <div id="anitest"><img src="/PJShop/img/Wooseok.gif" width="200px"></img></div>
	</form>
</div>
</body>
</html>

