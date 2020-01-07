<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../includes/header.jsp"%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">프리뷰</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<!-- 상세페이지 구현 -->
				<div class="panel panel-primary">
					<h3 class="panel-title">
						<span class="glyphicon glyphicon-tags"></span>
							&nbsp;&nbsp;상세페이지 
					</h3>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th><img id = "modalImg" class="media-object-center"
								style="width: 160px; height: 250px;"
								src=""></th>
							<th class="col-lg-1">
								<h4>
									<span id = "mTitle"></span>
								</h4> <br> <br>
								<div class = "form-group">
									저자:
									<span id = "mAuthor"></span>
								</div>
								<div class = "form-group">출판사: <span id = "mPublisher"></span></div>
								<div class = "form-group">출판일: <span id = "mPubdate"></span></div>
								<div class = "form-group">가격: <span id = "mPrice"></span></div>
								<div class = "form-group">
									쪽수 및 판형:
									<span id = "mBkpage"></span>
									
									<span id = "mBksize"></span>
									
								</div>
								
							</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>책 소개</th>
							<th><div class = "form-group" style = "overflow: auto;width:210px; height:140px;">
								<span id = "mBkindex"></span></div></th>
						</tr>
						<tr>
							<th>목차</th>
							<th><div class = "form-group" style = "overflow: auto;width:210px; height:140px;">
									<span id = "mBkdesc"></span>
								</div></th>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
					data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

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
												<label>제목</label> <input class="form-control inputModal" name="ptitle" value = "${product.ptitle}">
											</div>
											<div class="form-group">
												<label>출판사</label> <input class="form-control inputModal" name="publisher" value = "${product.publisher}">
											</div>
											<div class="form-group">
												<label>출판일</label> <input class="form-control inputModal" name="pubdate" value = "${product.pubdate}">
											</div>
											<div class="form-group">
												<label>저자</label> <input class="form-control inputModal" name="author" value = "${product.author}">
											</div>
											<div class="form-group">
												<label>가격</label> <input class="form-control inputModal" name="price" value = "${product.price}">
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
												<label>책 크기</label> <input class="form-control inputModal" name="bksize" value = "${product.bksize}">
											</div>
											<div class="form-group">
												<label>페이지수</label> <input class="form-control inputModal" name="bkpage" value = "${product.bkpage}">
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
						<label>목차</label> <textarea rows = "6" class="form-control inputModal" name="bkindex">${product.bkindex}</textarea>
					</div>
					<div class="form-group">
						<label>상세정보</label> <textarea rows = "6" class="form-control inputModal" name="bkdesc">${product.bkdesc}</textarea>
					</div>
					<button type="submit" class="btn btn-warning">상품수정</button>
					<button type="submit" class="btn btn-danger" id = "remove">삭제</button>
					<button type="button" class="btn btn-light" id = "display" data-toggle="modal" data-target="#myModal">미리보기</button>
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
	
	
	$("#display").on("click", function(){
		var input = document.getElementById("inputFile");
		if(input.value.length == 0){
			alert("이미지를 선택하세요.");
			return false;
		}
		var fReader = new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event){
			var img = document.getElementById("modalImg");
			img.src = event.target.result;
			}
		
		$("#mTitle").html($(".inputModal").get()[0].value);
		$("#mPublisher").html($(".inputModal").get()[1].value);
		$("#mPubdate").html($(".inputModal").get()[2].value);
		$("#mAuthor").html($(".inputModal").get()[3].value);
		$("#mPrice").html($(".inputModal").get()[4].value);
		$("#mBksize").html($(".inputModal").get()[5].value);
		$("#mBkpage").html($(".inputModal").get()[6].value);
		$("#mBkindex").html($(".inputModal").get()[7].value);
		$("#mBkdesc").html($(".inputModal").get()[8].value);
		
		$("#myModal").show();
	});
	
});
</script>