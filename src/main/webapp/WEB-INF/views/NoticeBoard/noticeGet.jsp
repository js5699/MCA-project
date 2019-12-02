<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class = "page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class = "panel panel-default">
			<div class = "panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class = "panel-body">
				<div class = "form-group">
					<label>Bno</label> <input class = "form-control" name = "bno"
					value = "<c:out value='${NB.bno}'/>" readonly="readonly">
				</div>
				<div class = "form-group">
					<label>Title</label> <input class = "form-control" name = "title"
					value = "<c:out value='${NB.title}'/>" readonly="readonly">
				</div>
				<div class = "form-group">
					<label>Text area</label>
					<textarea class = "form-control" rows = "3" name = "content"
					readonly="readonly"><c:out value = "${NB.content}"/></textarea>
				</div>
				<div class = "form-group">
					<label>Writer</label>
					<input class = "form-control" name = "writer"
					value = "<c:out value='${NB.writer}'/>" readonly="readonly">
				</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button data-oper = "modify" class = "btn btn-default">Modify</button>
					</sec:authorize>
					<button data-oper = "list" class = "btn btn-info">List</button>
				<form id = 'operForm' action = "/NoticeBoard/noticeModify" method = "get">
					<input type = "hidden" id = "bno" name = "bno" value = "<c:out value = '${NB.bno}'/>">
					<input type = "hidden" name = "pageNum" value = "<c:out value = '${cri.pageNum}'/>">
					<input type = "hidden" name = "amount" value = "<c:out value = '${cri.amount}'/>">
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
<script type = "text/javascript">
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/NoticeBoard/noticeModify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action", "/NoticeBoard/noticeList");
			operForm.submit();
		});
	});
</script>
