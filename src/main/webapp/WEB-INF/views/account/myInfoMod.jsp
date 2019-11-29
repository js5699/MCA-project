<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

	<c:if test="${result eq 'success'}">
	<div class="alert alert-success alert-dismissible fade show" role="alert">
		<strong>회원가입 완료</strong> 로그인 할 수 있습니다.
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	</c:if>

	<div class="col-lg-12 formContainer">
		<h5 class="pageSubtitle">비밀번호 변경</h5>
	</div>
	
	<!-- 비밀번호 변경 폼 -->
	<form action="/account/myInfoMod/pw" method="post" class="form-horizontal" name="pwModForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		<div class="form-group row">
		    <label for="inputuserid" class="col-sm-2">아이디</label>
		    <div class="col-sm-3">
		    	<input type="text" readonly class="form-control-plaintext" id="inputuserid" name="userid" value="${user.userid}">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputuserid" class="col-sm-2">현재 비밀번호</label>
		    <div class="col-sm-3">
		    	<input type="password" class="form-control" id="inputuserid" name="userpw" placeholder="PASSWORD">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputnewuserpw1" class="col-sm-2 ">새 비밀번호</label>
		    <div class="col-sm-3">
		    	<input type="password" class="form-control" placeholder="NEW PASSWORD" id="inputnewuserpw1" name="newUserPw1">
		    </div>
		    <div class="col-sm-3">
		    	<input type="password" class="form-control" placeholder="NEW PASSWORD CONFIRM" id="inputnewuserpw1" name="newUserPw2">
		    </div>
		</div>
		
		<div class="form-group row btn-submit">
		    <label for="input" class="col-sm-2 sr-only">수정완료 버튼</label>
		    <div class="col-sm-12 text-right">
		    	<button type="submit" class="btn btn-primary" onclick="return pwModCheck()">비밀번호 수정</button>
		    </div>
		</div>
	</form>
	<script>
		
	</script>
	
	<!-- 상세 정보 수정 폼 -->
	<div class="col-lg-12 formContainer">
		<h5 class="pageSubtitle">상세 정보</h5>
	</div>
	<form action="/account/myInfoMod/info" method="post" class="form-horizontal" name="infoModForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="userid" value="${user.userid}" />
		<div class="form-group row">
		    <label for="inputname" class="col-sm-2">이름</label>
		    <div class="col-sm-3">
		    	<input type="text" class="form-control" placeholder="NAME" id="inputname" name="name" value="${user.name}">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputemail" class="col-sm-2 ">이메일</label>
		    <div class="col-sm-5">
		    	<input type="email" class="form-control" placeholder="EMAIL" id="inputemail" name="email" value="${user.email}">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="input" class="col-sm-2 ">전화번호</label>
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
		    <label for="inputzipcode" class="col-sm-2 ">우편번호</label>
		    <div class="col-sm-3">
		    	<input type="text" class="form-control" placeholder="우편번호" id="inputzipcode" name="zipcode" value="${user.zipcode}" >
		    </div>
		    <div class="col-sm-5">
		    	<button type="button" class="btn btn-info" id="buttonFindZipcode" onClick="execDaumPostcode();">우편번호찾기</button>
		    </div>
		</div>
		<div class="form-group row">
		    <label for="inputAddress1" class="col-sm-2 ">주소</label>
		    <div class="col-sm-5">
		    	<input type="text" class="form-control" name="address1" id="inputAddress1"  value="${user.address1}" />
		    </div>
		</div>
		<div class="form-group row">
		    <label for="inputAddress2" class="col-sm-2 ">상세주소</label>
		    <div class="col-sm-5">
		    	<input type="text" class="form-control" placeholder="상세주소 입력" name="address2" id="inputAddress2"  value="${user.address2}" />
		    </div>
		</div>
		
		<div class="form-group row btn-submit">
		    <label for="input" class="col-sm-2 sr-only">수정완료 버튼</label>
		    <div class="col-sm-12 text-right">
		    	<button type="submit" class="btn btn-primary" onclick="return modFormCheck()">정보수정 완료</button>
		    </div>
		</div>
	
	</form>
	
	<script>
		function pwModCheck() {
			pmf = document.pwModForm;
			
			if( pmf.newuserpw1.value == "" || pmf.newuserpw2.value == "" || pmf.newuserpw1.value != pmf.newuserpw2.value) {
		        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		        pmf.newuserpw1.value = "";
		        pmf.newuserpw2.value = "";
		        pmf.userpw.focus();
		        return false;
		    } else {
		    	return true;
		    }
		}
	
		function formCheck() {
			imf = document.infoModForm;
			
			if(imf.email.value=="") {
		        alert("이메일을 입력해 주세요");
		        imf.email.focus();
		        return false;
		    } else if(imf.name.value=="") {
		        alert("이름을 입력해 주세요");
		        imf.name.focus();
		        return false;
		    } else{
		    	return true;
		    }
		}
	</script>
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
<%@ include file="../includes/footer.jsp"%>