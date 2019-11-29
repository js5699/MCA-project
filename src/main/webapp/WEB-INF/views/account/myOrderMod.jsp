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

	<h1 class="my-4">주문수정</h1><br>
		<table>
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
				<td><input type="text" value="${detail.ea}" /></td>
				<td><c:out value="${detail.saleprice}" /></td>
			</tr>
			</c:forEach>
		</table>
		<div style="margin-top:20px;"></div>
		<table>
			<tr>
				<th>수령자</th>
				<td><input type="text" value="${dNameinfo.dname}" /></td>
				<th>전화번호</th>
				<td><input type="text" value="${dNameinfo.dtell}" /></td>
			</tr>
			<tr>
				<th>주문수량</th>
				<td></td>
				<th>주문금액</th>
				<td></td>
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
					(<input type="text" value="${dNameinfo.dzipcode}" />)&nbsp;
					<input type="text" value="${dNameinfo.daddress1}" />&nbsp;
					<input type="text" value="${dNameinfo.daddress2}" />
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td colspan="3"><input type="text" value="${dNameinfo.dmsg}" /></td>
			</tr>
		</table>
		
		<button data-oper='list' class="btn btn-default" onclick="location.href='/account/myOrderMod?orderid=<c:out value="${dNameinfo.orderid}" />'">수정하기</button>
		<button data-oper='list' class="btn btn-default" onclick="location.href='/account/myOrderList?userid=<c:out value="${dNameinfo.userid}" />'">목록</button>

	</div>

<c:import url="../includes/footer.jsp"/>