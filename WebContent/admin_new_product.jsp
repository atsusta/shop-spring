<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품등록 페이지</title>
<script type="text/javascript">
// 	$(".dropdown-toggle").dropdown();
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="page-header">
				<h1>상품 추가</h1>
			</div>
			<div class="well">
				<form class="form-horizontal" action="addNewProduct.do" method="post">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-2 control-label"class="col-lg-2 control-label" for="name">상품 이름</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="name" id="name"
									placeholder="상품 이름">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="color">상품 색상</label>
							<select name="color" id="color">
								<option value="WHITE">WHITE</option>
								<option value="BLUE">BLUE</option>
								<option value="BLACK">BLACK</option>
								<option value="ORANGE">ORANGE</option>
								<option value="GRAY">GRAY</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="price">상품 가격</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="price" id="price"
									placeholder="상품 가격">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="image">상품 이미지</label>
							<div class="col-lg-8">
								<input type="file" class="form-control input-md" name="image" id="image">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="content">상품 간단한 내용 (24자 내외)</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="content" id="content"
									placeholder="상품 간단한 내용">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="detail">상품 상세 내용</label>
							<div class="col-lg-8">
								<textarea class="form-control" name="detail" id="detail"
									placeholder="상품 상세 내용"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="category">상품 카테고리</label>
							<div class="col-lg-8">
								<select name="category" id="category">
									<option value="top">TOP</option>
									<option value="bottom">BOTTOM</option>
									<option value="outer">OUTER</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="stock">재고</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="stock" id="stock">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">모두 지우기</button>
								<button type="submit" class="btn btn-primary">상품등록</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>