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

<h1 class="my-4">주문내역</h1><br>
<table>
	<tr>
		<th>주문번호</th>
		<th>도서명</th>
		<th>수량</th>
		<th>가격</th>
		<th>주문일자</th>
		<th>주문상태</th>
	</tr>
	<c:forEach items="${orderlist}" var="order">
	<tr>
		<td>
			<a href='/account/myOrderDetail?orderid=<c:out value="${order.orderid}" />'>
			<c:out value="${order.orderid}" /></a>
		</td>
		<td>외 <c:out value="${order.quantity-1}" />권</td>
		<td><c:out value="${order.quantity}" /></td>
		<td><c:out value="${order.totalprice}" /></td>
		<td><fmt:formatDate pattern="yy-MM-dd" value="${order.orderdate}" /></td>
		<td>
			<c:choose>
				<c:when test="${order.orderstatus=='od01'}">
					결제완료
				</c:when>
				<c:when test="${order.orderstatus=='od02'}">
					배송대기
				</c:when>
				<c:when test="${order.orderstatus=='od03'}">
					배송중
				</c:when>
				<c:when test="${order.orderstatus=='od04'}">
					배송완료
				</c:when>
				<c:when test="${order.orderstatus=='od05'}">
					결제취소
				</c:when>
				<c:when test="${order.orderstatus=='od06'}">
					주문취소
				</c:when>
				<c:otherwise>
					교환신청
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:forEach>
	
</table><br><br><br>

	
	
</div>
<c:import url="../includes/footer.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}" />'
});
</script>