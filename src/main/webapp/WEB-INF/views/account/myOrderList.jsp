<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

<h1 class="my-4">주문내역</h1><br>
<table class="table">
	<tr>
		<th>주문번호</th>
		<th>도서명</th>
		<th>수량</th>
		<th>가격</th>
		<th>주문일자</th>
		<th>주문상태</th>
	</tr>
	<c:forEach items="${orderlist}" var="order">
	<tr>
		<td>
			<a class='move' href="${order.orderid}">${order.orderid}</a>
		</td>
		<td><c:out value="${order.orderbook}" />외 <c:out value="${order.quantity-1}" />권</td>
		<td><c:out value="${order.quantity}" /></td>
		<td><fmt:formatNumber pattern="###,###,###" value="${order.totalprice}" />원</td>
		<td><fmt:formatDate pattern="yy-MM-dd" value="${order.orderdate}" /></td>
		<td>
			<c:choose>
				<c:when test="${order.orderstatus=='od01'}">
					결제완료
				</c:when>
				<c:when test="${order.orderstatus=='od02'}">
					배송대기
				</c:when>
				<c:when test="${order.orderstatus=='od03'}">
					배송중
				</c:when>
				<c:when test="${order.orderstatus=='od04'}">
					배송완료
				</c:when>
				<c:when test="${order.orderstatus=='od05'}">
					결제취소
				</c:when>
				<c:when test="${order.orderstatus=='od06'}">
					주문취소
				</c:when>
				<c:otherwise>
					교환신청
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	</c:forEach>
	
</table><br><br><br>
<div class = 'pull-right'>
	<ul class = "pagination">
		<c:if test = "${paging.prev}">
			<li class = "paginate_button previous"><a href = "${paging.startPage -1}">Previous</a></li>
		</c:if>
		<c:forEach var = "num" begin = "${paging.startPage}" end = "${paging.endPage}">
			<li class = "paginate_button ${paging.cri.pageNum == num ? "active":""}"><a href = "${num}">${num}</a></li>
		</c:forEach>
		<c:if test = "${paging.next}">
			<li class = "paginate_button next"><a href = "${paging.endPage + 1}">Next</a></li>
		</c:if>
	</ul>
</div>
<form id = "actionForm" action = "/account/myOrderList" method = "get">
	<input type="hidden" id="userid" name="userid" value="${order.userid}">
	<input type = "hidden" name = "pageNum" value = "${paging.cri.pageNum}">
	<input type = "hidden" name = "amount" value = "${paging.cri.amount}">
</form>
	
<!-- Modal 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">주문 완료</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save
					changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
	
</div>
<c:import url="../includes/footer.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}" />'
	
	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		}

		if (parseInt(result) > 0) {
			$(".modal-body").html(
					"주문번호 " + parseInt(result)
							+ " 번이 결제되었습니다.");
		}

		$("#myModal").modal("show");
	}
	
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type = 'hidden' name = 'orderid' value = '" + $(this).attr("href") + "'>");
		actionForm.attr("action", "/account/myOrderDetail");
		actionForm.submit();
	});
});
</script>
