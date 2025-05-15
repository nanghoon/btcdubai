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
			<form id="form" class="form" data-wf-page-id="679c71666e658672e6336fcd" data-wf-element-id="c316de6c-4760-7247-4e27-1358610678ba">
				<div class="member-box">
					<div class="signup-img"></div>
					<div class="member-frame">
						<div class="head-txt"><spring:message code="join.title"/></div>
						<div class="auth-tap">
							<div class="member-txt on" onclick="javascript:setAuth(0,'phone')"><spring:message code="join.phoneAuth"/></div>
							<div class="member-txt" onclick="javascript:setAuth(1,'email')"><spring:message code="join.emailAuth"/></div>
						</div>
						<div class="member-input-list">
							<div class="member-wrap" id="phoneBox" style="display:block;">
								<div class="member-title"><spring:message code="join.phone"/></div>
								<div class="member-input-box">
									<input onkeyup="SetNum(this)" class="member-input-short w-input" maxlength="20" name="phone" id="phone"
										placeholder="<spring:message code="join.phoneInput"/>" type="text"> 
									<a href="javascript:sendAuth('phone')" class="member-btn w-button _phoneBtn"><spring:message code="join.authBtn"/></a>
								</div>
							</div>
							<div class="member-wrap" id="emailBox" style="display:none;">
								<div class="member-title"><spring:message code="join.email"/></div>
								<div class="member-input-box">
									<input class="member-input-short w-input" maxlength="200" name="email" id="email"
										placeholder="<spring:message code="join.emailInput"/>" type="text"> 
									<a href="javascript:sendAuth('email')" class="member-btn w-button _emailBtn"><spring:message code="join.authBtn"/></a>
								</div>
							</div>
							<div class="member-wrap" id="authBox" style="display:none;">
								<div class="member-title"><spring:message code="join.authNum"/></div>
								<div class="member-input-box">
									<input onkeyup="SetNum(this)" class="member-input-short w-input" maxlength="6" name="code" id="code"
										placeholder="<spring:message code="join.authInput"/>" type="text"> 
									<a href="javascript:checkAuth()" class="member-btn w-button _authBtn"><spring:message code="join.check"/></a>
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title"><spring:message code="join.name"/></div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="30" name="name"
										placeholder="<spring:message code="join.nameInput"/>" type="text">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title"><spring:message code="join.pw"/></div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="30" name="pw"
										placeholder="<spring:message code="join.pwInput"/>" type="password">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title"><spring:message code="join.pwChk"/></div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="30" name="pwChk"
										placeholder="<spring:message code="join.pwChkInput"/>" type="password">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title"><spring:message code="join.invite"/> (Option)</div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="10" name="invite"
										placeholder="<spring:message code="join.inviteInput"/>" type="text">
								</div>
							</div>
							<label class="w-checkbox checkbox-field">
								<input type="checkbox" id="agree" name="checkbox" class="w-checkbox-input">
								<span class="w-form-label" for="agree"><spring:message code="join.privacy"/></span>
							</label> 
							<a href="javascript:join()" class="member-confirm-btn w-button _joinBtn"><spring:message code="join.joinBtn"/></a>
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
var joinAuth = false;
function setAuth(n , type){
	joinAuth = false;
	$(".member-txt").removeClass("on");
	$(".member-txt").eq(n).addClass("on");
	$("[id*=Box]").css('display','none');
	$("[id*=Box]").find('input').prop('readonly',false);
	$("[id*=Box]").find('input').val("");
	$("#"+type+"Box").css('display','block');
	$("._phoneBtn").attr("href","javascript:sendAuth('phone')");
	$("._emailBtn").attr("href","javascript:sendAuth('email')");
	$("._authBtn").attr("href" , "javascript:checkAuth()");
	$("._joinBtn").attr('href','javascript:join()');
}
function sendAuth(type){
	$("._"+type+"Btn").attr("href" , "javascript:void(0)");
	$.ajax({
		type : 'post',
		data : { 'type' : type ,  'value' : $("#"+type).val() },
		url : '/btc/sendAuth.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){				
				$("#authBox").css('display','block');
			}else{
				$("._"+type+"Btn").attr("href" , "javascript:sendAuth('"+type+"')");
			}
		}
	})
}
function checkAuth(){
	$("._authBtn").attr("href" , "javascript:void(0)");
	$.ajax({
		type :'post',
		data : {'code' : $("#code").val()},
		url : '/btc/checkAuth.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				joinAuth = true;
				$("[id*=Box]").find('input').prop('readonly',true);
			}else{
				$("._authBtn").attr("href" , "javascript:checkAuth()");
			}
		}
	})
}
function join(){
	if(!joinAuth){
		alert('<spring:message code="msg.requestAuth"/>');
		return;
	}
	if(!$("#agree").is(":checked")){
		alert('<spring:message code="msg.agree"/>');
		return;
	}
	$("._joinBtn").attr('href','javascript:void(0)');
	$.ajax({
		type :'post',
		data : $("#form").serialize(),
		url : '/btc/joinProcess.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.href='/btc/login.do';
			}else{
				$("._joinBtn").attr('href','javascript:join()');
			}
		}
	})
}
</script>
</html>