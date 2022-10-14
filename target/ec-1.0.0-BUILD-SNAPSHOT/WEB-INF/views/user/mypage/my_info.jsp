<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, java.io.*"
	isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
 /* 입력폼 */
input:focus {
	outline: none;
}
input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
#infobody {
	margin: 0;
	height: 100%;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
#content2 {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}
#ari { /* 굵은 글씨 */
	font-size: 14px;
	font-weight: 700;
}
#bir_wrap {
	display: table;
	width: 100%;
}
#bir_yy {
	display: table-cell;
	width: 150px;
}
#bir_mm {
	display: table-cell;
	width: 150px;
	vertical-align: middle;
}
#bir_dd {
	display: table-cell;
	width: 150px;
}
#bir_mm, #bir_dd {padding-left: 10px;}
#select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff
		url(https://static.nid.naver.com/image/join/pc/sel_arr_2x.gif) 100%
		50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
#alertTxt {
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}
#btnJoin {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #A67F78;
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}
.btn_area {margin: 30px 0 91px;}
.box {
	display: inline-block;
	width: 100%;
	height: 45px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}
.int {
	display: inline-block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
	margin-bottom: 7px;
}
.box.int_id {padding-right: 110px;}
.box.int_pass {padding-right: 40px;}
.box.int_pass_check {padding-right: 40px;}
.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}
/* 에러메세지 */
.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}
</style>
<meta charset="UTF-8">
<title>개인 정보 수정</title>
</head>
<body>
<div>
	<div id="infobody">
		<div id="content2">
			<form method="post">
				<!-- Nickname -->
				<div>
					<p id="ari">
						<label for="nick">닉네임</label>
					</p>
					<span class="box int_id">
					<input type="text" id="nick" name="user_nick" class="int" maxlength="20"></span>
					<span class="error_next_box"></span>
				</div>
				<!-- PW1 -->
				<div>
					<p id="ari">
						<label for="pswd1">비밀번호</label>
					</p>
					<span class="box int_pass">
					<input type="password" id="pswd1" name="user_pwd" class="int" maxlength="20">
					<span id="alertTxt">사용불가</span>
					<img src="${contextPath }/image/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>
				<!-- PW2 -->
				<div>
					<p id="ari">
						<label for="pswd2">비밀번호 재확인</label>
					</p>
					<span class="box int_pass_check">
					<input type="password" id="pswd2" name="pwd_ck" class="int" maxlength="20">
					<img src="${contextPath }/image/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg"></span>
					<span class="error_next_box"></span>
				</div>
				<!-- NAME -->
				<div>
					<p id="ari">
						<label for="name">이름</label>
					</p>
					<span class="box int_name"> <input type="text" id="name"
						name="user_name" class="int" maxlength="20" readonly disabled>
					</span> <span class="error_next_box"></span>
				</div>
				<!-- BIRTH -->
				<div>
					<p id="ari">
						<label for="yy">생년월일</label>
					</p>
					<div id="bir_wrap">
						<!-- BIRTH_YY -->
						<div id="bir_yy">
							<span class="box"> <input type="text" id="yy"
								name="birth_yy" class="int" maxlength="4" placeholder="년(4자)">
							</span>
						</div>
						<!-- BIRTH_MM -->
						<div id="bir_mm">
							<span class="box"> <select id="mm" name="birth_mm" class="sel" style="width:110px;">
									<option>월</option>
									<!-- 자동으로 value에 텍스트 월 들어감 -->
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select>
							</span>
						</div>
						<!-- BIRTH_DD -->
						<div id="bir_dd">
							<span class="box">
							<input type="text" id="dd" name="birth_dd" class="int" maxlength="2" placeholder="일">
							</span>
						</div>
					</div>
					<span class="error_next_box"></span>
				</div>
				<!-- EMAIL -->
				<div>
					<p id="ari">
						<label for="email">본인확인 이메일</label>
					</p>
					<span class="box int_email">
					<input type="text" id="email" name="user_email" class="int" maxlength="100"
						placeholder="예)id@google.com"></span>
					<span class="error_next_box">이메일형식을 확인해주세요.</span>
				</div>
				<!-- MOBILE -->
				<div>
					<p id="ari">
						<label for="mobile">휴대전화</label>
					</p>
					<span class="box int_mobile">
					<input type="tel" id="mobile" name="tel" class="int" maxlength="16" placeholder="하이폰(-)제외 번호만입력"></span>
					<span class="error_next_box"></span>
				</div>
				<!-- JOIN BTN-->
				<div class="btn_area">
					<input type="button" id="btnJoin" onclick="checkNull(this.form)" value="수정하기" />
				</div>
			</form>
		</div>
		<!-- content-->
	</div>
	
	<script src="${contextPath }/js/memberForm_udetail.js"></script>
	</div>
	<script>
        // 전송 버튼 클릭시
        function checkNull(f){
            // 입력값 중에 비어있으면 안되는 것들이 있음.
            // id칸이 비어 있는가?
            if(f.id.value.length < 1){
                alert("아이디를 입력하세요.");
                f.id.value.focus
                //커서(포커스)를 아이디 인풋요소로 이동
            } // 닉네임이 비어 있는가?
            else if(f.nick.value.length < 1){
                alert("닉네임을 입력하세요.");
            }
            // 비밀번호 비어 있는가?
            else if(f.pswd1.value.length < 1){
                alert("비밀번호를 입력하세요.");
            }
             // 비밀번호 확인 비어 있는가?
             else if(f.pswd2.value.length < 1){
                alert("비밀번호 확인을 입력하세요.");
            }
             // 이름 비어 있는가?
             else if(f.name.value.length < 1){
                alert("이름을 입력하세요.");
            } 
             else if(f.yy.value.length < 1){
                alert("년을 입력하세요.");
            }
              else if(f.mm.value == "월"){
                alert("월을 입력하세요.");
            }  
             else if(f.dd.value.length < 1){
                 alert("일을 입력하세요.");
             }
             else if(f.gender.value == "성별"){
                 alert("성별을 골라주세요.");
                 document.form.mobile.focus();
             } 
             else if(f.email.value.length < 1){
                 alert("이메일을 입력하세요.");
             }
            
             else if(f.mobile.value.length < 1){
                 alert("전화번호를 입력하세요.");
             }
             else{
            	 f.action="${contextPath}/user/addMember.do"
            	 f.submit();
             }
         }
    </script>
</body>
</html>