<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%@ include file="includes/header.jsp"%>

<div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="PASSWORD" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="/index.html" class="btn btn-lg btn-success btn-block">Login</a>
                            </fieldset>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div>
        	<p class="bg-warning"> 아이디 혹은 비밀 번호가 일치하지 않습니다.</p>
        </div>
        <script src="/resources/vendor/jquery/jquery.min.js"></script>
        <script>
    	
    	$(".btn-success").on("click", function(e){
    		
    		e.preventDefault();
    		$("form").submit();
    		
    	});
    </script>

<%@ include file="includes/footer.jsp"%>