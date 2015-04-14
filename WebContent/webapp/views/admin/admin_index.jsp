<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="webapp/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script type="text/javascript">
	$(function () {
		// acvitate when clicking Nav
	    var menu = '<c:out value="${requestScope.menu }" />';
	    
	    console.log("menu: " + menu);
	    
	    $("li").each(function () {
	    	if ( $( this ).attr("id") == menu) {
	    		$( this ).addClass("active");
	    	}
	    });
	    
		// responsive navbar
		// Trigger: document ready
		effect();
		
		// Trigger: window on scroll
		$( window ).scroll(function () {
			effect();
		});
		
		// Trigger: window on resize
		$( window ).resize(function () {
			effect();
		});
		
	})
	
	// state에 따라 navbar의 css class를 정함
	function effect() {
		$('.navbar').removeClass('row container navbar-fixed-top');
		
		var width = $( window ).width();
		var originalNavbarOffset = $('.navbar').offset().top;
		var navbarHeight = $('.navbar').height();
		var targetClass;
		
		// console.log("navbar height: " + navbarHeight)
		// console.log("navbar offset: " + originalNavbarOffset)
		// console.log("window scroll: " + $( window ).scrollTop())
		// console.log("resized width: " + width)
		
		if (( width >= 992 ) && 
				($( window ).scrollTop() + navbarHeight <= originalNavbarOffset)) {
			// state = "MIDDLE_DEVICE_TOP";
			targetClass = "container";
		} else if (( width < 992 ) && 
				($( window ).scrollTop() + navbarHeight <= originalNavbarOffset)) {
			// state = "SMALL_DEVICE_TOP";
			targetClass = "row";
		} else if ($( window ).scrollTop() + navbarHeight > originalNavbarOffset) {
			// state = "MIDDLE_DEVICE_SCROLL_OVER";
			// state = "SMALL_DEVICE_SCROLL_OVER";
			targetClass = "navbar-fixed-top";
		}
		
		$('.navbar').addClass(targetClass);
	}
</script>
<title>관리자 페이지</title>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1 class="text-inverse">관리자 페이지&nbsp;&nbsp;<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></h1>
		</div>
	</div>

	<!-- nav -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li role="presentation" id="orders"><a href="orders.do"><span 
						class="glyphicon glyphicon-credit-card" aria-hidden="true"></span> 판매자 결제승인</a></li>
					<li role="presentation" id="addNewProduct"><a href="addNewProductForm.do"><span 
						class="glyphicon glyphicon-plus" aria-hidden="true"></span> 상품 추가</a>
<!-- 					<li role="presentation" id="newOrder"><a href="#"><span  -->
<!-- 						class="glyphicon glyphicon-tasks" aria-hidden="true"></span> 주문 등록</a></li> -->
					<li role="presentation" id="customerList"><a href="customerList.do"><span
						class="glyphicon glyphicon-tasks" aria-hidden="true"></span> 고객 정보</a>
					<li role="presentation" id="customerPage"><a href="product.do"><span 
						class=" glyphicon glyphicon-triangle-top" aria-hidden="true"></span> 일반 페이지</a></li>
					</li>
				</ul>
			</div>
		</div>
	</nav><!-- nav -->

	<!-- container -->
	<div class="container">
		<div class="row" id="main-container">
			<jsp:include page="${mainContent }" flush="false" />
		</div>
	</div><!-- container -->
</body>
</html>
