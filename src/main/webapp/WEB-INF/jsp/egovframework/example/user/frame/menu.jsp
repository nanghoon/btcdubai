<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div data-wf--menu--variant="base" class="menu">
	<a href="../index.html" class="logo-link mobile-flex w-inline-block">
		<img src="/btc/wf/images/BTC_Exchange_logo1.svg" loading="lazy" alt="" class="logo-img">
	</a>
	<div class="menu-wrap">
		<div class="menu-item-list">
			<div class="menu-item-box">
				<a href="../index.html" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">Main</h5>
				</a>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">Derivatives</h5>
				</a>
				<div class="menu-hover-box">
					<a href="../derivatives/perpetual-futures.html" class="menu-item-link-hover futures w-inline-block">
						<h5 class="menu-txt">Perpetual Futures</h5>
					</a> 
					<a href="../derivatives/spot-exchange.html" class="menu-item-link-hover spot w-inline-block">
						<h5 class="menu-txt">Spot</h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">Copy Trading</h5>
				</a>
				<div class="menu-hover-box">
					<a href="../copy-trading/follow.html" class="menu-item-link-hover follow w-inline-block">
						<h5 class="menu-txt">Follow</h5>
					</a> 
					<a href="../copy-trading/my-copy-trade.html" class="menu-item-link-hover copytrade w-inline-block">
						<h5 class="menu-txt">My Copy trade</h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">Wallet</h5>
				</a>
				<div class="menu-hover-box c-flex">
					<div class="hover-box">
						<a href="../wallet/property.html" class="menu-item-link-hover property w-inline-block">
							<h5 class="menu-txt">Property</h5>
						</a> 
						<a href="../wallet/deposit.html" class="menu-item-link-hover deposit w-inline-block">
							<h5 class="menu-txt">Deposit</h5>
						</a> 
						<a href="../wallet/withdrawal.html" class="menu-item-link-hover withdrawal w-inline-block">
							<h5 class="menu-txt">Withdrawal</h5>
						</a> 
						<a href="../wallet/history.html" class="menu-item-link-hover history w-inline-block">
							<h5 class="menu-txt">Histroy</h5>
						</a>
					</div>
					<div class="hover-box">
						<a href="../wallet/exchange.html" class="menu-item-link-hover exchange w-inline-block">
							<h5 class="menu-txt">Exchange</h5>
						</a> 
						<a href="../wallet/futures-exchange.html" class="menu-item-link-hover futures-exchange w-inline-block">
							<h5 class="menu-txt">Futures Exchange</h5>
						</a> 
						<a href="../wallet/withdrawal-list.html" class="menu-item-link-hover w-inline-block">
							<h5 class="menu-txt">Withdrawal List</h5>
						</a>
					</div>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="#" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">My Page</h5>
				</a>
				<div class="menu-hover-box">
					<a href="../my-page/trade-history.html"
						class="menu-item-link-hover trade-history w-inline-block">
						<h5 class="menu-txt">Trade History</h5>
					</a> 
					<a href="../my-page/funding-history.html"
						class="menu-item-link-hover funding-history w-inline-block">
						<h5 class="menu-txt">Funding History</h5>
					</a>
				</div>
			</div>
			<div class="menu-item-box">
				<a href="../open-api.html" class="menu-item-link w-inline-block">
					<h5 class="menu-txt">Open API</h5>
				</a>
			</div>
		</div>
		<div class="menu-right">
			<a href="../member/login.html" class="menu-btn w-button">Log in</a>
			<a href="../member/signup.html" class="menu-btn sign-up-btn w-button w--current">Sign up</a>
			<div class="lang-box">
				<a href="#" class="lang-btn w-button"></a>
				<div class="lang-list">
					<a href="#" class="lang-list-btn w-inline-block">
						<div>English</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>한국어</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>中国人</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>日本語</div>
					</a> 
					<a href="#" class="lang-list-btn w-inline-block">
						<div>
							<strong>ចេះខ្មែរដែលបង</strong>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="mobile-menu">
		<a href="../index.html" class="mobile-bottom-btn home on w-button">Home</a>
		<a href="../copy-trading/follow.html" class="mobile-bottom-btn follow w-button">Follow</a> 
		<a href="../derivatives/perpetual-futures.html" class="mobile-bottom-btn trade w-button">Trade</a> 
		<a href="../wallet/property.html" class="mobile-bottom-btn wallet w-button">Wallet</a> 
		<a href="../my-page/trade-history.html" class="mobile-bottom-btn mypage w-button">My Page</a>
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
</script>