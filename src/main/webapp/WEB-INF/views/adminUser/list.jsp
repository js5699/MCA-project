<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/datepicker3.css" />
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.kr.js"></script>

	
	<div class="row formContainer">
		<h5 class="pageSubtitle">관리자 <i class="fas fa-caret-right"></i> 고객 관리</h5>
	</div>

	<div class="row">
		<div class="card col-lg-12">
			<div class="card-body">
				<p><i class="fas fa-search"></i>회원 검색</p>
				<form action="/adminUser/list" method="get" class="form-horizontal" name="searchForm">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
					<div class="form-group row">
						<label for="inputuserid" class="col-sm-2">이름 OR 아이디</label>
						<div class="col-sm-3">
							<input type="text" class="form-control form-control-sm" id="inputkw-name" name="kw_name" placeholder="홍길동" value="${pageMaker.cri.kw_name}">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputuserid" class="col-sm-2">주문 일자</label>
						<div class="input-group col-sm-3 date">
							<div class="input-group-prepend">
								<div class="input-group-text ">
									<i class="far fa-calendar-alt"></i>
								</div>
							</div>
							<input type="text" class="form-control form-control-sm text-info" id="datepickerFrom" name="kw_date_from" placeholder="2019-01-01" autocomplete="off" data-date-end-date="0d" value="${pageMaker.cri.kw_date_from}">
						</div>
						<label for="inputuserid" class="col-sm-1 text-center">~</label>
						<div class="input-group col-sm-3 date">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="far fa-calendar-alt"></i>
								</div>
							</div>
							<input type="text" class="form-control form-control-sm text-info" id="datepickerTo" name="kw_date_to" placeholder="2019-01-31" autocomplete="off" data-date-end-date="0d" value="${pageMaker.cri.kw_date_to}">
						</div>
						<div class="col-sm-3 text-right">
					    	<button class="btn btn-primary btn-sm">검색</button>
					    </div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
	<div class="row formContainer">
		<p class="text-right" style="width:100%"><small><i class="fas fa-list-ul"></i>전체 ${total}건 · 10개씩 ${pageMaker.cri.pageNum}/${pageMaker.endPage}페이지</small></p>
		
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
					<td>
						<c:if test="${!empty user.orderid}">
							<a href="/adminOrder/detail?orderid=${user.orderid}">${user.orderid}</a>
						</c:if>
						<c:if test="${empty user.orderid}">-</c:if>
					</td>
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
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a href="${pageMaker.startPage -1}" class="page-link">이전</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
					<a href="${num}" class="page-link">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
				</li>
			</c:if>
		</ul>
	</nav>
	
	<form action="/adminOrder/list" id="actionForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
		<input type="hidden" name="kw_name" value="${pageMaker.cri.type}"/>
		<input type="hidden" name="kw_date_from" value="${pageMaker.cri.kw_date_from}"/>
		<input type="hidden" name="kw_date_to" value="${pageMaker.cri.kw_date_to}"/>
	</form>

	<script type="text/javascript">
	$(document).ready(function() {
		
		$('#datepickerFrom').datepicker({
			calendarWeeks: false,
	        todayHighlight: true,
	        autoclose: true,
	        format: "yyyy-mm-dd",
	        language: "kr"
		 });
		
		$('#datepickerTo').datepicker({
			calendarWeeks: false,
	        todayHighlight: true,
	        autoclose: true,
	        format: "yyyy-mm-dd",
	        language: "kr"
		});

		
		var actionForm = $("#actionForm");

		$(".usermod").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userid' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/adminUser/mod");
			actionForm.submit();
		});
		
		$(".userinfo").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='userid' value='"+ $(this).attr("href") + "'>");
			actionForm.attr("action", "/adminUser/info");
			actionForm.submit();
		});
		
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
	</script>


<%@ include file="../includes/footer.jsp"%>