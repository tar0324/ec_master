<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>먹고보자 찜 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/function.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/jquery-library.min.js"></script>
<link href="${contextPath}/css/common/common.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/common/css-library.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/mypage.min.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/css/wish.css" rel="stylesheet" type="text/css">
</head>

<body>
  <div id="wrap" class="mypage like">
    <div id="contents">
      <div class="innercon">
      		
	    <section class="conarea">
		  <h3 class="tit">찜♡</h3>
		  
		  <!-- 좋아요 표시된 상품 선택 및 좋아요 삭제 버튼 -->
		  <div class="list-filter">
	        <label><input type="checkbox" id="checkAll" onclick="selectAll(this);"><span class="select-all">전체선택</span></label>
	        <button type="button" onclick="deleteCheckList();" class="btn small lightgray">선택삭제</button>
	        <button type="button" onclick="deleteSoldoutList();" class="btn small lightgray">품절삭제</button>
	      </div>
	       
	      <fieldset class="list-field">
	        <!-- 좋아요 목록이 있다면 -->
	        <c:if test="${!empty wishList}">
              <ul id="contUl" class="product-list vertical">
             
                <c:forEach items="${wishList}" var="wishDTO">
	              <li>
		            <button type="button" class="btn-del" onclick="wishDelete(${wishDTO.productId}, ${wishDTO.companyId});">삭제</button>
		              <label class="thumb">
		              	<!-- 상품id, 업체id, 상품수량으로 체크박스 value 설정-->
		                <input type="checkbox" name="checkboxAll" onclick="checkSelectAll();" value="${wishDTO.productId}, ${wishDTO.companyId}, ${wishDTO.productCount}">
		                <!-- 상품이 삭제된 경우 표시글-->
		                <c:if test="${wishDTO.deleted == 1}">
		                  <span class="soldout">판매중단</span>
		                </c:if>
		                <!-- 상품 수량이 0인 경우 표시글-->
		                <c:if test="${wishDTO.productCount == 0 && wishDTO.deleted != 1}">
		                  <span class="soldout">일시품절</span>
		                </c:if>
		                <!-- 정상 표시글-->
		                <span class="normal"></span>
		                <img src="${wishDTO.imageUrl}" alt="${wishDTO.productName}">
	                  </label>
		
		              <div class="contr">
		                <!-- 상품이 삭제되지 않은 경우 연결 링크 -->
		                <c:if test="${wishDTO.deleted != 1}">
		                  <a href="${contextPath}/product/detail.do?pid=${wishDTO.productId}&cid=${wishDTO.companyId}">
		                    <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
		                  </a>
		                </c:if>
		                <!-- 상품이 삭제된 경우 연결 링크 -->
		                <c:if test="${wishDTO.deleted == 1}">
		                  <a href="#">
		                    <strong class="txt-ti ellipsis">${wishDTO.productName}</strong>
		                  </a>
		                </c:if>
		                     
	                    <input id="dawnSoldoutYn" name="dawnSoldoutYn" type="hidden" value="N"/>
	                    <span class="info">
	                      <span class="txt-price">
	                        <!-- 원가와 주문가(할인가) 다르다면 -->                            
	                        <c:if test="${wishDTO.discountPrice != wishDTO.productPrice}">
		                      <strong><em><fmt:formatNumber value="${wishDTO.discountPrice}"/></em>원</strong>
	                          <del><fmt:formatNumber value="${wishDTO.productPrice}"/></del>
	                        </c:if> 
	                        <!-- 원가와 주문가(할인가) 같다면 -->
	                        <c:if test="${wishDTO.discountPrice == wishDTO.productPrice}">
		                      <strong><em><fmt:formatNumber value="${wishDTO.discountPrice}"/></em>원</strong>
		                    </c:if>      
	                      </span>
	                      <div class="probtn">
	                        <!-- 판매자가 상품을 삭제한 경우 버튼 표시 문구 --> 
		       				<c:if test="${wishDTO.deleted == 1}">      
		                      <button type="button" class="btn fill small lightgray" onclick="soldoutAlarm()">판매중단 상품</button>
		                    </c:if> 
		                    <!-- 정상 버튼 표시 문구 --> 
		                    <c:if test="${wishDTO.productCount > 0 && wishDTO.deleted != 1}">      
		                      <button type="button" class="btn small orange" onclick="addToCart(${wishDTO.productId}, ${wishDTO.companyId})">찜 하기</button>
		                    </c:if> 
		                    <!-- 수량이 없는 경우 버튼 표시 문구 --> 
		                    <c:if test="${wishDTO.productCount <= 0 && wishDTO.deleted != 1}">
		                      <button type="button" class="btn fill small lightgray" onclick="restockAlarm()">재입고 알림</button>
		                    </c:if>    
		                  </div>
		                </span>
	                  </div>
		            </li>
	              </c:forEach>      
                </ul>
               
                <!-- 페이지네이션 -->
		        <div class="pagination">
		   		  <c:if test="${beginPage > pagePerList}">
				    <a class="prev" href="${contextPath}/mypage/wish.do?pno=${beginPage-1}">이전</a>
				  </c:if>
				  <c:forEach var="pno" begin="${beginPage}" end="${endPage}">
				    <span class="num"><a href="${contextPath}/mypage/wish.do?pno=${pno}">${pno}</a></span>
				  </c:forEach>
				  <c:if test="${endPage < totalPageCount}">
				    <a class="next" href="${contextPath}/mypage/wish.do?pno=${endPage + 1}">다음</a>
				  </c:if>
			    </div>
              </c:if>
               
              <!-- 좋아요 목록이 없다면 --> 
              <c:if test="${empty wishList}">
		   	    <div class="nodata">찜 한 곳이 아직 없습니다.</div>
		      </c:if>
               
               
            </fieldset>                   
          </section>
        </div>
      </div>
    </div>
  <script type="text/javascript">
/*
	@Author 이지민
	좋아요 삭제 및 체크박스 선택 관련 js
*/
	
	//좋아요 삭제  
	function wishDelete(pId, cId){
				
		$.ajax({
			type: 'POST',
			url:'${contextPath}/wish/delete.do',
			dataType:'text', //json이 아니라 int가 반환된다 주의!
			data: {
				productId: pId,
				memberId: ${loginUser.memberId},
				companyId: cId
			},
			success : function(data){
				console.log(data);
				location.reload();
			},
			error : function(err) {
				console.log(err);
			}
		});		
	}
	
	//장바구니 담기
	function addToCart(pId, cId) {
			
		$.ajax({
			type: 'POST',
			url:'${contextPath}/cart/create.do',
			dataType:'json',
			data: {
				product_id: pId,
				company_id: cId,
				count: 1
			},
			success : function(data){
				console.log(data);
				alert("찜 목록에 담았습니다");
			},
			error : function(err) {
				console.log(err);
				var errorMsg = err.responseJSON.message;
				alert(errorMsg);
				
			}
		});
				
	}
  
	//상품이 삭제된 경우
	function soldoutAlarm() {
		alert("상품 판매가 중단되었습니다");
	}
	
	//상품 수량이 없는 경우
	function restockAlarm() {
		alert("준비 중입니다");	
	}
	
	//체크박스 전체 선택 및 해제
	function selectAll(selectAll) {

		var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked
		})		
	}
	
	//선택된 체크박스 삭제
	function deleteCheckList() {
		var checkBoxArr = [];
		var checked = document.querySelectorAll('input[name="checkboxAll"]:checked');
		
		checked.forEach((check) => {
			checkBoxArr.push(check.value);
		})
		console.log(checkBoxArr);
		
		if (checkBoxArr != null) {
			checkBoxArr.forEach((check) => {
				var info = check.split(","); //상품id, 업체id 나누기
				console.log(info);
				var pId = parseInt(info[0]);
				var cId = parseInt(info[1]);
				wishDelete(pId, cId);
			})
		}		
	}
	
	//체크박스 중 하나라도 선택 해제되면 전체 선택 해제
	function checkSelectAll() {
		var allBoxes = document.querySelectorAll('input[name="checkboxAll"]'); //전체 체크박스 
		var checked = document.querySelectorAll('input[name="checkboxAll"]:checked'); //선택된 체크박스
		var selectAll = document.querySelector('input[id="checkAll"]'); //전체를 체크하는 체크박스 하나
		
		if (allBoxes.length === checked.length) {
			selectAll.checked = true;
		} else {
			selectAll.checked = false;
		}
	}
	
	//수량이 0인 일시품절 상품 일괄 삭제
	function deleteSoldoutList() {
		var checkBoxArr = [];
		var allBoxes = document.querySelectorAll('input[name="checkboxAll"]'); //전체 체크박스
		
		allBoxes.forEach((check) => {
			checkBoxArr.push(check.value);
		})
		console.log(checkBoxArr);
		
		if (checkBoxArr != null) {
			checkBoxArr.forEach((check) => {
				var info = check.split(","); //상품id, 업체id, 상품수량 나누기
				console.log(info);
				var pId = parseInt(info[0]);
				var cId = parseInt(info[1]);
				var pCnt = parseInt(info[2]);
				if (pCnt === 0) {
					console.log('success');
					wishDelete(pId, cId);				
				}
			})
		}	
	}
  </script>
</body>
</html>