<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript">
	$( document ).ready(function () {
	    if ($("#startPage").val() == $("#requestPage").val()) {
		    // disable pager when no more previous page is needed
			$("#previousPager").addClass("disabled");
			$("#previousPager").find("a").attr("href", "#");
	    }
	    
	    if ($("#endPage").val() == $("#requestPage").val()) {
			// disable pager when no more next page is needed
			console.log("why")
			$("#nextPager").addClass("disabled");
			$("#nextPager").find("a").attr("href", "#");
	    }
	})
	
	$( window ).load(function () {
		// window load시 clearfix 설정
		setClearfix();
	})
	
	$( window ).resize(function () {
		// window size clearfix 재설정
		setClearfix();
	})
	
	// responsive page를 위한 product list 정리용 함수
	// using bootstrap class '.clearfix'
	function setClearfix() {
		// 기존의 .clearfix code 삭제
		$( ".clearfix" ).each(function() {
			$( this ).remove();
		})
		
		// window size별 column size정리
		var productCount = $( "#total-products" ).children().length;
		var width = $( window ).width();
		var columnSize = 0;
		if ( width >= 1200 ) {
			// large device
			columnSize = 4;
		} else if ( width >= 992 ) {
			// middle device
			columnSize = 3;
		} else if ( width >= 768 ) {
			// small device
			// extra small device -> go through
			columnSize = 2;
		}
		
		// .clearfix code 추가
		var contents = $("div[content]");
		// console.log(contents);
		contents.each(function () {
			if ( ($.inArray( this, contents ) + 1) % columnSize == 0 ) {
				$( this ).after('<div class="clearfix"></div>');
			}
			// console.log($.inArray(this, contents));
		})
	}
</script>
<title>All</title>
</head>
<body>
	<div class="container">
		<div class="row" id="total-products">
			<c:forEach items="${productPage.productList }" var="product" varStatus="status">
				<div class="col-sm-6 col-md-4 col-lg-3" content="product">
					<div class="thumbnail">
						<a href="./productDetail.do?&productNo=${product.no }">
							<img src="img/${product.image }" class="img-responsive" alt="제품이미지" />
						</a>
						<div class="caption">
							<h3>${product.name}</h3>
							<p>${product.content}</p>
							<h4>${product.price}원</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav class="row text-center">
			<!-- pagination -->
			<ul class="pagination">
				<li id="previousPager"><a href="product.do?category=${category }&page=${requestPage - 1 }"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
				<c:forEach begin="${productPage.startPage }" end="${productPage.endPage }" var="page">
					<c:choose>
						<c:when test="${page == productPage.requestPage }">
							<li class="active"><a href="#">${page }</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="product.do?category=${category }&page=${page }">${page }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li id="nextPager"><a href="product.do?category=${category }&page=${requestPage + 1 }"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
			</ul><!-- /.pagination -->
			<input type="hidden" id="startPage" value="${productPage.startPage }">
			<input type="hidden" id="endPage" value="${productPage.endPage }">
			<input type="hidden" id="requestPage" value="${productPage.requestPage }">
		</nav>
	</div>
</body>
</html>