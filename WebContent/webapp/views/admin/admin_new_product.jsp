<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ��� ������</title>
<script type="text/javascript">
// 	$(".dropdown-toggle").dropdown();
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-10 col-lg-offset-1">
			<div class="page-header">
				<h1>��ǰ �߰�</h1>
			</div>
			<div class="well">
				<form class="form-horizontal" action="addNewProduct.do" method="post">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-2 control-label"class="col-lg-2 control-label" for="name">��ǰ �̸�</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="name" id="name"
									placeholder="��ǰ �̸�">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="color">��ǰ ����</label>
							<select name="color" id="color">
								<option value="WHITE">WHITE</option>
								<option value="BLUE">BLUE</option>
								<option value="BLACK">BLACK</option>
								<option value="ORANGE">ORANGE</option>
								<option value="GRAY">GRAY</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="price">��ǰ ����</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="price" id="price"
									placeholder="��ǰ ����">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="image">��ǰ �̹���</label>
							<div class="col-lg-8">
								<input type="file" class="form-control input-md" name="image" id="image">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="content">��ǰ ������ ���� (24�� ����)</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="content" id="content"
									placeholder="��ǰ ������ ����">
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="detail">��ǰ �� ����</label>
							<div class="col-lg-8">
								<textarea class="form-control" name="detail" id="detail"
									placeholder="��ǰ �� ����"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="category">��ǰ ī�װ�</label>
							<div class="col-lg-8">
								<select name="category" id="category">
									<option value="top">TOP</option>
									<option value="bottom">BOTTOM</option>
									<option value="outer">OUTER</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"for="stock">���</label>
							<div class="col-lg-8">
								<input type="text" class="form-control input-md" name="stock" id="stock">
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="reset" class="btn btn-default">��� �����</button>
								<button type="submit" class="btn btn-primary">��ǰ���</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>