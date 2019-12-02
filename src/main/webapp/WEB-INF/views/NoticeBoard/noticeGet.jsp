<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<%@ include file="../includes/header.jsp"%>

	<div class="row formContainer">
		<div class="col-md-12 ">
			<h4>공지사항</h4>
		</div>
		
		<div class="col-lg-12">
			<div class="row ">
				<div class="col-md-12 bd_container">
					<h5><c:out value="${NB.title}"/></h5>
					<p class="bd_information"><i class="far fa-calendar"></i><fmt:formatDate pattern="yyyy-MM-dd" value="${NB.regdate}" /></p>
				</div>
				<div class="col-md-12 bd_container">
					<p>${fn:replace(NB.content, replaceChar, "<br/>")}</p>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 formContainer btnBox">
			<div class="d-flex justify-content-end">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<button data-oper="modify" class="btn btn-warning">수정</button>
				</sec:authorize>
				<button data-oper="list" class="btn btn-light">목록</button>
			</div>
			
			<form id='operForm' action="/NoticeBoard/noticeModify" method="get">
				<input type="hidden" id="bno" name="bno" value="<c:out value='${NB.bno}'/>">
				<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
				<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
			</form>
		</div>
		
	</div><!-- row formContainer -->


<%@ include file="../includes/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		var operForm=$("#operForm");
		
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
