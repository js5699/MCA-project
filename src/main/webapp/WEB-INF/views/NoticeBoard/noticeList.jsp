<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

	<div class="row formContainer">
		<h5>공지사항</h5>
	</div>

	<div class="row formContainer">
		<table class="table table-hover">
			<tr>
				<th width="10%">번호</th>
				<th>제목</th>
				<th width="15%">등록일</th>
			</tr>

			<c:forEach items="${list}" var="Nboard">
				<tr>
					<td>${Nboard.bno}</td>
					<td><a class="move" href="${Nboard.bno}">${Nboard.title}</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Nboard.regdate}" /></td>
				</tr>
			</c:forEach>
		</table>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="col-sm-12 d-flex justify-content-end btnBox">
				<button id="regbtn" type="button" class="btn btn-primary">글쓰기</button>
			</div>
		</sec:authorize>
	</div>
	
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-end">
			<c:if test="${paging.prev}">
				<li class="page-item">
					<a href="${paging.startPage -1}" class="page-link">이전</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
				<li class="page-item ${paging.cri.pageNum == num ? 'active' : ''}">
					<a href="${num}" class="page-link">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${paging.next}">
				<li class="paginate_button next">
					<a class="page-link" href="${paging.endPage + 1}">Next</a>
				</li>
			</c:if>
			
		</ul>
	</nav>
	
	<form id="actionForm" action="/NoticeBoard/noticeList" method="get">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
	</form>
	
<%@ include file="../includes/footer.jsp"%>

<script type = "text/javascript">
	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".page-link").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$("#regbtn").on("click", function() {
			self.location = "/NoticeBoard/noticeRegister";
		});

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type= 'hidden' name='bno' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/NoticeBoard/noticeGet");
			actionForm.submit();
		});
	});
</script>