<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
<link href="/resources/css/table.css" rel="stylesheet" type = "text/css">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">공지사항</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class = "panel-heading">
						Notice Board
						<button id = "regBtn" type = "button" class = "btn btn-xs pull-right">Register New NoticeBoard</button>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
							
							<c:forEach items = "${list}" var = "Nboard">
								<tr>
									<td>${Nboard.bno}</td>
									<td>${Nboard.title}</td>
									<td>${Nboard.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${Nboard.regdate}" /></td>
								</tr>
							</c:forEach>
						</table>
						<div class = 'pull-right'>
							<ul class = "pagination">
								<c:if test = "${paging.prev}">
									<li class = "paginate_button previous"><a href = "${paging.startPage -1}">Previous</a></li>
								</c:if>
								<c:forEach var = "num" begin = "${paging.startPage}"
								end = "${paging.endPage}">
									<li class = "paginate_button ${paging.cri.pageNum == num ? "active":""}"><a href = "${num}">${num}</a></li>
								</c:forEach>
								<c:if test = "${paging.next}">
									<li class = "paginate_button next"><a href = "${paging.endPage + 1}">Next</a></li>
								</c:if>
							</ul>
						</div>
						<form id = "actionForm" action = "/NoticeBoard/noticelist" method = "get">
							<input type = "hidden" name = "pageNum" value = "${paging.cri.pageNum}">
							<input type = "hidden" name = "amount" value = "${paging.cri.amount}">
						</form>
					</div>
				</div>
			</div>
		</div>
<%@ include file="../includes/footer.jsp"%>
<script type = "text/javascript">
var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>