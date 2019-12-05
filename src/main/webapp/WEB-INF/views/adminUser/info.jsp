<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row formContainer">
	<h5 class="pageSubtitle">관리자 <i class="fas fa-caret-right"></i> 고객 관리 <i class="fas fa-caret-right"></i> ${user.userid}님의 회원 등록 정보</h5>
</div>

<div class="row">
	<div class="col-lg-6">
		<button type="button" class="btn btn-primary" onclick="history.go(-1)">목록으로</button>	
	</div>
	<div class="col-lg-6 text-right">
		<button type="button" class="btn btn-warning">회원 정보 수정</button>
	</div>
</div>

<div class="row formContainer-top">
	<h5>회원 정보</h5>
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
	</table>

</div>

<div class="row formContainer-top">
	<h5>주문 내역</h5>
</div>
<div class="row">
	<table class="table">
		<tr>
			<th></th>
			<th>주문번호</th>
			<th>주문일</th>
			<th>주문금액</th>
			<th>연락처</th>
			<th>상세보기</th>
			<th>상태처리</th>
		</tr>
		<c:forEach var="order" items="${order}" varStatus="idx">
			<tr>
				<td>${idx.current}</td>
				<td>${order.orderid}</td>
				<td>${order.orderdate}</td>
				<td>${order.totalprice}</td>
				<td>${order.dTell}</td>
				<td>-</td>
				<td>-</td>
			</tr>
		</c:forEach>
	</table>
</div>


<%@ include file="../includes/footer.jsp"%>