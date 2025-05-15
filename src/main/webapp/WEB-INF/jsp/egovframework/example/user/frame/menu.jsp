<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div data-wf--menu--variant="base" class="menu">
	<a href="../index.html" class="logo-link mobile-flex w-inline-block">
		<img src="/btc/wf/images/BTC_Exchange_logo1.svg" loading="lazy" alt="" class="logo-img">
	</a>
	<div class="menu-wrap">
		<div class="menu-item-list">
			<div class="menu-item-box">
				<a href="../index.html" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.main"/></h5>
				</a>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.derivatives"/></h5>
				</a>
				<div class="menu-hover-box">
					<a href="../derivatives/perpetual-futures.html" class="menu-item-link-hover futures w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.derivatives.futures"/></h5>
					</a> 
					<a href="../derivatives/spot-exchange.html" class="menu-item-link-hover spot w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.derivatives.spot"/></h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.copy"/></h5>
				</a>
				<div class="menu-hover-box">
					<a href="../copy-trading/follow.html" class="menu-item-link-hover follow w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.copy.follow"/></h5>
					</a> 
					<a href="../copy-trading/my-copy-trade.html" class="menu-item-link-hover copytrade w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.copy.mycopy"/></h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.wallet"/></h5>
				</a>
				<div class="menu-hover-box c-flex">
					<div class="hover-box">
						<a href="../wallet/property.html" class="menu-item-link-hover property w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.property"/></h5>
						</a> 
						<a href="../wallet/deposit.html" class="menu-item-link-hover deposit w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.deposit"/></h5>
						</a> 
						<a href="../wallet/withdrawal.html" class="menu-item-link-hover withdrawal w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.withdrawal"/></h5>
						</a> 
						<a href="../wallet/history.html" class="menu-item-link-hover history w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.history"/></h5>
						</a>
					</div>
					<div class="hover-box">
						<a href="../wallet/exchange.html" class="menu-item-link-hover exchange w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.exchange"/></h5>
						</a> 
						<a href="../wallet/futures-exchange.html" class="menu-item-link-hover futures-exchange w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.futures"/></h5>
						</a> 
						<a href="../wallet/withdrawal-list.html" class="menu-item-link-hover w-inline-block">
							<h5 class="menu-txt"><spring:message code="menu.wallet.withdrawallist"/></h5>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.mypage"/></h5>
				</a>
				<div class="menu-hover-box">
					<a href="../my-page/trade-history.html"
						class="menu-item-link-hover trade-history w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.mypage.futures"/></h5>
					</a> 
					<a href="../my-page/funding-history.html"
						class="menu-item-link-hover funding-history w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.mypage.spot"/></h5>
					</a>
					<a href="../my-page/funding-history.html"
						class="menu-item-link-hover funding-history w-inline-block">
						<h5 class="menu-txt"><spring:message code="menu.mypage.funding"/></h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="../open-api.html" class="menu-item-link w-inline-block">
					<h5 class="menu-txt"><spring:message code="menu.api"/></h5>
				</a>
			</div>
		</div>
		<div class="menu-right">
			<a href="/btc/login.do" class="menu-btn w-button"><spring:message code="menu.login"/></a>
			<a href="/btc/join.do" class="menu-btn sign-up-btn w-button w--current"><spring:message code="menu.join"/></a>
			<div class="lang-box">
				<a href="#" class="lang-btn w-button"></a>
				<div class="lang-list">
					<a href="javascript:changeLang('EN')" class="lang-list-btn w-inline-block">
						<div>English</div>
					</a> 
					<a href="javascript:changeLang('KO')" class="lang-list-btn w-inline-block">
						<div>한국어</div>
					</a> 
					<!-- <a href="#" class="lang-list-btn w-inline-block">
						<div>中国人</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>日本語</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>
							<strong>ចេះខ្មែរដែលបង</strong>
						</div>
					</a> -->
				</div>
			</div>
		</div>
	</div>
	<div class="mobile-menu">
		<a href="../index.html" class="mobile-bottom-btn home on w-button"><spring:message code="menu.main"/></a>
		<a href="../copy-trading/follow.html" class="mobile-bottom-btn follow w-button"><spring:message code="menu.copy"/></a> 
		<a href="../derivatives/perpetual-futures.html" class="mobile-bottom-btn trade w-button"><spring:message code="menu.derivatives"/></a> 
		<a href="../wallet/property.html" class="mobile-bottom-btn wallet w-button"><spring:message code="menu.wallet"/></a> 
		<a href="../my-page/trade-history.html" class="mobile-bottom-btn mypage w-button"><spring:message code="menu.mypage"/></a>
	</div>
</div>
<script>
$('.menu-item-box').mouseenter(function() {
    let menuIndex = $(this).index();
    const hoverBox = $(this).find('.menu-hover-box');
    if (hoverBox.length > 0) { // menu-hover-box가 존재하는 경우
        $('.menu-hover-box').css({
            display: 'none' // 모든 menu-hover-box 숨기기
        });
        hoverBox.css({
            display: 'flex' // 해당 menu-hover-box만 flex로 표시
        });
    }
});
$('.menu-item-box').mouseleave(function() {
    let menuIndex = $(this).index();
    const hoverBox = $(this).find('.menu-hover-box');
    if (hoverBox.length > 0) { // menu-hover-box가 존재하는 경우
        // item-box에서 벗어났을 때, hoverBox가 여전히 보일 수 있도록 조건 처리
        setTimeout(() => {
            if (!hoverBox.is(':hover') && !$(this).is(':hover')) {
                hoverBox.css({
                    display: 'none' // hoverBox가 완전히 벗어나면 숨기기
                });
            }
        }, 50); // 타이밍을 조절해 즉시 사라지지 않도록 함
    }
});
$('.menu-hover-box').mouseenter(function() {
    $(this).css({
        display: 'flex' // menu-hover-box 위에 마우스를 올리면 유지
    });
});
$('.menu-hover-box').mouseleave(function() {
    const parentItem = $(this).closest('.menu-item-box');
    // menu-hover-box에서 마우스를 벗어나면, 해당 부모가 hover 상태일 때만 숨김
    if (!parentItem.is(':hover')) {
        $(this).css({
            display: 'none' // 부모에서 벗어났을 때 숨기기
        });
    }
});
$(".lang-list").on("click",function(){
	if($(this).next().css("display") == "none"){
		$(".lang-list").hide();
	}				
	$(this).next().slideToggle(200);
});
$(".lang-box").click(function() {
	$(this).children(".lang-list").slideToggle(200);
	$(this).children('img').toggleClass('open');
});
function changeLang(clang) {
	$.ajax({
		type : 'post',
		url : '/btc/changeLanguage.do?lang=' + clang,
		success : function(data) {
			location.reload(true);
		}
	});
} 
</script>