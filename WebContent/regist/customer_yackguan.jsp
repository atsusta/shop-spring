<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("euc-kr"); %>
<%	response.setContentType("text/html; charset=euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<LINK href="./common_style/u3.css" type=text/css rel=STYLESHEET>
<LINK href="./css/board.css" type=text/css rel=STYLESHEET>
<title>Insert title here</title>
<script type="text/javascript">
function agree_alert(){
	form = document.yackuan_form;
	if(form.agree1.checked != true || form.agree2.checked != true){
		alert("�̿����� �����ϼž� ������ ������ �� �ֽ��ϴ�.");
	}else{
		form.action = "/PJShop/registForm.do";
		form.submit();
	}
}

function degree_alert(){
	form = document.member_join_form;
	form.action = "./member/member_insert_form.jsp";
	form.submit();
}

</script>
<style type="text/css">
	h1#top{ color: blue; text-align: center;}
	strong#yackguan {margin-left: 320px; font-size:25px; padding-top:10px;}
   .joinAgree fieldset {
   	text-align: left;
	width: 600px;
	height: 280px;
	background: rgb(248,201,179);
	color: #7c682d;
    border: 1px solid #d0c9b3;
	margin: 3px 0 5px 0;
	padding: 5px 0 0 5px;
	overflow-x: hidden;
	overflow-y: auto;
	
    }
    .div_1{
    position: relative;
    
    }
/* 	.seri06 .joinAgree .textbox { */
/* 	text-align: left; */
/* 	width: 565px; */
/* 	height: 280px; */
/* 	overflow-x: hidden; */
/* 	overflow-y: auto; */
/* 	background: #f8f5f4; */
/* 	color: #7c682d; */
/* 	border: 1px solid #d0c9b3; */
/* 	margin: 3px 0 5px 0; */
/* 	padding: 5px 0 0 5px; */
/* 	} */
/* } */


</style>

</head>
<body>

<h1 id="top">
- ȸ������ : 
���� ���θ��� ���Ű��� ȯ���մϴ�. - 
</h1>
<hr width="60%"><br>
<strong id="yackguan">�������</strong>
<div align="center">
<form name="yackuan_form" method="get" onsubmit="return chkAgree(this);" action="" class="joinAgree">
<!-- 					<h3><img src="http://image.seri.org/seri/cc/2013/tit_welcome.gif" alt="SERI.org�� ���� ���� ȯ���մϴ�."></h3> -->
<!-- 					<h4><img src="http://image.seri.org/seri/cc/2013/join_title02.gif" alt="������� - SERI.org�� ȸ������ ����������ȣ�� ���� �¶��� �󿡼� ������ ���������� ��ȣ���� �� �ֵ��� �ּ��� ���ϰ� �ֽ��ϴ�. ȸ������ ������ ���� ���� �������� ������, ����������ȣ��å�� ���� ��ȣ�ް� �ֽ��ϴ�."></h4> -->
					<div class="div_1">
						<p class="agree_tlt"><strong>�̿���</strong></p>
						<div class="textbox" tabindex="0">
<!-- 						<SERI.org -> P-Shop.org> -->
						<fieldset>
							<h5>�� 1 �� �� Ģ</h5>
							<h6>�� 1 �� ����</h6>
							<p>�� �̿���(���� "���")�� ���� �̿��ڰ� ���θ�(���� "ȸ��"�� �մϴ�)���� �����ϴ� P-Shop.org ���񽺿� ȸ������ �����ϰ� �̸� �̿��Կ� �־� ȸ��� ȸ���� �Ǹ����ǹ� �� å�ӻ����� �������� �������� �մϴ�.</p>
							<h6>�� 2 �� ����� ����</h6>
							<p>�� ������� ����ϴ� ����� ���Ǵ� ������ �����ϴ�.</p>
							<ul>
								<li>�� 'P-Shop.org ����(���� "����"�� �մϴ�)'�� ���� �����Ǵ� ���(PC, �޴����ܸ��� ���� ���� ������ ��ġ�� ����)�� ������� 'ȸ��'�� �̿��� �� �ִ� P-Shop.org ���� ���񽺸� ���մϴ�.</li>
								<li>�� 'ȸ��'�̶� �� ����� �����ϰ� ȸ������� �Ϸ��Ͽ� ȸ�� ���̵� �ο����� ���� �̿��ڸ� ���մϴ�.</li>
								<li>�� 'ȸ�� ���̵�(���� "ID"�� �մϴ�)'�� ȸ�� �ĺ��� ���� �̿��� ���Ͽ� ȸ���� �����ϰ� ȸ�簡 ������ ���� �Ǵ� ������ ������ ���մϴ�.</li>
								<li>�� '��й�ȣ'�� ȸ���� �ο����� ID�� ��ġ�� ȸ������ Ȯ���ϰ�, ȸ���� ���������� ��ȣ�ϱ� ���Ͽ� ȸ���� ���� ���ڿ� ������ ������ ���մϴ�.</li>
								<li>�� '����Ʈ'�� ���� ������ ȿ���� �̿��� ���� ȸ�簡 ���Ƿ� å�� �Ǵ� ����, ������ �� �ִ� ����� ��ġ�� ���� '����'���� ���� �����͸� ���ϸ�, �� ��Ī�� ȸ���� ���� ���� �� ���뿡 ���� ����� �� �ֽ��ϴ�.</li>
								<li>�� '�������(���� "Ż��"�� �մϴ�)'�� ȸ�� �Ǵ� ȸ���� �̿����� �����ϴ� ���� ���մϴ�.</li>
							</ul>
							<h6>�� 3 �� �̿����� ����, ȿ�� �� ����</h6>
							<ul>
								<li>�� ȸ��� �� ����� ������ ȸ���� ���� �� �� �ֵ��� ���� ����Ʈ �ʱ� ȭ�鿡 �Խ��մϴ�. </li>
								<li>�� ȸ��� ����� ������ ���� ���� �� ���ù��� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�. </li>
								<li>�� ȸ��� ����� �����ϴ� ��� ������ ����� ����� �������� ���Ͽ� �����Ϸκ��� �ּ� 7�� ��(��, �̿����� �Ǹ����ǹ��� �ߴ��� ������ ��ġ�� ���׿� ���Ͽ��� 30����)���� ���������� �����Ͽ� ���� ����Ʈ �ʱ�ȭ�鿡 �����մϴ�. ����, ���� ȸ�����Դ� ���� �ܿ� ȸ���� �Է��� ���� �����ּҸ� ���� �����մϴ�. </li>
								<li>�� ȸ�簡 ���׿� ���� ȸ������ �����ϸ鼭 �����������Ϸκ��� ���� ��� ������ 7�� �ı��� �ź��ǻ縦 ǥ������ �ƴ��ϸ� ������ ������ ���ٴ� ���� ��Ȯ�ϰ� �����Ͽ������� ȸ���� �ź��ǻ縦 ǥ������ ���� ��� ����� ����� ������ ������ ���ϴ�. </li>
								<li>�� ȸ���� ���� ����� �������� ���� ��� ȸ�翡 Ż���û�� �� �� �ֽ��ϴ�.</li>
							</ul>
							<h6>�� 4 ��  ��� �� ��Ģ</h6>
							<ul>
								<li>�� �� ����� ȸ�簡 �����ϴ� �������񽺿� ���� �̿�ȳ�(���� "���񽺺� �ȳ�"�� �մϴ�)�� �Բ� ���� �˴ϴ�. �� ����� ���񽺺� �ȳ��� ������ ���/���˵� ��쿡�� ���񽺺� �ȳ����� ���� �ٿ� ���� ���� �켱������ ���մϴ�.</li>
							    <li>�� �� ����� ���õ��� �ƴ��� ���׿� ���ؼ��� ������� �� ���񽺺� �ȳ��� �����մϴ�.</li>
							</ul>
							<h5>�� 2 �� �̿��� ü��</h5>
							<h6>�� 5 �� ȸ������ �� �̿����� ����</h6>
							<ul>
								<li>�� �̿����� ȸ���� �ǰ��� �ϴ� ��(���� "���Խ�û��"�� �մϴ�)�� ����� ���� �� ȸ���� ����������޹�ħ�� ���Ͽ� ���Ǹ� �� ���� ȸ�����Խ�û�� �ϰ� ȸ�簡 �̷��� ��û�� ���Ͽ� �³������ν� �����˴ϴ�. </li>
								<li>�� ���� �̿��ڰ� �� ��� �� ȸ���� ����������޹�ħ�� �а� "����"��ư�� �����ų� "Ȯ��" � üũ�ϴ� ����� ���� ��� �� ����� ������ ������ �����մϴ�. </li>
								<li>��  Ÿ���� ����, �̸���, �ҼȰ���(Ʈ����, ���̽���)�� �̿��Ͽ� ȸ������ �� ����� ���񽺸� �̿��� �� ���� �ش� ID�� �����Ǹ�, ������ɿ� ���� ó���� ���� �� �ֽ��ϴ�. </li>
							</ul>
							<h6>�� 6 �� �̿� ��û�� �³��� ����</h6>
							<ul>
								<li>�� ȸ��� ���Խ�û���� ��û�� ���Ͽ� Ư���� ������ ���� �� ���� �̿��� �³��մϴ�. �ٸ�, ȸ��� ���� �� ȣ�� �ش��ϴ� ��û�� ���Ͽ��� �³��� ���� �ʰų� �³� �Ŀ��� ���Ƿ� Ż���ų �� �ֽ��ϴ�.
									<ul>
										<li>1. Ÿ���� ���Ǹ� �̿��Ͽ� ��û�� ��� </li>
										<li>2. ������ ������ �����ϰų� ȸ�簡 �䱸�ϴ� ������ �������� ���� ���</li>
										<li>3. ��ȸ�� �ȳ�� ����, ��ǳ����� ������ �������� ��û�� ���</li>
										<li>4. ������ �뵵�� �� ���񽺸� �̿��ϰ��� �ϴ� ���</li>
										<li>5. ������ �߱��� �������� �� ���񽺸� �̿��ϰ��� �ϴ� ���</li>
										<li>6. ��� �Ǵ� ȸ���� ���� ������ �����Ͽ� ��û�ϴ� ���</li>
										<li>7. �� ���񽺿� ������迡 �ִ� �̿��ڰ� ��û�ϴ� ���</li>
										<li>8. 14�� �̸��� �Ƶ��� �����븮��(�θ� ��)�� ���Ǹ� ���� �ƴ��� ���</li>
									</ul>
								</li>
								<li>�� ȸ��� ���� �� ȣ�� ���뿡 �ش��ϴ� ��� �̿��û�� ���� �³��� �����ϰų� ������ �� �ֽ��ϴ�.
									<ul>
										<li>1. ȸ���� ���� ���� ���� ������ ���� ���</li>
										<li>2. ���� ������ ����� ������ �ִ� ���</li>
										<li>3. �̼������� ���</li>
										<li>4. ��Ÿ �� �� ȣ�� ���ϴ� ������ �ִٰ� �����Ǵ� ���</li>
									</ul>
								</li>
								<li>�� ȸ��� �� ���񽺸� �̿��ϴ� ȸ���� ��޺��� �����Ͽ� �̿�ð�, �̿�Ƚ��, ���� �޴� ���� �����Ͽ� �� �̿뿡 ������ �� �� �ֽ��ϴ�.</li>
							</ul>
							<h6>�� 7 �� ���������� ��ȣ �� ���</h6>
							<p>ȸ��� ���� ������ ���ϴ� �ٿ� ���� ȸ���� ���������� ��ȣ�ϱ� ���� ����մϴ�. ���������� ��ȣ �� ��뿡 ���ؼ��� ���� ���� �� ȸ���� ����������޹�ħ�� ����˴ϴ�. �ٸ�, ȸ�簡 ������ ����Ʈ �̿��� ��ũ�� ����Ʈ������ ȸ���� ����������޹�ħ�� ������� �ʽ��ϴ�. </p>
							<h6>�� 8 �� ȸ�� ID �ο� �� ����</h6>
							<ul>
								<li>�� ȸ���� ȸ��κ��� �ο����� ID�� ������ �� �����ϴ�. �ε����� ������ �����ϰ��� �ϴ� ��쿡�� ȸ�� Ż�� �� �簡���Ͽ��� �մϴ�. </li>
							    <li>�� ȸ��� ȸ���� ID�� ���� �� ȣ�� �ش��ϴ� ��� ȸ������ ID�� ������ ��û�� �� ������, �� ��� ȸ���� ȸ�� Ż�� �� �簡�� ������ ��ƾ� �մϴ�.
									<ul>
										<li>1. ID�� �̿����� ��ȭ��ȣ �Ǵ� �ֹε�Ϲ�ȣ ������ ��ϵǾ� ���Ȱ ħ�ذ� ����Ǵ� ���</li>
										<li>2. Ÿ�ο��� �������� �ְų� ��ǳ��ӿ� ��߳��� ���</li>
									</ul>
								</li>
								<li>�� ȸ�簡 �����ϴ� ������ ID�� ȸ�� ������ ���� �Ͽ� ȸ�簡 ��ϴ� �ٸ� ����Ʈ�� ID�� ����� �� �ֽ��ϴ�.</li>
								<li>�� ��Ÿ ȸ�� �������� ���� �� ���� � ���� ������ ȸ���� �������� ��޹�ħ �� ���񽺺� �ȳ��� ���ϴ� �ٿ� �����ϴ�.</li>
							</ul>
							<h6>�� 9 �� ȸ�������� ����</h6>
							<ul>
								<li>�� ȸ���� ������������ȭ���� ���Ͽ� �������� ������ ���������� �����ϰ� ������ �� �ֽ��ϴ�. �ٸ�, ���� ������ ���� �ʿ��� ID �� ������ �� �����ϴ�.</li>
								<li>�� ȸ���� ȸ�����Խ�û �� ������ ������ ����Ǿ��� ��� �¶������� �����ϰų� ���ڿ��� ��Ÿ ������� ȸ�翡 ���Ͽ� �� ��������� �˷��� �մϴ�. </li>
								<li>�� ��2���� ��������� ȸ�翡 �˸��� �ʾ� �߻��� �����Ϳ� ���Ͽ� ȸ��� å������ �ʽ��ϴ�. </li>
							</ul>
							<h6>�� 10 �� ȸ���� ID �� ��й�ȣ �����ǹ�</h6>
							<ul>
								<li>�� ȸ���� ID�� ��й�ȣ�� ���� ����å���� ȸ������ ������ �̸� ��3�ڰ� �̿��ϵ��� �Ͽ����� �ȵ˴ϴ�. </li>
								<li>�� ȸ���� ID �Ǵ� ��й�ȣ�� ����ǰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� �̸� ��� ȸ�翡 �����ϰ� ȸ���� �ȳ��� ����� �մϴ�. </li>
								<li>�� ȸ���� ��1�� �� ��2���� �����Ͽ� �߻��� ���س� �����Ϳ� ���ؼ��� ȸ���� å���� ���� �ϸ� ȸ��� å���� �δ����� �ʽ��ϴ�. </li>
							</ul>
							<h5>�� 3 �� ��� ������� �ǹ�</h5>
							<h6>�� 11 �� ȸ���� �ǹ�</h6>
							<ul>
								<li>�� ȸ��� ���ù����̳� �� ����� �����ϴ� ���� �Ǵ� ��ǳ��ӿ� ���ϴ� ������ ���� ������, �������̰� �������� ���񽺸� �����ϱ� ���Ͽ� �ּ��� ���Ͽ� ����մϴ�. </li>
								<li>�� ȸ��� ȸ���� �����ϰ� ���񽺸� �̿��� �� �ֵ��� ȸ���� ����������ȣ�� ���� ���Ƚý����� �����ϸ� ����������޹�ħ�� �����ϰ� �ؼ��մϴ�.</li>
								<li>�� ȸ��� ȸ���� ���� ���Ǹ� ���� ���� ���� ������ ������ ���ڿ����� �߼����� �ʽ��ϴ�. </li>
								<li>�� ȸ���� Ż���û�� �ִ� ��� ȸ��� ���� Ȯ�� �� ��� Ż�� ó���մϴ�. </li>
							</ul>
							<h6>�� 12 �� ȸ���� �ǹ�</h6>
							<ul>
								<li>�� ȸ���� ������ ������ �Ͽ����� �ƴ� �˴ϴ�.
									<ul>
										<li>1. ȸ�����Խ�û �Ǵ� ���� �� ���������� ����ϴ� ����</li>
										<li>2. �ٸ� ȸ���� ID, ��й�ȣ, �̸���, �ҼȰ���(Ʈ����, ���̽���), ��Ÿ �������� ���� �����ϴ� ����</li>
										<li>3. ID�� Ÿ�ΰ� �ŷ��ϴ� ����</li>
										<li>4. ȸ���� ���, ���� �Ǵ� �����ڸ� ��Ī�ϴ� ����</li>
										<li>5. ȸ��κ��� Ư���� �Ǹ��� �ο����� �ʰ� ȸ���� Ŭ���̾�Ʈ ���α׷��� �����ϰų�, ȸ���� ������ ��ŷ�ϰų�, ������Ʈ �Ǵ� �Խõ� ������ �Ϻκ� �Ǵ� ��ü�� ���Ƿ� �����ϴ� ����</li>
										<li>6. ���񽺿� ���ظ� ���ϰų� ���Ƿ� �����ϴ� ����</li>
										<li>7. �� ���񽺸� ���� ���� ������ ȸ���� ���� �³� ���� ���� �̿� ���� �������� ���ǰ���, �Ǹ�, ����, �۽�, �����ϰų�, �̸� ���� �� ��� � ����ϰų�, �� 3�ڿ��� �����ϴ� ����</li>
										<li>8. ȸ�� �Ǵ� ��3���� ���۱� �� ���������� ħ���ϰų�, ħ���ϴ� ������ ����, �Խ�, ���ڿ��� �Ǵ� ��Ÿ�� ������� Ÿ�ο��� �����ϴ� ����</li>
										<li>9. �������� �� ��ǳ��ӿ� ���ݵǴ� ����, ������ ������ ����, ����, ����, ����, �������� ����, �Խ�, ���ڿ��� �Ǵ� ��Ÿ�� ������� Ÿ�ο��� �����ϴ� ����</li>
										<li>10. ������̰ų� ���νŻ� ���� �����̾ Ÿ���� ������ �����̹��ø� ħ���� �� �ִ� ������ ����, �Խ�, ���ڿ��� �Ǵ� ��Ÿ�� ������� Ÿ�ο��� �����ϴ� ����</li>
										<li>11. �ٸ� ȸ���� ��� �Ǵ� �����ϰų�, Ư�� �̿��ڿ��� ���������� ���� �Ǵ� ������ �ִ� ����</li>
										<li>12. ȸ���� ������ ���� �ʰ� �ٸ� ȸ���� ���������� ���� �Ǵ� �����ϴ� ����</li>
										<li>13. ���˿� ��εȴٰ� ���������� �ǴܵǴ� ����</li>
										<li>14. �� ����� �����Ͽ� ��Ÿ ȸ�簡 ���� ���� ���� �Ǵ� �̿� ������ �����ϴ� ����</li>
										<li>15. ȸ���� ������ ���صǴ� ���� �� ȸ���� ������ �ջ��Ű�� ����</li>
										<li>16. ȸ���� �������� ���� ���� ������ �̿����, ��Ÿ �̿������ ������ Ÿ�ο��� �絵, ����, �㺸�� �����ϴ� ����</li>
										<li>17. ��Ÿ ���ɿ� ����Ǵ� ���� </li>
									</ul>
								</li>
								<li>�� ȸ���� �������, �� ����� ����, ��Ÿ ȸ�簡 ���� ���� ����, ���� �̿�ȳ�, �������� �� ȸ�簡 �����ϴ� ���� ���� �ؼ��Ͽ��� �մϴ�.</li>
							    <li>�� ȸ���� ȸ���� ���� �³� ���� ���񽺸� �̿��Ͽ� ����Ȱ���� �� �� �����ϴ�. ȸ�� �� �Ǵ� ȸ���� ��3�� ���� ���񽺸� �Ű��� �Ͽ� �̷���� �ŷ��� ȸ��ʹ� �����ϸ� ȸ��� �̿� ���� ��� å�ӵ� ���� �ʽ��ϴ�. </li>
							    <li>�� ȸ���� ��3���� �����Ͽ� ȸ�翡 ���ظ� �߱��� ��� ȸ���� ȸ�翡 �� ���ظ� ����ؾ� �մϴ�. </li>
							</ul>
							<h5>�� 4 �� ������ �̿�</h5>
							<h6>�� 13 �� ������ ���� �� ����</h6>
							<ul>
								<li>�� ȸ��� ȸ�簡 �����ϴ� �������� �����ϴ� �̺�Ʈ ���� ��� ���񽺸� ȸ������ �����մϴ�. �ٸ�, ��6�� ��3�׿� ���� ȸ���� ��޺��� �����ϴ� ���񽺿� ������ �� �� �ֽ��ϴ�.</li>
								<li>�� ȸ��� ���񽺸� ����� �����մϴ�. ������ �Ϻ� �Ǵ� ���θ� ����� ��ȯ�� ��� ���� �����ϸ� �� �̿뿡 ���� ������ ȸ�簡 ������ ���� ���� ��� �� ��å �Ǵ� ���Ģ�� �����ϴ�. </li>
								<li>�� ȸ��� ���� ���� �� �� ����� ������ ���� �� �������ڸ� ��14���� ���� ������� ȸ������ �����մϴ�. </li>
							</ul>
							<h6>�� 14 �� ������ ���� �� ����</h6>
							<ul>
								<li>�� ȸ��� ȸ���� ���� �̿� �� �ʿ��ϴٰ� �����Ǵ� �پ��� ������ �������� Ȥ�� ���ڿ��� ���� ������� ȸ������ ������ �� �ֽ��ϴ�. </li>
							    <li>�� ȸ��� ȸ���� ���������� ���ڿ��� ������ �ź��� ��쿡�� ���ù����̳� �� ������� ���� ���� �ǹ��� ���ϱ� ���� �ʿ��� ��쿡�� ���ڿ����� �߼��� �� �ֽ��ϴ�. </li>
							    <li>�� ȸ��� ��Ư�� �ټ� ȸ���� ���� ������ �ϴ� ��� 7�� �̻� �������׿� �Խ������ν� ���� ������ ������ �� �ֽ��ϴ�. </li>
							</ul>
							<h6>�� 15 �� (�Խù��� ����)</h6>
							<ul>
								<li>�� ȸ��� ȸ���� ����� �Խù� �� �ڷᰡ ����, �Ѽ�, �������� �ʵ��� ����մϴ�.</li>
								<li>�� ȸ��� ���� �� ȣ�� �ش��ϴ� ������ ���Ե� �Խù��̳� �ڷῡ ���� ȸ���� ����� �ź��ϰų�, �������� ���� ����, �̵�, ������ �� �ֽ��ϴ�.
									<ul>
										<li>1. �ٸ� ȸ�� �Ǵ� ��3�ڿ��� ���� ����� �ְų� ������ �ջ��Ű�� ����</li>
									   <li>2. �������� �� ��ǳ��ӿ� ���ݵǴ� ���� �Ǵ� �׷��� ������ ��� �ִ� ����Ʈ�� ������ �� �ֵ��� ��ũ��Ų ����</li>
									   <li>3. �������� �Խ��ϰų� �������� ��� �ִ� ����Ʈ�� ������ �� �ֵ��� ��ũ��Ų ���</li>
									   <li>4. �ҹ����� �Ǵ� ��ŷ�� �����ϴ� ����</li>
									   <li>5. ������ �������� �ϴ� ������ ���Լ� �Խù��� ���</li>
									   <li>6. ���˿� ��εȴٰ� ���������� �����Ǵ� ����</li>
									   <li>7. ȸ��, �ٸ� ȸ��, ��3���� ���۱� ��Ÿ �Ǹ��� ħ���ϴ� ����</li>
									   <li>8. ����ϰ��� �ϴ� �Խ��� ���ݿ� �������� �ʴ� ���</li>
									   <li>9. ������Ʈ��� ũ�������� �ø� ��� </li>
									  <li>10. ��Ÿ ȸ���� ���� �����̳� ������ɿ� ����Ǵ� ����</li>
								  </ul>
							    </li>
							</ul>
							<h6>��16�� �Խù��� ���� �Ǹ��� �ͼ�</h6>
							<ul>
								<li>�� ȸ�簡 �ۼ��� ���۹��� ���� ���۱� �� ��Ÿ ���������� ȸ�翡 �ͼӵ˴ϴ�.</li>
							  <li>�� ȸ���� ���� ȭ�� ���� �Խ��� �Խù��� ���۱��� �Խ��� ȸ������ �ͼӵǸ�, ȸ��� �̸� ������������ �̿����� �ʽ��ϴ�. </li>
							  <li>�� ȸ���� ���۱��� ���� �Խù��� ���ؼ� ȸ��� �񿵸��������� �̸� �̿��� �� ������(ȸ�簡 ���޸� �ΰ� �ִ� �ٸ� ȸ�簡 ��ϴ� �ܺ� ����Ʈ�� �������� ��Ÿ �����͸� �����ϴ� ���� �����մϴ�), �������� ������ �����ϰ� ȸ�簡 ��ϴ� ����Ʈ �������� �����Ӱ� �̿��� �� �ֽ��ϴ�. ȸ���� �� ����� ������ ��� ���� ���� �̿뿡 �ʿ��� �������� ���� ȸ���� ȸ�翡 �ο��� ������ �����ϸ�, �̴� ȸ���� Ż���� �Ŀ��� ��ȿ�մϴ�. </li>
							  <li>�� ȸ��� ȸ���� ���۱��� ���� �Խù��� ���ؼ� ��3�׿��� ���� ��� �̿��� ������� ���� �������� �̿��ϰ��� �ϴ� ��� ��ȭ, �ѽ�, ���ڿ��� ���� ����� ���� ������ ȸ���� ���Ǹ� ���� �մϴ�. </li>
							  <li>�� ȸ�簡 ��4�׿� ���� ȸ���� �Խù��� �̿��� ��� ȸ��� ȸ������ ������ �����մϴ�.</li>
							</ul>
							<h6>��17�� �������� </h6>
							<p>ȸ��� ������ ��� �����Ͽ� ���� ȭ��, Ȩ������ � ������ ������ �� �ֽ��ϴ�. Ÿ���� ������ ���� ������ ���Ǽ�, ��Ȯ��, �ŷڼ��� ���� ȸ��� å���� �δ����� �ʽ��ϴ�. </p>
							<h6>��18�� ���� �̿�ð�</h6>
							<ul>
								<li>�� ȸ��� ���� �Ǵ� ����� ��ְ� �ִ� ��츦 �����ϰ� �� ���񽺸� 1�� 24�ð�, ���߹��޷� �����մϴ�. </li>
								<li>�� ȸ��� ���񽺸� ���� ������ �����Ͽ� �� �������� �̿밡�ɽð��� ������ ������ �� �ֽ��ϴ�. �� ��� �� ������ �����մϴ�.</li>
							</ul>
							<h6>��19�� ���� �̿� ���� �Ǵ� ���� �� ȸ�� Ż��</h6>
							<ul>
								<li>�� ȸ��� ���� �� ȣ�� �ش��ϴ� ������ �߻��� ��� ȸ���� ���� �̿��� ���� �Ǵ� ������Ű�ų�, ȸ���� Ż���ų �� �ֽ��ϴ�.
									<ul>
										<li>1. ȸ���� ȸ�� ���� ��� ���� �Ǵ� ���Ƿ� �����ϴ� ���</li>
									   <li>2. ȸ���� ��12������ ������ ȸ���� �ǹ��� ������ ���</li>
									   <li>3. ������ż��� �Ǵ� �ý����� ��������, ���� �� ��ü, ���� ����, ���� �� ����� ���� �ε��� �� ���</li>
									   <li>4. ������Ż������ ������ �Ⱓ��Ż���ڰ� ������ż��񽺸� �ߴ��� ���</li>
									   <li>5. ����������, ���� ���� ���, ���� �̿� ���� ������ ���� �̿뿡 ������ �ִ� ���</li>
									   <li>6. ��ǳ����� �����ϴ� ����� ID �Ǵ� ������ ����� ���</li>
									   <li>7. ���� ����û �Ǵ� ��������� ���� �䱸 ���� �ִ� ���</li>
									   <li>8. 3���� �̻� ���񽺸� �̿����� �ʴ� ���</li>
									   <li>9. �Խ��ǿ� �ε��� ���Ͼ��� �ڷḸ �÷� ���� �� �Խ����� ���� �ڷ�Ƿ� �����ϴ� ��� </li>
									   <li>10. ��15�� ��2�׿��� �����ϴ� �Խù��̳� �ڷḦ �Խ�, ����� ���</li>
									</ul>
								</li>
								<li>�� ȸ��� ������ ������ ���Ͽ� ������ �̿��� �����ϰų� ������ ��� �� ���� �� ���ѱⰣ ���� ������ �����մϴ�. �ٸ�, ȸ�簡 ������ �� ���� ������ ���� ���� �ߴ� �� ���������� �Ұ����� ��쿡�� ���Ŀ� �� ������ �����մϴ�.  </li>
							</ul>
							<h6>��20�� ����Ʈ </h6>
							<ul>
								<li>�� ȸ��� ������ ȿ���� �̿� �� ��� ���� ���� ���� �� ����Ʈ�� �Ϻ� �Ǵ� ���θ� ������ �� ������, ����Ʈ�� ȸ�簡 ���� �Ⱓ�� ���� �ֱ������� �Ҹ��� �� �ֽ��ϴ�. </li>
								<li>�� ȸ���� ȸ���� ���� ���� ����Ʈ�� ��3�ڿ��� �絵, ������ �� �����ϴ�</li>
							</ul>
							<h6>�� 21 �� ��� ����</h6>
							<p>ȸ���� �̿����� �����ϰ��� �ϴ� ��쿡�� ȸ�� ������ ����Ʈ ���� ȸ��Ż�� �޴��� �̿��� Ż�� ��û�� �Ͽ��� �մϴ�.</p>
							<h5>�� 5 �� ��Ÿ</h5>
							<h6>�� 22 �� å������</h6>
							<ul>
								<li>�� ȸ�簡 ��19�� ��1�׿��� ������ ������ ���� ���� ������ ���� �Ǵ� ������Ű�ų� ȸ���� Ż���Ų ���, ȸ��� �̷� ���� �߻��� ȸ���� ���ظ� ����� å���� �����ϴ�.</li>
								<li>�� ȸ��� ȸ���� ���ڿ��� �� ���������� �ν��ϰ� �����ϰų� �Ǵ� ��9�� ��2�׿� ���� �������� �����ǹ��� ������ �ƴ��Ͽ� �߻��� ���ؿ� ���� ����� å���� �����ϴ�.</li>
								<li>�� ȸ���� �� ���� ����Ʈ�� ������ ����, �ڷ�, ��� ���� ���Ǽ�, ��Ȯ��, �ŷڼ��� ȸ�簡 �������� �ʽ��ϴ�. ȸ���� �Խ��� �ڷ��� Ȱ�� ���δ� ȸ�� ������ å�Ӱ� �Ǵܿ� �ð��� ������, �׷� ���� �߱�Ǵ� ����� ���� ȸ��� ��ü�� å���� ���� �ʽ��ϴ�. </li>
								<li>�� ȸ��� ȸ���� �� ȸ���� ��3�ڰ��� ���񽺸� �Ű��� �߻��� ���￡ ���� ������ �ǹ��� �����ϴ�. ȸ��� ���� �̿�� �����Ͽ� ȸ���� ���� �Ǵ� ���Ƿ� ���Ͽ� ȸ�� �Ǵ� ��3�ڿ��� �߻��� ���ؿ� ���Ͽ� å���� �δ����� �ʽ��ϴ�. �ٸ�, ���ù��ɿ��� �޸� �����ϰ� �ִ� ������ ������ �׿� �����ϴ�. </li>
							</ul>
							<h6>�� 23 �� ������ �ذ� </h6>
							<ul>
								<li>�� ȸ��� ȸ���� ���񽺿� �����Ͽ� �߻��� ������ �����ϰ� �ذ��ϱ� ���Ͽ� �ʿ��� ����� �մϴ�.</li>
								<li>�� ȸ��� ȸ�����κ��� ����Ǵ� �Ҹ����� �� �ǰ��� �����ϸ�, �̸� �������� ȸ������ ���� ���� ���񽺰� �����ǵ��� ����մϴ�.</li>
							</ul>
							<h6>�� 24 �� ���Ǳ� �� �ذŹ�</h6>
							<p>ȸ��� ȸ�� ���� ���� �̿����� �߻��� ���￡ ���Ͽ��� ���ѹα����� �����ϸ�, �� �������� ���Ͽ� ���� ������ �λ�Ҽ۹��� ���մϴ�.</p>
							<p>&lt;��Ģ(2013.2.7)&gt;</p>
							<p>�� ����� 2013�� 2�� 15�Ϻ��� ����˴ϴ�.<br>
							2012�� 3�� 6�Ϻ��� ����Ǵ� ������ ����� �� ������� ��ü�մϴ�.</p>
						</fieldset>
						</div>
					</div>
						<p><input type="checkbox" name="agree1" id="agree1" title="�̿����� Ȯ���Ͽ����� �̿� �����մϴ� üũ�ڽ�"><label for="agree1">�̿����� Ȯ���Ͽ����� �̿� �����մϴ�.</label></p>
					<div>
						<p class="agree_tlt 01_name_sg"><strong>�������� ����, �̿뿡 ���� ����</strong><span class="sm_tit">(���� ���� ������ <a href="/cc/ccPrivateProtection.html" target="_blank" title="����������޹�ħ���� - ��â"><strong>����������޹�ħ</strong></a>�� �����ϼ���)</span></p>
						<div class="textbox" tabindex="0">
						<fieldset>
							<p>"���θ�"(���� 'SERI')�� "������Ÿ� �̿����� �� ������ȣ � ���� ����", "�������� ��ȣ��", "��ź�к�ȣ��" ��Ÿ �������� ��ȣ�� ���� ���ù����� �ؼ��ϰ� �ֽ��ϴ�. SERI�� "�� ����������޹�ħ"(���� '�� ��ħ')�� ���Ͽ� SERI�� ���ϰ� �ִ� �������� �������� ó�����ذ� �� ��ȣ��ġ ���� �˷� �帳�ϴ�. �� ��ħ�� �����ϴ� ��� SERI Ȩ������(P-Shop.org) �������� �Ǵ� ���ڸ����� �̿��� ���������� ���Ͽ� �ż��� �˷� �帮�ڽ��ϴ�.</p>
							<ul>
								<li>
									<h5>1. ���������� �������̿����</h5>
									<h6>��. ȸ������ </h6>
									<ul>
										<li>- P-Shop.org ����Ʈ���� �����ϴ� ȸ���� ���� �̿��� ���� ����Ȯ��</li>
										<li>- ���θ� �̿��� ��19���� ���� �̿��� ����, �����ǰų� �̿����� ������ ȸ���� ���� �̿� ������ ���ΰ� ��� ����</li>
										<li>- P-Shop.org ���� �ǻ� Ȯ��, ����Ȯ��, �� 14�� �̸� �Ƶ� �������� ���� �� ���� �븮�� ���� Ȯ��</li>
										<li>- �Ҹ�ó�� �� �ο�ó��, �������� ���� </li>
									</ul>
									<h6>��. ���� ����</h6>
									<ul>
										<li>- �α��� �� ȸ������ ���� ������, ���� �̿��ڰ� �� �̺�Ʈ �����ڰ� �ο�</li>
										<li>- Ȱ�� ����Ʈ ����</li>
									</ul>
									<h6>��. �ű� ���� ���� �� �����ä����� ��� Ȱ��</h6>
									<ul>
										<li>- �ű� ���� ���� �� ������ Ưȭ, ���� ���� ����</li>
										<li>- ������� Ư���� ���� ���� ���� </li>
										<li>- ������ ��ȿ�� Ȯ��</li>
										<li>- �̺�Ʈ �� ������ ���� ���� �� ������ȸ ����</li>
										<li>- �̺�Ʈ ��÷ �� ��ǰ ��� </li>
										<li>- ���Ӻ� �ľ�</li>
										<li>- ȸ���� ���� �̿뿡 ���� ����ۼ�</li>
										<li>- ��������, �м��������� Ȱ��</li>
									</ul>
								</li>
								<li>
									<h5>2. �����ϴ� ���������� �׸� �� �������</h5>
									<h6>��. �������κ��� �����޾� �����ϴ� ��������</h6>
									<p>�� �ʼ� ����</p>
									<ul>
										<li>- �̸�, �α���ID, ��й�ȣ, �̸����ּ�, ����ó(�޴���ȭ)</li>
										<li>- Ʈ���� ID(�Ǵ� �̸��� ����), ������, ������ �̹���, ȸ���� �ȷο�, Ʈ��, RT ����</li>
										<li> ��Ʈ���� ���� ȸ���� ���� </li>
										<li>- ���̽��� �̸���, �з�, ���, ������, ������ �̹��� �� �⺻ ������ ����, ģ��, ��� ����</li>
										<li>�����̽��� ���� ȸ���� ����</li>
									</ul>
									<p>�� ���� ����</p>
									<ul>
										<li>- ������ �������� </li>
										<li>- �ΰ����� ���� ������ ���� �߰� ��������(�� ��� SERI�� ȸ������ �������� �߰������� ���� ���Ǹ� ���� �� �Դϴ�)</li>
									</ul>
									<h6>��. ȸ���� ���� �̿�������� �����Ǵ� ��������</h6>
									<p>- ���� �̿���, ���ӷα�, ��Ű, �湮�Ͻ�, �ҷ� �̿� ���(�ҷ�ȸ������ �����Ǵ� ������ �Ǵ� �̿����� �ǹ��մϴ�), ��Ÿ �̿� ������ ����<br>
										�� �ҷ��̿����� ������ ȸ���� ���� �̿�������� �����Ǵ� ���������� ���� ȸ���� ��8������ ���ϴ� �ٿ� ���� �� ������ �ź��� �� �ֽ��ϴ�.</p>
									<h6>��. �������</h6>
									<ul>
										<li>- ���ͳ� �Ǵ� ��/������ �̿��� ȸ���� P-Shop.org ȸ������, ȸ������ ����, ��ǰ ��� ����, ��� ��û �������� ȸ���� �����ϴ� ���������� ����</li>
										<li>- ȸ���� ���� �̿�������� �����Ǵ� ���������� ����</li>
										<li>- ����ȸ�簡 �������� ��ü�κ��� SERI�� ���� �������� ������ ���� ���Ǹ� ��� �����ϴ� ����� �������� ���� ��</li>
									</ul>
								</li>
								<li>
									<h5>3. ���������� ���� �� �̿�Ⱓ</h5>
									<p>SERI�� ȸ���� Ż�� ��û�� �ְų� �������� �ı� ��û�� ���� ������ �ش� ���������� �����Ͽ� �̿��մϴ�. �ٸ�, ȸ���� ��û�� �ִ� ��쿡�� ���� ������ ���� ���� �������� ȸ���� ���������� �����մϴ�.</p>
									<h6>(1) ȸ�� ���� ��ħ�� ���� ������ �����ϴ� ���</h6>
									<ul>
										<li>- �����̿���
											<ul>
												<li>�� �������� : ���� �̿� ����</li>
												<li>�� �����Ⱓ : 1��</li>
											</ul>
										</li>
									</ul>
									<h6>(2) ���� ���ɿ� ���� �������� ����</h6>
                                    <ul>
										<li>- ������Ʈ �湮��� 
											<ul>
												<li>�� �������� : ��ź�к�ȣ��</li>
												<li>�� �����Ⱓ : 3����</li>
											</ul>
										</li>
									</ul>
                                    <h6>(3) ��Ÿ ����</h6>
                                    <ul>
										<li>- �����Ⱓ�� ȸ������ �̸� �����ϰ� �� �����Ⱓ�� ������� �ƴ��� ���� ���������� ȸ������ ������ ���Ǹ� ���� ��쿡�� ����� �����Ⱓ ���� ����</li>
                                        <li>- �ٸ� ������ ���� ���������� �����ؾ� �ϴ� ���</li>
									</ul>
								</li>
								<li>
									<h5>4. �������� �������̿� ���� �� �źο� ���� ����</h5>
									<p>P-Shop.org ȸ�� ���� ��û�ڴ� ��Ģ������ �������� �������̿뿡 ���� �ź��� �Ǹ��� ������ �ֽ��ϴ�. ��, ���� �źθ� �Ͽ��� ��� ȸ��� ���� ��� ������ ���� ���ݾ����� ������ �� �����Ƿ� �ش� ��û�ڴ� ���� ������ ���ѵ˴ϴ�.</p>
								</li>
							</ul>
						</fieldset>
						</div>
					</div>
						<p><input type="checkbox" name="agree2" id="agree2" title="�������� ���� �� �̿뿡 ���� ���Ǹ� Ȯ���Ͽ����� �̿� �����մϴ�. üũ�ڽ�"><label for="agree2">�������� ���� �� �̿뿡 ���� ���Ǹ� Ȯ���Ͽ����� �̿� �����մϴ�</label></p>
					<div class="agreeBtn">
						<input type="image" src="http://image.seri.org/seri/cc/2012/join_btn1.gif" style="width:60px;height:25px;border:none;" alt="�̿��� ������" onclick="agree_alert();" />
<!-- 						<a href="/member/logout.html?dummy=3a6ac8a5dcd128ca9aaa36e9061788bc" title="�������� ����"> -->
						<a><img src="http://image.seri.org/seri/cc/2012/join_btn2.gif" width="104" height="25" border="0" alt="�̿��� �������� ����" onclick="javascript:history.go(-1)" style="cursor:hand"; ></a>
					</div>
				</form>

</div>
</body>
</html>