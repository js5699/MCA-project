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
<h1 class="my-4">주문하기</h1><br>
	<table class="table">
		<tr>
			<th>#</th>
			<th>도서명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		
		<tr>
			<td>1</td>
			<td>엄마의 20년</td>
			<td>2</td>
			<td>28,000원</td>
		</tr>
		
	</table>
<div class="col-lg-12 text-right"><h4>총 수량 : 2권 &nbsp; 총 금액 : 28,000원</h4></div>
<div class="col-lg-12"><h3 class="my-4">주문 정보 입력</h3></div>
<div class="col-lg-12">
	<form role="form" method="post"  class="form-horizontal " action="/account/orderPayment">
		
		<input type="hidden" name="userid" value="${order.userid}" />
		
		<div class="form-group">
			<label>수령인</label>
			<input class="form-control" style="width:20%" type="text" name="dName" required="required" />
		</div>
		<div class="form-group">
			<label>전화번호</label>
			<input class="form-control" style="width:20%" type="text" name="dTell" required="required" />
		</div>
		<div class="form-group">
			<label>우편번호</label>
			<input class="form-control" style="width:10%" type="text" name="dZipcode" required="required" />
		</div>
		<div class="form-group">
			<label>주소</label>
			<input class="form-control" style="width:60%" type="text" name="dAddress1" required="required" />
		</div>
		<div class="form-group">
			<label>상세주소</label>
			<input class="form-control" style="width:60%" type="text" name="dAddress2" required="required" />
		</div>
		<div class="form-group">
			<label>배송메세지</label>
			<input class="form-control" style="width:60%" type="text" name="dMsg" />
		</div>
		
	   <button type="submit" class="btn btn-primary">주문</button>
	   <button type="reset" class="btn btn-default">취소</button> 
		
	</form>


</div>


</div>
<c:import url="../includes/footer.jsp"/>