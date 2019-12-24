<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<div class="row formContainer">
	<div class="col-lg-10">
		<h5>관리자 <i class="fas fa-caret-right depth-arrow"></i> 주문 관리 <i class="fas fa-caret-right depth-arrow"></i> 주문번호 ${order.orderid}</h5>
	</div>
	<div class="col-lg-2 text-right">
		<button type="button" class="btn btn-primary btn-sm order-list" onclick="location.href='/adminOrder/list'">목록</button>
	</div>
</div>

<c:if test="${result eq 'success'}">
	<div class="alert alert-primary alert-dismissible fade show" role="alert">
		주문 진행 상태가 정상적으로 변경되었습니다.
		<button class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<div class="row">
	<div class="col-lg-6">
		<h5><i class="fas fa-receipt"></i>주문 정보</h5>
	</div>
</div>

<div class="row">
	<div class="col-lg-12 formContainer">
		<c:if test="${order.orderstatus != 'od06' and order.orderstatus != 'od6' and order.orderstatus != 'od07'}">
			<ul class="order-process rounded">
				<c:choose>
					<c:when test="${order.orderstatus == 'od01'}">
						<li class="step step-on">
							<span class="step-name step-name-on">결제완료</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송대기</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송중</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송완료</span>
						</li>
					</c:when>
					<c:when test="${order.orderstatus == 'od02'}">
						<li class="step step-on">
							<span class="step-name step-name-on">결제완료</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송대기</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송중</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송완료</span>
						</li>				
					</c:when>
					<c:when test="${order.orderstatus == 'od03'}">
						<li class="step step-on">
							<span class="step-name step-name-on">결제완료</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송대기</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송중</span>
						</li>
						<li class="step step-off">
							<span class="step-name step-name-off">배송완료</span>
						</li>				
					</c:when>
					<c:when test="${order.orderstatus == 'od04'}">
						<li class="step step-on">
							<span class="step-name step-name-on">결제완료</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송대기</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송중</span>
						</li>
						<li class="step step-on">
							<span class="step-name step-name-on">배송완료</span>
						</li>					
					</c:when>
				</c:choose>
			</ul>
			
		</c:if>
		<c:if test="${order.orderstatus == 'od05' or order.orderstatus == 'od06' or order.orderstatus == 'od07'}">
			<ul class="order-process">
				<li class="step step-cancel-on">
					<span class="step-name step-name-on"> 
						<c:choose>
							<c:when test="${order.orderstatus == 'od05'}">결제취소</c:when>
							<c:when test="${order.orderstatus == 'od06'}">주문취소</c:when>
							<c:when test="${order.orderstatus == 'od07'}">교환신청</c:when>
						</c:choose>
					</span>
				</li>
			</ul>
		</c:if>
	</div>
</div>
<table class="table table-bordered">
	<tr>
		<th class="order-row-group">주문번호</th>
		<td class="order-row-group">${order.orderid}</td>
		<th class="order-row-group">주문일</th>
		<td class="text-right">
			<i class="far fa-calendar-alt"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderdate}" />　
			<i class="far fa-clock"></i> <fmt:formatDate pattern="HH시 mm분 ss초" value="${order.orderdate}" />
		</td>
	</tr>
	<tr>
		<th>주문 요약</th>
		<td colspan="3">${order.orderbook}</td>
		
	</tr>
	<tr>
		<th>진행 상태</th>
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
		<th>총 주문 금액</th>
		<td class="text-right"><fmt:formatNumber value="${order.totalprice}" pattern="#,###" />원</td>
	</tr>
</table>

<div class="col-lg-12 text-right">
	<button class="btn btn-outline-primary btn-sm btn-order-mod" type="button" data-toggle="collapse" data-target="#order-modify" aria-expanded="false" aria-controls="order-modify">주문 진행 상태 변경 <i class="fas fa-angle-double-down"></i></button>
</div>
<div class="collapse" id="order-modify">
	<div class="card card-body card-order-mod">
		<form action="/adminOrder/detail" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="orderid" value="${order.orderid}"/>
			<div class="form-row align-items-center">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus01" name="orderstatus" value="od01" ${order.orderstatus == 'od01' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus01">결제완료</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus02" name="orderstatus" value="od02" ${order.orderstatus == 'od02' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus02">배송대기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus03" name="orderstatus" value="od03" ${order.orderstatus == 'od03' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus03">배송중</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus04" name="orderstatus" value="od04" ${order.orderstatus == 'od04' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus04">배송완료</label>
				</div>
			</div>
			<hr />
			<div class="form-row align-items-center">
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus05" name="orderstatus" value="od05" ${order.orderstatus == 'od05' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus05">결제취소</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus06" name="orderstatus" value="od06" ${order.orderstatus == 'od06' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus06">주문취소</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="orderstatus07" name="orderstatus" value="od07" ${order.orderstatus == 'od07' ? 'checked' : ''}> 
					<label class="custom-control-label" for="orderstatus07">교환신청</label>
				</div>
			</div>
			<hr />
			<div class="row ">
				<div class="col-lg-6 align-middle">
					 <small class="form-text text-muted"><i class="fas fa-exclamation-circle"></i> 선택 후 저장을 눌러야 반영됩니다.</small>
				</div>
				<div class="col-lg-6 align-middle text-right">
					<button class="btn btn-warning btn-sm" type="submit">저장</button>
				</div>
			</div>
		</form>
	</div>
</div>

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

<form action="/adminOrder/list" id="actionForm" method="get">
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<input type="hidden" name="kw_name" value="${cri.kw_name}"/>
	<input type="hidden" name="kw_oderid" value="${cri.kw_orderid}"/>
	<input type="hidden" name="kw_date_from" value="${cri.kw_date_from}"/>
	<input type="hidden" name="kw_date_to" value="${cri.kw_date_to}"/>
</form>

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
				
				str = "<tr><th colspan='2' style='width:70%'>상품명</th><th style='width:10%' class='text-center'>수량</th><th class='text-right' style='width:20%'>금액</th></tr>";
				
				if(list == null || list.length == 0) {
					return;
				}
				
				for (var i = 0, len = list.length || 0; i<len; i++) {
					
					str += "<tr>";
					str +=  "<td colspan='2'><a href='"+list[i].productid+"'><span class='book-title text-body'>" + list[i].ptitle + " <i class='fas fa-external-link-alt'></span></i></a></td>";
					str +=  "<td class='text-center'>" + list[i].ea + "</td>";
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
	
	var actionForm = $("#actionForm");
	
	$(".order-list").on("click", function(e) {
		e.preventDefault();
		actionForm.attr("action", "/adminOrder/list");
		actionForm.submit();
	});
</script>
<%@ include file="../includes/footer.jsp"%>