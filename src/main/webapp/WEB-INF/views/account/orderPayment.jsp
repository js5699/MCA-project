<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
table, td, th {  
  border: 1px solid #ddd;
  text-align: left;
}

table {
  border-collapse: collapse;
  width: 100%;
}

th, td{
  padding: 10px;
}
</style>
<c:import url="../includes/header.jsp" />
<div class="row">
<h1 class="my-4">주문하기</h1><br>
	<form role="form" action="/account/orderPayment" method="post" style="width:100%">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
		
		<!-- <input type = "hidden" name = "userid" value = "<c:out value = '${order.userid}'/>"> -->
		<table class="table" id="table-2">
			<tr>
				<th>도서명</th>
				<th id="productid">도서코드</th>
				<th>구입 수량</th>
				<th>개당 가격</th>
				<th>합계</th>
			</tr>
			<c:set var="quantity" value="0" />
			<c:set var="totalprice" value="0" />
			<c:forEach items="${cartList}" var="cartList">
			<tr>
				<td>${cartList.ptitle}</td>
				<td id="productid-2">${cartList.productid}</td>
				<td>${cartList.productstock}</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${cartList.price}" />원</td>
				<td><fmt:formatNumber pattern="###,###,###" value="${cartList.price * cartList.productstock}" />원</td>
			</tr>
			<c:set var="quantity" value="${quantity + cartList.productstock}" />
			<c:set var="totalprice" value="${totalprice + (cartList.price * cartList.productstock)}" />
			</c:forEach>
			<!-- 첫번째 책제목 가져와서 넣기(미완) -->
			<input type="hidden" name="orderbook" id="orderbook" />
			<script>
			function firstbook(){
				//var firstTitle = document.getElementsByTagName('td')[0].childNodes[0].nodeValue;
				//$('#orderbook').val(firstTitle);
				var firstTitle = td.eq(1).text();
				$('#orderbook').val(firstTitle);
			}
			</script>
		</table>
		
		<div class="col-lg-12 text-right">
			<h4>총 개수 : ${quantity}권 &nbsp;
				총 금액 : <fmt:formatNumber pattern="###,###,###" value="${totalprice}" />원</h4>
		</div>
		<div class="col-lg-12"><h3 class="my-4">주문 정보 입력</h3></div>
		<div class="col-lg-12">
		<!-- <form role="form" method="post"  class="form-horizontal " action="/account/orderPayment"> -->
		
		<input type="hidden" name="orderid" value="${order.orderid}" />
		
		<div class="form-group">
			<label>수령자</label>
			<input class="form-control" style="width:20%" type="text" name="dname" required="required" />
		</div>
		<div class="form-group">
			<label>전화번호</label>
			<input class="form-control" style="width:20%" type="text" name="dtell" required="required" />
		</div>
		<div class="form-group">
			<label>우편번호</label>
			<input class="form-control" style="width:10%" type="text" name="dzipcode" required="required" />
		</div>
		<div class="form-group">
			<label>주소</label>
			<input class="form-control" style="width:60%" type="text" name="daddress1" required="required" />
		</div>
		<div class="form-group">
			<label>상세주소</label>
			<input class="form-control" style="width:60%" type="text" name="daddress2" required="required" />
		</div>
		<div class="form-group">
			<label>배송메세지</label>
			<input class="form-control" style="width:60%" type="text" name="dmsg" />
		</div>
		
	   <button type="submit" data-oper='payment' class="btn btn-primary">주문</button>
	   <button type="reset" data-oper='cancel' class="btn btn-default">취소</button> 
		
	</form>


</div>


</div>
<c:import url="../includes/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#productid').attr('style',"display:none;");
	
	$('#productid-2').attr('style',"display:none;");
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'payment'){
			formObj.attr("action", "/account/orderCompleted").attr("method","get");
			//var userid = $("input[name='userid']").clone();
			
			//var orderbook = $("td.first-child").text();
			formObj.append(orderbook);
			//formObj.append(orderid);
		}
		
		formObj.submit();
	});
	
	
});


</script>