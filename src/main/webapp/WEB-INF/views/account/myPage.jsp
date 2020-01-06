<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

	
<div class="col-lg-12 formContainer">
	<c:if test="${result eq 'pwModSuccess'}">
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			<strong>비밀번호 변경 완료</strong> 비밀번호가 변경 되었습니다. 로그인시 새로운 비밀번호를 입력하세요.
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
	</c:if>
<ul class="list-group list-group-horizontal">
  <li class="list-group-item">내정보조회</li>
  <li class="list-group-item">주문내역</li>
  <li class="list-group-item">교환/취소내역</li>
</ul>
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

	<hr />
	
	<div class="col-lg-12 formContainer-top">
		<h5><i class="fas fa-user-slash"></i>회원 탈퇴</h5>
	</div>
	<div class="col-lg-12 ">
		<span>고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</span>
	</div>
		

	<button type="button" class="btn btn-outline-light">수정</button>

</div>

<%@ include file="../includes/footer.jsp"%>