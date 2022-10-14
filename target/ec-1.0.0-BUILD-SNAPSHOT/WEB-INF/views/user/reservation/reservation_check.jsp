<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<%-- <fmt:parseDate var="set" value="${booking.reserv_date}"  pattern="yyyymmdd"/> --%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/css/reser_style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://js.tosspayments.com/v1"></script>
<script type="text/javascript">
$(document).ready(function() {
	var clientKey = 'test_ck_YZ1aOwX7K8m9OjPd5eP8yQxzvNPG'
	var tossPayments = TossPayments(clientKey)
	var button = document.getElementById('payment-button') // 결제하기 버튼		
	
	button.addEventListener('click', function () {
		tossPayments.requestPayment('카드', {
		amount: ${booking.reserv_pay},
		orderId: '${booking.order_id}',
		orderName: '${reservInfo.store_nic}',
		customerName: '${booking.user_name}',
		successUrl: 'http://localhost:8080/ec/main.do',
		failUrl: 'http://localhost:8080/ec/reservCheck',
		        })
		      });

});
</script>
<style type="text/css">
#content{
	background-color: #d4dadf;
}
.reserv_title {
	background-color: white;
}

.reserv_title .bi-arrow-left, .reserv_title .seller_title, .reserv_title .btn_my
	{
	color: black;
}
.reserv_check_btn{
	position: relative;
	margin: 13px -12px 0.5px;
}
.check_btn_group{
	position: relative;
	display: table;
	width: 100%;
	background-color: #fafbfc;
	border: 1px solid;
	border-color: #d9dadb;
	text-align: center;
}
.check_btn{
	width: 50%;
	height: 56px;
	display: table-cell;
	position: relative;
	text-decoration: none;
	font-size: 15px;
	vertical-align: middle;
}
.left{
	border: none;
	border-right: 1px solid;
	border-color: #d9dadb;
}
.right{
	border: none;
}
</style>
</head>
<body>
	<div id="content">
		<div class="check_header">
			<div class="reserv_title">
				<a href="#" onClick="history.back()" class="btn_back"><i class="bi bi-arrow-left"></i></a>
				<h2>
					<a href="#" class="seller_title"></a>
				</h2>
				<a href="${contextPath}/mypage.do" class="btn_my"><span title="내 예약 현황">MY</span></a>
			</div>
		</div>
		<div class="page_confirm">
			<div class="page_confirm_inner">
				<div class="confirm_item_top">
					<h3 class="confirm_title">
						<i class="bi bi-bag-check-fill"></i>
						<span class="title_text">예약 확인중</span>
					</h3>
					<div class="confirm_top_content">
						<div class="item_title">예약번호</div>
							<div class="item_desc">
								<span class="confirm_num">${booking.order_id}
								</span>
							</div>
						<h4 class="seller_title">
							<a href="#" class="anchor">${reservInfo.store_nic}</a>
						</h4>
						<div class="check_detail">
							<ul class="infoList">
								<li class="info_item">
									<div class="item_title">예약일</div>
									<div class="item_desc"><span class="booking_date">
									<fmt:parseDate var="reset" value="${booking.reserv_date}" pattern="yyyyMMdd" />
 									<fmt:formatDate value="${reset}" pattern="yyyy.MM.dd(E)" />
									</span></div>
								</li>
								<li class="info_item">
									<div class="item_title">예약시간</div>
									<div class="item_desc"><span class="booking_date">
									<fmt:parseDate var="reset2" value="${booking.reserv_time}" pattern="HH:mm" />
  									<fmt:formatDate value="${reset2}" pattern="HH:mm(a)" />
									</span></div>
								</li>
								<li class="info_item">
									<div class="item_title">인원</div>
									<div class="item_desc"><span class="booking_people">${booking.count_pp}명</span></div>
								</li>
								<li class="info_item">
									<div class="item_title">예약비용</div>
									<div class="item_desc"><span class="booking_people"><fmt:formatNumber value="${booking.reserv_pay}" pattern="#,###"/>원</span></div>
								</li>
							</ul>	
						</div>
						<div class="reserv_check_btn">
							<div class="check_btn_group">
								<button type="button" class="check_btn left" id="payment-button"><span >예약 확정</span></button>
								<button type="button" class="check_btn right"><span>예약 취소</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>