function checkz() {
	var getIntro = $("#intro").val().replace(/\s|/gi, '');
	var getinputemail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	var getName = RegExp(/^[가-힣]+$/);
	var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
	var pwRECheck = RegExp(/^[a-zA-Z0-9]{6,20}$/);
	
	//아이디 공백 확인
	if ($("#inputuserid").val() == "") {
		alert("아이디를 입력하세요.");
		$("#inputuserid").focus();
		return false;
	}

	//이름의 유효성 검사
	if (!getCheck.test($("#inputname").val())) {
		alert("이름을 정확히 입력하세요.");
		$("#inputname").val("");
		$("#inputname").focus();
		return false;
	}
	
	//이름 유효성
	if (!getName.test($("#inputname").val())) {
		alert("알맞은 정확히 입력하세요.");
		$("#inputname").val("");
		$("#inputname").focus();
		return false;
	}

	//비밀번호
	if (!pwRECheck.test($("#inputuserpw1").val())) {
		alert("비밀번호는 영어 대소문자+숫자, 6~20자리로 쓸 수 있습니다.");
		$("#inputuserpw1").val("");
		$("#inputuserpw1").focus();
		return false;
	}

	//아이디랑 비밀번호랑 같은지
	if ($("#inputname").val() == ($("#inputuserpw1").val())) {
		alert("아이디와 비밀번호는 똑같이 설정할 수 없습니다.");
		$("#inputuserpw1").val("");
		$("#inputuserpw1").focus();
	}

	//비밀번호 똑같은지
	if ($("#inputuserpw1").val() != ($("#inputuserpw2").val())) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#inputuserpw1").val("");
		$("#inputuserpw2").val("");
		$("#inputuserpw1").focus();
		return false;
	}

	//이메일 공백 확인
	if ($("#inputemail").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#inputemail").focus();
		return false;
	}

	//이메일 유효성 검사
	if (!getinputemail.test($("#inputemail").val())) {
		alert("이메일형식에 맞게 입력해주세요.")
		$("#inputemail").val("");
		$("#inputemail").focus();
		return false;
	}
	
	 if(idck==0){
         alert("아이디 중복체크해주세요.");
         return false;
     }

	return true;
}