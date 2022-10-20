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
<link rel="stylesheet" href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<!-- 메시지 띄우기  -->
<c:choose>
	<c:when test="${result=='pwdfail' }">
		<script>
			window.onload=function() {
				alert("비밀번호를 다시 입력해주세요.");
			}
		</script>
	</c:when>

</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper" style="min-height: 1604.44px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle" src="${contextPath}/store/download.do?seller_id=' + ${sellerinfo.seller_id} + '&imageFileName=' +${sellerinfo.image_fileName}" alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">${seller.seller_name}</h3>

                <p class="text-muted text-center">${sellerinfo.store_introduce }</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>누적 찜</b> <a class="float-right">${infosum.wish_sum }</a>
                  </li>
                  <li class="list-group-item">
                    <b>누적 리뷰</b> <a class="float-right">${infosum.review_sum }</a>
                  </li>
                  <li class="list-group-item">
                    <b>누적 예약</b> <a class="float-right">${infosum.book_sum }</a>
                  </li>
                </ul>

           <!--      <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a> -->
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- /.card -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link" href="#activity" data-toggle="tab">Activity</a></li>
                  <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">업체 소개</a></li>
                  <li class="nav-item"><a class="nav-link active" href="#sellerinfo" data-toggle="tab">업체 정보</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="tab-pane" id="activity">
                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">
                        <span class="username">
                          <a href="#">Jonathan Burke Jr.</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Shared publicly - 7:30 PM today</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post clearfix">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user7-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Sarah Ross</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Sent you a message - 3 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <p>
                        Lorem ipsum represents a long-held tradition for designers,
                        typographers and the like. Some people hate it and argue for
                        its demise, but others ignore the hate as they create awesome
                        tools to help create filler text for everyone from bacon lovers
                        to Charlie Sheen fans.
                      </p>

                      <form class="form-horizontal">
                        <div class="input-group input-group-sm mb-0">
                          <input class="form-control form-control-sm" placeholder="Response">
                          <div class="input-group-append">
                            <button type="submit" class="btn btn-danger">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                    <!-- /.post -->

                    <!-- Post -->
                    <div class="post">
                      <div class="user-block">
                        <img class="img-circle img-bordered-sm" src="../../dist/img/user6-128x128.jpg" alt="User Image">
                        <span class="username">
                          <a href="#">Adam Jones</a>
                          <a href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
                        </span>
                        <span class="description">Posted 5 photos - 5 days ago</span>
                      </div>
                      <!-- /.user-block -->
                      <div class="row mb-3">
                        <div class="col-sm-6">
                          <img class="img-fluid" src="../../dist/img/photo1.png" alt="Photo">
                        </div>
                        <!-- /.col -->
                        <div class="col-sm-6">
                          <div class="row">
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="../../dist/img/photo2.png" alt="Photo">
                              <img class="img-fluid" src="../../dist/img/photo3.jpg" alt="Photo">
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-6">
                              <img class="img-fluid mb-3" src="../../dist/img/photo4.jpg" alt="Photo">
                              <img class="img-fluid" src="../../dist/img/photo1.png" alt="Photo">
                            </div>
                            <!-- /.col -->
                          </div>
                          <!-- /.row -->
                        </div>
                        <!-- /.col -->
                      </div>
                      <!-- /.row -->

                      <p>
                        <a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a>
                        <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a>
                        <span class="float-right">
                          <a href="#" class="link-black text-sm">
                            <i class="far fa-comments mr-1"></i> Comments (5)
                          </a>
                        </span>
                      </p>

                      <input class="form-control form-control-sm" type="text" placeholder="Type a comment">
                    </div>
                    <!-- /.post -->
                  </div>
                  <!-- /.tab-pane -->
                  <div class="tab-pane" id="timeline">
                    <!-- The timeline -->
                    <div class="timeline timeline-inverse">
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-danger">
                          10 Feb. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 12:05</span>

                          <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                          <div class="timeline-body">
                            Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                            weebly ning heekya handango imeem plugg dopplr jibjab, movity
                            jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                            quora plaxo ideeli hulu weebly balihoo...
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read more</a>
                            <a href="#" class="btn btn-danger btn-sm">Delete</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 5 mins ago</span>

                          <h3 class="timeline-header border-0"><a href="#">Sarah Young</a> accepted your friend request
                          </h3>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 27 mins ago</span>

                          <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                          <div class="timeline-body">
                            Take me to your leader!
                            Switzerland is small and neutral!
                            We are more like Germany, ambitious and misunderstood!
                          </div>
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View comment</a>
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <!-- timeline time label -->
                      <div class="time-label">
                        <span class="bg-success">
                          3 Jan. 2014
                        </span>
                      </div>
                      <!-- /.timeline-label -->
                      <!-- timeline item -->
                      <div>
                        <i class="fas fa-camera bg-purple"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> 2 days ago</span>

                          <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                          <div class="timeline-body">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                            <img src="https://placehold.it/150x100" alt="...">
                          </div>
                        </div>
                      </div>
                      <!-- END timeline item -->
                      <div>
                        <i class="far fa-clock bg-gray"></i>
                      </div>
                    </div>
                  </div>
                  <!-- /.tab-pane -->
				<!-- 업체 정보 수정  -->
                  <div class="tab-pane active" id="sellerinfo">
<form>
                <div class="card-body">
				  <div class="form-group">
                        <label>가게 아이디</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled value="${seller.seller_id }">
                  </div>
                  <div class="form-group">
                        <label>사업자번호</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled value="${seller.seller_bizReg }">
                      </div>
                  <div class="form-group">
                    <label for="seller_tel">전화번호</label>
                    <input class="form-control" id="seller_tel" type="text" placeholder="'-' 없이 작성" value="${seller.seller_tel }">
                  </div>
                  <div class="form-group">
                    <label for="seller_tel">상호명</label>
                    <input class="form-control" id="seller_tel" type="text" value="${seller.seller_name }">
                  </div>
                  <label for="seller_email">이메일</label>
                  <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                  </div>
                  <input type="email" class="form-control" placeholder="Email" id="seller_email" value="${seller.seller_email }">
                </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>지역</label>
                        <select class="form-control">
                          	<%-- <option hidden><%=searcharea %></option> --%>
						  	<option value="null">전체</option>
						  	<option value="서울특별시" <c:if test="${seller.area eq '서울특별시'}">selected</c:if>>서울특별시</option>
						  	<option value="인천광역시" <c:if test="${seller.area eq '인천광역시'}">selected</c:if>>인천광역시</option>
						  	<option value="광주광역시" <c:if test="${seller.area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="대구광역시" <c:if test="${seller.area eq '대구광역시'}">selected</c:if>>대구광역시</option>
						  	<option value="광주광역시" <c:if test="${seller.area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="울산광역시" <c:if test="${seller.area eq '울산광역시'}">selected</c:if>>울산광역시</option>
						  	<option value="대전광역시" <c:if test="${seller.area eq '대전광역시'}">selected</c:if>>대전광역시</option>
						  	<option value="부산광역시" <c:if test="${seller.area eq '부산광역시'}">selected</c:if>>부산광역시</option>
						  	<option value="세종특별자치시" <c:if test="${seller.area eq '세종특별자치시'}">selected</c:if>>세종특별자치시</option>
						  	<option value="경기도" <c:if test="${seller.area eq '경기도'}">selected</c:if>>경기도</option>
						  	<option value="강원도" <c:if test="${seller.area eq '강원도'}">selected</c:if>>강원도</option>
						  	<option value="충청남도" <c:if test="${seller.area eq '충청남도'}">selected</c:if>>충청남도</option>
						  	<option value="충청북도" <c:if test="${seller.area eq '충청북도'}">selected</c:if>>충청북도</option>
						  	<option value="경상북도" <c:if test="${seller.area eq '경상북도'}">selected</c:if>>경상북도</option>
						  	<option value="경상남도" <c:if test="${seller.area eq '경상남도'}">selected</c:if>>경상남도</option>
						  	<option value="전라북도" <c:if test="${seller.area eq '전라북도'}">selected</c:if>>전라북도</option>
						  	<option value="전라남도" <c:if test="${seller.area eq '전라남도'}">selected</c:if>>전라남도</option>
						  	<option value="제주도" <c:if test="${seller.area eq '제주도'}">selected</c:if>>제주도</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>업종</label>
                        <select class="form-control" disabled="">
                          <option <c:if test="${seller.category_code eq '10'}">selected</c:if>>먹거리</option>
                          <option <c:if test="${seller.category_code eq '20'}">selected</c:if>>볼거리</option>
                        </select>
                      </div>
                    </div>
                  </div>
             <label>키워드</label>
                <div class="row">
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-3">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-4">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-5">
                  </div>
                </div>
              
                <!-- /.card-body -->
				</div>
                <div class="card-footer">
                <c:if test="${infostatus eq 0 }">
                  <button type="submit" class="btn btn-primary">등록</button>
                 </c:if>
                <c:if test="${infostatus eq 1 }">
                  <button type="submit" class="btn btn-primary">수정</button>
                 </c:if>
                </div>
                
              </form>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>






<%-- <div class="content-wrapper" style="min-height: 2171.31px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>내 정보 수정</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">메인</a></li>
              <li class="breadcrumb-item active">마이페이지</li>
              <li class="breadcrumb-item active">정보 수정</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form>
                <div class="card-body">
				  <div class="form-group">
                        <label>가게 아이디</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled="">
                  </div>
                  <div class="form-group">
                        <label>사업자번호</label>
                        <input type="text" class="form-control" placeholder="Enter ..." disabled="">
                      </div>
                  <div class="form-group">
                    <label for="seller_tel">전화번호</label>
                    <input class="form-control" id="seller_tel" type="text" placeholder="'-' 없이 작성">
                  </div>
                  <div class="form-group">
                    <label for="seller_tel">상호명</label>
                    <input class="form-control" id="seller_tel" type="text">
                  </div>
                  <label for="seller_email">이메일</label>
                  <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                  </div>
                  <input type="email" class="form-control" placeholder="Email" id="seller_email">
                </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <!-- select -->
                      <div class="form-group">
                        <label>지역</label>
                        <select class="form-control">
                          	<option hidden><%=searcharea %></option>
						  	<option value="null">전체</option>
						  	<option value="서울특별시" <c:if test="${area eq '서울특별시'}">selected</c:if>>서울특별시</option>
						  	<option value="인천광역시" <c:if test="${area eq '인천광역시'}">selected</c:if>>인천광역시</option>
						  	<option value="광주광역시" <c:if test="${area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="대구광역시" <c:if test="${area eq '대구광역시'}">selected</c:if>>대구광역시</option>
						  	<option value="광주광역시" <c:if test="${area eq '광주광역시'}">selected</c:if>>광주광역시</option>
						  	<option value="울산광역시" <c:if test="${area eq '울산광역시'}">selected</c:if>>울산광역시</option>
						  	<option value="대전광역시" <c:if test="${area eq '대전광역시'}">selected</c:if>>대전광역시</option>
						  	<option value="부산광역시" <c:if test="${area eq '부산광역시'}">selected</c:if>>부산광역시</option>
						  	<option value="세종특별자치시" <c:if test="${area eq '세종특별자치시'}">selected</c:if>>세종특별자치시</option>
						  	<option value="경기도" <c:if test="${area eq '경기도'}">selected</c:if>>경기도</option>
						  	<option value="강원도" <c:if test="${area eq '강원도'}">selected</c:if>>강원도</option>
						  	<option value="충청남도" <c:if test="${area eq '충청남도'}">selected</c:if>>충청남도</option>
						  	<option value="충청북도" <c:if test="${area eq '충청북도'}">selected</c:if>>충청북도</option>
						  	<option value="경상북도" <c:if test="${area eq '경상북도'}">selected</c:if>>경상북도</option>
						  	<option value="경상남도" <c:if test="${area eq '경상남도'}">selected</c:if>>경상남도</option>
						  	<option value="전라북도" <c:if test="${area eq '전라북도'}">selected</c:if>>전라북도</option>
						  	<option value="전라남도" <c:if test="${area eq '전라남도'}">selected</c:if>>전라남도</option>
						  	<option value="제주도" <c:if test="${area eq '제주도'}">selected</c:if>>제주도</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label>업종</label>
                        <select class="form-control" disabled="">
                          <option>먹거리</option>
                          <option>볼거리</option>
                        </select>
                      </div>
                    </div>
                  </div>
             
                <div class="row">
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-3">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-4">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder=".col-5">
                  </div>
                </div>
              
                <!-- /.card-body -->
				</div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
                
              </form>
            
            <!-- /.card -->
			</div>
			</div>
        </div>
        </div>
    </section>
    <!-- /.content -->
  </div> --%>

</body>
</html>