<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<body>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-3">

				<h1 class="my-4">Book 스토어</h1>
				<div class="list-group">
					<a href="#" class="list-group-item">도서</a>
					 <a href="#" class="list-group-item">해외 도서</a>
					  <a href="#" class="list-group-item">음반</a>
				</div>
			</div>



			<div class="col-lg-9">

				<div id="carouselExampleIndicators" class="carousel slide my-4"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>

					<!-- jumbotron 느낌 나는 부분 -->
					<h2>이달의 추천도서</h2>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="/resources/images/asd.png"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="http://placehold.it/900x350"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>


				<!-- 판매 도서 목록  c:forEach -->
				<h3 class="lg">판매 도서 목록</h3>
					<div class="row">
					<c:forEach items="${list}" var="product">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<a href="/shop/productDetail?pid=${product.productid}"><img
									class="card-img-top" src='<c:out value="${product.pimg}"/>'
									alt="<c:out value="${product.ptitle}"/>"
									title="<c:out value="${product.ptitle}"/>"></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="/shop/productDetail?pid=${product.productid}"><c:out
												value="${product.ptitle}" /></a>
									</h4>
									<h5>
										<c:out value="${product.price}" />원
									</h5>

								</div>
								<div class="card-footer">
									<button type="button"
										class="btn btn-primary" id="cart${product.productid}">장바구니</button>
							<script>
								$("#cart${product.productid}").click(function(){
									
									var productid = ${product.productid};
									var productstock = 1;
									alert(productid);
									var data = {
											productid : productid,
											productstock : productstock
											};
									alert("장바구니에  담겨습니다.");
									var confirm_val = confirm("장바구니로 이동하시겠습니까?");
									$.ajax({
										url : "addCart",
										type : "post",
										data : data,
										beforeSend : function(xhr)
					                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
											 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
											 
					                      },
										success : function() {
												//꿀 팁											  
										 	 if(confirm_val){
										 		 location.href = "/shop/cart";   
										 	 }	   
												 
												/* alert(JSON.stringify(data)); */
												
											/* } */
										},
										error : function(request,status,error){
											alert("카트 담기 실패");
											  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

											  
										}
										
										
									});
								});
							</script>				
									<button type="button" class="btn btn-primary">바로구매</button>
								</div>
							</div>
						</div>
							</c:forEach>
					</div>
			


				<div class="col-lg-12">
					<form id="searchForm" action="/board/list" method="get"
						class="pull-right">
						<select name="type" class="pull-right">
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':'Not select'}"/>>---</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':'Not select'}"/>>도서명</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':'Not select'}"/>>저자명</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'Not select'}"/>>도서명
								or 저자명</option>
						</select> <input type="text" name="keyword" class="pull-right"
							value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
							type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type="hidden" name="amount"
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class="btn btn-primary pull-right">검색</button>
					</form>
					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum}"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount}"> <input
							type="hidden" name="type"
							value='<c:out value="${pageMaker.cri.type}"/>' /> <input
							type="hidden" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword}"/>' />
					</form>
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /.col-lg-9 -->

	</div>
	<!-- /.row -->







	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>