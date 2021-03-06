<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("euc-kr"); %>
<%	response.setContentType("text/html; charset=euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<title>이용 약관</title>
<script type="text/javascript">
	function agree_alert() {
		form = document.member_join_form;
		if ((form.agree1.checked != true) || (form.agree2.checked != true)) {
			alert("이용약관에 동의하셔야 가입을 진행할 수 있습니다.");
		} else {
			form.action = "/Shop-spring/registForm.do";
			form.submit();
		}
	}
	
	function degree_alert() {
		form = document.member_join_form;
		form.action = "./member/member_insert_form.jsp";
		form.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-8 col-lg-offset-2">
			<div class="page-header">
				<h1>회원가입 <small>저희 쇼핑몰에 오신것을 환영합니다.</small></h1>
			</div>
			<form name="member_join_form" method="GET" 
				onsubmit="return chkAgree(this);" action="" class="form-horizontal">
				<p class="lead">약관동의</p>
				<div class="text-center">
					<h4>이용 약관</h4>
				</div>
				<div class="well well-lg">
					<fieldset>
						<h4>제 1 장 총 칙</h4>
						<h5>제 1 조 목적</h5>
						<p class="text-primary">이 이용약관(이하 "약관")은 서비스 이용자가 쇼핑몰(이하 "회사"라 합니다)에서 제공하는 P-Shop.org 서비스에 회원으로 가입하고 이를 이용함에 있어 회사와 회원의 권리ㆍ의무 및 책임사항을 규정함을 목적으로 합니다.</p>
						<h5>제 2 조 용어의 정의</h5>
						<p class="text-primary">이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
						<ul class="text-warning">
							<li>① 'P-Shop.org 서비스(이하 "서비스"라 합니다)'라 함은 구현되는 기기(PC, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 '회원'이 이용할 수 있는 P-Shop.org 제반 서비스를 말합니다.</li>
							<li>② '회원'이란 이 약관에 동의하고 회원등록을 완료하여 회원 아이디를 부여받은 서비스 이용자를 말합니다.</li>
							<li>③ '회원 아이디(이하 "ID"라 합니다)'란 회원 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 승인한 문자 또는 숫자의 조합을 말합니다.</li>
							<li>④ '비밀번호'란 회원이 부여받은 ID와 일치된 회원임을 확인하고, 회원의 개인정보를 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.</li>
							<li>⑤ '포인트'라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 '서비스'상의 가상 데이터를 말하며, 그 명칭은 회사의 서비스 방향 및 내용에 따라 변경될 수 있습니다.</li>
							<li>⑥ '등록해지(이하 "탈퇴"라 합니다)'란 회사 또는 회원이 이용계약을 해지하는 것을 말합니다.</li>
						</ul>
						<h5>제 3 조 이용약관의 명시, 효력 및 개정</h5>
						<ul class="text-warning">
							<li>① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 사이트 초기 화면에 게시합니다. </li>
							<li>② 회사는 약관의 규제에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. </li>
							<li>③ 회사는 약관을 개정하는 경우 개정된 약관의 내용과 시행일을 정하여 시행일로부터 최소 7일 전(단, 이용자의 권리·의무에 중대한 영향을 미치는 사항에 대하여는 30일전)부터 개정내용을 명시하여 서비스 사이트 초기화면에 공지합니다. 또한, 기존 회원에게는 공지 외에 회원이 입력한 전자 우편주소를 통해 고지합니다. </li>
							<li>④ 회사가 전항에 따라 회원에게 통지하면서 공지ㆍ고지일로부터 개정 약관 시행일 7일 후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 통지하였음에도 회원이 거부의사를 표시하지 않은 경우 변경된 약관을 승인한 것으로 봅니다. </li>
							<li>⑤ 회원은 개정 약관에 동의하지 않을 경우 회사에 탈퇴신청을 할 수 있습니다.</li>
						</ul>
						<h5>제 4 조 약관 외 준칙</h5>
						<ul class="text-warning">
							<li>① 이 약관은 회사가 제공하는 개별서비스에 관한 이용안내(이하 "서비스별 안내"라 합니다)와 함께 적용 됩니다. 이 약관과 서비스별 안내의 내용이 모순/저촉될 경우에는 서비스별 안내에서 정한 바에 따라 적용 우선순위를 정합니다.</li>
						    <li>② 이 약관에 명시되지 아니한 사항에 대해서는 관계법령 및 서비스별 안내를 적용합니다.</li>
						</ul>
						<h4>제 2 장 이용계약 체결</h4>
						<h5>제 5 조 회원가입 및 이용계약의 성립</h5>
						<ul class="text-warning">
							<li>① 이용계약은 회원이 되고자 하는 자(이하 "가입신청자"라 합니다)가 약관의 내용 및 회사의 개인정보취급방침에 대하여 동의를 한 다음 회원가입신청을 하고 회사가 이러한 신청에 대하여 승낙함으로써 성립됩니다. </li>
							<li>② 서비스 이용자가 이 약관 및 회사의 개인정보취급방침을 읽고 "동의"버튼을 누르거나 "확인" 등에 체크하는 방법을 취한 경우 이 약관에 동의한 것으로 간주합니다. </li>
							<li>③  타인의 명의, 이메일, 소셜계정(트위터, 페이스북)을 이용하여 회원가입 한 사람은 서비스를 이용할 수 없고 해당 ID는 삭제되며, 관계법령에 따라 처벌을 받을 수 있습니다. </li>
						</ul>
						<h5>제 6 조 이용 신청의 승낙과 제한</h5>
						<ul class="text-warning">
							<li>① 회사는 가입신청자의 신청에 대하여 특별한 사정이 없는 한 서비스 이용을 승낙합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 승낙 후에도 임의로 탈퇴시킬 수 있습니다.
								<ul class="text-warning">
									<li>1. 타인의 명의를 이용하여 신청한 경우 </li>
									<li>2. 허위의 정보를 기재하거나 회사가 요구하는 내용을 기재하지 않은 경우</li>
									<li>3. 사회의 안녕과 질서, 미풍양속을 저해할 목적으로 신청한 경우</li>
									<li>4. 부정한 용도로 본 서비스를 이용하고자 하는 경우</li>
									<li>5. 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우</li>
									<li>6. 약관 또는 회사의 제반 규정을 위반하여 신청하는 경우</li>
									<li>7. 본 서비스와 경쟁관계에 있는 이용자가 신청하는 경우</li>
									<li>8. 14세 미만의 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우</li>
								</ul>
							</li>
							<li>② 회사는 다음 각 호의 내용에 해당하는 경우 이용신청에 대한 승낙을 제한하거나 유보할 수 있습니다.
								<ul class="text-warning">
									<li>1. 회사의 서비스 관련 설비에 여유가 없는 경우</li>
									<li>2. 서비스 제공에 기술상 문제가 있는 경우</li>
									<li>3. 미성년자의 경우</li>
									<li>4. 기타 위 각 호에 준하는 사유가 있다고 인정되는 경우</li>
								</ul>
							</li>
							<li>③ 회사는 본 서비스를 이용하는 회원을 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 그 이용에 차등을 둘 수 있습니다.</li>
						</ul>
						<h5>제 7 조 개인정보의 보호 및 사용</h5>
						<p class="text-primary">회사는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관계 법령 및 회사의 개인정보취급방침이 적용됩니다. 다만, 회사가 개설한 사이트 이외의 링크된 사이트에서는 회사의 개인정보취급방침이 적용되지 않습니다. </p>
						<h5>제 8 조 회원 ID 부여 및 관리</h5>
						<ul class="text-warning">
							<li>① 회원은 회사로부터 부여받은 ID를 변경할 수 없습니다. 부득이한 사유로 변경하고자 하는 경우에는 회원 탈퇴 후 재가입하여야 합니다. </li>
						    <li>② 회사는 회원의 ID가 다음 각 호에 해당하는 경우 회원에게 ID의 변경을 요청할 수 있으며, 이 경우 회원은 회원 탈퇴 후 재가입 절차를 밟아야 합니다.
								<ul class="text-warning">
									<li>1. ID가 이용자의 전화번호 또는 주민등록번호 등으로 등록되어 사생활 침해가 우려되는 경우</li>
									<li>2. 타인에게 혐오감을 주거나 미풍양속에 어긋나는 경우</li>
								</ul>
							</li>
							<li>③ 회사가 제공하는 서비스의 ID는 회원 본인의 동의 하에 회사가 운영하는 다른 사이트의 ID와 연결될 수 있습니다.</li>
							<li>④ 기타 회원 개인정보 관리 및 변경 등에 관한 사항은 회사의 개인정보 취급방침 및 서비스별 안내에 정하는 바에 따릅니다.</li>
						</ul>
						<h5>제 9 조 회원정보의 변경</h5>
						<ul class="text-warning">
							<li>① 회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 ID 는 수정할 수 없습니다.</li>
							<li>② 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정하거나 전자우편 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다. </li>
							<li>③ 제2항의 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다. </li>
						</ul>
						<h5>제 10 조 회원의 ID 및 비밀번호 관리의무</h5>
						<ul class="text-warning">
							<li>① 회원의 ID와 비밀번호에 관한 관리책임은 회원에게 있으며 이를 제3자가 이용하도록 하여서는 안됩니다. </li>
							<li>② 회원은 ID 또는 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 회사에 통지하고 회사의 안내에 따라야 합니다. </li>
							<li>③ 회원이 제1항 및 제2항을 위반하여 발생한 손해나 불이익에 대해서는 회원이 책임을 져야 하며 회사는 책임을 부담하지 않습니다. </li>
						</ul>
						<h4>제 3 장 계약 당사자의 의무</h4>
						<h5>제 11 조 회사의 의무</h5>
						<ul class="text-warning">
							<li>① 회사는 관련법령이나 이 약관이 금지하는 행위 또는 미풍양속에 반하는 행위를 하지 않으며, 지속적이고 안정적인 서비스를 제공하기 위하여 최선을 다하여 노력합니다. </li>
							<li>② 회사는 회원이 안전하게 서비스를 이용할 수 있도록 회원의 개인정보보호를 위한 보안시스템을 구축하며 개인정보취급방침을 공시하고 준수합니다.</li>
							<li>③ 회사는 회원이 수신 동의를 하지 않은 영리 목적의 광고성 전자우편을 발송하지 않습니다. </li>
							<li>④ 회원의 탈퇴신청이 있는 경우 회사는 본인 확인 후 즉시 탈퇴 처리합니다. </li>
						</ul>
						<h5>제 12 조 회원의 의무</h5>
						<ul class="text-warning">
							<li>① 회원은 다음의 행위를 하여서는 아니 됩니다.
								<ul class="text-warning">
									<li>1. 회원가입신청 또는 변경 시 허위내용을 등록하는 행위</li>
									<li>2. 다른 회원의 ID, 비밀번호, 이메일, 소셜계정(트위터, 페이스북), 기타 개인정보 등을 도용하는 행위</li>
									<li>3. ID를 타인과 거래하는 행위</li>
									<li>4. 회사의 운영진, 직원 또는 관계자를 사칭하는 행위</li>
									<li>5. 회사로부터 특별한 권리를 부여받지 않고 회사의 클라이언트 프로그램을 변경하거나, 회사의 서버를 해킹하거나, 웹사이트 또는 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위</li>
									<li>6. 서비스에 위해를 가하거나 고의로 방해하는 행위</li>
									<li>7. 본 서비스를 통해 얻은 정보를 회사의 사전 승낙 없이 서비스 이용 외의 목적으로 임의가공, 판매, 복제, 송신, 배포하거나, 이를 출판 및 방송 등에 사용하거나, 제 3자에게 제공하는 행위</li>
									<li>8. 회사 또는 제3자의 저작권 등 지식재산권을 침해하거나, 침해하는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
									<li>9. 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용의 정보, 문장, 도형, 음향, 동영상을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
									<li>10. 모욕적이거나 개인신상에 대한 내용이어서 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송, 게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위</li>
									<li>11. 다른 회원을 희롱 또는 위협하거나, 특정 이용자에게 지속적으로 고통 또는 불편을 주는 행위</li>
									<li>12. 회사의 승인을 받지 않고 다른 회원의 개인정보를 수집 또는 저장하는 행위</li>
									<li>13. 범죄와 결부된다고 객관적으로 판단되는 행위</li>
									<li>14. 이 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용 조건을 위반하는 행위</li>
									<li>15. 회사의 업무에 방해되는 행위 및 회사의 명예를 손상시키는 행위</li>
									<li>16. 회사의 명시적인 동의 없이 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여, 담보로 제공하는 행위</li>
									<li>17. 기타 법령에 위배되는 행위 </li>
								</ul>
							</li>
							<li>② 회원은 관계법령, 이 약관의 규정, 기타 회사가 정한 제반 규정, 서비스 이용안내, 공지사항 등 회사가 통지하는 사항 등을 준수하여야 합니다.</li>
						    <li>③ 회원은 회사의 사전 승낙 없이 서비스를 이용하여 영업활동을 할 수 없습니다. 회원 간 또는 회원과 제3자 간에 서비스를 매개로 하여 이루어진 거래는 회사와는 무관하며 회사는 이에 대해 어떠한 책임도 지지 않습니다. </li>
						    <li>④ 회원이 제3항을 위반하여 회사에 손해를 야기한 경우 회원은 회사에 그 손해를 배상해야 합니다. </li>
						</ul>
						<h4>제 4 장 서비스의 이용</h4>
						<h5>제 13 조 서비스의 제공 및 변경</h5>
						<ul class="text-warning">
							<li>① 회사는 회사가 제공하는 콘텐츠와 진행하는 이벤트 등의 모든 서비스를 회원에게 제공합니다. 다만, 제6조 제3항에 따라 회원의 등급별로 제공하는 서비스에 차등을 둘 수 있습니다.</li>
							<li>② 회사는 서비스를 무료로 제공합니다. 서비스의 일부 또는 전부를 유료로 전환할 경우 사전 공지하며 그 이용에 대한 사항은 회사가 별도로 정한 서비스 약관 및 정책 또는 운영규칙에 따릅니다. </li>
							<li>③ 회사는 서비스 변경 시 그 변경될 서비스의 내용 및 제공일자를 제14조에 정한 방법으로 회원에게 통지합니다. </li>
						</ul>
						<h5>제 14 조 정보의 제공 및 통지</h5>
						<ul class="text-warning">
							<li>① 회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항 혹은 전자우편 등의 방법으로 회원에게 제공할 수 있습니다. </li>
						    <li>② 회사는 회원이 명시적으로 전자우편 수신을 거부한 경우에도 관련법령이나 본 약관에서 정한 통지 의무를 다하기 위해 필요한 경우에는 전자우편을 발송할 수 있습니다. </li>
						    <li>③ 회사는 불특정 다수 회원에 대한 통지를 하는 경우 7일 이상 공지사항에 게시함으로써 개별 통지에 갈음할 수 있습니다. </li>
						</ul>
						<h5>제 15 조 (게시물의 관리)</h5>
						<ul class="text-warning">
							<li>① 회사는 회원이 등록한 게시물 및 자료가 변조, 훼손, 삭제되지 않도록 노력합니다.</li>
							<li>② 회사는 다음 각 호에 해당하는 내용이 포함된 게시물이나 자료에 대해 회원의 등록을 거부하거나, 사전통지 없이 삭제, 이동, 변경할 수 있습니다.
								<ul class="text-warning">
									<li>1. 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 손상시키는 내용</li>
								   <li>2. 공공질서 및 미풍양속에 위반되는 내용 또는 그러한 내용을 담고 있는 사이트에 접속할 수 있도록 링크시킨 내용</li>
								   <li>3. 음란물을 게시하거나 음란물을 담고 있는 사이트에 접속할 수 있도록 링크시킨 경우</li>
								   <li>4. 불법복제 또는 해킹을 조장하는 내용</li>
								   <li>5. 영리를 목적으로 하는 광고나 스팸성 게시물인 경우</li>
								   <li>6. 범죄에 결부된다고 객관적으로 인정되는 내용</li>
								   <li>7. 회사, 다른 회원, 제3자의 저작권 기타 권리를 침해하는 내용</li>
								   <li>8. 등록하고자 하는 게시판 성격에 부합하지 않는 경우</li>
								   <li>9. 상용소프트웨어나 크랙파일을 올린 경우 </li>
								  <li>10. 기타 회사의 제반 규정이나 관계법령에 위배되는 내용</li>
							  </ul>
						    </li>
						</ul>
						<h5>제16조 게시물에 관한 권리의 귀속</h5>
						<ul class="text-warning">
							<li>① 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속됩니다.</li>
						  <li>② 회원이 서비스 화면 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속되며, 회사는 이를 영리목적으로 이용하지 않습니다. </li>
						  <li>③ 회원이 저작권을 갖는 게시물에 대해서 회사는 비영리목적으로 이를 이용할 수 있으며(회사가 제휴를 맺고 있는 다른 회사가 운영하는 외부 사이트에 무상으로 메타 데이터를 제공하는 것을 포함합니다), 영리목적 유무와 무관하게 회사가 운영하는 사이트 내에서는 자유롭게 이용할 수 있습니다. 회원이 본 약관에 동의할 경우 위와 같은 이용에 필요한 저작재산권 등을 회원이 회사에 부여한 것으로 간주하며, 이는 회원이 탈퇴한 후에도 유효합니다. </li>
						  <li>④ 회사는 회원이 저작권을 갖는 게시물에 대해서 제3항에서 정한 방법 이외의 방법으로 영리 목적으로 이용하고자 하는 경우 전화, 팩스, 전자우편 등의 방법을 통해 사전에 회원의 동의를 얻어야 합니다. </li>
						  <li>⑤ 회사가 제4항에 따라 회원의 게시물을 이용할 경우 회사는 회원에게 보상을 제공합니다.</li>
						</ul>
						<h5>제17조 광고게재 </h5>
						<p class="text-primary">회사는 서비스의 운영과 관련하여 서비스 화면, 홈페이지 등에 광고를 게재할 수 있습니다. 타인이 게재한 광고 내용의 진실성, 정확성, 신뢰성에 대해 회사는 책임을 부담하지 않습니다. </p>
						<h5>제18조 서비스 이용시간</h5>
						<ul class="text-warning">
							<li>① 회사는 업무 또는 기술상 장애가 있는 경우를 제외하고 본 서비스를 1일 24시간, 연중무휴로 제공합니다. </li>
							<li>② 회사는 서비스를 일정 범위로 분할하여 각 범위별로 이용가능시간을 별도로 지정할 수 있습니다. 이 경우 그 내용을 공지합니다.</li>
						</ul>
						<h5>제19조 서비스 이용 제한 또는 중지 및 회원 탈퇴</h5>
						<ul class="text-warning">
							<li>① 회사는 다음 각 호에 해당하는 사유가 발생할 경우 회원의 서비스 이용을 제한 또는 중지시키거나, 회원을 탈퇴시킬 수 있습니다.
								<ul class="text-warning">
									<li>1. 회원이 회사 서비스 운영을 고의 또는 과실로 방해하는 경우</li>
								   <li>2. 회원이 제12조에서 규정한 회원의 의무를 위반한 경우</li>
								   <li>3. 정보통신설비 또는 시스템의 정기점검, 증설 및 교체, 보수 점검, 고장 등 공사로 인해 부득이 한 경우</li>
								   <li>4. 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중단한 경우</li>
								   <li>5. 국가비상사태, 서비스 설비 장애, 서비스 이용 폭주 등으로 서비스 이용에 지장이 있는 경우</li>
								   <li>6. 미풍양속을 저해하는 비속한 ID 또는 별명을 사용한 경우</li>
								   <li>7. 관련 행정청 또는 공공기관의 시정 요구 등이 있는 경우</li>
								   <li>8. 3개월 이상 서비스를 이용하지 않는 경우</li>
								   <li>9. 게시판에 인덱스 파일없이 자료만 올려 놓는 등 게시판을 파일 자료실로 전용하는 경우 </li>
								   <li>10. 제15조 제2항에서 규정하는 게시물이나 자료를 게시, 등록한 경우</li>
								</ul>
							</li>
							<li>② 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지할 경우 그 이유 및 제한기간 등을 사전에 통지합니다. 다만, 회사가 예상할 수 없는 사유로 인한 서비스 중단 등 사전공지가 불가능한 경우에는 사후에 그 이유를 통지합니다.  </li>
						</ul>
						<h5>제20조 포인트 </h5>
						<ul class="text-warning">
							<li>① 회사는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 포인트의 일부 또는 전부를 조정할 수 있으며, 포인트는 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다. </li>
							<li>② 회원은 회사의 동의 없이 포인트를 제3자에게 양도, 증여할 수 없습니다</li>
						</ul>
						<h5>제 21 조 계약 해지</h5>
						<p class="text-primary">회원이 이용계약을 해지하고자 하는 경우에는 회원 본인이 사이트 내의 회원탈퇴 메뉴를 이용해 탈퇴 신청을 하여야 합니다.</p>
						<h4>제 5 장 기타</h4>
						<h5>제 22 조 책임제한</h5>
						<ul class="text-warning">
							<li>① 회사가 제19조 제1항에서 규정한 사유로 인해 서비스 제공을 제한 또는 중지시키거나 회원을 탈퇴시킨 경우, 회사는 이로 인해 발생한 회원의 손해를 배상할 책임이 없습니다.</li>
							<li>② 회사는 회원이 전자우편 등 개인정보를 부실하게 기재하거나 또는 제9조 제2항에 따른 개인정보 변경의무를 다하지 아니하여 발생한 손해에 대해 배상할 책임이 없습니다.</li>
							<li>③ 회원이 본 서비스 사이트에 게재한 정보, 자료, 사실 등의 진실성, 정확성, 신뢰성은 회사가 보장하지 않습니다. 회원이 게시한 자료의 활용 여부는 회원 각자의 책임과 판단에 맡겨져 있으며, 그로 인해 야기되는 결과에 대해 회사는 일체의 책임을 지지 않습니다. </li>
							<li>④ 회사는 회원간 및 회원과 제3자간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없습니다. 회사는 서비스 이용과 관련하여 회원의 고의 또는 과실로 인하여 회원 또는 제3자에게 발생한 손해에 대하여 책임을 부담하지 않습니다. 다만, 관련법령에서 달리 규정하고 있는 사항이 있으면 그에 따릅니다. </li>
						</ul>
						<h5>제 23 조 분쟁의 해결 </h5>
						<ul class="text-warning">
							<li>① 회사와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 노력을 합니다.</li>
							<li>② 회사는 회원으로부터 제출되는 불만사항 및 의견을 존중하며, 이를 바탕으로 회원에게 보다 나은 서비스가 제공되도록 노력합니다.</li>
						</ul>
						<h5>제 24 조 재판권 및 준거법</h5>
						<p class="text-primary">회사와 회원 간에 서비스 이용으로 발생한 분쟁에 대하여는 대한민국법을 적용하며, 본 분쟁으로 인하여 법적 관할은 민사소송법에 의합니다.</p>
						<p class="text-primary">&lt;부칙(2013.2.7)&gt;</p>
						<p class="text-primary">본 약관은 2013년 2월 15일부터 적용됩니다.<br>
						2012년 3월 6일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.</p>
				</fieldset>
				</div>
				<div class="checkbox text-center">
					<label>
						<input type="checkbox" name="agree1" id="agree1" 
							title="이용약관을 확인하였으며 이에 동의합니다 체크박스"> 이용약관을 확인하였으며 이에 동의합니다.
					</label>
				</div>
				<hr class="divider">
				<div class="text-center">
					<h4>개인정보 수집, 이용에 관한 동의 (보다 상세한 내용은 <a href="/cc/ccPrivateProtection.html" 
						target="_blank" title="개인정보취급방침보기-새창"><strong>개인정보취급방침</strong></a>을 참조하세요)</h4>
				</div>
				<div class="well well-lg">
					<fieldset>
						<p class="text-primary">"쇼핑몰"(이하 'SERI')는 "정보통신망 이용촉진 및 정보보호 등에 관한 법률", "개인정보 보호법", "통신비밀보호법" 
							기타 개인정보 보호에 관한 관련법률을 준수하고 있습니다. SERI는 "본 개인정보취급방침"(이하 '본 방침')을 통하여 
							SERI가 취하고 있는 고객님의 개인정보 처리기준과 그 보호조치 등을 알려 드립니다. 본 방침을 개정하는 경우 
							SERI 홈페이지(P-Shop.org) 공지사항 또는 전자메일을 이용한 개별공지를 통하여 신속히 알려 드리겠습니다.</p>
						<ul class="text-warning">
							<li>
								<h4>1. 개인정보의 수집·이용목적</h4>
								<h5>가. 회원관리 </h5>
								<ul class="text-warning">
									<li>- P-Shop.org 사이트에서 제공하는 회원제 서비스 이용을 위한 본인확인</li>
									<li>- 쇼핑몰 이용약관 제19조에 의해 이용이 제한, 정지되거나 이용계약이 해지된 회원의 부정 이용 방지와 비인가 사용 방지</li>
									<li>- P-Shop.org 가입 의사 확인, 연령확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의 확인</li>
									<li>- 불만처리 등 민원처리, 공지사항 전달 </li>
								</ul>
								<h5>나. 서비스 제공</h5>
								<ul class="text-warning">
									<li>- 로그인 한 회원에게 각종 콘텐츠, 서비스 이용자격 및 이벤트 응모자격 부여</li>
									<li>- 활동 포인트 제공</li>
								</ul>
								<h5>다. 신규 서비스 개발 및 마케팅ㆍ광고 등에의 활용</h5>
								<ul class="text-warning">
									<li>- 신규 서비스 개발 및 고객별 특화, 맞춤 서비스 제공</li>
									<li>- 통계학적 특성에 따른 서비스 제공 </li>
									<li>- 서비스의 유효성 확인</li>
									<li>- 이벤트 등 광고성 정보 제공 및 참여기회 제공</li>
									<li>- 이벤트 당첨 시 경품 배송 </li>
									<li>- 접속빈도 파악</li>
									<li>- 회원의 서비스 이용에 대한 통계작성</li>
									<li>- 시장조사, 학술연구에의 활용</li>
								</ul>
							</li>
							<li>
								<h4>2. 수집하는 개인정보의 항목 및 수집방법</h4>
								<h5>가. 고객으로부터 제공받아 수집하는 개인정보</h5>
								<p class="text-primary">○ 필수 정보</p>
								<ul class="text-warning">
									<li>- 이름, 로그인ID, 비밀번호, 이메일주소, 연락처(휴대전화)</li>
									<li>- 트위터 ID(또는 이메일 정보), 프로필, 프로필 이미지, 회원의 팔로워, 트윗, RT 정보</li>
									<li> ※트위터 연동 회원에 한함 </li>
									<li>- 페이스북 이메일, 학력, 경력, 프로필, 프로필 이미지 외 기본 프로필 정보, 친구, 멘션 정보</li>
									<li>※페이스북 연동 회원에 한함</li>
								</ul>
								<p class="text-primary">○ 선택 정보</p>
								<ul class="text-warning">
									<li>- 아이핀 관련정보 </li>
									<li>- 부가서비스 등의 제공을 위한 추가 개인정보(이 경우 SERI는 회원에게 개인정보 추가수집에 대한 동의를 받을 것 입니다)</li>
								</ul>
								<h5>나. 회원의 서비스 이용과정에서 생성되는 개인정보</h5>
								<p class="text-primary">- 서비스 이용기록, 접속로그, 쿠키, 방문일시, 불량 이용 기록(불량회원으로 지정되는 사유가 되는 이용기록을 의미합니다), 기타 이와 유사한 정보<br>
									※ 불량이용기록을 제외한 회원의 서비스 이용과정에서 생성되는 개인정보에 대해 회원은 제8조에서 정하는 바에 따라 그 수집을 거부할 수 있습니다.</p>
								<h5>다. 수집방법</h5>
								<ul class="text-warning">
									<li>- 인터넷 또는 유/무선을 이용한 회원의 P-Shop.org 회원가입, 회원정보 수정, 경품 행사 응모, 배송 요청 과정에서 회원이 제공하는 개인정보의 수집</li>
									<li>- 회원의 서비스 이용과정에서 생성되는 개인정보의 수집</li>
									<li>- 협력회사가 개인정보 주체로부터 SERI에 대한 개인정보 제공에 대해 동의를 얻고 제공하는 경우의 개인정보 수집 등</li>
								</ul>
							</li>
							<li>
								<h4>3. 개인정보의 보유 및 이용기간</h4>
								<p class="text-primary">SERI는 회원의 탈퇴 요청이 있거나 개인정보 파기 요청이 있을 때까지 해당 개인정보를 보유하여 이용합니다. 다만, 회원의 요청이 있는 경우에도 다음 목적을 위한 범위 내에서는 회원의 개인정보를 보유합니다.</p>
								<h5>(1) 회사 내부 방침에 의해 정보를 보유하는 경우</h5>
								<ul class="text-warning">
									<li>- 부정이용기록
										<ul class="text-warning">
											<li>· 보존이유 : 부정 이용 방지</li>
											<li>· 보존기간 : 1년</li>
										</ul>
									</li>
								</ul>
								<h5>(2) 관련 법령에 의한 정보보유 사유</h5>
	                            <ul class="text-warning">
									<li>- 웹사이트 방문기록 
									<ul class="text-warning">
										<li>· 보존이유 : 통신비밀보호법</li>
										<li>· 보존기간 : 3개월</li>
									</ul>
									</li>
								</ul>
	                            <h5>(3) 기타 사유</h5>
	                            <ul>
									<li>- 보유기간을 회원에게 미리 고지하고 그 보유기간이 경과하지 아니한 경우와 개별적으로 회원에게 사전에 동의를 받은 경우에는 약속한 보유기간 동안 보유</li>
	                                <li>- 다른 법률에 따라 개인정보를 보존해야 하는 경우</li>
								</ul>
							</li>
							<li>
								<h4>4. 개인정보 수집·이용 동의 및 거부에 관한 사항</h4>
								<p class="text-primary">P-Shop.org 회원 가입 신청자는 원칙적으로 개인정보 수집·이용에 대해 거부할 권리를 가지고 있습니다. 단, 동의 거부를 하였을 경우 회사는 서비스 계약 이행을 위한 제반업무를 진행할 수 없으므로 해당 신청자는 서비스 가입이 제한됩니다.</p>
							</li>
						</ul>
					</fieldset>
				</div>
				<div class="checkbox text-center">
					<label>
						<input type="checkbox" name="agree2" id="agree2" 
							title="개인정보 수집 및 이용에 관한 동의를 확인하였으며 이에 동의합니다. 체크박스">개인정보 수집 및 이용에 관한 동의를 확인하였으며 이에 동의합니다
					</label>
				</div>
				<hr class="divider">
				<div class="text-center">
					<button class="btn btn-success" 
						onclick="agree_alert();"><span class="glyphicon glyphicon-ok-circle" 
						aria-hidden="true"></span> 동의함</button>
					<button class="btn btn-danger"
						onclick="javascript:history.go(-1)"><span class="glyphicon glyphicon-remove-circle" 
						aria-hidden="true"></span> 동의하지 않음</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>