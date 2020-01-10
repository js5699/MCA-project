<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	<h5>상품등록</h5>
</div>

<div class="row formContainer">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<form role="form" action="/adminProduct/register" method="post" id = "form">
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
												<label>제목</label> <input class="form-control inputModal" name="ptitle">
											</div>
											<div class="form-group">
												<label>출판사</label> <input class="form-control inputModal" name="publisher">
											</div>
											<div class="form-group">
												<label>출판일</label> <input class="form-control inputModal" name="pubdate">
											</div>
											<div class="form-group">
												<label>저자</label> <input class="form-control inputModal" name="author">
											</div>
											<div class="form-group">
												<label>가격</label> <input class="form-control inputModal" name="price">
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
													<option value = "">카테고리</option>
													<c:forEach items="${cidList}" var="list">
														<option value = "${list.cid}">${list.cname}</option>
													</c:forEach>
													
												</select>
											</div>
											<div class="form-group">
												<label>책 크기</label> <input class="form-control inputModal" name="bksize">
											</div>
											<div class="form-group">
												<label>페이지수</label> <input class="form-control inputModal" name="bkpage">
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
						<label>목차</label> <textarea rows = "6" class="form-control inputModal" name="bkindex"></textarea>
					</div>
					<div class="form-group">
						<label>상세정보</label> <textarea rows = "6" class="form-control inputModal" name="bkdesc"></textarea>
					</div>
					<div class="col-lg-12 formContainer btnBox">
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-light" id = "register">상품등록</button>
							<button type="button" class="btn btn-light" id = "display" data-toggle="modal" data-target="#myModal">미리보기</button>
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
	function check(){
		if($("input[name='pimg']").val().length == 0){
			alert("이미지를 입력해 주세요.");
			return false;
		}else if($("input[name='ptitle']").val().length == 0){
			alert("제목을 입력해 주세요.");
			return false;
		}else if($("input[name='publisher']").val().length == 0){
			alert("출판사를 입력해 주세요.");
			return false;
		}else if($("input[name='pubdate']").val().length == 0){
			alert("출간일을 입력해 주세요.");
			return false;
		}else if($("input[name='author']").val().length == 0){
			alert("저자를 입력해 주세요.");
			return false;
		}else if($("input[name='price']").val().length == 0){
			alert("가격을 입력해 주세요.");
			return false;
		}else if($("select[name='cid']").val().length == 0){
			alert("카테고리를 선택해 주세요.");
			return false;
		}else if($("input[name='isbn']").val().length == 0){
			alert("ISBN을 입력해 주세요.");
			return false;
		}else if($("input[name='stock']").val().length == 0){
			alert("재고수량을 입력해 주세요.");
			return false;
		}else if($("textarea[name='bkindex']").val().length == 0){
			alert("목차를 입력해 주세요.");
			return false;
		}else if($("textarea[name='bkdesc']").val().length == 0){
			alert("상세정보를 입력해 주세요.");
			return false;
		}
		return true;
	}
	var form = $("#form");
	$("#register").on("click", function(e){
		e.preventDefault();
		if(check()){
			form.submit();
		}
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


	