<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row formContainer AdminMenuSubtitle">
	<div class="col-lg-10">
		<h5>관리자 <i class="fas fa-caret-right"></i> 고객 관리 <i class="fas fa-caret-right"></i> ${user.userid}님의 회원 등록 정보</h5>
	</div>
	<div class="col-lg-2 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/adminUser/list'">목록</button>
	</div>
</div>

<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5>회원 정보</h5>
	</div>
	
	<div class="col-lg-6 text-right">
		<button type="button" class="btn btn-warning btn-sm" onclick="location.href='/adminUser/mod?userid=${user.userid}'">회원 정보 수정</button>
	</div>
</div>

<div class="row">
	<table class="table">
		<tr>
			<td colspan="2"><i class="far fa-calendar-alt"></i> 회원가입일 : <fmt:formatDate pattern="yyyy년 MM월 dd일 오후 h시 mm분 ss초" value="${user.regdate}" /></td>
		</tr>
		<tr>
			<th style="width:25%">아이디</th>
			<td>${user.userid}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${user.name}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${user.phone}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${user.email}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>(우)${user.zipcode}<br>${user.address1}<br>${user.address2}</td>
		</tr>
		<tr>
			<th>
				메모<i class="fas fa-question-circle" data-toggle="tooltip" data-html="true" title="<small>관리자만 확인할 수 있으며<br>회원에게 노출되지 않습니다.</small>"></i>
			</th>
			<td>${!empty user.adminMemo ? user.adminMemo : "-"}</td>
		</tr>
	</table>
</div>

<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5>주문 내역<small>(최근-오래된 순)</small></h5>
	</div>
	<div class="col-lg-6 text-right">
		<small><span class="badge badge-pill badge-info"><i class="fas fa-info"></i> </span>눌러서 주문 상태를 처리할 수 있습니다.</small>
	</div>
</div>

<div class="row">
	<table class="table orderList">
		<tr>
			<th></th>
			<th>주문번호</th>
			<th>주문일</th>
			<th>주문금액</th>
			<th>연락처</th>
			<th>상태</th>
			<th>상세보기</th>
		</tr>
		
	</table>
	
	<div class="orderListNav">
	</div>
</div>
<script type="text/javascript" src="/resources/js/order.js"></script>
<script>
	$(document).ready(function() {
		
		var useridValue = '<c:out value="${user.userid}"/>';
		var orderTable = $(".orderList");
		
		showOrderList(1);
		
		function showOrderList(page) {
			
			console.log("show order List " + page);
			
			orderListService.getList({userid:useridValue, page: page || 1}, function(orderCnt, list) {
				
				console.log("orderCount : " + orderCnt);
				console.log("list: " + list);
				
				if(page == -1) {
					pageNum = Math.ceil(orderCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
				if(list == null || list.length == 0) {
					return;
				}
				
				for (var i = 0, len = list.length || 0; i<len; i++) {
					str += "<tr>";
					str +=  "<td></td>";
					str +=  "<td>"+list[i].orderid+"</td>";
					str +=  "<td>"+orderListService.displayTime(list[i].orderdate)+"</td>";
					str +=  "<td>"+list[i].totalprice.toLocaleString();+"원</td>";
					str +=  "<td>"+list[i].dtell+"</td>";
					str +=  "<td>"+list[i].orderstatus+"</td>";
					str +=  "<td><a href="+list[i].orderid+" class='btn btn-sm'><i class='fas fa-search-plus'></i></a></td>";
					str += "</tr>";
				}
				
				orderTable.append(str);
				showOrderListNavigation(orderCnt)
			});
		}
	})
</script>
<script type="text/javascript">
	var pageNum = 1;
	var orderListPageFooter = $(".orderListNav");
	
	function showOrderListNavigation(orderCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if( endNum * 10 >= orderCnt ) {
			endNum = Math.ceil(orderCnt/10.0);
		}
		
		if( endNum * 10 > orderCnt ) {
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href=''" + (startNum-1) + "'>Prev</a></li>";
		}
		
		for(var i = startNum ; i <= endNum ; i++ ) {
			
			var active = pageNum == i? "active" : "";
			
			str += "<li class='page-item " + active + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			
		}
		
		if(next) {
			str += "<li calss='page-itrm'><a class='page-link' href='" + (endNum+1) + "'>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		
		orderListPageFooter.html(str);
	}
</script>
<%@ include file="../includes/footer.jsp"%>
<script>
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>