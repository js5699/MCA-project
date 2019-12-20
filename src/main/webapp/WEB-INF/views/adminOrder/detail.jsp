<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<div class="row formContainer AdminMenuSubtitle">
	<div class="col-lg-10">
		<h5>관리자 <i class="fas fa-caret-right"></i> 주문 관리 <i class="fas fa-caret-right"></i> ${order.orderid}</h5>
	</div>
	<div class="col-lg-2 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/adminOrder/list'">목록</button>
	</div>
</div>

<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5><i class="fas fa-receipt"></i>주문 정보</h5>
	</div>
</div>
<table class="table table-bordered">
	<tr>
		<th class="order-row-group">주문번호</th>
		<td class="order-row-group">${order.orderid}</td>
		<th class="order-row-group">주문일</th>
		<td class="text-right">
			<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderdate}" /><br />
			<i class="far fa-clock"></i> <fmt:formatDate pattern="HH시 mm분 ss초" value="${order.orderdate}" />
		</td>
	</tr>
	<tr>
		<th>진행 상태</th>
		<td colspan="3">
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
	</tr>
	<tr>
		<th>주문 요약</th>
		<td>${order.orderbook}</td>
		<th>총 주문 금액</th>
		<td class="text-right"><fmt:formatNumber value="${order.totalprice}" pattern="#,###" />원</td>
	</tr>
</table>
<table class="table table-bordered">
	<tr>
		<th style="width:20%">주문ID</th>
		<td style="width:20%"><a href="/adminUser/info?userid=${order.userid}">${order.userid} <i class="fas fa-external-link-alt"></i></a></td>
		<th rowspan="2" style="width:20%" class="order-row-group">배송지</th>
		<td rowspan="2">(우)${order.dzipcode}<br />${order.daddress1}<br />${order.daddress2}</td>
	</tr>
	<tr>
		<th>수령자명</th>
		<td>${order.dname}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${order.dtell}</td>
		<th>배송메세지</th>
		<td>${!empty order.dmsg ? order.dmsg : '-'}</td>
	</tr>
</table>


<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5><i class="fas fa-archive"></i>주문 상품</h5>
	</div>
</div>
<table class="table orderList">
</table>


<nav aria-label="Page navigation" class="navigation">
</nav>


<script type="text/javascript" src="/resources/js/order.js"></script>
<script>
	$(document).ready(function() {
		
		var orderidValue = '<c:out value="${order.orderid}"/>';
		var orderDetailTable = $(".orderList");
		
		showOrderDetail(1);
		
		function showOrderDetail(page) {
			
			console.log("show order detail list" + page);
			
			orderDetailService.getList({orderid:orderidValue, page: page || 1}, function(itemsCnt, list){
				
				console.log("order detail list count(itemsCnt) : " + itemsCnt);
				console.log("list: " + list);
				
				if(page == -1) {
					pageNum = Math.ceil(itemsCnt/10.0);
					showOrderDetail(pageNum);
					return;
				}
				
				str = "<tr><th colspan='2' style='width:70%'>상품명</th><th style='width:10%'>수량</th><th class='text-right' style='width:20%'>금액</th></tr>";
				
				if(list == null || list.length == 0) {
					return;
				}
				
				for (var i = 0, len = list.length || 0; i<len; i++) {
					
					str += "<tr>";
					str +=  "<td colspan='2'><a href='"+list[i].productid+"'><span class='book-title text-body'>" + list[i].ptitle + " <i class='fas fa-external-link-alt'></span></i></a></td>";
					str +=  "<td>" + list[i].ea + "</td>";
					str +=  "<td class='text-right'>" + list[i].saleprice.toLocaleString() + "원</td>";
					str += "</tr>";
				}
				
				orderDetailTable.html(str);
				
				showOrderDetailListNavigation(itemsCnt);
				
			});
		}
		
		orderDetailPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showOrderDetail(pageNum);
		});
		
		
	});
</script>
<script type="text/javascript">
	var pageNum = 1;
	var orderDetailPageFooter = $(".navigation");
	
	function showOrderDetailListNavigation(itemsCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if( endNum * 10 >= itemsCnt ) {
			endNum = Math.ceil(itemsCnt/10.0);
		}
		
		if( endNum * 10 < itemsCnt ) {
			next = true;
		}
		
		var str = "<ul class='pagination justify-content-end'>";
		
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href=''" + (startNum-1) + "'>Prev</a></li>";
		}
		
		for(var i = startNum ; i <= endNum ; i++ ) {
			
			var active = pageNum == i? "active" : "";
			
			str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			
		}
		
		if(next) {
			str += "<li class='page-item'><a class='page-link' href='" + (endNum+1) + "'>Next</a></li>";
		}
		
		str += "</ul>";
		
		console.log(str);
		
		orderDetailPageFooter.html(str);
	}
</script>
<%@ include file="../includes/footer.jsp"%>