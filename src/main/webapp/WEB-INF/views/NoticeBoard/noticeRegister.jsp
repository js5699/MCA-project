<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">NoticeBoard Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class = "panel panel-default">
			<div class = "panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class = "panel-body">
				<form role = "form" action = "/NoticeBoard/noticeRegister" method = "post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class = "form-group">
						<label>Title</label> <input class = "form-control" name = "title">
					</div>
					<div class = "form-group">
						<label>Text area</label>
						<textarea class = "form-control" rows = "3" name = "content"></textarea>
					</div>
					<div class = "form-group">
						<label>Writer</label>
						<input class = "form-control" name = "writer">
					</div>
					<button type = "submit" class = "btns btn-default">Submit Button</button>
					<button type="reset" class = "btns btn-default">Reset Button</button>
					<br><br>
				</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<%@ include file="../includes/footer.jsp"%>