<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-2">

				<h2>상세페이지</h2>

			</div>

			<div class="col-lg-9">

				<!-- 상세페이지 구현 -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-tags"></sapn>
										&nbsp;&nbsp;상세페이지 
								</h3>
							</div>

							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th></th>
										<th><img class="media-object-center"
											style="width: 160px; height: 250px;"
											src="<c:out value="${product.pimg}"/>"
											alt="<c:out value="${product.ptitle}"/>"
											title="<c:out value="${product.ptitle}"/>의 사진"></th>
										<th class="col-lg-1">
											<h4>
												<c:out value="${product.ptitle}" />
											</h4> <br> <br>
											<p>
												저자:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<c:out value="${product.publisher}" />
											</p>
											<P>출판사:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp publisher</P>
											<P>출판일:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp pubdate</P>
											<P>
												쪽수 및 판형:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<c:out value="${product.bkPage}" />
												쪽
												<c:out value="${product.bkSize}" />
												mm
											</P>
											<div class="col-sm-8 input-group">
												수량:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<button type="button" class="btn btn-primary plus" id="plus">+</button>
												&nbsp <input type="number" class="stock" min="1"
													max="${product.stock}" value="1" readonly="readonly" />
												&nbsp
												<button type="button" class="btn btn-primary minus"
													id="minus">-</button>
											</div>
											<p></p>
											<button class="btn btn-primary">바로구매</button>
											<button class="btn btn-primary" id="cart${product.productid}">장바구니</button>
											<script>
											       /* 수량 변경 js */
												  $("#plus").click(function(){
													  
												   var num = $(".stock").val();
												   var plusNum = Number(num) + 1;
												   
												   if(plusNum >= ${product.stock}){
													   alert("재고를 초과 하였습니다. 판매자에게 문의 하세요!");
													   $(".stock").val(num);
												   }else{
												    $(".stock").val(plusNum);          
												   }
												  });
												  
												  
												  $("#minus").click(function(){
													   var num = $(".stock").val();
													   var minusNum = Number(num) - 1;
													   
													   if(minusNum <= 0) {
													    $(".stock").val(num);
													   } else {
													    $(".stock").val(minusNum);          
													   }
													  });
												  
												  /* 장바구니 담기 js */
												  
											/* 	  $(document).ready(function() {
                    							    <sec:authorize access="isAuthenticated()">
                    							    replyer='<sec:authentication property="principal.username"/>';
                    							    </sec:authorize>
                       								 var csrfHeaderName = "${_csrf.headerName}";
                       								 var csrfTokenValue = "${_csrf.token}";
                        
									                    $(document).ajaxSend(function(e, xhr, options){
									                         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
									                       });
									
										                }); */
												  
													$("#cart${product.productid}").click(function(){
														
														var productid = ${product.productid};
														var productstock = $(".stock").val();
														
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
															success : function(xhr,data) {
																	//꿀 팁
																	/*  alert(JSON.stringify(xhr)); */ 
																	 if(confirm_val){
																 		 location.href = "/shop/cart";   
																 	 }	   
																	
																	
																/* } */
															},
															error : function(request,status,error){
																alert("카트 담기 실패");
																  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

																  
															}
															
															
														});
													});
									  
										 </script>
										</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<th></th>
										<th></th>
										<th>책 소개</th>
										<th><c:out value="${product.bkDesc}" /></th>
									</tr>
									<tr>
										<th></th>
										<th></th>
										<th>목차</th>
										<th><pre>
<c:out value="${product.bkIndex}" /> 
<!-- <details>
    <summary>펼치기</summary>
</details> -->
											</pre>
								</tbody>
								</th>
								</tr>

							</table>

						</div>


					</div>


				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>