<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>주문 내역</title>
<link href="${contextPath}/css/common/common.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/common/css-library.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/mypage.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/order-history.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div id="wrap" class="mypage orderlist">
    <div id="contents">
	  <div class="innercon">
	
		<!-- 주문 내역 컨텐츠  -->
		<section class="conarea">
		  <h3 class="tit">주문목록</h3>

		  <div class="orderlist-area">
	
			<!-- 주문 내역이 있다면 -->
		  	<c:if test="${!empty orderList}">
			    <div class="cont">
		          <ul class="product-order-list">
			        <c:forEach items="${orderList}" var="orderDTO">	                                        
		              <li dlvDivision="1_DAWN" data-dlvc_pay_gbcd="10" class="product-order-item">
		              	<label class="thumb">
		                  <div><img src="${orderDTO.imageUrl}" class="product-img"></div>
		                </label>
		                <div class="contr">
		                  <div class="info1">
	                        <a href="${contextPath}/product/detail.do?pid=${orderDTO.productId}&cid=${orderDTO.companyId}">
	                          <strong class="txt-ti ellipsis product-name">${orderDTO.productName}</strong>
	                        </a>
	                        <p class="company-name">${orderDTO.companyName}</p>                      
	                      </div>
		                  
		                  <span class="info2">
		                    <p class="product-count">수량: ${orderDTO.orderCount}</p>
		                    <span class="txt-price">
		                      <!-- 원가와 주문가(할인가) 다르다면 -->
		                      <c:if test="${orderDTO.productPrice != orderDTO.orderPrice}">
		                           <strong><em class="str-price"><fmt:formatNumber value="${orderDTO.orderPrice}"/></em>원</strong>
		                           <del><fmt:formatNumber value="${orderDTO.productPrice}"/></del>
		                      </c:if> 
		                      <!-- 원가와 주문가(할인가) 같다면 -->
		                      <c:if test="${orderDTO.productPrice == orderDTO.orderPrice}">
		                        <strong><em class="str-price"><fmt:formatNumber value="${orderDTO.orderPrice}"/></em>원</strong>
		                      </c:if>                              
		                    </span>
		                  </span>
		                </div>          
		              </li>
		              <hr class="line">			
			        </c:forEach>		
				  </ul>
				</div>
		      <!-- 페이지네이션 -->
		      <div class="pagination">
		   		<c:if test="${beginPage > pagePerList}">
				  <a class="prev" href="${contextPath}/mypage/order_list.do?pno=${beginPage-1}">이전</a>
				</c:if>
				<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				  <span class="num"><a href="${contextPath}/mypage/order_list.do?pno=${pno}">${pno}</a></span>
				</c:forEach>
				<c:if test="${endPage < totalPageCount}">
				  <a class="next" href="${contextPath}/mypage/order_list.do?pno=${endPage + 1}">다음</a>
				</c:if>
			  </div>
		      </c:if>
			
			  <!-- 주문 내역이 없다면 -->
		  	  <c:if test="${empty orderList}">
		   	    <div class="nodata">주문내역이 없습니다.</div>
		      </c:if>
		      			
		  </div>
		</section>
	  </div>
	</div>
  </div>
</body>
</html>