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

<div class="row formContainer">
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
				메모
				<p><small>관리자만 확인할 수 있으며 회원에게 노출되지 않습니다.</small></p>
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
	<table class="table">
		<tr>
			<th></th>
			<th>주문번호</th>
			<th>주문일</th>
			<th>주문금액</th>
			<th>연락처</th>
			<th>상세보기</th>
			<th>상태</th>
		</tr>
		<c:choose>
			<c:when test="${!empty order}">
				<c:forEach var="order" items="${order}" varStatus="idx">
					<tr>
						<td>${idx.count}</td>
						<td>${order.orderid}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${order.orderdate}" /></td>
						<td>${order.totalprice}</td>
						<td>${order.dtell}</td>
						<td>-</td>
						<td>-</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7" class="text-center">
						<p><em>주문 내역이 없습니다.</em></p>
					</td>
				</tr>
			
			</c:otherwise>
		</c:choose>
	</table>
</div>

<%@ include file="../includes/footer.jsp"%>