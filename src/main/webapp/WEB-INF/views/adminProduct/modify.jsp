<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../includes/header.jsp"%>


<div class="row formContainer">
	<h5>상품수정</h5>
</div>

<div class="row formContainer">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/adminProduct/modify" method="post" id = "modifyForm">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="hidden" name = "productId" value = "${product.productId}"/>
				<div class = "col-lg-12">
					<table style = "width : 100%">
						<tr>
							<td>
								<div class="col-lg-6">
									<img id = "img" style = 'width:250px; height:auto' src = '/adminProduct/display?fileName=${product.pimg}&cid=${product.cid}'>
								</div>
								<div class="col-lg-6">
									<input type = "file" name="pimg" value = "${product.pimg}" id="inputFile">
									
								</div>
							</td>
							<td>
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label>제목</label> <input class="form-control" name="ptitle" value = "${product.ptitle}">
											</div>
											<div class="form-group">
												<label>출판사</label> <input class="form-control" name="publisher" value = "${product.publisher}">
											</div>
											<div class="form-group">
												<label>출판일</label> <input class="form-control" name="pubdate" value = "${product.pubdate}">
											</div>
											<div class="form-group">
												<label>저자</label> <input class="form-control" name="author" value = "${product.author}">
											</div>
											<div class="form-group">
												<label>가격</label> <input class="form-control" name="price" value = "${product.price}">
											</div>
											
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label>카테고리</label>
												<select name = "cid" class="form-control">
													<c:forEach items="${cidList}" var="list">
														<c:choose>
															<c:when test="${product.cid == list.cid}">
																<option value = "${list.cid}" selected="selected">${list.cname}</option>
															</c:when>
															<c:otherwise>
																<option value = "${list.cid}">${list.cname}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<label>책 크기</label> <input class="form-control" name="bksize" value = "${product.bksize}">
											</div>
											<div class="form-group">
												<label>페이지수</label> <input class="form-control" name="bkpage" value = "${product.bkpage}">
											</div>
											<div class="form-group">
												<label>ISBN</label> <input class="form-control" name="isbn" value = "${product.isbn}">
											</div>
											<div class="form-group">
												<label>재고 수량</label> <input class="form-control" name="stock" value = "${product.stock}">
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
					<div class="form-group">
						<label>목차</label> <textarea rows = "6" class="form-control" name="bkindex">${product.bkindex}</textarea>
					</div>
					<div class="form-group">
						<label>상세정보</label> <textarea rows = "6" class="form-control" name="bkdesc">${product.bkdesc}</textarea>
					</div>
					<button type="submit" class="btn btn-warning">상품수정</button>
					<button type="submit" class="btn btn-danger" id = "remove">삭제</button>
					<button type="reset" class="btn btn-light">다시쓰기</button>
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
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	var formObj=$("#modifyForm");
	$("#remove").on("click", function(e){
		e.preventDefault();
		formObj.attr("action", "/adminProduct/remove");
		formObj.submit();
	});
	
	$("input[type='file']").change(function(){
		var input = document.getElementById("inputFile");
		var fReader = new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event){
			var img = document.getElementById("img");
			img.src = event.target.result;
			}
	});
	
});
</script>