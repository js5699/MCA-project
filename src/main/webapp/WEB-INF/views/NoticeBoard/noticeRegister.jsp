<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">공지게시판</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class = "panel panel-default">
			
			<!-- /.panel-heading -->
			<div class = "panel-body">
				<form role = "form" action = "/NoticeBoard/noticeRegister" method = "post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class = "form-group">
						<label>제목</label> <input class = "form-control" name = "title">
					</div>
					<div class = "form-group">
						<label>내용</label>
						<textarea class = "form-control" rows = "3" name = "content"></textarea>
					</div>
					<div class = "form-group">
						<label>작성자</label>
						<input class = "form-control" name = "writer" value = "${user.name}" readonly="readonly">
					</div>
					<button type = "submit" class = "btn btn-light">게시물 등록</button>
					<button type="reset" class = "btn btn-light">다시쓰기</button>
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