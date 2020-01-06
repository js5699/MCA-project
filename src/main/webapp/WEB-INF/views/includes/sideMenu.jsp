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
			<div class="list-group mb-3">
				<a href="/account/myPage" class="list-group-item">내 정보</a>
				<a href="/account/myPage" class="list-group-item">내가 쓴 글</a>
			</div>
			<div class="list-group mb-3">
				<a href="/account/myPage" class="list-group-item">주문 내역</a>
				<a href="#"	class="list-group-item">교환내역</a>
				<a href="#"	class="list-group-item">취소내역</a>
			</div>
			<div class="list-group mb-3">
				<a href="/account/withdraw" class="list-group-item">회원탈퇴</a>
			</div>
		</c:when>
		<c:when test="${sideNavName eq 'NoticeBoard' or sideNavName eq 'QnaBoard'}">
			<h4 class="sidevarName">고객센터</h4>
			<div class="list-group">
				<a href="/NoticeBoard/noticeList" class="list-group-item">공지게시판</a>
				<a href="/QnaBoard/list" class="list-group-item">Q&A게시판</a>
			</div>
		</c:when>
		<c:when test="${sideNavName eq 'adminProduct' or sideNavName eq 'adminUser'}">
			<h4 class="sidevarName">관리자 전용</h4>
			<div class="list-group">
				<a href="/adminProduct/register" class="list-group-item">물품 등록</a>
				<a href="/adminUser/info" class="list-group-item">회원 관리</a>
				<a href="/adminUser/list" class="list-group-item">주문 정보</a>
			</div>
		</c:when>
		<c:otherwise>
			<h4 class="sidevarName">분류</h4>
			<div class="list-group btn-group dropright">
				<input  value="도서" class="dropdown-toggle list-group-item" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly"> 	
		  			<div class="dropdown-menu dropright">
	  				  <ul class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly"> 		  
  			 	 		가정살림  
  			 	 		<div class="dropdown-menu">
					  	      <li><a href="#"> 메뉴 1</a><li>
							  <li><a href="#"> 메뉴 2</a><li>
							  <li><a href="#"> 메뉴 3</a><li>				
			  		    </div>
			  		    </ul>			  		    			  		  			  			    			  		 
			  		    <ul class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly">
			  		   	 건강 취미  		  
  			 	 		<div class="dropdown-menu">
					  	     <li><a href="#"> 메뉴 4</a><li>
							 <li><a href="#"> 메뉴 5</a><li>
							 <li><a href="#"> 메뉴 6</a><li>		
			  		    </div>
			  		    </ul>
			  		</div>	
				<input  value="해외도서" class="dropdown-toggle1 list-group-item" data-toggle="dropdown1" aria-haspopup="true" aria-expanded="false" readonly="readonly">
  				<input  value="CD음반" class="dropdown-toggle2 list-group-item" data-toggle="dropdown2" aria-haspopup="true" aria-expanded="false" readonly="readonly">
			</div>
		</c:otherwise>
	</c:choose>
	