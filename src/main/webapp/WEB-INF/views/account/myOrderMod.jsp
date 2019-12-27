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
	
	<form role="form" action="/account/myOrderMod" method="post" style="width:100%">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type = "hidden" name = "userid" value = "<c:out value = '${dNameinfo.userid}'/>">
		<input type = "hidden" name = "pageNum" value = "<c:out value = '${cri.pageNum}'/>">
		<input type = "hidden" name = "amount" value = "<c:out value = '${cri.amount}'/>">
		<table class="table">
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
				<td><c:out value="${detail.ea}" /></td>
				<td><fmt:formatNumber pattern="###,###,###" value="${detail.saleprice}" />원</td>
			</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<th>수령자</th>
				<td><input class="form-control" name='dname' value='<c:out value="${dNameinfo.dname}"/>' ></td>
				<th>전화번호</th>
				<td><input class="form-control" name='dtell' value='<c:out value="${dNameinfo.dtell}"/>' ></td>
			</tr>
			<tr>
				<th>주문수량</th>
				<td><input class="form-control" name='quantity' value='<c:out value="${dNameinfo.quantity}"/>' 
					readonly="readonly"></td>
				<th>주문금액</th>
				<td>
					<input class="form-control" name='totalprice' value='<fmt:formatNumber pattern="###,###,###" 
					value="${dNameinfo.totalprice}"/>원' readonly="readonly">
				</td>
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
					<input class="form-control" style="width:10%" name='dzipcode' 
					value='<c:out value="${dNameinfo.dzipcode}"/>' ><br>
					<input class="form-control" name='daddress1' value='<c:out value="${dNameinfo.daddress1}"/>' ><br>
					<input class="form-control" name='daddress2' value='<c:out value="${dNameinfo.daddress2}"/>' >
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td colspan="3"><input class="form-control" name='dmsg' value='<c:out value="${dNameinfo.dmsg}"/>' ></td>
			</tr>
		</table>
		<div style="margin-top:20px;"></div>
		<button type="submit" data-oper='modify' class="btn btn-default">주문수정</button>
	 	<button type="submit" data-oper='list' class="btn btn-info">목록</button>
	 	
	</form>
</div>

<c:import url="../includes/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function() {

	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'list'){
	    	formObj.attr("action", "/account/myOrderList").attr("method","get");
	    	var userid = $("input[name='userid']").clone();
	    	var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			formObj.empty();
			formObj.append(userid);
			formObj.append(pageNumTag);
			formObj.append(amountTag);
	    }      
	    
	    formObj.submit();
	  });

});
</script>
