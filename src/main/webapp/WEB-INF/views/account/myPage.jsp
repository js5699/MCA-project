<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%@ include file="../includes/header.jsp"%>

<c:if test="${!empty result}">
	<div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
		<c:choose>
			<c:when test="${result eq 'pwModSuccess'}">
				<strong>비밀번호 변경 완료</strong> 비밀번호가 변경 되었습니다. 로그인시 새로운 비밀번호를 입력하세요.
			</c:when>
			<c:when test="${result eq 'pwModFail'}">
				<strong>비밀번호 변경 실패</strong>알 수 없는 오류로인해 비밀번호 변경에 실패했습니다.
			</c:when>
			<c:when test="${result eq 'infoModsuccess'}">
				<strong>회원정보 변경 완료</strong> 회원 정보가 변경되었습니다.
			</c:when>
			<c:when test="${result eq 'infoModFail'}">
				<strong>회원정보 변경 실패</strong> 회원 정보가 변경되지않았습니다
			</c:when>
		</c:choose>	
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</c:if>

<div class="col-lg-12 formContainer">
	<h5><i class="fas fa-receipt"></i>최근 주문 내역</h5>
</div>

<hr />

<div class="col-lg-12 formContainer">
	<h5><i class="fas fa-user-circle"></i>내 정보</h5>

	<table class="table">
		<tr>
			<th style="width: 16.66%">아이디</th>
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
			<td>(우)${user.zipcode} <br /> ${user.address1} <br />
				${user.address2}
			</td>
		</tr>
	</table>
	
	<div class="col-lg-12 text-right">
		<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='pwConfirm'">내 정보 수정</button>
	</div>
</div>

<hr />
<%@ include file="../includes/footer.jsp"%>