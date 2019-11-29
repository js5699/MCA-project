<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../includes/header.jsp"%>
	<div class="col-lg-12 formContainer">
		<h5 class="pageSubtitle">회원가입 정보 입력</h5>
	</div>
	<form action="/account/join" method="post" class="form-horizontal " name="joinForm" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		<div class="form-group row">
		    <label for="inputuserid" class="col-sm-2 ">아이디</label>
		    <div class="col-sm-3">
		    	<input type="text" class="form-control" placeholder="ID" id="inputuserid" name="userid">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputuserpw1" class="col-sm-2 ">비밀번호</label>
		    <div class="col-sm-3">
		    	<input type="password" class="form-control" placeholder="PASSWORD" id="inputuserpw1" name="userpw">
		    </div>
		    <div class="col-sm-3">
		    	<input type="password" class="form-control" placeholder="PASSWORD CONFIRM" id="inputuserpw2" name="userpw2">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputname" class="col-sm-2 ">이름</label>
		    <div class="col-sm-3">
		    	<input type="text" class="form-control" placeholder="NAME" id="inputname" name="name">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputemail" class="col-sm-2 ">이메일</label>
		    <div class="col-sm-5">
		    	<input type="email" class="form-control" placeholder="EMAIL" id="inputemail" name="email">
		    </div>
		</div>
		
		<div class="form-group row">
		    <label for="input" class="col-sm-2 ">전화번호</label>
		    <div class="col-sm-2">
					<select name="phone1" class="form-control" required="required">
						<option>선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
						<option value="02">서울 (02)</option>
						<option value="031">경기 (031)</option>
						<option value="032">인천 (032)</option>
						<option value="033">강원 (033)</option>
						<option value="041">충남 (041)</option>
						<option value="042">대전 (042)</option>
						<option value="043">충북 (043)</option>
						<option value="051">부산 (051)</option>
						<option value="052">울산 (052)</option>
						<option value="053">대구 (053)</option>
						<option value="054">경북 (054)</option>
						<option value="055">경남 (055)</option>
						<option value="061">전남 (061)</option>
						<option value="062">광주 (062)</option>
						<option value="063">전북 (063)</option>
						<option value="064">제주 (064)</option>
						<option value="070">인터넷전화 (070)</option>
						<option value="050">평생전화 (050)</option>
					</select>
                </div>
                <div class="col-sm-2"> 
                    <input type="number" class="form-control" id="ph2" name="phone2" required="required">
                </div>
                <div class="col-sm-2">
                    <input type="number" class="form-control" id="ph3" name="phone3" required="required">
                </div>
		</div>
		
		<div class="form-group row">
		    <label for="inputzipcode" class="col-sm-2 ">우편번호</label>
		    <div class="col-sm-3">
		    	<input type="text" class="form-control" placeholder="우편번호" id="inputzipcode" name="zipcode">
		    </div>
		    <div class="col-sm-5">
		    	<button type="button" class="btn btn-info" id="buttonFindZipcode" onClick="execDaumPostcode();">우편번호찾기</button>
		    </div>
		</div>
		<div class="form-group row">
		    <label for="input" class="col-sm-2 ">주소</label>
		    <div class="col-sm-5">
		    	<input type="text" class="form-control" name="address1" id="inputAddress1" />
		    </div>
		</div>
		<div class="form-group row">
		    <label for="input" class="col-sm-2 ">상세주소</label>
		    <div class="col-sm-5">
		    	<input type="text" class="form-control" placeholder="상세주소 입력" name="address2" id="inputAddress1" />
		    </div>
		</div>
		
		<div class="form-group row btn-submit">
		    <label for="input" class="col-sm-2 sr-only">회원가입 버튼</label>
		    <div class="col-sm-8 text-right">
		    	<button type="submit" class="btn btn-primary">회원가입</button>
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
<script type="text/javascript">
function formCheck() {
	jf = document.joinForm;
	
	if(jf.userid.value=="") {
        alert("아이디를 입력해 주세요");
        jf.userid.focus();
        return false;
    } else if(jf.userpw.value != jf.userpw2.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        jf.userpw.value = "";
        jf.userpw2.value = "";
        jf.userpw.focus();
        return false;
    } else if(jf.email.value=="") {
        alert("이메일을 입력해 주세요");
        jf.email.focus();
        return false;
    } else if(jf.name.value=="") {
        alert("이름을 입력해 주세요");
        jf.name.focus();
        return false;
    } else{
    	return true;
    }
}
</script>


<%@ include file="../includes/footer.jsp"%>
