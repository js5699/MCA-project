<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../includes/header.jsp"%>

<div class="row formContainer">
	<h5><i class="fas fa-user-slash"></i>회원탈퇴</h5>
</div>

<div class="col-lg-12">
	<p class="h6">탈퇴 전 안내사항</p>
	<dl class="row">
		<dt class="col-sm-1"><i class="fas fa-exclamation-triangle text-warning"></i></dt>
		<dd class="col-sm-11">출고 이전 주문이 있을 경우 상품 배송처리 문제로 탈퇴 불가합니다.(주문 취소 혹은 출고 이후 탈퇴 가능)</dd>
		<dt class="col-sm-1"><i class="fas fa-exclamation-triangle text-warning"></i></dt>
		<dd class="col-sm-11">모든 배송이 끝난경우엔 사이트에서 로그아웃되고 다시 로그인 할 수 없으며, 주문내역을 확인 할 수 없습니다.</dd>
		<dt class="col-sm-1"><i class="fas fa-exclamation-triangle text-warning"></i></dt>
		<dd class="col-sm-11">고객님의 거래내역은 전자상거래 등에서의 소비자보호에 관한 법률 제6조 및 동법 시행령 제 6조에 의거하여 표시 및 광고에 관한 기록은 6월, 계약 또는 청약 철회 등에 관한 기록은 5년, 대금결제 및 재화 공급 등의 공급에 관한 기록은 5년, 소비자 불만 또는 분쟁처리에 관한 기록은 3년간 기록됩니다.</dd>
	</dl>
</div>

<hr />

<div class="col-lg-12 mt-4 mb-5">
	<p class="text-center">본인 확인을 위해 비밀번호 입력 후 [회원 탈퇴]버튼을 클릭시 회원 탈퇴가 완료 됩니다.</p>
	<form action="/account/withdraw" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="form-row justify-content-md-center">
			<div class="col-sm-5 my-1">
				<label class="sr-only" for="inlineFormInputGroupUsername">PASSWORD</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">비밀번호</div>
					</div>
					<input type="password" class="form-control" id="inputpassword" placeholder="PASSWORD" name="userpwcf">
				</div>
			</div>
			<div class="col-auto my-1">
		      <button type="submit" class="btn btn-outline-danger">회원 탈퇴</button>
		    </div>
		</div>
	</form>
</div>

<div class="card mb-md-3">
	<div class="card-header"><strong>개인정보 수집, 이용, 제공에 대한 동의철회</strong></div>
	<div class="card-body">
		<p class="card-text">
			① 회원가입 등을 통해 개인정보의 수집, 이용, 제공에 대해 이용자께서 동의하신 내용을 이용자는 언제든지 철회하실 수
			있습니다.<br /> 동의철회는 홈페이지 첫 화면의 『나의계정』을 클릭하거나 개인정보관리책임자 및 담당자에게 서면, 전화,
			E-mail등으로 연락하시면 즉시 개인정보의 삭제 등 필요한 조치를 하겠습니다.<br /> 동의 철회를 하고 개인정보를
			파기하는 등의 조치를 취한 경우에는 그 사실을 이용자께 지체없이 통지하도록 하겠습니다.<br /> ② 알라딘은 개인정보의
			수집에 대한 동의철회(계정 삭제)를 개인정보를 수집하는 방법보다 쉽게 할 수 있도록 필요한 조치를 취하겠습니다.
		</p>
	</div>
</div>

<div class="card mb-md-3">
	<div class="card-header"><strong>개인정보의 보유 및 이용기간</strong></div>
	<div class="card-body">
		<p class="card-text">
			① 이용자의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 법령의
			규정에 의하여 보존할 필요성이 있는 경우에는 예외로 합니다.<br /> - 계정정보의 경우, 계정을 삭제하거나 제명된 때<br />
			- 대금지급정보의 경우, 대금의 완제일 또는 채권소멸시효기간이 만료된 때<br /> - 배송정보의 경우, 물품 또는
			서비스가 인도되거나 제공된 때<br /> ② 위 개인정보 수집목적 달성시 즉시파기 원칙에도 불구하고 다음과 같이 거래 관련
			권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 전자상거래등에서의소비자보호에 관한법률등에
			근거하여 일정기간 보유합니다.<br /> ⓐ 계약 또는 청약철회 등에 관한 기록<br /> - 보존 근거 : 전자상거래
			등에서의 소비자보호에 관한 법률<br /> - 보존 기간 : 5년<br /> ⓑ 대금결제 및 재화 등의 공급에 관한 기록<br />
			- 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br /> - 보존 기간 : 5년<br /> ⓒ 소비자의
			불만 또는 분쟁처리에 관한 기록<br /> - 보존 근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br /> -
			보존 기간 : 3년<br /> ③ 이용자의 동의를 받아 보유하고 있는 거래정보등을 이용자께서 열람을 요구하는 경우 알라딘은
			지체없이 그 열람할 수 있도록 조치합니다.<br />
		</p>
	</div>
</div>

<div class="card mb-md-3">
	<div class="card-header"><strong>개인정보의 파기 절차 및 방법</strong></div>
	<div class="card-body">
		<p class="card-text">
			이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br /> “알라딘”의
			파기절차 및 방법은 다음과 같습니다.<br /> ① 파기절차<br /> - 이용자가 회원가입 등을 위해 입력한 정보는
			이용목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에
			따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다. <br />- 동 개인정보는 법률에 의한 경우가 아니고서는 보유되는
			이외의 다른 목적으로 이용되지 않습니다.<br /> ② 파기방법<br /> - 종이에 출력된 개인정보는 분쇄기로
			분쇄하거나 소각을 통하여 파기합니다. <br />- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여
			삭제합니다.<br />
		</p>
	</div>
</div>

<%@ include file="../includes/footer.jsp"%>