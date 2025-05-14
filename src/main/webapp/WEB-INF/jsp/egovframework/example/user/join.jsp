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
<c:set var="phone"> <spring:message code="phone" /> </c:set>
<c:set var="email"> <spring:message code="email" /> </c:set>
<c:set var="name"> <spring:message code="name" /> </c:set>
<c:set var="pw"> <spring:message code="pw" /> </c:set>
<c:set var="authNum"> <spring:message code="join.authNum" /> </c:set>
<c:set var="pwChk"> <spring:message code="join.pwChk" /> </c:set>
<c:set var="invite"> <spring:message code="join.invite" /> </c:set>
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
							<div class="member-txt on"><spring:message code="join.typeAuth" arguments="${phone}"/></div>
							<div class="member-txt"><spring:message code="join.typeAuth" arguments="${email}"/></div>
						</div>
						<div class="member-input-list">
							<div class="member-wrap">
								<div class="member-title">${phone}</div>
								<div class="member-input-box">
									<input class="member-input-short w-input" maxlength="256" name="field" data-name="Field"
										placeholder="<spring:message code="input.l" arguments="${phone}"/>" type="text" id="field" required=""> 
									<a href="#" class="member-btn w-button"><spring:message code="join.authBtn"/></a>
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title">${authNum}</div>
								<div class="member-input-box">
									<input class="member-input-short w-input" maxlength="256" name="field" data-name="Field"
										placeholder="<spring:message code="input.l" arguments="${authNum}"/>" type="text" id="field" required=""> 
									<a href="#" class="member-btn w-button"><spring:message code="check"/></a>
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title">${name}</div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="256" name="field-2" data-name="Field 2"
										placeholder="<spring:message code="input.o" arguments="${name}"/>" type="text" id="field-2" required="">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title">${pw }</div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="256" name="field-2" data-name="Field 2"
										placeholder="<spring:message code="input.l" arguments="${pw}"/>" type="text" id="field-2" required="">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title">${pwChk}</div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="256" name="field-2" data-name="Field 2"
										placeholder="<spring:message code="input.o" arguments="${pwChk}"/>" type="text" id="field-2" required="">
								</div>
							</div>
							<div class="member-wrap">
								<div class="member-title">${invite} (Option)</div>
								<div class="member-input-box">
									<input class="member-input-long w-input" maxlength="256" name="field-2" data-name="Field 2"
										placeholder="<spring:message code="input.l" arguments="${invite}"/>"
										type="text" id="field-2" required="">
								</div>
							</div>
							<label class="w-checkbox checkbox-field">
								<input type="checkbox" id="checkbox" name="checkbox" data-name="Checkbox" class="w-checkbox-input">
								<span class="w-form-label" for="checkbox"><spring:message code="join.privacy"/></span>
							</label> 
							<a href="#" class="member-confirm-btn w-button"><spring:message code="join.joinBtn"/></a>
						</div>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="frame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="frame/footer.jsp"></jsp:include>
</body>
</html>