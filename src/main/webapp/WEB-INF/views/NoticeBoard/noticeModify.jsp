<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar", "<br>"); %>

<%@ include file="../includes/header.jsp"%>
	
	<div class="row formContainer">
		
		<div class="col-md-12">
			<h4>공지사항</h4>
		</div>
		
		<form role="form" class="col-md-12 formContainer" action="/NoticeBoard/noticeModify" method="post" id="modifyForm">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
			<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
			<input type="hidden" name="bno" value="${NB.bno}" />
			<input type="hidden" name="writer" value="${NB.writer}" />
			
			<div class="form-group">
				<input class="form-control" name="title" value="<c:out value='${NB.title}'/>">
			</div>
			
			<div class="form-group">
				<textarea class="form-control" rows="10" name="content">${fn:replace(NB.content, replaceChar, "\\n")}</textarea>
			</div>
			<div class="form-group row">
			    <div class="col-sm-4">
			    	<p class="bd_information"><i class="far fa-calendar"></i>작성일: <fmt:formatDate pattern="yyyy-MM-dd" value="${NB.regdate}" /></p>
			    </div>
			    <div class="col-sm-4">
			    	<p class="bd_information"><i class="far fa-clock"></i>수정일: <fmt:formatDate pattern="yyyy-MM-dd" value="${NB.updateDate}" /></p>
			    </div>
			    <div class="col-sm-4 d-flex justify-content-end">
			    	<p class="bd_information"><i class="fas fa-user"></i><c:out value="${NB.writer}"/></p>
			    </div>
			</div>
		
			<div class="d-flex justify-content-end btnBox">
				<button type="submit" data-oper="modify" class="btn btn-warning">수정완료</button>
				<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
				<button type="submit" data-oper="list" class="btn btn-light">목록</button>
			</div>
		</form>
	</div>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj=$("#modifyForm");
		$("button").on("click", function(e){
			
			e.preventDefault();
			
			var operation=$(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove'){
				formObj.attr("action", "/NoticeBoard/noticeRemove");
			}else if(operation === 'list'){
				formObj.attr("action", "/NoticeBoard/noticeList").attr("method", "get");
				var pageNumTag=$("input[name='pageNum']").clone();
				var amountTag=$("input[name='amount']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}
			formObj.submit();
		});
	});
</script>