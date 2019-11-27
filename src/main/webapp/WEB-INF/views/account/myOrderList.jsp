<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../includes/header.jsp" />
<div class="row">

	<div class="col-lg-9">
		<div class="row">
			<div class="col-lg-4 col-md-6 mb-4">
				<table>
					<tr>
						<th id="table_id">주문번호</th>
						<th >도서명</th>
						<th >수량</th>
						<th >가격</th>
						<th >주문일자</th>
						<th >주문상태</th>
					</tr>
					<c:forEach items="${orderlist}" var="order">
					<tr>
						<th><c:out value="${order.orderid }" /></th><th>1</th><th>1</th><th>1</th><th>1</th><th>1</th>
					</tr>
					</c:forEach>
					<tr>
						<th>1</th><th>1</th><th>1</th><th>1</th><th>1</th><th>1</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<c:import url="../includes/footer.jsp"/>

<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}" />'
});
</script>