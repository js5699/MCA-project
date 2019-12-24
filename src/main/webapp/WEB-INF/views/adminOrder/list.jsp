<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/resources/css/datepicker3.css" />
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap-datepicker.kr.js"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>



<div class="row formContainer">
	<h5>관리자 <i class="fas fa-caret-right depth-arrow"></i> 주문 관리</h5>
</div>

<div class="row">
	<div class="card col-lg-12">
		<div class="card-body">
			<p><i class="fas fa-search"></i>검색조건</p>
			<form action="/adminOrder/list" method="get" class="form-horizontal" name="searchForm">
				<div class="form-group row">
					<label for="inputuserid" class="col-sm-2">이름 OR 아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control form-control-sm" id="inputkw-name" name="kw_name" placeholder="홍길동" value="${pageMaker.cri.kw_name}">
					</div>
					
					<label for="inputuserid" class="col-sm-2">주문 번호</label>
					<div class="col-sm-3">
						<input type="text" class="form-control form-control-sm" id="inputkw-orderid" name="kw_orderid" placeholder="20190725123" value="${pageMaker.cri.kw_orderid}">
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
					<label for="inputuserid" class="col-sm-2 text-center">~</label>
					<div class="input-group col-sm-3 date">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="far fa-calendar-alt"></i>
							</div>
						</div>
						<input type="text" class="form-control form-control-sm text-info" id="datepickerTo" name="kw_date_to" placeholder="2019-01-31" autocomplete="off" data-date-end-date="0d" value="${pageMaker.cri.kw_date_to}">
					</div>
					<div class="col-sm-2 text-right">
				    	<button class="btn btn-primary btn-sm">검색</button>
				    </div>
				</div>
			</form>
		</div>
	</div>

</div>

<div class="row formContainer">
	<div class="col-sm-6">
		<c:if test="${!empty pageMaker.cri.kw_name}"><span class="badge badge-pill badge-info">${pageMaker.cri.kw_name}</span></c:if>
		<c:if test="${!empty pageMaker.cri.kw_orderid}"><span class="badge badge-pill badge-info">${pageMaker.cri.kw_orderid}</span></c:if>
		<c:if test="${!empty pageMaker.cri.kw_date_from}"><span class="badge badge-pill badge-info">${pageMaker.cri.kw_date_from} ~ ${pageMaker.cri.kw_date_to}</span></c:if>
    </div>
    <div class="col-sm-6 text-right">
    	<p><small><i class="fas fa-list-ul"></i>전체 <span class="text-primary">${total}</span>건 · 10개씩 ${pageMaker.cri.pageNum}/${pageMaker.endPage}페이지</small></p>
    </div>

	<table class="table customerList orderList table-hover">
		<tr>
			<th></th>
			<th>주문 ID</th>
			<th>
				주문 번호<br />
				주문 시간
			</th>
			<th>상품명</th>
			<th>주문 금액</th>
			<th colspan="2">주문 상태</th>
		</tr>
		
		<c:forEach var="order" items="${list}" varStatus="s">
			<fmt:formatDate pattern="yyyyMMdd" value="${order.orderdate}" var="orderDate" />
			<tr ${nowDate eq orderDate ? ' class="todayOrder"' : ''}>
				<td>${s.count}</td>
				<td><a href="/adminUser/info?userid=${order.userid}" class="text-info">${order.userid}</a></td>
				<td class="text-left">
					<span class="text-secondary">${order.orderid}</span><br />
					<fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderdate}" />
					<fmt:formatDate pattern="HH시 mm분 ss초" value="${order.orderdate}" />
				</td>
				<td class="text-left">${order.orderbook }</td>
				<td><fmt:formatNumber value="${order.totalprice}" pattern="#,###" />원</td>
				<td>
					<c:choose>
						<c:when test="${order.orderstatus == 'od01'}"><span class="text-primary">결제완료</span></c:when>
						<c:when test="${order.orderstatus == 'od02'}"><span class="text-warning">배송대기</span></c:when>
						<c:when test="${order.orderstatus == 'od03'}"><span class="text-success">배송중</span></c:when>
						<c:when test="${order.orderstatus == 'od04'}"><span class="text-info">배송완료</span></c:when>
						<c:when test="${order.orderstatus == 'od05'}"><span class="text-muted">결제취소</span></c:when>
						<c:when test="${order.orderstatus == 'od06'}"><span class="text-muted">주문취소</span></c:when>
						<c:when test="${order.orderstatus == 'od07'}"><span class="text-danger">교환신청</span></c:when>
						<c:otherwise>-</c:otherwise>
					</c:choose>
				</td>
				<td><a href="${order.orderid}" class="text-dark order-info"><i class="far fa-edit"></i></a></td>
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
	<input type="hidden" name="kw_name" value="${pageMaker.cri.kw_name}"/>
	<input type="hidden" name="kw_oderid" value="${pageMaker.cri.kw_orderid}"/>
	<input type="hidden" name="kw_date_from" value="${pageMaker.cri.kw_date_from}"/>
	<input type="hidden" name="kw_date_to" value="${pageMaker.cri.kw_date_to}"/>
</form>

<script type='text/javascript'>
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
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		
/* 		//selected 된것이 없을 때
		if( !searchForm.find("option:selected").val() ){
			alert("검색종류를 선택하세요.");
			return false;
		}
		
		//keyword 필드 null일때
		if( !searchForm.find("input[name='keyword']").val() ){
			alert("키워드를 입력하세요.");
			return false;
		}
		 */
		//검색결과는 1page로 이동
		searchForm.find("input[name='pageNum']").val("1");
		
		e.preventDefault();
		
		searchForm.submit();
		
	});
	
	
	var actionForm = $("#actionForm");
	
	$(".order-info").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='orderid' value='"+ $(this).attr("href") + "'>");
		actionForm.attr("action", "/adminOrder/detail");
		actionForm.submit();
	});
</script>

<%@ include file="../includes/footer.jsp"%>