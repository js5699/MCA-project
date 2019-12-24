<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../includes/header.jsp"%>


<div class="row formContainer">
	<h5>상품등록</h5>
</div>

<div class="row formContainer">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/adminProduct/register" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class = "col-lg-12">
					<table style = "width : 100%">
						<tr>
							<td>
								<div class="col-lg-6">
									<img id = "img" style = 'width:250px; height:auto' src = "">
								</div>
								<div class="col-lg-6">
									<input type = "file" name="pimg" id = "inputFile">
								</div>
							</td>
							<td>
								<table>
									<tr>
										<td>
											<div class="form-group">
												<label>제목</label> <input class="form-control" name="ptitle">
											</div>
											<div class="form-group">
												<label>출판사</label> <input class="form-control" name="publisher">
											</div>
											<div class="form-group">
												<label>출판일</label> <input class="form-control" name="pubdate">
											</div>
											<div class="form-group">
												<label>저자</label> <input class="form-control" name="author">
											</div>
											<div class="form-group">
												<label>가격</label> <input class="form-control" name="price">
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
														<option value = "${list.cid}">${list.cname}</option>
													</c:forEach>
													
												</select>
											</div>
											<div class="form-group">
												<label>책 크기</label> <input class="form-control" name="bksize">
											</div>
											<div class="form-group">
												<label>페이지수</label> <input class="form-control" name="bkpage">
											</div>
											<div class="form-group">
												<label>ISBN</label> <input class="form-control" name="isbn">
											</div>
											<div class="form-group">
												<label>재고 수량</label> <input class="form-control" name="stock">
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
					<div class="form-group">
						<label>목차</label> <textarea rows = "6" class="form-control" name="bkindex"></textarea>
					</div>
					<div class="form-group">
						<label>상세정보</label> <textarea rows = "6" class="form-control" name="bkdesc"></textarea>
					</div>
					<div class="col-lg-12 formContainer btnBox">
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-light">상품등록</button>
							<button type="reset" class="btn btn-light">다시쓰기</button>
						</div>
					</div>
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
