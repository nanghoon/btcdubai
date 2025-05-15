<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="679c71666e658672e6336fcd" data-wf-site="67930f452d3c56c4f68244bb">
<head>
	<jsp:include page="frame/header.jsp"></jsp:include>
</head>
<body>
	<div class="root">
		<jsp:include page="frame/menu.jsp"></jsp:include>
		<div class="form-block w-form">
			<form id="form" class="form" data-wf-page-id="679c75698198ca36a355e3a5" data-wf-element-id="4162bf84-9541-6812-a888-7dac6114f4fb">
				<div class="member-box">
					<div class="signup-img"></div>
					<div class="member-frame">
						<div class="head-txt"><spring:message code="menu.login"/></div>
						<div class="auth-tap">
							<div class="member-txt on" onclick="javascript:setAuth(0,'phone')"><spring:message code="join.phoneAuth"/></div>
							<div class="member-txt" onclick="javascript:setAuth(1,'email')"><spring:message code="join.emailAuth"/></div>
						</div>
						<div class="member-input-list">
							<div class="member-wrap" id="phoneBox" style="display:block;">
								<div class="member-title"><spring:message code="join.phone"/></div>
								<div class="member-input-box">
									<input onkeyup="SetNum(this)" class="member-input-long w-input" maxlength="20" name="phone" id="phone"
										placeholder="<spring:message code="join.phoneInput"/>" type="text"> 
								</div>
							</div>
							<div class="member-wrap" id="emailBox" style="display:none;">
								<div class="member-title"><spring:message code="join.email"/></div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="200" name="email" id="email"
										placeholder="<spring:message code="join.emailInput"/>" type="text"> 
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title"><spring:message code="join.pw"/></div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="30" name="pw"
										placeholder="<spring:message code="join.pwInput"/>" type="password">
								</div>
							</div>
							<a href="javascript:login()" class="member-confirm-btn w-button _loginBtn"><spring:message code="menu.login"/></a>
						</div>
						<div class="member-txt-wrap">
							<a href="javascript:openPwPop()" class="member-link w-inline-block">
								<div class="member-link"><spring:message code="menu.findPw"/></div>
							</a> 
							<a href="/btc/join.do" class="member-link main-color w-inline-block">
								<div><spring:message code="menu.join"/></div>
							</a>
						</div>
					</div>
				</div>
				<div class="popup">
					<div class="password_pop">
						<div class="registpop_blcok">
							<div class="poptitle">
								<div class="title6-2">비밀번호 찾기</div>
							</div>
							<div class="w-layout-vflex input-field-flex-box">
								<div class="login-box">
									<label for="name" class="title5-2"><strong>Contact</strong></label>
									<div class="password-find-box">
										<input class="input-password-find w-input" maxlength="256"
											name="name-3" data-name="Name 3" placeholder="Please enter your contact information"
											type="text" id="name-3"> 
										<a href="#" class="auth-btn w-button">인증요청</a>
									</div>
								</div>
								<label for="email" class="field-label"><strong>Authentication code</strong></label>
								<input class="l_p_input w-input" maxlength="256"
									name="email-3" data-name="Email 3" placeholder="인증 코드를 입력 해주세요"
									type="email" id="email-3" required="">
								<div class="password-forgot">
									<label for="email" class="field-label">새 비밀번호 입력</label>
									<input class="l_p_input w-input" maxlength="256" name="email-3"
										data-name="Email 3" placeholder="새로운 비밀번호를 입력해주세요"
										type="email" id="email-3" required="">
									<div class="warn">※비밀번호는 영어+숫자 8자리 이상으로 설정 가능합니다.</div>
									<label for="name" class="field-label">새 비밀번호 입력 확인</label><input
										class="l_p_input w-input" maxlength="256" name="email-3"
										data-name="Email 3" placeholder="새로운 비밀번호를 입력해주세요"
										type="email" id="email-3" required="">
								</div>
							</div>
							<div class="pop_btn-4">
								<a href="javascript:closePwPop()" class="cancle-2 w-button">취소</a> 
								<a href="#" class="confirm-2 w-button">확인</a>
							</div>
							<div class="pop_exist" onclick="javascript:closePwPop()">
								<img sizes="(max-width: 1600px) 100vw, 1600px" alt="" src="/btc/wf/images/wx.png" loading="lazy" class="close-img">
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="frame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="frame/footer.jsp"></jsp:include>
</body>
<script>
function openPwPop(){
	$(".popup , .password_pop").css('display','flex');
}
function closePwPop(){
	$(".popup , .password_pop").css('display','none');
}
function setAuth(n , type){
	$(".member-txt").removeClass("on");
	$(".member-txt").eq(n).addClass("on");
	$("[id*=Box]").css('display','none');
	$("[id*=Box]").find('input').val("");
	$("#"+type+"Box").css('display','block');
}
function login(){
	$("._loginBtn").attr('href','javascript:void(0)');
	$.ajax({
		type :'post',
		data : $("#form").serialize(),
		url : '/btc/loginProcess.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.href='/btc/main.do';
			}else{
				$("._loginBtn").attr('href','javascript:login()');
			}
		}
	})
}
</script>
</html>