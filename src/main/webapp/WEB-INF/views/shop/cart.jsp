<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<body>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-lg-2">

				<h1 class="shoppingCart">장바구니</h1>

			</div>

			<div class="col-lg-10">

				<!-- 장바구니 구현 -->
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<h3 class="panel-title">
									<span class="glyphicon glyphicon-tags"></span> &nbsp;&nbsp;장바구니									
								</h3>
							</div>										
							<table class="table">
								<thead class="bg-primary">
									<tr>
										<th style="text-align:center;" ><div class="custom-control custom-checkbox">
												<input type="checkbox" id="allcheck" class="custom-control-input">
												<!-- 참고 사항 input에 id 와  label에 for 와 일치 해야 작동합니다.  -->
												<label class="custom-control-label" for="allcheck">전체 선택</label>
											</div></th>
										<th id="cnt" >상품명</th>
										<th id="cnt">가격</th>
										<th id="cnt">수량</th>
										<th id="cnt">삭제</th>
									</tr>
								</thead>
								<c:if test="${nocart eq 'nocart'}">								
								<tbody>
										<tr>
											<th id="cnt"></th>
											<th id="cnt"></th>
											<th id="cnt"><div><br><br><h2>장바구니에 상품이 없습니다.</h2><br><br></div></th>											
											<th id="cnt"></th>
											<th id="cnt"></th>				
										</tr>				
								</tbody>
								</c:if>
								<c:forEach items="${cartList}" var="product" varStatus="status">																																																																		
								<tbody>
									<tr>
										<th>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" id="check${product.productid}" class="custom-control-input"
												data-cartNum="${product.cartNum}"/>
												<!-- 참고 사항 input에 id 와  label에 for 와 일치 해야 작동합니다.  -->
												<label class="custom-control-label" for="check${product.productid}">선택</label>
											</div>
										</th>
										<th><a href="/shop/productDetail?pid=${product.productid}"><img class="media-object"
												src="<c:out value="${product.pimg}"/>"><a href="/shop/productDetail?pid=${product.productid}"><c:out value="${product.ptitle}"/></a></th>
										<th><c:out value="${product.price}"/>원</th>
										<th><div class="input-group">
												<button type="button" class="btn btn-primary plus" id="plus${product.cartNum}" data-cartNum="${product.cartNum}" >+</button>
												&nbsp <input type="number" class="stock${product.cartNum}" min="1"	max="${product.stock}" value="${product.productStock}" readonly="readonly" id="cnt" />
												&nbsp
																								
												<c:if test="${product.productStock != 1}">
												<button type="button" class="btn btn-primary minus"	id="minus${product.cartNum}" data-cartNum="${product.cartNum}">-</button>																							
												</c:if>												
											</div>
											
											</th>
										<th><button class="btn btn-primary" data-cartNum="${product.cartNum}" id="delete_btn${product.cartNum}">삭제</button></th>
									</tr>									
								</tbody>
								<script>
							     /* 수량 변경 버튼 js */
							     while($("#plus${product.cartNum}").mousedown(function(){
							    	 var num = $(".stock${product.cartNum}").val();									
							    	 var plusNum = Number(num) + 1;					    	 
									
							    	  $("#plus${product.cartNum}").mouseup(function(){
										alert("마우스 땜");	
							    	   });
									
							    	 if(plusNum >= ${product.stock}){									
							    		 $(".stock${product.cartNum}").val(num);										
							    	 } else{									
							    		 $(".stock${product.cartNum}").val(plusNum);        										
							    	 }									
							     }));
							     /* $("#plus${product.cartNum}").click(function(){								
							    	 var num = $(".stock${product.cartNum}").val();									
							    	 var plusNum = Number(num) + 1;					    	 
									
							    	 if(plusNum >= ${product.stock}){									
							    		 $(".stock${product.cartNum}").val(num);										
							    	 } else{									
							    		 $(".stock${product.cartNum}").val(plusNum);        										
							    	 }									
							     });	 */						     
								
							     $("#minus${product.cartNum}").click(function(){								
							    	 var num = $(".stock${product.cartNum}").val();									
							    	 var minusNum = Number(num) - 1;						   
							    	 
							    	 if(minusNum <= 0) {									
							    		 $(".stock${product.cartNum}").val(num);										
							    	 } else {									
							    		 $(".stock${product.cartNum}").val(minusNum);      
							    	 }										
							     }); 
							    
							     /* 개별수량 변경 js */			
								 $("#plus${product.cartNum}").click(function(){
										
								  	 if( ${product.productStock} >= ${product.stock}-1){	
								  		var productstock = ${product.productStock};								  		 
								  		alert("재고를 초과 하였습니다. 판매자에게 문의 하세요");							    		 										
							    	 }else{			
							    	 	var productstock = ${product.productStock}+1;							    		       										
							    	 }
								
									 var productid = '${product.productid}';
									 										
									 var checkArr = new Array();
									 checkArr.push($(this).attr("data-cartNum"));
									 
									 var data = {
												"chbox" : checkArr,
												productid : productid,
												productstock : productstock
												};
									 
									 $.ajax({
											url : "modifyCart",
											type : "post",
											data : data,										
											beforeSend : function(xhr)
						                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
												 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");												 
						                      },
						                      success : function(xhr,data) {												
												location.href = "/shop/cart";   
										 	 }							 				
										});
								 });
							     
									$("#minus${product.cartNum}").click(function(){
									
									 	 if( ${product.productStock} < 1){			
									 		 var productstock =${product.productStock}+1;								    		 
								    	 } else{							    										
								    		 var productstock = ${product.productStock}-1;	     
								    	 }										
										
									 var productid = '${product.productid}';																	
									 var checkArr = new Array();
									 checkArr.push($(this).attr("data-cartNum"));
									 
									 var data = {
												"chbox" : checkArr,
												productid : productid,
												productstock : productstock
												};
									 
									 $.ajax({
											url : "modifyCart",
											type : "post",
											data : data,										
											beforeSend : function(xhr)
						                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
												 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");												 
						                      },
						                      success : function(xhr,data) {												 
												location.href = "/shop/cart";   
										 	 }							 				
										});
								 });												 
							     
																
								/* 개별삭제 js */
								 $("#delete_btn${product.cartNum}").click(function(){
								  var confirm_val = confirm("정말 삭제하시겠습니까?");
								  
								  if(confirm_val){
								   var checkArr = new Array();
								   checkArr.push($(this).attr("data-cartNum"));
								 
								   
								   $.ajax({
								    url : "deleteCart",
								    type : "post",
								    data : { "chbox" : checkArr}, 
									beforeSend : function(xhr)
				                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
										 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
										 
				                      },
								    success : function(result){
								      location.href = "/shop/cart";			     
								     }							    			
								   });
								  } 
								 });
								</script>								
								</c:forEach>
							</table>
							<div class="container">
								<div class="row">
									<div class="col-lg-12">
									<c:if test="${nocart != 'nocart'}">							
										<button class="btn btn-primary float-right" id="selectdel" data-cartNum="${product.cartNum}">선택 삭제</button>
									</c:if>	
									</div>
								</div>
							</div>
								<script>
								 /* 선택삭제 js */
								 $("#selectdel").click(function(){
									 var confirm_val = confirm("정말 삭제하시겠습니까?");
									 var checkArr = new Array();
									 	<c:forEach items="${cartList}" var="product">								   																 
									  	
									  	   $("input[id='check${product.productid}']:checked").each(function(){
											    checkArr.push($(this).attr("data-cartNum"));
											   });  	
									  			
									  	</c:forEach>
									 
								   if(confirm_val){
								  
								  	 /* alert(JSON.stringify(checkArr));  */
								   
								   $.ajax({
								    url : "deleteCart",
								    type : "post",
								    data : { "chbox" : checkArr}, 
									beforeSend : function(xhr)
				                      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
										 xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
										 
				                      },
								    success : function(result){
								      location.href = "/shop/cart";			     
								     }							    			
								   });
								   }  
								 });
								</script>
							<div class="container">
								<div class="row">
									<div class="col-sm"></div>
									<div class="col-sm">
										<strong>총 상품가격</strong>
									</div>
									<div class="col-sm">
										<strong>배송비</strong>
									</div>
									<div class="col-sm"></div>
									<div class="col-sm">
										<strong>총 주문 상품수</strong>
									</div>
								</div>
								<div class="row">
									<div class="col-sm">
										<pre></pre>
									</div>
									<div class="col-sm"></div>
									<div class="col-sm"></div>
									<div class="col-sm"></div>
									<div class="col-sm"></div>
								</div>
								<div class="row">
									<div class="col-sm"></div>
									<c:forEach items="${cartList}" var="product" varStatus="status">
									<!-- 총 책 값을 구하기 위한 변수 선언 후 값 더하기 -->
									<!-- 리스트에 책 값이 존재 할때 마다 값을 더해준다 -->
									<c:choose> 
										<c:when test="${product.price != null}">
											<c:set var="allprice" value="${allprice + (product.price * product.productStock)}"/>
											<c:set var="allStock" value="${allStock + product.productStock}"/>
										</c:when>
									</c:choose>
									<c:choose>	
										<c:when test="${status.last}">											
											<div class="col-sm">${allprice}원</div>
											<div class="col-sm">배송비 원</div>
											<div class="col-sm"></div>
											<div class="col-sm">${status.count}종   총 ${allStock} 권(개)</div>
										</c:when>
									</c:choose>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
						<c:if test="${nocart != 'nocart'}">
							<button class="btn btn-primary float-right">선택상품주문</button>
						</c:if>	
						</div>
					</div>
				</div>
				
				<!-- 전체 선택  js  -->				
				<script>
						$("#allcheck").click(function() {
							<c:forEach items="${cartList}" var="product" varStatus="status">							
							var productid = '${product.productid}';							
							 $("#check"+productid).prop("checked", $(this).prop("checked"));
							 </c:forEach>
						});
				</script>
				
				

				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>