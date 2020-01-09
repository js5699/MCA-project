<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<!-- content -->

<table class="table">
			<tr>
				<th>도서명</th>
				<th id="productid">도서코드</th>
				<th>구입 수량</th>
				<th>개당 가격</th>
				<th>합계</th>
			</tr>
			<c:set var="quantity" value="0" />
			<c:set var="totalprice" value="0" />
			<c:forEach items="${cartlist}" var="cartlist">
				<tr>
					<td>${cartlist.ptitle}</td>
					<td>${cartlist.productid}</td>
					<td>${cartlist.productstock}</td>
					<td>${cartlist.price}</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${cartlist.price * cartlist.productstock}" />원</td>
				</tr>
				<c:set var="quantity" value="${quantity + cartlist.productstock}" />
				<c:set var="totalprice" value="${totalprice + (cartlist.price * cartlist.productstock)}" />
			</c:forEach>
		</table>

<%@ include file="../includes/footer.jsp"%>