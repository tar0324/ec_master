<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 | Eat & See </title>
</head>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<style>
/* body {display: inline-block; color: #32435F; margin-left:3px;  }


*/
a{
color: #32435F !important;
text-decoration: none !important;
}
.zz {
	text-decoration: none;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	float: left;
	outline: none;
	margin-left: 10px;
	border: 1px solid #E1DCD9;
	
}
.xx {
	outline: none;
	font-weight: 600;
} 
#na {
float: left;
display: inline-block;
margin: 20px 10px;
vertical-align: text-top;
}
#na1 {
display: inline-block;
float: right;
margin-top: 10px;
margin-right: 30px;
}
#my01 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m01.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
	border: 1px solid #fff;
}

#my01:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m001.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my02 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m02.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my02:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m002.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my03 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m03.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my03:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m003.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my04 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m04.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my04:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m004.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my05 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m05.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my05:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m005.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}
#my06 {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m06.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}

#my06:hover {
	background-color: transparent;
	background-image: url( "${contextPath }/image/icon_m006.png" );
	background-repeat: no-repeat;
	background-size: contain;
	width: 70px;
	height: 36px;
}
</style>
<body>
<div class="zz">
		<ul>
			<div class="xx"><a href="${contextPath }/mypage/my_pList.do">
<%-- 			<span id="upointCurAmt">${totalWishCount}개</span> --%>
			<button type="button" id="my01" style="border: none;" alt="먹플리, 볼플리" title="먹플리, 볼플리"></button></a></div>
		<br>
			<div class="xx"><a href="${contextPath }/mypage/uReview.do">
<%-- 			<span id="upointCurAmt">${reviewList.review_count}개</span> --%>
			<button type="button" id="my02" style="border: none;" alt="내가 쓴 리뷰" title="내가 쓴 리뷰"></button></a></div>
		<br>
			<div class="xx"><a href="${contextPath }/mypage/uBook.do">
<%-- 			<span id="upointCurAmt">${totalWishCount}<strong>개</span> --%>
			<button type="button" id="my03" style="border: none;" alt="예약조회" title="예약조회"></button></a></div>
		<br>
			<div class="xx"><a href="${contextPath }/mypage/uLike.do">
<%-- 			<span id="upointCurAmt">${totalWishCount}<strong>개</span> --%>
			<button type="button" id="my04" style="border: none;" alt="찜 목록" title="찜 목록"></button></a></div>
		<br>
			<div class="xx"><a href="${contextPath }/mypage/uAsk.do">
<%-- 			<span id="upointCurAmt">${totalWishCount}<strong>개</span> --%>
			<button type="button" id="my05" style="border: none;" alt="1:1 문의" title="1:1 문의"></button></a></div>
		<br>
			<div class="xx"><a href="${contextPath }/mypage/myinfo.do">
<%-- 			<span id="upointCurAmt">${totalWishCount}<strong>개</span> --%>
			<button type="button" id="my06" style="border: none;" alt="내 정보" title="내 정보"></button></a></div>
		</ul>
	</div>

</body>
</html>