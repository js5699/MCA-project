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

	<h1 class="my-4">주문상세보기</h1><br>
		<table class="table">
			<tr>
				<th>주문번호</th>
				<th>도서명</th>
				<th>수량</th>
				<th>가격</th>
			</tr>
			<c:forEach items="${orderdetail}" var="detail">
			<tr>
				<td><c:out value="${detail.orderid}" /></td>
				<td><c:out value="${detail.ptitle}" /></td>
				<td><c:out value="${detail.ea}" /></td>
				<td><fmt:formatNumber pattern="###,###,###" value="${detail.saleprice}" />원</td>
			</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<th>수령자</th>
				<td>${dNameinfo.dname}</td>
				<th>전화번호</th>
				<td>${dNameinfo.dtell}</td>
			</tr>
			<tr>
				<th>주문수량</th>
				<td>${dNameinfo.quantity}</td>
				<th>주문금액</th>
				<td><fmt:formatNumber pattern="###,###,###" value="${dNameinfo.totalprice}" />원</td>
			</tr>
			<tr>
				<th>주문일자</th>
				<td><fmt:formatDate pattern="yy-MM-dd" value="${dNameinfo.orderdate}" /></td>
				<th>주문상태</th>
				<td>
					<c:choose>
						<c:when test="${dNameinfo.orderstatus=='od01'}">
							결제완료
						</c:when>
						<c:when test="${dNameinfo.orderstatus=='od02'}">
							배송대기
						</c:when>
						<c:when test="${dNameinfo.orderstatus=='od03'}">
							배송중
						</c:when>
						<c:when test="${dNameinfo.orderstatus=='od04'}">
							배송완료
						</c:when>
						<c:when test="${dNameinfo.orderstatus=='od05'}">
							결제취소
						</c:when>
						<c:when test="${dNameinfo.orderstatus=='od06'}">
							주문취소
						</c:when>
						<c:otherwise>
							교환신청
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td colspan="3">
					(${dNameinfo.dzipcode})&nbsp;
					${dNameinfo.daddress1}&nbsp;
					${dNameinfo.daddress2}
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td colspan="3">${dNameinfo.dmsg}</td>
			</tr>
		</table>
		<div style="margin-top:20px;"></div>
		<button type="submit" data-oper='modify' class="btn btn-default">주문수정</button>&nbsp;
		<button type="submit" data-oper='list' class="btn btn-info">목록</button>
		<div style="margin-bottom:20px;"></div>
		
		<form id='operForm' action="/account/myOrderMod" method="get">
			<input type='hidden' id='userid' name='userid' value='<c:out value="${dNameinfo.userid}" />'>
			<input type = "hidden" name = "pageNum" value = "<c:out value = '${cri.pageNum}'/>">
			<input type = "hidden" name = "amount" value = "<c:out value = '${cri.amount}'/>">
			<input type='hidden' id='orderid' name='orderid' value='<c:out value="${dNameinfo.orderid}" />'>
		</form>

	</div>

<c:import url="../includes/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
	operForm.attr("action","/account/myOrderMod");
	operForm.submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#orderid").remove();
    operForm.attr("action","/account/myOrderList");
    operForm.submit();
    
  });  
});
</script>