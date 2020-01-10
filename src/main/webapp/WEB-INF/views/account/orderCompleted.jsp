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
<h1 class="my-4">주문완료</h1><br>
	<div class="col-lg-12"><h3 class="my-4">주문이 완료되었습니다.</h3></div>
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
	
	수령자 : ${dNameinfo.dname}<br>
	전화번호 : ${dNameinfo.dtell}<br>
	우편번호 : ${dNameinfo.dzipcode}<br>
	주소 : ${dNameinfo.daddress1}<br>
	상세주소 : ${dNameinfo.daddress2}<br>
	배송메세지 : ${dNameinfo.dmsg}<br>
	
	<div class="col-lg-12"></div>
	<div style="margin-top:20px;"></div>
	<button type="submit" data-oper='list' class="btn btn-info">주문목록</button>
	
	</div>
</div>
<c:import url="../includes/footer.jsp"/>