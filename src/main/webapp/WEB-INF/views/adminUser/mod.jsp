<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("replaceChar", "<br>"); %>

<%@ include file="../includes/header.jsp"%>
<div class="row formContainer">
	<h5>관리자 
	<i class="fas fa-caret-right depth-arrow"></i> 고객 관리 
	<i class="fas fa-caret-right depth-arrow"></i> ${user.userid}님의 회원 정보 수정
	</h5>
</div>


<c:if test="${result eq 'userModSuccess'}">
	<div class="alert alert-success" role="alert">
		<i class="fas fa-check"></i> 회원 정보가 수정되었습니다.
	</div>
</c:if>

<form action="/adminUser/mod" method="post" class="form-horizontal">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="userid" id="userid" value="${user.userid}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<input type="hidden" name="kw_name" value="${cri.kw_name}"/>
	<input type="hidden" name="kw_date_from" value="${cri.kw_date_from}"/>
	<input type="hidden" name="kw_date_to" value="${cri.kw_date_to}"/>
	
	<div class="row formContainer">
		<h5 class="col-lg-12"><i class="fas fa-user-lock"></i> 회원 권한</h5>
	
		<c:forEach items="${auth}" var="auth">
			<c:if test="${auth.auth == 'ROLE_USER'}">
				<c:set var="auth_user" value="${auth.auth}"/>
			</c:if>
			<c:if test="${auth.auth == 'ROLE_ADMIN'}">
				<c:set var="auth_admin" value="${auth.auth}"/>
			</c:if>
		</c:forEach>
		
		<div class="col-lg-12 formContainer-top">
			<div class="form-group row ">
				<label for="inputAddress2" class="col-sm-2">회원권한 관리</label>
				<div class="custom-control-mypage custom-checkbox col-sm-5">
					<input type="checkbox" class="custom-control-input" id="auth_user" value="ROLE_USER" checked disabled>
					<label class="custom-control-label" for="auth_user">일반회원</label>
					<p><small class="text-muted">회원가입시 기본 회원권한이며 관리자에게도 부여됩니다.</small></p>
				</div>
			
				<div class="custom-control-mypage custom-checkbox col-sm-5 ">
					<input type="checkbox" class="custom-control-input" id="auth_admin" value="ROLE_ADMIN" ${!empty auth_admin ? 'checked disabled' : ''} >
					<label class="custom-control-label" for="auth_admin">관리자</label>
					<p><small class="text-muted">이 회원에게 관리자 권한이 추가됩니다.</small></p>
				</div>
			</div>
		</div>
		<div class="col-lg-12 text-right">
			<button class="btn btn-warning btn-sm">권한 업데이트</button>
		</div>
	</div>
	
	<div class="row">
		<h5 class="col-lg-12"><i class="fas fa-user-edit"></i> 회원 등록 정보</h5>
	</div>
	<div class="form-group row">
	    <label for="inputuserid" class="col-sm-2 col-form-label">아이디</label>
	    <div class="col-sm-3">
	    	<input type="text" readonly class="form-control-plaintext" id="inputuserid" name="userid-display" value="${user.userid}">
	    </div>
	</div>
	
	<hr />
	
	<div class="form-group row">
	    <label for="inputname" class="col-sm-2 col-form-label">이름</label>
	    <div class="col-sm-3">
	    	<input type="text" class="form-control" placeholder="NAME" id="inputname" name="name" value="${user.name}">
	    </div>
	</div>
	
	<div class="form-group row">
	    <label for="inputemail" class="col-sm-2 col-form-label">이메일</label>
	    <div class="col-sm-5">
	    	<input type="email" class="form-control" placeholder="EMAIL" id="inputemail" name="email" value="${user.email}">
	    </div>
	</div>
	
	<div class="form-group row">
	    <label for="input" class="col-sm-2 col-form-label">전화번호</label>
	    <div class="col-sm-2">
			<select name="phone1" class="form-control" required="required">
				<option>선택</option>
				<option value="010" ${user.phone1=='010'?'selected':''}>010</option>
				<option value="011" ${user.phone1=='011'?'selected':''}>011</option>
				<option value="016" ${user.phone1=='016'?'selected':''}>016</option>
				<option value="017" ${user.phone1=='017'?'selected':''}>017</option>
				<option value="018" ${user.phone1=='018'?'selected':''}>018</option>
				<option value="019" ${user.phone1=='019'?'selected':''}>019</option>
				<option value="02" ${user.phone1=='02'?'selected':''}>서울 (02)</option>
				<option value="031" ${user.phone1=='031'?'selected':''}>경기 (031)</option>
				<option value="032" ${user.phone1=='032'?'selected':''}>인천 (032)</option>
				<option value="033" ${user.phone1=='033'?'selected':''}>강원 (033)</option>
				<option value="041" ${user.phone1=='041'?'selected':''}>충남 (041)</option>
				<option value="042" ${user.phone1=='042'?'selected':''}>대전 (042)</option>
				<option value="043" ${user.phone1=='043'?'selected':''}>충북 (043)</option>
				<option value="051" ${user.phone1=='051'?'selected':''}>부산 (051)</option>
				<option value="052" ${user.phone1=='052'?'selected':''}>울산 (052)</option>
				<option value="053" ${user.phone1=='053'?'selected':''}>대구 (053)</option>
				<option value="054" ${user.phone1=='054'?'selected':''}>경북 (054)</option>
				<option value="055" ${user.phone1=='055'?'selected':''}>경남 (055)</option>
				<option value="061" ${user.phone1=='061'?'selected':''}>전남 (061)</option>
				<option value="062" ${user.phone1=='062'?'selected':''}>광주 (062)</option>
				<option value="063" ${user.phone1=='063'?'selected':''}>전북 (063)</option>
				<option value="064" ${user.phone1=='064'?'selected':''}>제주 (064)</option>
				<option value="070" ${user.phone1=='070'?'selected':''}>인터넷전화 (070)</option>
				<option value="050" ${user.phone1=='050'?'selected':''}>평생전화 (050)</option>
			</select>
              </div>
              <div class="col-sm-2"> 
                  <input type="number" class="form-control" id="ph2" name="phone2" value="${user.phone2}" required="required">
              </div>
              <div class="col-sm-2">
                  <input type="number" class="form-control" id="ph3" name="phone3" value="${user.phone3}" required="required">
              </div>
	</div>
	
	<div class="form-group row">
	    <label for="inputzipcode" class="col-sm-2 col-form-label">우편번호</label>
	    <div class="col-sm-3">
	    	<input type="text" class="form-control" placeholder="우편번호" id="inputzipcode" name="zipcode" value="${user.zipcode}" >
	    </div>
	    <div class="col-sm-5">
	    	<span class="btn btn-info" id="buttonFindZipcode" onClick="execDaumPostcode();">우편번호찾기</span>
	    </div>
	</div>
	<div class="form-group row">
	    <label for="inputAddress1" class="col-sm-2 col-form-label">주소</label>
	    <div class="col-sm-5">
	    	<input type="text" class="form-control" name="address1" id="inputAddress1"  value="${user.address1}" />
	    </div>
	</div>
	<div class="form-group row">
	    <label for="inputAddress2" class="col-sm-2 col-form-label">상세주소</label>
	    <div class="col-sm-5">
	    	<input type="text" class="form-control" placeholder="상세주소 입력" name="address2" id="inputAddress2"  value="${user.address2}" />
	    </div>
	</div>
	
	<div class="row formContainer-top formContainer">
		<h5 class="col-lg-12"><i class="fas fa-user-edit"></i> 관리자 메모</h5>
	</div>
	<div class="form-group row ">
	    <label for="inputAddress2" class="col-sm-2 col-form-label">메모</label>
	    <div class="col-sm-10"> 
	    	<textarea class="form-control" rows="4" name="adminMemo">${fn:replace(user.adminMemo, replaceChar, "\\n")}</textarea>
	    	<small id="emailHelp" class="form-text text-muted">관리자 메모는 관리자만 확인할 수 있으며 회원에게는 공개되지않습니다.</small>
	    </div>
	</div>
	
	<div class="row formContainer btnBox">
		<div class="col-sm-6">
	    	<button type="submit" class="btn btn-secondary" data-oper="list">목록</button>
	    	<button type="submit" class="btn btn-info" data-oper="info">회원정보</button>
	    </div>
	    <div class="col-sm-6 text-right">
	    	<button type="submit" class="btn btn-primary" data-oper="mod">저장</button>
	    </div>
	</div>
	
	
	
</form>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$('[name=zipcode]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address1]').val(data.address);
				$('[name=address2]').val(data.buildingName);
	        }
	    }).open();
	}
</script>
<script>
	$(document).ready(function() {
		
		var formObj = $("form");
		
		$("button").on("click", function(e) {
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			var useridTag = $("input[name='userid']").clone();
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var kw_date_fromTag = $("input[name='kw_date_from']").clone();
			var kw_date_toTag = $("input[name='kw_date_to']").clone();
			var kw_nameTag = $("input[name='kw_name']").clone();
			
			if (operation == 'list') {
				
				formObj.attr("action", "/adminUser/list").attr("method", "get");
				formObj.empty();
				
			}else if(operation == 'info') {
				
				formObj.attr("action", "/adminUser/info").attr("method", "get");
				formObj.empty();
				formObj.append(useridTag);
				
			}else if(operation == 'mod') {
				formObj.submit();
			}
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(kw_date_fromTag);
			formObj.append(kw_date_toTag);
			formObj.append(kw_nameTag);
			
			formObj.submit();
			
		});

	});
</script>

<%@ include file="../includes/footer.jsp"%>