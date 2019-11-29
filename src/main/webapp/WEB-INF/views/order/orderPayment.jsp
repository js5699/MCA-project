<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../includes/header.jsp" />
<div class="row">
	
<h1 class="my-4">주문 정보 입력</h1><br>
<div class="orderInfo">
	<form role="form" method="post" action="/order/orderPayment">
		
		<input type="hidden" name="userid" value="${order.userid}" />
		
		<div class="form-group">
			<label>수령인</label>
			<input class="form-control" type="text" name="dName" required="required" />
		</div>
		<div class="form-group">
			<label>전화번호</label>
			<input class="form-control" type="text" name="dTell" required="required" />
		</div>
		<div class="form-group">
			<label>우편번호</label>
			<input type="text" name="dZipcode" required="required" />
		</div>
		<div class="form-group">
			<label>기본주소</label>
			<input type="text" name="dAddress1" required="required" />
		</div>
		<div class="form-group">
			<label>상세주소</label>
			<input type="text" name="dAddress2" required="required" />
		</div>
		<div class="form-group">
			<label>배송메세지</label>
			<input type="text" name="dMsg" />
		</div>
		
		   <button type="submit" class="btn btn-default">주문</button>
		   <button type="reset" class="btn btn-default">취소</button> 
		
	</form>


</div>


</div>
<c:import url="../includes/footer.jsp"/>