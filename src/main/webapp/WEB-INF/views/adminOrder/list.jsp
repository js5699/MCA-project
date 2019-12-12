<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp" %>

	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="nowDate"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>

	<div class="row formContainer">
		<h5 class="pageSubtitle">관리자 <i class="fas fa-caret-right"></i> 주문 관리</h5>
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
		
		<table class="table customerList orderList table-hover">
			<tr>
				<th></th>
				<th>주문자</th>
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
					<td>${order.userid}</td>
					<td class="text-left">
						${order.orderid}<br />
						<fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderdate}" />
						<fmt:formatDate pattern="HH시 mm분 ss초" value="${order.orderdate}" />
					</td>
					<td class="text-left">${order.orderbook }</td>
					<td><fmt:formatNumber value="${order.totalprice}" pattern="#,###" />원</td>
					<td>
						<c:choose>
							<c:when test="${order.orderstatus == 'od01'}"><span>결제완료</span></c:when>
							<c:when test="${order.orderstatus == 'od02'}"><span>배송대기</span></c:when>
							<c:when test="${order.orderstatus == 'od03'}"><span>배송중</span></c:when>
							<c:when test="${order.orderstatus == 'od04'}"><span>배송완료</span></c:when>
							<c:when test="${order.orderstatus == 'od05'}"><span>결제취소</span></c:when>
							<c:when test="${order.orderstatus == 'od06'}"><span>주문취소</span></c:when>
							<c:when test="${order.orderstatus == 'od07'}"><span>교환신청</span></c:when>
							<c:otherwise>-</c:otherwise>
						</c:choose>
					</td>
					<td><a href="/adminOrder/userOrder-detail?orderid=${order.orderid}"><i class="fas fa-angle-double-right"></i></a></td>
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
	
	<script>
		function nullCheck() {
			cf = document.criteriaForm;
			if ( cf.keywword.value == "") {
				alert("검색어를 입력해주세요.");
				cf.keywword.focus();
				return false;
			} else {
				return true;
			}
		}
	</script>
<%@ include file="../includes/footer.jsp"%>