<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>

			<div class="col-lg-2">

				<h2>상세페이지</h2>

			</div>


				<!-- 상세페이지 구현 -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-tags"></span>
										&nbsp;&nbsp;상세페이지 
								</h3>
							</div>

							<table class="table">
								<thead>
									<tr>
										<th></th>
										<th></th>
										<th><img class="media-object-center"
											style="width: 300px; height: 400px;"
											src="/adminProduct/display?fileName=${product.pimg}&cid=${product.cid}"
											alt="<c:out value="${product.ptitle}"/>"
											title="<c:out value="${product.ptitle}"/>의 사진"></th>
										<th class="col-lg-1">
											<h3 id="cnt">
												<c:out value="${product.ptitle}" />
											</h3> <br> <br>
											<p>
												저자:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<c:out value="${product.author}" />
											</p>
											<P>출판사:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${product.publisher}</P>
											<P>출판일:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${product.pubdate}</P>
											<P>
												가격:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<fs><c:out value="${product.price}"/></fs>&nbsp원
											</p> 
											<hr>
											<div class="col-sm-8 input-group">
												<span><fs>수량 :</fs></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
												<button type="button" class="btn btn-primary plus" id="plus">+</button>
												&nbsp <input type="number" class="stock" min="1" id="cnt"
													max="${product.stock}" value="1" readonly="readonly" />
												&nbsp
												<button type="button" class="btn btn-primary minus"
													id="minus">-</button>
												<br>&nbsp&nbsp&nbsp
												<span><button class="btn btn-primary">바로구매</button>
											<button class="btn btn-primary" id="cart${product.productId}">장바구니</button></span>												
											</div>
											<P><fs>&nbsp&nbsp&nbsp&nbsp																																																							
												<span class="allprice"></span></fs>
												</p>	
											<p></p>											
											<script>
											
											       /* 수량 변경 js */
												  $("#plus").click(function(){												  
												   var num = $(".stock").val();									
												   var ex = $(".ex").val();
												   var plusNum = Number(num) + 1;												   
												   if(plusNum >= ${product.stock}){
													   alert("재고를 초과 하였습니다. 판매자에게 문의 하세요!");
													   $(".stock").val(num);													   	 
												   }else{
													    $(".stock").val(plusNum);												    
													  	$(".allprice").text('총상품가격: '+plusNum * ${product.price} +' 원');															   												    
												   }
												  });												  
												  
												  $("#minus").click(function(){
													   var num = $(".stock").val();
													   var minusNum = Number(num) - 1;													   
													  
													   if(minusNum <= 0) {													  
														    $(".stock").val(num);														   
													   } else {
														    $(".stock").val(minusNum);
														    $(".allprice").text('총상품가격: '+minusNum * ${product.price} +' 원');												    
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
												  
													$("#cart${product.productId}").click(function(){
														
														var productid = '${product.productId}';
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
										<th><h4>기본정보</h4></th>
										<th><span><c:out value="${product.bkpage}"/> 쪽    <c:out value="${product.bksize}"/>mm	<c:out value="${product.bkweight}"/>	ISBN : 9791196688318</span><br><br>																					
											<h5>주제 분류</h5>										
											국내도서 > 에세이 > 명사에세이 > 기타<br>
											국내도서 > 에세이 > 사진/그림 에세이<br>
											국내도서 > 에세이 > 한국에세이<br>
											</th>										
									</tr>

									<tr>
										<th></th>
										<th></th>
										<th><h4>책 소개</h4></th>
										<th><c:out value="${product.bkdesc}" /></th>
									</tr>
									<tr>
										<th></th>
										<th></th>
										<th><h4>목차</h4></th>
										<th><pre>
<c:out value="${product.bkindex}" /> 
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



	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>