<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<form>
	<div class="form-group">
		<label for="userid">아이디</label> 
		<input type="text" name="userid"
			id="userid" class="form-check-input" />
	</div>

	<div class="form-group col-md-6">
		<label for="inputuserpw1">비밀번호</label> <input type="password"
			class="form-control" name="userpw" id="inputuserpw1"
			placeholder="Password">
	</div>
	<div class="form-group col-md-6">
		<label for="inputuserpw2">비밀번호 확인</label> <input type="password"
			class="form-control" name="userpw2" id="inputuserpw1"
			placeholder="Password Confirm">
	</div>

	<div class="form-group">
		<label for="">이름</label><input type="text" name="name" id="" />
	</div>
	<div class="form-group">
		<label for="">전화번호</label> 
		<input type="number" name="phone1" id="" /> 
		- <input type="number" name="phone2" id="" /> 
		- <input type="number"	name="phone3" id="" />
	</div>
	<div class="form-group">
		<label for="">이메일</label><input type="text" name="email" id="" />
	</div>
	<div class="form-group">
		<button type="submit" class="btn btn-info">우편번호찾기</button>
		<label for="">우편번호</label><input type="text" name="zipcode" id="" />
	</div>
	<div class="form-group">
		<label for="">주소</label><input type="text" name="address1" id="" />
	</div>
	<div class="form-group">
		<label for="">상세주소</label><input type="text" name="address2" id="" />
	</div>



	<button type="submit" class="btn btn-primary">Submit</button>
</form>


<%@ include file="../includes/footer.jsp"%>