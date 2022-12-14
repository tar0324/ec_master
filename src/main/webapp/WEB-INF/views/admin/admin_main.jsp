<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
String viewName = (String) request.getAttribute("viewName");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.css" />
<script
	src="https://uicdn.toast.com/calendar/latest/toastui-calendar.min.js"></script>
<style type="text/css">
.content-wrapper>.content {
	padding: 1em 0.5em;
}

.col-lg-3 {
	flex: 0 0 33.3%;
	max-width: 33.3%;
}

.main-header-block {
	display: block;
}

.main-header-margin {
	margin: 0 auto;
}

.toastui-calendar-template-monthDayName {
	text-align: center;
}

.toastui-calendar-day-name-item {
	font-size: 20px !important;
}

.toastui-calendar-grid-cell-date {
	font-size: 18px;
}

.bg-gradient-success {
	background: #80cebe linear-gradient(180deg, #9fdebd, #80cebe) repeat-x
		!important;
	color: #fff;
}
</style>
<script type="text/javascript">
	$(document).ready(
			
		function periodUserChart(period){
			var labelList = [];
			var visitList = [];
			var userList = [];
			var reservList =[];
			var reviewList = [];
			var signUpList = [];
			
			$.ajax({
				url:"${contextPath}/userChart",
				type:"get",
				data:{
					period: period
				},
				dataType:"json",
				success: function (data){
					for(var i = 0; i<data.length; i++){
						labelList.push(data[i].period);
						visitList.push(data[i].visitor);
						userList.push(data[i].user);
						reservList.push(data[i].reserv);
						reviewList.push(data[i].review);
						signUpList.push(data[i].signUp);
						
					}
					console.log(labelList);
					var ticksStyle = { 
							fontColor : '#495057', 
							fontStyle : 'bold'}
						
					var mode = 'index';
					var intersect = true;
					var $userChart = $('#user-chart')
					var userChart = new Chart($userChart,
			{
				data : {
					labels : labelList,
					datasets : [
						{
							type : 'line',
							data : visitList,
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "?????????"
						},
						{
							type : 'line',
							data : userList,
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "???????????????"
						},
						{
							type : 'line',
							data : reservList,
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "??????"
						},
						{
							type : 'line',
							data : reviewList,
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "??????"
						},
						{
							type : 'line',
							data : signUpList,
							backgroundColor : 'transparent',
							borderColor : 'red',
							pointBorderColor : 'red',
							pointBackgroundColor : 'red',
							fill : false,
							label: "????????????"
						},
						]
				},
				options : {
				maintainAspectRatio : false,
					tooltips : {
						mode : mode,
						intersect : intersect
					},
					hover : {
						mode : mode,
						intersect : intersect
					},
					legend : {
						display : false
					},
					scales : {
						yAxes : [{
							gridLines : {
								display : true,
								lineWidth : '4px',
								color : 'rgba(0, 0, 0, .2)',
								zeroLineColor : 'transparent'
							},
							ticks : $.extend({beginAtZero : true}, ticksStyle)
						}],
						xAxes : [{
							display : true,
							gridLines : {
								display : false
							},
							ticks : ticksStyle
						}]
					}
				}
			})
				}
				
			})
		}
		);
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<!-- user chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">????????? ??????</h3>
								</div>
							</div>
							<div class="card-body">
								<div class="d-flex">
									<p class="ml-auto d-flex flex-column text-right">
										<ul class="nav nav-pills">
						                <li class="nav-item"><a class="nav-link active" onClick="periodUserChart('daily')" data-toggle="tab">??????</a></li>
						                <li class="nav-item"><a class="nav-link" onClick="periodUserChart('monthly')" data-toggle="tab">??????</a></li>
						                <li class="nav-item"><a class="nav-link" onClick="periodUserChart('yearly')" data-toggle="tab">??????</a></li>
						                </ul>
									</p>
								</div>
								<!-- /.d-flex -->
								<div class="position-relative mb-4" id= "daily">
									<canvas id="user-chart-daily" height="200"></canvas>
								</div>
								<div class="position-relative mb-4" id= "monthly">
									<canvas id="user-chart-monthly" height="200"></canvas>
								</div>
								<div class="position-relative mb-4" id= "yearly">
									<canvas id="user-chart-yearly" height="200"></canvas>
								</div>
								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square text-primary"></i> 
										?????????
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										????????????
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										??????
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										??????
									</span>
									<span> 
										<i class="fas fa-square text-gray"></i> 
										????????????
									</span>
								</div>
							</div>
						</div>
						<!-- /.card -->
						<!-- community chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">????????? ??????</h3>
								</div>
							</div>
							<div class="card-body">
								<div class="d-flex">
									<p class="ml-auto d-flex flex-column text-right">
										<span class="text-success"> 
											<i class="fas fa-arrow-up"></i>
											????????? ?????? ????????????
										</span>
									</p>
								</div>
								<!-- /.d-flex -->
								<div class="position-relative mb-4">
									<canvas id="community-chart" height="200"></canvas>
								</div>

								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square text-primary"></i> 
										????????? ???
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										????????? ???
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										????????? ??????
									</span>
									<span> 
										<i class="fas fa-square text-gray"></i> 
										????????? ??????
									</span>
								</div>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col-md-6 -->
					<div class="col-lg-6">
						<!-- seller chart card -->
						<div class="card">
							<div class="card-header border-0">
								<div class="d-flex justify-content-between">
									<h3 class="card-title">????????? ??????</h3>
								</div>
							</div>
							<div class="card-body">
								<div class="d-flex">
									<p class="ml-auto d-flex flex-column text-right">
										<span class="text-success"> 
											<i class="fas fa-arrow-up"></i>
											????????? ?????? ????????????
										</span>
									</p>
								</div>
								<!-- /.d-flex -->

								<div class="position-relative mb-4">
									<canvas id="seller-chart" height="200"></canvas>
								</div>

								<div class="d-flex flex-row justify-content-end">
									<span class="mr-2"> 
										<i class="fas fa-square text-primary"></i> 
										????????????
									</span> 
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										???????????????
									</span>
									<span class="mr-2"> 
										<i class="fas fa-square text-gray"></i> 
										??????????????????
									</span>
									<span> 
										<i class="fas fa-square text-gray"></i> 
										????????????
									</span>
								</div>
							</div>
						</div>
						<!-- blackList recognize -->
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">??????????????? ??????</h3>
								<div class="card-tools">
									<div class="btn-group">
										<a href="${contextPath}/seller/notice"
											class="btn btn-sm btn-tool"> <i class="fas fa-bars"></i>
										</a>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body p-0">
								<table class="table">
									<thead>
										<tr align="center">
											<th style="width: 100px">??????</th>
											<th>?????? ??????</th>
											<th>?????????</th>
											<th>?????????</th>
											<th style="width: 100px">??? ??????</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty noticeList}">
												<tr align="center">
													<td colspan="5">
														<p align="center">
															<b><span style="font-size: 9pt;">????????? ?????? ????????????.</span></b>
														</p>
													</td>
												</tr>
											</c:when>
											<c:when test="${!empty noticeList}">
												<c:forEach var="notice" items="${noticeList}"
													varStatus="noticeNum">
													<tr align="center">
														<c:choose>
															<c:when test="${paging.nowPage == 1 }">
																<td>${paging.boardCount-noticeNum.index}</td>
															</c:when>
															<c:otherwise>
																<td>${paging.boardCount-noticeNum.index}</td>
															</c:otherwise>
														</c:choose>
														<td>${notice.no_title}</td>
														<td><fmt:formatDate value="${notice.reg_date}"
																pattern="yyyy-MM-dd" /></td>
														<td>${notice.hits}</td>
														<td><a
															href="${contextPath}/seller/notice/view?list_num=${notice.list_num}"
															class="text-muted"><i class="fas fa-search"></i></a></td>
												</c:forEach>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
							<!-- /.card-body -->
						</div>
					</div>
					<!-- /.col-md-6 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

</body>
</html>