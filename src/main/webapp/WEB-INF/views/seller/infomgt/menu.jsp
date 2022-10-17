<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
 <!--ajax -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<style type="text/css">
.zPfVt {
  display: inline-block;
  overflow: hidden;
  text-overflow: ellipsis;
  width:400px;
  white-space :nowrap;
  vertical-align: top;
}

.hoveri:hover {
	color: blue;
}

</style>
<script type="text/javascript">
$(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
  
  
  //체크박스 선택한 개수 파악
	function count_checkbox(){
	var status = confirm("정말로 삭제하실건가요?");
	if(status == true) {
		var flag = false;
		var values = document.getElementsByName("menucheck");
		var form = document.getElementById("deleteform");
		var count = 0;
		for(var i = 0 ; i <values.length;i++) {
			if(values[i].checked) {
				count++;
			}
		}
		if(count<1){
			alert("1개 이상 선택해야 합니다.");
		}else { 
			  form.action = "${contextPath}/deletemenu.do";
			  form.mothod = "GET";
			  form.submit();
		}
	}

}   

//낱개 삭제
function delonemenu(pro_num,seller_id){
	var status = confirm("정말로 삭제하실건가요?");
	//삭제 확인
	if(status == true) {
		$.ajax({
			url:"${contextPath}/delonemenu.do",
			type : 'POST',
			async: false ,
			dataType:"text",
			data : {
				pro_num : pro_num,
				seller_id : seller_id
				
			},
		    success: function (data) {
		    	console.log("성공");
		    	alert("삭제 되었습니다😀");
		    	location.reload();
		    	
		    	
	        },
	        error: function(request, status, error, data) {
	        	console.log("error: " + error);
	        	console.log("message: " + request.responseText);
	        	console.log("Data::::: " + data);
	        	
	   }
	});
	}
	
}   

//메뉴 상세 닫기
function detailclose(){
	$(".col-md-3").remove();
}

//메뉴 상세
function menudetail(pro_num) {
	$.ajax({
		url:"${contextPath}/menudetail.do",
		type : 'POST',
		data : {
			pro_num : pro_num
			
		},
	    success: function (data) {
	    	$(".col-md-3").remove();
	    	let $detail = `<div class="col-md-3" >
	    	<div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0 small">
                메뉴 상세보기
                <a href="#">
                <i class="ion ion-ios-close-empty" style="float:right;font-size:25px;color:gray"></i>
              </a>
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col-7">
                    <h2 class="lead"><b id="proname" style="font-size:1.2rem"></b></h2>
                    <p class="text-muted text-sm" id="prodesc"></p>
                    <ul class="ml-4 mb-0 fa-ul text-muted">
                      <li ><span class="fa-li"><i class="fas fa-sharp fa-solid fa-coins" style="font-size:15px"></i></span><span id="proprice"></span></li>
                      <li class="small"><span class="fa-li"><i class="ion ion-android-alarm-clock" style="font-size:15px;padding-right: 8px;"></i></span><span id="regdate" class="small"></span></li>
                    </ul>
                  </div>
                  <div class="col-5 text-center">
                    <img src="" alt="user-avatar" class="img-fluid" id="proimg" style="border-radius:10px;">
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="text-right">
                  <a href="#" class="btn btn-sm bg-teal" id="menumod">
                    <i class="ion ion-compose" style="font-size:18px"></i> 수정하기
                  </a>
                  <a href="#" class="btn btn-sm btn-danger" id="delmenu">
                    <i class="ion ion-ios-trash" style="font-size:18px"></i> 삭제하기
                  </a>
                </div>
              </div>
            </div>
            </div>
            `;
	    	$("#leftdetail").before($detail);
	    	$("#delmenu").attr('onclick','delonemenu("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#menumod").attr('onclick','menu_mod("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#proname").append(data.pro_name);
	    	$("#proimg").attr('src','${contextPath}/image/menu/' + data.seller_id + '/' + data.pro_img);
	    	$("#prodesc").append(data.pro_desc);
	    	$("#regdate").append('등록일 : ' + data.reg_date);
	    	if(data.mod_date != null) {
	    		$("#regdate").append('<br> 수정일 : ' + data.mod_date);
	    	}
	    	
	    	/* 정규식 사용하여 가격 , 입력 */
	    	$("#proprice").append(data.pro_price.replace(/\B(?=(\d{3})+(?!\d))/g, ',') +' 원');
	    	
        },
        error: function(request, status, error, data) {
        	console.log("error: " + error);
        	console.log("message: " + request.responseText);
        	console.log("Data::::: " + data);
        	
        }
	});
}

//메뉴 수정창
function menu_mod(pro_num, seller_id) {
	$.ajax({
		url:"${contextPath}/menudetail.do",
		type : 'POST',
		data : {
			pro_num : pro_num,
			seller_id:seller_id
			
		},
	    success: function (data) {
	    	$(".col-md-3").remove();
	    	let $detail = `<div class="col-md-3" >
	    	<form method="post" action="${contextPath}/menumod.do">
	    	<div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0 small">
                메뉴 수정
                <a href="#">
                <i class="ion ion-ios-close-empty" style="float:right;font-size:25px;color:gray"></i>
              </a>
              </div>
              <div class="card-body pt-0">
                <div class="row">
                  <div class="col-7">
                  <p class="text-muted text-sm">
                  	<label for="proname" class="form-label">메뉴 설명</label>
                  	<input class="form-control lead" type="text" id="proname" name="pro_name" aria-label="default input example">
              		</p>
                    <p class="text-muted text-sm">
	                    <label for="prodesc" class="form-label">메뉴 설명</label>
	                    <textarea class="form-control" id="prodesc" rows="3" name="pro_desc"></textarea>
                    </p>
                    <p class="text-muted text-sm">
                    <label for="proprice" class="form-label">가격</label>
                    <input class="form-control lead" type="text" id="proprice" aria-label="default input example" name="pro_price"/>
               		 </p>
                  </div>
                  
                  <div class="col-5 text-center">
                    <img src="" alt="user-avatar" class="img-fluid" id="proimg" style="border-radius:10px;">
                  </div>
                  <div class="form-group" style="margin: 8px 0 8px;">

                  <input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:85%; display: inline;">

                  		<div class="fileRegiBtn">

                  		<label for="myFileUp">파일등록하기</label>

                  		<input type="file" id="myFileUp">

                  </div>

                  </div>
                </div>
              </div>
              <div class="card-footer">
                <div class="text-right">
                  <a href="#" class="btn btn-sm bg-teal" id="menumodform">
                    <i class="ion ion-compose" style="font-size:18px"></i> 수정완료
                  </a>
                </div>
              </div>
            </div>
            </form>
            </div>
            `;
	    	$("#leftdetail").before($detail);
	    	$("#delmenu").attr('onclick','delonemenu("' + data.pro_num + '" , "' + data.seller_id + '")');
	    	$("#menumodform").attr('onclick','modmenu();');
	    	$("#proname").attr('value',data.pro_name);
	    	$("#proimg").attr('src','${contextPath}/image/menu/' + data.seller_id + '/' + data.pro_img);
	    	$("#prodesc").append(data.pro_desc);
	    	$("#regdate").append('등록일 : ' + data.reg_date);
	    	if(data.mod_date != null) {
	    		$("#regdate").append('<br> 수정일 : ' + data.mod_date);
	    	}
	    	
	    	/* 정규식 사용하여 가격 , 입력 */
	    	$("#proprice").attr('value',data.pro_price.replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	    	
        },
        error: function(request, status, error, data) {
        	console.log("error: " + error);
        	console.log("message: " + request.responseText);
        	console.log("Data::::: " + data);
        	
        }
	});
}



</script>
<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='deletesuccess' }">
		<script>
			window.onload=function() {
				alert("삭제 되었습니다😀");
			}
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper">
<section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>메뉴 관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${contextPath}/sellerMain">메인</a></li>
              <li class="breadcrumb-item active">정보 관리</li>
              <li class="breadcrumb-item active">메뉴 관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
	<section class="content">
      <div class="row">
      <!--<div class="col-md-3" >
       <div class="card bg-light d-flex flex-fill">
                <div class="card-header text-muted border-bottom-0">
                  Digital Strategist
                </div>
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="lead"><b>Nicole Pearson</b></h2>
                      <p class="text-muted text-sm"><b>About: </b> Web Designer / UX / Graphic Artist / Coffee Lover </p>
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> Address: Demo Street 123, Demo City 04312, NJ</li>
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Phone #: + 800 - 12 12 23 52</li>
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                    <a href="#" class="btn btn-sm bg-teal">
                      <i class="fas fa-comments"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-primary">
                      <i class="fas fa-user"></i> View Profile
                    </a>
                  </div>
                </div>
              </div>

      
        </div> -->
        <!-- /.col -->
        <div class="col" id="leftdetail">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h3 class="card-title">메뉴 관리</h3>

			
              <div class="card-tools">
              <form action="${contextPath}/searchmenu.do">
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="메뉴명 검색"  name="search">
                  <div class="input-group-append">
                    <button type="submit" class="btn btn-primary" >
                      <i class="fas fa-search"></i>
                    </button>
                  </div>
                </div>
                  </form>
              </div>
           
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <form action="#" id="deleteform">
            <div class="card-body p-0" id="searchload">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm">
                    <!-- <i class="fas fa-reply"></i> -->
                    <i class="ion ion-android-add" style="font-size: 18px;" ></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" onclick="count_checkbox()">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>

              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                
                  <tbody>
                  <c:forEach var="menu" items="${menuList }" varStatus="menuNum">
                  <tr>
                    <td>
                      <div class="icheck-primary">
                        <input type="checkbox" name="menucheck" value="${menu.pro_num }" id="check${menuNum.index }"> <!-- 아이디 증가해야함  -->
                        <label for="check${menuNum.index }"></label>
                      </div>
                    </td>
                    <!-- <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td> -->
                    <td class="mailbox-name"><a href="#" onclick="menudetail(${menu.pro_num})">${menu.pro_name }</a></td>
                    <td class="mailbox-subject zPfVt">${menu.pro_desc }</td>
                    <td class="mailbox-attachment"><b><fmt:formatNumber value="${menu.pro_price }" pattern="#,###"/></b></td>
                    <td class="mailbox-date"><b>${menu.reg_days } days ago</b></td>
                  </tr>
       			</c:forEach>
                  </tbody>
                  
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            </form>
            <!-- /.card-body -->
            <div class="card-footer p-0">
                <div class="mailbox-controls float-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-left"></i>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-right"></i>
                    </button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.float-right -->
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      
    </section>
<%@ include file="/WEB-INF/views/seller/infomgt/menu_mod.jsp" %>

</body>

<!--modal js  -->
 <script src="${contextPath }/js/menu_modal.js"></script>
</html>