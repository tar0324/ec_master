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
	.content-header{
		text-align: center;
	}
	.notice{
		width: 395px;
		display: inline-block;
		height: 300px;
	}
	.review{
		width: 395px;
		display: inline-block;
		margin-left: 10px;
		height: 300px;
		float: right;
	}
	.booking-YN {
		width: 80px;
		height: 40px;
		display: inline-block;
		margin-top: 0 !important;
	}
	.review-btn{
		cursor: pointer;
	}
	.text-lg{
		font-size: 15px;
	}
	.main-board{
		font-size: 14px;
	}
	.booking-card{
		height: 375px;
	}
	.calendar-card{
		height: 456px;
	}
</style>
<script type="text/javascript">
$(function () {
	  'use strict'

	  var ticksStyle = {
	    fontColor: '#495057',
	    fontStyle: 'bold'
	  }

	  var mode = 'index'
	  var intersect = true

	  var $salesChart = $('#sales-chart')
	  // eslint-disable-next-line no-unused-vars
	  var salesChart = new Chart($salesChart, {
	    type: 'bar',
	    data: {
	      labels: ['월', '화', '수', '목', '금', '토', '일'],
	      datasets: [
	        {
	          backgroundColor: '#ecaa88',
	          borderColor: '#ecaa88',
	          data: [10, 20, 30, 25, 27, 25, 30]
	        },
	        {
	          backgroundColor: '#d9adac',
	          borderColor: '#d9adac',
	          data: [7, 17, 27, 20, 18, 15, 20]
	        }
	        ,
	        {
	          backgroundColor: '#f8a39e',
	          borderColor: '#f8a39e',
	          data: [6, 10, 7, 1, 9, 15, 13]
	        }
	      ]
	    },
	    options: {
	      maintainAspectRatio: false,
	      tooltips: {
	        mode: mode,
	        intersect: intersect
	      },
	      hover: {
	        mode: mode,
	        intersect: intersect
	      },
	      legend: {
	        display: false
	      },
	      scales: {
	        yAxes: [{
	          // display: false,
	          gridLines: {
	            display: true,
	            lineWidth: '4px',
	            color: 'rgba(0, 0, 0, .2)',
	            zeroLineColor: 'transparent'
	          },
	          ticks: $.extend({
	            beginAtZero: true,

	            // Include a dollar sign in the ticks
	            callback: function (value) {
	              if (value >= 1000) {
	                value /= 1000
	                value += 'k'
	              }

	              return value
	            }
	          }, ticksStyle)
	        }],
	        xAxes: [{
	          display: true,
	          gridLines: {
	            display: false
	          },
	          ticks: ticksStyle
	        }]
	      }
	    }
	  })

	})
$(document).ready(function() {
	const Calendar = tui.Calendar;
	const container = document.getElementById('calendar');
	const options = {
	  defaultView: 'month',
	  usageStatistics: false
	};

	const calendar = new Calendar(container, options);
	
	calendar.createEvents([
		  {
		    id: 'event1',
		    calendarId: 'cal2',
		    title: '주간 회의',
		    start: '2022-10-10',
		    end: '2022-10-10',
		  }
		]);
	
  });
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
            <h1 class="m-0">메인 페이지</h1>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
          <!-- 예약건수/리뷰수/찜수 일주일 그래프 -->
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <span class="text-bold text-lg">우리가게 현황 - 이번주</span>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="text-muted">예약일 기준</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="sales-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square" style="color:#ecaa88 !important"></i> 예약 건 수
                  </span>
                  <span class="mr-2">
                    <i class="fas fa-square" style="color:#d9adac !important"></i> 찜 수
                  </span>
                  <span class="mr-2">
                    <i class="fas fa-square" style="color:#f8a39e !important"></i> 리뷰 수
                  </span>
                </div>
              </div>
            </div>
            <!-- 예약 승인/취소 -->

            <div class="card booking-card">
              <div class="card-header border-0">
                <span class="text-bold text-lg">예약 승인/거부</span>	
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>	
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr align="center">
                    <th width="150px">예약자</th>
                    <th>예약 인원</th>
                    <th>예약 일자</th>
                    <th>현황</th>
                    <th width="300px">승인/거부</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr align="center">
                    <td>
                      예약자
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                    10 명
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                    <td>
                        2022-12-25 12:30
	                    <!-- 예약일 + 시간으로 변경 -->
                    </td>
                    <td>
                        <span>대기</span>
	                    <!-- 예약일 + 시간으로 변경 -->
                    </td>
                    <td>
                        <button type="button" class="btn btn-block btn-primary booking-YN">승인</button>
                      /
                        <button type="button" class="btn btn-block btn-primary booking-YN">거부</button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card notice">
              <div class="card-header border-0">
                <span class="text-bold text-lg">공지사항</span>	
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>	
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr align="center">
                    <th>내용</th>
                    <th>작성일</th>
                  </tr>
                  </thead>
                  <tbody class="main-board">
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                    <td>
                      공지사항입니다. 주의부탁드립니다.
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                  12.25
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                  </tr>
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.card -->
			 <div class="card review">
              <div class="card-header border-0">
                <span class="text-bold text-lg">예약 승인/거부</span>	
                <div class="card-tools">
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>	
                  </a>
                </div>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr align="center">
                    <th>리뷰 작성자</th>
                    <th>작성일</th>
                    <th>답변 여부</th>
                  </tr>
                  </thead>
                  <tbody class="main-board">
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                    <td>
                      예약자
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                    2022-12-25 12:30
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                    <td>
                       <span>미답변</span>
                    </td>
                  </tr>
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                    <td>
                      예약자
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                    2022-12-25 12:30
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                    <td>
                       <span>미답변</span>
                    </td>
                  </tr>
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                    <td>
                      예약자
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                    2022-12-25 12:30
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                    <td>
                       <span>미답변</span>
                    </td>
                  </tr>
                  <tr align="center" class="review-btn" onclick="location.href='${contextPath}/sellerMain'">                  
                    <td>
                      예약자
                      <!-- 사용자 이름으로 변경 -->
                    </td>
                    <td>
	                    2022-12-25 12:30
	                    <!-- 예약 인원으로 변경 --> 
                    </td>
                    <td>
                       <span>미답변</span>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card calendar-card">
            <div class="card-header border-0">
                <span class="text-bold text-lg">예약 상황</span>	
                <div class="card-tools">
                <button class="button is-rounded today">Today</button>
                 <button class="button is-rounded prev">
          </button>
          <button class="button is-rounded next">
          </button>
          <span class="navbar--range"></span>
                  <a href="#" class="btn btn-tool btn-sm">
                    <i class="fas fa-bars"></i>	
                  </a>
                </div>
              </div>
              <div class="card-body main-cal">
              	<div id="calendar" style="height: 360px;"></div>
              </div>
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