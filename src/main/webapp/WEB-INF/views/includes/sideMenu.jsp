<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
	<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
	
	<c:set var="pageUrl" value="${fn:split(path, '/')}"/>

	<c:forEach var="pu" items="${pageUrl}" varStatus="s">
		<c:if test="${s.count==1}">
			<c:set var="sideNavName" value="${pu}"/>
		</c:if>	
	</c:forEach>

	<!-- shopping menu  -->
	<c:choose>
		<c:when test="${sideNavName eq 'account'}">
			<h4 class="sidevarName">마이페이지</h4>
			<div class="list-group">
				<a href="/account/myPage" class="list-group-item">내 정보 수정</a>
				<a href="#"	class="list-group-item">주문 내역</a>
			</div>
		</c:when>
		<c:otherwise>
			<h4 class="sidevarName">분류</h4>
			<div class="list-group">
				<a href="#" class="list-group-item">국내 도서</a>
				<a href="#"	class="list-group-item">해외 도서</a>
				<a href="#"	class="list-group-item">음반</a>
			</div>
		</c:otherwise>
	</c:choose>
	