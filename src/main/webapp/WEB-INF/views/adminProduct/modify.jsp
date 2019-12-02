<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상품등록</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/adminProduct/modify" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="form-group">
						<label>productId</label> <input class="form-control" name="productId" value = "${AP.productId}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>pImg</label> <input class="form-control" name="pImg" value = "${AP.pImg}">
					</div>
<!-- 					<div class="form-group"> -->
<%-- 						<label>pTitle</label> <input class="form-control" name="pTitle" value = "<c:out value = '${product.pTitle}'/>"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>price</label> <input class="form-control" name="price" value = "${product.price}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>publisher</label> <input class="form-control" name="publisher" value = "${product.publisher}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>pubDate</label> <input class="form-control" name="pubDate" value = "${product.pubDate}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>author</label> <input class="form-control" name="author" value = "${product.author}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>bkSize</label> <input class="form-control" name="bkSize" value = "${product.bkSize}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>bkPage</label> <input class="form-control" name="bkPage" value = "${product.bkPage}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>bkIndex</label> <input class="form-control" name="bkIndex" value = "${product.bkIndex}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>bkDesc</label> <input class="form-control" name="bkDesc" value = "${product.bkDesc}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>ISBN</label> <input class="form-control" name="ISBN" value = "${product.ISBN}"> --%>
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<%-- 						<label>cId</label> <input class="form-control" name="cId" value = "${product.cId}"> --%>
<!-- 					</div> -->
					<button type="submit" class="btns btn-default">Submit Button</button>
					<button type="reset" class="btns btn-default">Reset Button</button>
				</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@ include file="../includes/footer.jsp"%>