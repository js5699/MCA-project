<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<!-- content -->
	<a href="#" class="test">장바구니g</a>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="../resources/vendor/test.js" type="text/javascript"></script>	
	<button class="btn">장바구니</button>
	<script>
		$(document).ready(function() {
			<sec:authorize access="isAuthenticated()">
			replyer='<sec:authentication property="principal.username"/>';
			</sec:authorize>
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			$(document).ajaxSend(function(e, xhr, options){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			});
			
			$(".btn").click(function(){
				
				var productid = "testbook name";
				var productstock = 1;
				
				var cart = {
						productid : productid,
						productstock : productstock
						};
				
				cartService.add(cart, function(result) {
					alert(result);
				});
				
			});
			
		});
	</script>
</body>
</html>


