<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ include file="../includes/header.jsp"%>

	<div class="row formContainer">
		
		<div class="col-md-12">
			<h4 class="pageSubtitle">공지사항 작성</h4>
		</div>
		
		<form role="form" class="col-md-12" action="/NoticeBoard/noticeRegister" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
			<div class="form-group">
				<input class="form-control" name="title">
			</div>
			
			<div class="form-group">
				<textarea class="form-control" rows="10" name="content"></textarea>
			</div>
			
			<div class="form-group row">
			    <label for="inputuserid" class="col-sm-2 col-form-label">작성자</label>
			    <div class="col-sm-3">
			    	<input type="text" readonly class="form-control-plaintext" id="inputuserid" name="writer" value="<sec:authentication property="principal.username"/>">
			    </div>
			</div>
			
			<div class="row formContainer btnBox">
				<div class="col-sm-6">
					<button type="button" data-oper="list" class="btn btn-light" onclick="location.href='/NoticeBoard/noticeList'">목록</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
				<div class="col-sm-6 text-right">
					<button type="submit" class="btn btn-primary">작성</button>
				</div>
			</div>
		</form>
	</div>

<%@ include file="../includes/footer.jsp"%>