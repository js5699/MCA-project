<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../includes/header.jsp"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<form class="form-horizontal" role="form">
	<div class="row">
		
		${principal.username}
		
		<input type="text" class="form-control col-md-10" value="<sec:authentication property="principal.username"/>">
		
				
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-10">
				<input type="password" class="form-control col-md-4" name="userpw" id="inputuserpw1" placeholder="ID">
			</div>
		</div>
		<div class="form-group col-md-12">
			<label for="inputuserpw1">아이디</label> 
			<input type="password" class="form-control col-md-4" name="userpw" id="inputuserpw1" placeholder="ID">
		</div>
		<div class="form-group col-md-5">
			<label for="inputuserpw1">비밀번호</label> 
			<input type="password" class="form-control col-md-10" name="userpw" id="inputuserpw1" placeholder="Password">
		</div>
		<div class="form-group col-md-5">
			<label for="inputuserpw2">비밀번호 확인</label> 
			<input type="password" class="form-control col-md-10" name="userpw2" id="inputuserpw1" placeholder="Password Confirm">
		</div>
		
		<div class="form-group col-md-12">
			<label for="inputname">이름</label> 
			<input type="password" class="form-control col-md-4" name="name" id="inputname" placeholder="ID">
		</div>
		
		<div class="form-group col-md-12">
			<label for="inputemail">이메일</label> 
			<input type="email" class="form-control col-md-4" name="email" id="inputemail" placeholder="email">
		</div>
		
		<div class="form-group">
			<label for="" class="col-md-12">전화번호</label> 
			<div class="col-xs-2">
				<input type="text" class="form-control" placeholder=".col-xs-2">
			</div>
			<div class="col-xs-3">
				<input type="text" class="form-control" placeholder=".col-xs-3">
			</div>
			<div class="col-xs-4">
				<input type="text" class="form-control" placeholder=".col-xs-4">
			</div>
		</div>
		
		
	</div>
	
</form>


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
<%@ include file="../includes/footer.jsp"%>