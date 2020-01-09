<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp"%>


<c:if test="${result != null}">
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		<c:if test="${result eq 'remove'}">
			<strong>삭제 완료</strong>
		</c:if>
		<c:if test="${result eq 'register'}">
			<strong>등록 완료</strong>
		</c:if>
		<c:if test="${result eq 'modify'}">
			<strong>수정 완료</strong>
		</c:if>
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>
<div class="col-md-12 ">
	<h4>관리자 페이지</h4>
</div>

<input type = "checkbox" id = "allChk">전체 선택

<div class="row">
	
	<c:forEach items="${list}" var="Plist">
		<div class="col-lg-4 col-md-6 mb-4">
		<input type="checkbox" name = "chk" value = "${Plist.productId}" style="float: left">
			<div class="card h-100">
				<a href="/adminProduct/modify?productId=${Plist.productId}"><img class="card-img-top"
					src="/adminProduct/display?fileName=${Plist.pimg}&cid=${Plist.cid}" alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="/adminProduct/modify?productId=${Plist.productId}">${Plist.ptitle}</a>
					</h4>
					<h5>${Plist.price}원</h5>
					<p class="card-text">
						${Plist.publisher}<br>
						${Plist.author}<br>
						<fmt:formatDate pattern="yyyy-MM-dd" value="${Plist.pubdate}" />
					</p>
				</div>
				<div class="card-footer btnBox">
					<div class="d-flex justify-content-end">
						<form action="/adminProduct/modify" method="get" id = "form">
							<input type = "hidden" name = "productId" value = "${Plist.productId}">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<button type = "submit" name = "modify" class = "btn btn-warning">수정</button>
							<button name = "remove" class = "btn btn-danger">삭제</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="col-lg-12 formContainer btnBox">
		<div class="d-flex justify-content-end">
			<form action="/adminProduct/chkRemove" method="post" id = "chkForm">
				<input type = "hidden" name = "chkProductId" value = "">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button type = "submit" name = "chkRemove" class = "btn btn-danger">선택 삭제</button>
			</form>
		</div>
	</div>
</div>
<!-- /.row -->

</div>
<!-- /.col-lg-9 -->

</div>
<!-- /.row -->
<%@ include file="../includes/footer.jsp"%>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	var form = $("#form");
	$("button[name='remove']").on("click", function(e){
		e.preventDefault();
		form.attr("method", "post");
		form.attr("action", "/adminProduct/remove");
		form.submit();
	});
	
	$("#allChk").on("click", function(){
		if($("#allChk").prop("checked")){
			$("input[name='chk']").prop("checked", true);
		}else{
			$("input[name='chk']").prop("checked", false);
		}
	});
	
	
	var chkLength = $("input[name='chk']").length;
	$("input[name='chk']").on("click", function(){
		if(chkLength == $("input[name='chk']:checked").length){
			$("#allChk").prop("checked", true);
		}else{
			$("#allChk").prop("checked", false);
		}
	});
	
	$("button[name='chkRemove']").on("click", function(e){
		e.preventDefault();
		var result = confirm("정말로 삭제하시겠습니까?");
		if(result){
			var chkForm = $("#chkForm");
			var chkProductId = [];
			$("input[name='chk']:checked").each(function(){
				chkProductId.push($(this).val());
	        });
			$("input[name=chkProductId]").prop("value", chkProductId);
			chkForm.submit();
		}
		
		
	});
	
});
</script>