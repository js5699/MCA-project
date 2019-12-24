<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row formContainer">
	<div class="col-lg-10">
		<h5>관리자 <i class="fas fa-caret-right depth-arrow"></i> 고객 관리 <i class="fas fa-caret-right depth-arrow"></i> ${user.userid}님의 회원 등록 정보</h5>
	</div>
	<div class="col-lg-2 text-right">
		<button class="btn btn-primary btn-sm" data-oper="list">목록</button>
	</div>
</div>

<c:if test="${result eq 'success'}">
	<div class="alert alert-primary alert-dismissible fade show" role="alert">
		회원 정보가 정상적으로 수정되었습니다.
		<button class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5><i class="far fa-user"></i>회원 정보</h5>
	</div>
	
	<div class="col-lg-6 text-right">
		<button class="btn badge badge-primary" data-oper="modify"><i class="fas fa-user-cog"></i> 회원정보 수정</button>
	</div>
</div>
<table class="table">
	<tr>
		<td colspan="4"><i class="far fa-calendar-alt"></i> 회원가입일 : <fmt:formatDate pattern="yyyy년 MM월 dd일 오후 h시 mm분 ss초" value="${user.regdate}" /></td>
	</tr>
	<tr>
		<th style="width:25%">아이디</th>
		<td>${user.userid}</td>
		<th>이름</th>
		<td>${user.name}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${user.phone}</td>
		<th>이메일</th>
		<td>${user.email}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">(우)${user.zipcode}<br>${user.address1}<br>${user.address2}</td>
	</tr>
	<tr>
		<th>
			메모<i class="fas fa-question-circle text-info" data-toggle="tooltip" data-html="true" title="<small>관리자만 확인할 수 있으며<br>회원에게 노출되지 않습니다.</small>" ></i>
		</th>
		<td colspan="3">${!empty user.adminMemo ? user.adminMemo : "-"}</td>
	</tr>
</table>


<div class="row formContainer-top">
	<div class="col-lg-6">
		<h5><i class="fas fa-clipboard-list"></i>주문 내역<small>(최근-오래된 순)</small></h5>
	</div>
	<div class="col-lg-6 text-right">
		<small class="totalCount"></small>
	</div>
</div>
<table class="table orderList">
</table>


<nav aria-label="Page navigation" class="navigation">
</nav>

<form action="/adminOrder/mod" id="operForm" method="get">
	<input type="hidden" name="userid" id="userid" value="${user.userid}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<input type="hidden" name="kw_name" value="${cri.kw_name}"/>
	<input type="hidden" name="kw_date_from" value="${cri.kw_date_from}"/>
	<input type="hidden" name="kw_date_to" value="${cri.kw_date_to}"/>
</form>

<script type="text/javascript" src="/resources/js/order.js"></script>
<script>
	$(document).ready(function() {
		
		$('[data-toggle="tooltip"]').tooltip()
		
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/adminUser/mod").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#userid").remove();
			operForm.attr("action", "/adminUser/list");
			operForm.submit();
		});
		
		
		var useridValue = '<c:out value="${user.userid}"/>';
		var orderTable = $(".orderList");
		var totalCountSpan = $(".totalCount");
		
		showOrderList(1);
		
		function showOrderList(page) {
			
			console.log("show order List " + page);
			
			orderListService.getList({userid:useridValue, page: page || 1}, function(orderCnt, list) {
				
				console.log("orderCount : " + orderCnt);
				console.log("list: " + list);
				
				if(page == -1) {
					pageNum = Math.ceil(orderCnt/10.0);
					showOrderList(pageNum);
					return;
				}
				
				var str = "<tr><th></th><th>주문번호</th><th>주문일</th><th>주문금액</th><th>연락처</th><th>상태</th><th class='text-center'>상세보기</th></tr>";
				
				if(list == null || list.length == 0) {
					return;
				}
				
				for (var i = 0, len = list.length || 0; i<len; i++) {
					str += "<tr>";
					str +=  "<td></td>";
					str +=  "<td>"+list[i].orderid+"</td>";
					str +=  "<td>"+orderListService.displayTime(list[i].orderdate)+"</td>";
					str +=  "<td>"+list[i].totalprice.toLocaleString()+"원</td>";
					str +=  "<td>"+list[i].dtell+"</td>";
					str +=  "<td>"+list[i].orderstatus+"</td>";
					str +=  "<td class='text-center'><a href='/adminOrder/detail?orderid="+list[i].orderid+"' class='btn btn-sm'><i class='fas fa-search-plus text-primary'></i></a></td>";
					str += "</tr>";
				}
				
				orderTable.html(str);
				totalCountSpan.text("총 " + orderCnt + "건");
				showOrderListNavigation(orderCnt);
			});
		}
		
		orderListPageFooter.on("click", "li a", function(e) {
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum);
			
			pageNum = targetPageNum;
			
			showOrderList(pageNum);
		});
	});
</script>
	
<script type="text/javascript">
	var pageNum = 1;
	var orderListPageFooter = $(".navigation");
	
	function showOrderListNavigation(orderCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if( endNum * 10 >= orderCnt ) {
			endNum = Math.ceil(orderCnt/10.0);
		}
		
		if( endNum * 10 < orderCnt ) {
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
		
		orderListPageFooter.html(str);
	}
</script>
<%@ include file="../includes/footer.jsp"%>
