<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Select All Checkboxes</h1>
	<form>
		<div class="checkbox select-all">
			<input id="all" type="checkbox" /> <label for="all">Select
				all</label>
		</div>
		<div class="checkbox rows">
			<input id="box1" type="checkbox" /> <label for="box1">Checkbox
				1</label>
		</div>
		<div class="checkbox rows">
			<input id="box2" type="checkbox" /> <label for="box2">Checkbox
				2</label>
		</div>
		<div class="checkbox rows">
			<input id="box3" type="checkbox" /> <label for="box3">Checkbox
				3</label>
		</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

	<script>
		$('#all').change(
				function(e) {
					if (e.currentTarget.checked) {
						$('.rows').find('input[type="checkbox"]').prop(
								'checked', true);
					} else {
						$('.rows').find('input[type="checkbox"]').prop(
								'checked', false);
					}
				});
	</script>

	<script>
		$("#checkAll").click(function() {
			$(".check").prop("checked", $(this).prop("checked"));
		});
	</script>
<head>
<meta charset="utf-8">
<title>jQuery</title>

</head>
<body>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.check-all').click(function() {
				$('.ab').prop('checked', this.checked);
			});
		});
	</script>
	<form>
		<p>
			<input type="checkbox" name="all" class="check-all"> <label>Check
				ALL</label>
		</p>
		<hr>
		<p>
			<input type="checkbox" name="cb1" class="ab"> <label>Checkbox
				1</label>
		</p>
		<p>
			<input type="checkbox" name="cb2" class="ab"> <label>Checkbox
				2</label>
		</p>
		<p>
			<input type="checkbox" name="cb3" class="ab"> <label>Checkbox
				3</label>
		</p>
		<p>
			<input type="checkbox" name="cb4" class="ab"> <label>Checkbox
				4</label>
		</p>
	</form>
</body>

<div class="dropdown">
	<button class="btn dropdown-toggle lg-4" type="button"
		id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
		aria-expanded="false">도서</button>
	<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		<h6 class="dropdown-header">가정 살림</h6>
		<a class="dropdown-item" href="#">육아</a> <a class="dropdown-item"
			href="#">요리</a>
		<h6 class="dropdown-header">건강 취미</h6>
		<a class="dropdown-item" href="#">스포츠</a> <a class="dropdown-item"
			href="#">퍼즐</a>
		<h6 class="dropdown-header">경제경영</h6>
		<a class="dropdown-item" href="#">경제</a> <a class="dropdown-item"
			href="#">마케팅</a>
		<h6 class="dropdown-header">사회정치</h6>
		<a class="dropdown-item" href="#">정치/외교</a> <a class="dropdown-item"
			href="#">사회학</a>
		<h6 class="dropdown-header">소설시희곡</h6>
		<a class="dropdown-item" href="#">한국소설</a> <a class="dropdown-item"
			href="#">영미소설</a>
		<h6 class="dropdown-header">수험서자격증</h6>
		<a class="dropdown-item" href="#">공무원</a> <a class="dropdown-item"
			href="#">교원임용시험</a>
		<h6 class="dropdown-header">어린이</h6>
		<a class="dropdown-item" href="#">어린이 교양</a> <a class="dropdown-item"
			href="#">어린이 문학</a>
		<h6 class="dropdown-header">에세이</h6>
		<a class="dropdown-item" href="#">한국 에세이</a> <a class="dropdown-item"
			href="#">외국 에세이</a>
		<h6 class="dropdown-header">여행</h6>
		<a class="dropdown-item" href="#">국내여행</a> <a class="dropdown-item"
			href="#">해외여행</a>
		<h6 class="dropdown-header">역사</h6>
		<a class="dropdown-item" href="#">한국사</a> <a class="dropdown-item"
			href="#">서양사</a>
		<h6 class="dropdown-header">예술</h6>
		<a class="dropdown-item" href="#">건축</a> <a class="dropdown-item"
			href="#">음악</a>
		<h6 class="dropdown-header">유아</h6>
		<a class="dropdown-item" href="#">0-3세</a> <a class="dropdown-item"
			href="#">4-6세</a>
		<h6 class="dropdown-header">청소년</h6>
		<a class="dropdown-item" href="#">인문 일반</a> <a class="dropdown-item"
			href="#">기호학/언어학</a>
		<h6 class="dropdown-header">자기계발</h6>
		<a class="dropdown-item" href="#">처세술/삶의 자세</a> <a
			class="dropdown-item" href="#">성공학/경력관리</a>
		<h6 class="dropdown-header">자연과학</h6>
		<a class="dropdown-item" href="#">과학</a> <a class="dropdown-item"
			href="#">수학</a>
		<h6 class="dropdown-header">종교</h6>
		<a class="dropdown-item" href="#">천주교</a> <a class="dropdown-item"
			href="#">기독교(개신교)</a>
		<h6 class="dropdown-header">it모바일</h6>
		<a class="dropdown-item" href="#">컴퓨터공학</a> <a class="dropdown-item"
			href="#">OS/데이터베이스</a>
	</div>
	<button class="btn dropdown-toggle lg-4" type="button"
		id="dropdownMenuButton1" data-toggle="dropdown" aria-haspopup="true"
		aria-expanded="false">예시</button>
	<div class="dropdown-menu1" aria-labelledby="dropdownMenuButton1">
		<h6 class="dropdown-header">살림 header</h6>
		<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item"
			href="#">Another action</a>
	</div>

</div>


<div class="logo"></div>
<div class="topMenu">
	<ul class="menu01">
		<li><span>가정 살림</span>
			<ul class="dept01">
				<li id="nop">육아</li>
				<li id="nop">요리</li>
			</ul></li>
		<li><span>건강취미</span>
			<ul class="dept01">
				<li id="nop">sub01</li>
				<li id="nop">sub02</li>
				<li id="nop">sub03</li>
				<li id="nop">sub04</li>
				<li id="nop">sub05</li>
			</ul></li>
		<li><span>경제 경영</span>
			<ul class="dept01">
				<li id="nop">sub01</li>
				<li id="nop">sub02</li>
				<li id="nop">sub03</li>
				<li id="nop">sub04</li>
				<li id="nop">sub05</li>
			</ul></li>
		<li><span>사회정치</span>
			<ul class="dept01">
				<li id="nop">sub01</li>
				<li id="nop">sub02</li>
				<li id="nop">sub03</li>
				<li id="nop">sub04</li>
				<li id="nop">sub05</li>
			</ul></li>
		<li><span>Menu05</span>
			<ul class="dept01">
				<li id="nop">sub01</li>
				<li id="nop">sub02</li>
				<li id="nop">sub03</li>
				<li id="nop">sub04</li>
				<li id="nop">sub05</li>
			</ul></li>
	</ul>
</div>
<div class="none"></div>


<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).on('mouseover', '.topMenu span', function() {
		$('.dept01').slideDown(100);
	});
	$(document).on('mouseover', 'div', function() {
		if (!$(this).hasClass('topMenu')) {
			$('.dept01').slideUp(120);
		}
	});
</script>



<span>구입 수량</span>
<button type="button" class="plus">+</button>
<input type="number" class="numBox" min="1" max="10" value="1"
	readonly="readonly" />
<button type="button" class="minus">-</button>

<script>
	$(".plus").click(function() {
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;

		if (plusNum >= 10) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);
		}
	});

	$(".minus").click(function() {
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1;

		if (minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);
		}
	});
</script>
<hr>
<!-- Default dropright button -->
<div class="btn-group dropright">
  <input  value="도서" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly"> 	
	  <div class="dropdown-menu dropright">
	  	  <input value="가정살림"  class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly"> 		  
  			  <div class="dropdown-menu">
			  	  <li class="nav-item">
			  	  <a class="nav-link dropdown-indicator collapsed" href="#authentication-basic" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-basic">가정살림</a>
                    <ul class="nav collapse" id="authentication-basic" style="">
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/login.html">Login</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/logout.html">Logout</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/register.html">Register</a></li>                 </ul>
                  </li>
	  		  </div>
	  		  <input value="건강취미"  class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" readonly="readonly"> 		  
  			  <div class="dropdown-menu">
			  	  <li class="nav-item">
			  	  <a class="nav-link dropdown-indicator collapsed" href="#authentication-basic" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-basic">건강취미</a>
                    <ul class="nav collapse" id="authentication-basic" style="">
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/reset-password.html">Reset password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/confirm-mail.html">Confirm mail</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/lock-screen.html">Lock screen</a></li>
                    </ul>
                  </li>
	  		  </div>
	  </div>
  </div>





<hr>
<div class="btn-group dropright">
  <button type="button" class="btn btn-secondary">
    Split dropright
  </button>
  <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropright</span>
  </button>
  <div class="dropdown-menu">
    <!-- Dropdown menu links -->
  </div>
</div>




<hr>
<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
  ...
  <li class="dropdown-submenu">
    <a tabindex="-1" href="#">More options</a>
    <ul class="dropdown-menu">
      ...
    </ul>
  </li>
</ul>



     
</div>



<a class="nav-link dropdown-indicator" href="#authentication" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="authentication">
	<div class="d-flex align-items-center">
	<span>도서</span>	
	</div>                  
</a>
<ul class="nav collapse show" id="authentication" data-parent="#navbarVerticalCollapse" style="">
                  <li class="nav-item"><a class="nav-link dropdown-indicator collapsed" href="#authentication-basic" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-basic">Basic</a>
                    <ul class="nav collapse" id="authentication-basic" style="">
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/login.html">Login</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/logout.html">Logout</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/register.html">Register</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/forgot-password.html">Forgot password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/reset-password.html">Reset password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/confirm-mail.html">Confirm mail</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/basic/lock-screen.html">Lock screen</a></li>
                    </ul>
                  </li>
                  <li class="nav-item"><a class="nav-link dropdown-indicator collapsed" href="#authentication-card" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-card">Card</a>
                    <ul class="nav collapse" id="authentication-card" style="">
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/login.html">Login</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/logout.html">Logout</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/register.html">Register</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/forgot-password.html">Forgot password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/reset-password.html">Reset password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/confirm-mail.html">Confirm mail</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/card/lock-screen.html">Lock screen</a></li>
                    </ul>
                  </li>
                  <li class="nav-item"><a class="nav-link dropdown-indicator collapsed" href="#authentication-split" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-split">Split</a>
                    <ul class="nav collapse" id="authentication-split" style="">
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/login.html">Login</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/logout.html">Logout</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/register.html">Register</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/forgot-password.html">Forgot password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/reset-password.html">Reset password</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/confirm-mail.html">Confirm mail</a></li>
                      <li class="nav-item"><a class="nav-link" href="../authentication/split/lock-screen.html">Lock screen</a></li>
                    </ul>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="../authentication/wizard.html">
                      <div class="d-flex align-items-center"><span>Wizard</span><span class="badge badge-pill ml-2 badge-soft-success">New</span></div>
                    </a></li>
                  <li class="nav-item"><a class="nav-link" href="#!" data-toggle="modal" data-target="#authentication-modal">In Modal</a></li>
                </ul>



<asd>ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</asd>
<script>
$("asd").on({ 
  click: function() {
    $("asd").append("마우스가 문장을 클릭했습니다.<br>");
  },
  mouseenter: function() {
    $("asd").append("마우스가 커서가 문장 위로 들어왔습니다.<br>");
  },
  mouseleave: function() {
    $("asd").append("마우스가 커서가 문장을 빠져 나갔습니다.<br>");
  }
});


</script>

<button id="btn1">div1로 이동</button>

<div id="div1">div1</div>

<script>

	$(document).ready(function(){

		$('#btn1').click(function(){

			var offset = $('#div1').offset(); //선택한 태그의 위치를 반환                

	        $('html').animate({scrollTop : offset.top}, 400);

		});

	});

</script>





<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

</body>
</html>