<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>
	
	<div class="row formContainer">
		<h5 class="pageSubtitle">관리자 <i class="fas fa-caret-right"></i> 고객 관리</h5>
	</div>

	<div class="row">
		<div class="card col-lg-12">
			<div class="card-body">
				<p><i class="fas fa-search"></i>검색조건</p>
				<form action="/adminUser/list" method="post" class="form-horizontal" name="criteriaForm">
					<div class="form-group row">
						<label for="inputuserid" class="col-sm-3">아이디 혹은 이름</label>
						<div class="col-sm-3">
							<select class="custom-select custom-select-sm" name="pkType">
								<option value="N">이름</option>
								<option value="I">아이디</option>
							</select>
						</div>
						<div class="col-sm-4">
							<input type="text" class="form-control form-control-sm" id="inputuserid" name="keywword" placeholder="keyword">
						</div>
						<div class="col-sm-2 text-right">
					    	<button type="submit" class="btn btn-primary btn-sm" onclick="return nullCheck()">검색</button>
					    </div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
	<div class="row formContainer">
		<p class="text-right" style="width:100%"><small>전체 ${total}건 · 10개씩 ${paging.cri.pageNum}/${paging.endPage}페이지</small></p>
		
		<table class="table customerList table-hover">
			<tr>
				<th></th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>최근 주문건</th>
				<th class="cell-justify-right">관리</th>
			</tr>
			
			<c:forEach var="user" items="${list}" varStatus="s">
				<tr>
					<td>${s.count}</td>
					<td>${user.userid}</td>
					<td>${user.name}</td>
					<td>${user.phone}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.regdate}" /></td>
					<td>${!empty user.orderid ? user.orderid : '-'}</td>
					<td class="cell-justify-right">
						<a href="${user.userid}" class="btn btn-outline-primary btn-sm usermod">정보수정</a>
						<a href="${user.userid}" class="btn btn-outline-info btn-sm userinfo">상세정보</a>
					</td>
				</tr>
			</c:forEach>
		</table>
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
	
	<form id="actionForm" action="/admiUser/list" method="get">
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
		<input type="hidden" name="amount" value="${paging.cri.amount}">
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".userinfo").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userid' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/adminUser/info");
			actionForm.submit();
		});
	});
	</script>


<%@ include file="../includes/footer.jsp"%>