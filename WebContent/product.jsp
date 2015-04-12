<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>�� �� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-2.1.3.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	$( document ).ready(function () {
		// acvitate when clicking Nav
		var category = '<c:out value="${requestScope.category }" />';
		
		console.log("category: " + category);
		
		$("li").each(function () {
			if ( $( this ).attr("id") == category ) {
			    // activate clicked nav
				$( this ).addClass("active");
			} else if (category == "") {
			    // activate 'ALL' nav at first load of page
			    $( "#all" ).addClass("active");
			}
		});
		
		// call modal for login & join
		$("#loginButton").click(function () {
			$("#loginModal").modal('show');
			console.log("modal showing");
		});
		
		// when modal is shown
		$("#loginModal").on('shown.bs.modal', function () {
		    // set z-index of modal dialog as backdrop hides the dialog (this bug sucks)
		    $("#loginModalDialog").css("z-index", "1040");
		    
		    // focus on input element 'ID'
		    $('#id').focus();
		    
		    // login avaliable when press Enter in password field
		    $("#password").keydown(function ( event ) {
		    	if ( event.which == 13 ) {
		    		login();
		    	}
		    })
		    
		})
		
		// responsive Navigation bar
		// states :
		// 1. MIDDLE_DEVICE_TOP
		//  -> position is top of window in width >= 992
		//  -> .container
		// 2. SMALL_DEVICE_TOP
		//  -> position is top of window in width < 992
		//  -> .row
		// 3. SCROLL_OVER
		//  -> position is down over navbar in all device
		//  -> .navbar-fixed-top
		
		// Initialize state and state machine
		// Trigger: document ready
		var navbarState;
		if ( ($( window ).width < 992) && 
				($( window ).scrollTop() + $('.navbar').height() <= $('.navbar').offset().top) ) {
			navbarState = new MiddleDeviceTop();
		} else if ( ($( window ).width >= 992) && 
				($( window ).scrollTop() + $('.navbar').height() <= $('.navbar').offset().top) ) {
			navbarState = new SmallDeviceTop();
		} else if ( $( window ).scrollTop() + 
				$('.navbar').height() <= $('.navbar').offset().top ) {
			navbarState = new ScrollOver();
		}
		
		var navbarStateMachine = new NavbarStateMachine(navbarState); 
		navbarStateMachine.effect();
		
		// Trigger: window on scroll
		$( window ).scroll(function () {
			if ( $( window ).scrollTop() + $('.navbar').height() <= 
					$('.navbar').offset().top ) {
				
				// fsm.setState( 'DEVICE_TOP' );
				// fsm.effect();
				
			} else if ( $( window ).scrollTop() + $('.navbar').height() > 
					$('.navbar').offset().top ) {
				
				// fsm.setState( 'SCROLL_OVER' );
				// fsm.effect();
			}
			
		});
		
		// Trigger: window on resize
		$( window ).resize(function () {
			if ( $( window ).width() < 992 ) {
				
				// fsm.setState( 'MIDDLE_DEVICE' );
				// fsm.effect();
			} else if ( $( window ).width() >= 992 ) {
				
				// fsm.setState( 'SMALL_DEVICE' );
				// fsm.effect();
			}
			
		});
		
		// login button
		$("#loginTrigger").click(function () {
			login();
		});
	
		// logout menu
		$("#logoutMenu").click(function () {
	    	$.ajax({
	    		type: "get",
			    url: "logout.do",
			    success: function () {
			    	$("#sessionList").remove();
			    	console.log("sessionList removed");
			    	
			    	$(".navbar-collapse").append(
						'<form class="nav navbar-form navbar-right" id="loginForm">' +
							'<a href="#" class="btn btn-primary" id="loginButton"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;�α���</a>' +
						'</form>'
			    	);
			    	
			    	// reload web page
			    	location.reload();
			    },
			    error: function (jqXHR, textStatus, errorThrown) {
					alert("ajax error : " + errorThrown);
			    }
	    	})
	    	
	    	// JavaScript propagation ����
	    	return false;
	    })
	    
	})
	
	// Class : NavbarStateMachine
	// Description : State Machine for responsive navbar 
	function NavbarStateMachine(navbarState) {
		this.navbarState = navbarState;
	}
	
	// Method : changeState(navbarState)
	NavbarStateMachine.prototype.changeState = function (navbarState)
	{
		this.navbarState = navbarState;
	}
	
	// Method : effect() 
	NavbarStateMachine.prototype.effect = function ()
	{
		navbarState.removeClass();
		navbarState.addClass();
	}
	
	// Class : NavbarState
	// Description : State for Navbar State Machine
	function NavbarState() {
		
	}
	
	// Method : addClass()
	NavbarState.prototype.addClass = function ()
	{
		
	}
	
	// Method : removeClass()
	NavbarState.prototype.removeClass = function ()
	{
		
	}
	
	// Class : ScrollOver
	// Description : Specialization of NavbarState
	function ScrollOver () {
		NavbarState.call(this);
	}
	
	// Create a ScrollOver.prototype object that inherits from NavbarState.prototype.
	ScrollOver.prototype = Object.create(NavbarState.prototype);
	
	// Set the "constructor" property to refer to NavbarState
	ScrollOver.prototype.constructor = ScrollOver;
	
	// Replace the "addClass" method
	ScrollOver.prototype.addClass = function () {
		$( '.navbar' ).addClass( 'navbar-fixed-top' );
	}
	
	// Replace the "removeClass" method
	ScrollOver.prototype.removeClass = function () {
		$( '.navbar' ).removeClass( 'row container' );
	}
	
	// Class : MiddleDeviceTop
	// Description : Specialization of NavbarState
	function MiddleDeviceTop () {
		NavbarState.call(this);
	}
	
	// Create a ScrollOver.prototype object that inherits from NavbarState.prototype.
	MiddleDeviceTop.prototype = Object.create(NavbarState.prototype);
	
	// Set the "constructor" property to refer to NavbarState
	MiddleDeviceTop.prototype.constructor = MiddleDeviceTop;
	
	// Replace the "addClass" method
	MiddleDeviceTop.prototype.addClass = function () {
		$( '.navbar' ).addClass( 'container' );
	}
	
	// Replace the "removeClass" method
	MiddleDeviceTop.prototype.removeClass = function () {
		$( '.navbar' ).removeClass( 'row navbar-fixed-top' );
	}
	
	// Class : SmallDeviceTop
	// Description : Specialization of NavbarState
	function SmallDeviceTop () {
		NavbarState.call(this);
	}
	
	// Create a SmallDeviceTop.prototype object that inherits from NavbarState.prototype.
	SmallDeviceTop.prototype = Object.create(NavbarState.prototype);
	
	// Set the "constructor" property to refer to NavbarState
	SmallDeviceTop.prototype.constructor = SmallDeviceTop;
	
	// Replace the "addClass" method
	SmallDeviceTop.prototype.addClass = function () {
		$( '.navbar' ).addClass( 'row' );
	}
	
	// Replace the "removeClass" method
	SmallDeviceTop.prototype.removeClass = function () {
		$( '.navbar' ).removeClass( 'container navbar-fixed-top' );
	}
	
	
	
	// state�� ���� navbar�� css class�� ����
	function effect() {
		$('.navbar').removeClass('row container navbar-fixed-top');
		
		var width = $( window ).width();
		var originalNavbarOffset = $('.navbar').offset().top;
		var navbarHeight = $('.navbar').height();
		var targetClass;
		
		// console.log("navbar height: " + navbarHeight)
		// console.log("navbar offset: " + originalNavbarOffset)
		// console.log("***window scroll: " + $( window ).scrollTop())
		// console.log("resized width: " + width)
		
		if ($( window ).scrollTop() + navbarHeight <= originalNavbarOffset) {
			if ( width >= 992 ) {
				// state = "MIDDLE_DEVICE_TOP";
				// console.log("container setted")
				targetClass = "container";
			} else if ( width < 992 ) {
				// state = "SMALL_DEVICE_TOP";
				// console.log("row setted")
				targetClass = "row";
			}
		} else if ($( window ).scrollTop() + navbarHeight > originalNavbarOffset) {
			// state = "MIDDLE_DEVICE_SCROLL_OVER";
			// state = "SMALL_DEVICE_SCROLL_OVER";
			// console.log("top fixed")
			targetClass = "navbar-fixed-top";
		}
		
		$('.navbar').addClass(targetClass);
	}
	
	function login() {
	    if ($('#id').val() == "" || $('#password').val() == "") {
			alert("���̵�� ��й�ȣ�� �Է��ϼ���");
			return false;
	    }
	    
		$.ajax({
			type: "post",
			url: "login.do",
			
			// request
//				contentType: "application/json",
//				mimeType: "application/json",
			data: { 
				"id": $('#id').val(), 
				"password": $('#password').val() 
			},
			
			// response
			dataType: "json",
			success: function (data) {
				if (data != null) {
					$("#loginModal").modal("hide");
					console.log("modal hided");
					$("#loginForm").remove();
					console.log("loginForm removed");
					
					$(".navbar-collapse").append(
						'<ul class="nav navbar-nav navbar-right" id="sessionList">' +
						  '<li class="dropdown">' +
						    '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">' + data.id + '�� <span class="caret"></span></a>' +
						      '<ul class="dropdown-menu" role="menu">' +
						        '<li><a href="customerDetail.do"><span class="glyphicon glyphicon-th-list"></span>  �� ���� ����</a></li>' +
						        '<li class="divider"></li>' +
						        '<li><a href="#" id="logoutMenu"><span class="glyphicon glyphicon-log-out"></span>  �α� �ƿ�</a></li>' +
						      '</ul>' +
						  '</li>' +
						'</ul>'
					);
					console.log("login successful");
					
					// reload web page
					location.reload();
				} else {
					alert("���̵� Ȥ�� ��й�ȣ�� �߸��Ǿ����ϴ�.");
				}
		    },
		    error: function (jqXHR, textStatus, errorThrown) {
//					alert("ajax error: \n" + "data: " + jqXHR + "\n" + 
//						"textStatus: " + textStatus + "\n" + 
//						"errorThrown: " + errorThrown);
				alert("���̵� Ȥ�� ��й�ȣ�� �߸��Ǿ����ϴ�.");
		    }
		})
		
		// JavaScript propagation ����
		return false;
	}
</script>
</head>
<body>
	<!-- title -->
	<div class="jumbotron">
		<div class="container">
			<h1>�ֱԳ׿ʹ�</h1>
			<p>�뾲�ִ� ��Ͽ������� ���θ�</p>
		</div>
	</div><!-- /.title -->
	
	<!-- modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true" data-backdrop="true">
		<div class="modal-dialog" id="loginModalDialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span 
						aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="loginModalLabel">�α���</h4>
				</div>
				<!-- who: ǥ��� -->
				<!-- when: 15.4.6 -->
				<!-- what: ID/Password �Է� �κ� ���� -->
				<div class="modal-body">
					<form role="login" action="login.do" method="post">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="ID" id="id">
							<input type="password" class="form-control" placeholder="Password" id="password">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="row">
						<div class="col-xs-4 text-left">
							<a class="btn btn-danger" href="join.do">ȸ�� ����</a>
						</div>
						<div class="col-xs-8 text-right">
							<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
							<button type="button" class="btn btn-primary" id="loginTrigger">�α���</button>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- navbar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li id="all"><a href="product.do?category=all">ALL</a></li>
					<li id="top"><a href="product.do?category=top">TOP</a></li>
					<li id="bottom"><a href="product.do?category=bottom">BOTTOM</a></li>
					<li id="outer"><a href="product.do?category=outer">OUTER</a></li>
					<li id="myOrders"><a href="myOrders.do">MY-ORDER</a></li>
					<li id="review"><a href="#">REVIEW</a></li>
					<li id="qna"><a href="#">Q & A</a></li>
				</ul>
				<c:choose>
					<c:when test="${empty sessionScope.customerId }">				
						<form class="nav navbar-form navbar-right" id="loginForm">
							<a href="#" class="btn btn-primary" id="loginButton"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;�α���</a>
						</form>
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right" id="sessionList">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" 
									role="button" aria-expanded="false">${sessionScope.customerId } �� <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<c:if test='${sessionScope.customerId == "admin" }'>
										<li><a href="admin.do"><span class="glyphicon glyphicon-wrench"></span>  ������ ������</a></li>
									</c:if>
									<li><a href="customerDetail.do"><span class="glyphicon glyphicon-th-list"></span>  �� ���� ����</a></li>
									<li class="divider"></li>
									<li><a href="#" id="logoutMenu"><span class="glyphicon glyphicon-log-out"></span>  �α� �ƿ�</a></li>
								</ul>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav><!-- /.navbar -->
	
	<!-- container -->
	<div class="container">
		<!-- main -->
		<div class="row">
			<jsp:include page="${mainContent }" flush="false" />
		</div><!-- /.main -->
		
	</div><!-- /.container -->
	
</body>
</html>