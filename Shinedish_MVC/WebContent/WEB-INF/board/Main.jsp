<%@page import="java.util.Date"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Object Casting (객체 형변환! - 제일 중요함!)
// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>) request.getAttribute("list");
//ArrayList<Near_restaurantsVO> near_list = (ArrayList<Near_restaurantsVO>) request.getAttribute("list");

// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
String cpath = request.getContextPath(); // cpath : /m02

// 세션값을 읽어오는 방법!
//UserVO user = (UserVO)session.getAttribute("succ");

//시간 구하기, 객체 생성
//java.util.Date d= new java.util.Date();

Date d = new Date();
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShineDish</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main_mainstyle.css">
    
    <meta charset="utf-8">
    <link rel="stylesheet" href="fonts/font.css">

    <!-- search -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

</head>

<body>
	<div id="home">

        <div id="header">

            <div class="logo">
                <a href="#"  id="header_logo"
					onclick="location.href='<%=cpath%>/main.do'"><img src="img/shinedish.png" alt="로고"></a>
            </div>

            <div class="search_box">
                <input class="search-txt" type="text" name="" placeholder="Type to search">
                <a class="search-btn" href=""><i class="fas fa-search"></i></a>
            </div>

            <div class="menu">
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/main.do'">메인</a> <a
					href="#" class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
				<a href="#" class="menu_list">MY페이지</a> <a href="#"
					class="menu_list">로그인</a>
			</div>

		</div>
		<div id="mainpic">
			<div>
				<div class="frame">
					<div id="m-booked-bl-simple-87016">
						<div class="booked-wzs-160-110 weather-customize"
							style="background-color: #137AE9; width: 200px;" id="width2"
							href="https://www.weather.go.kr/w/weather/forecast/short-term.do">
							<div class="booked-wzs-160-110_in">
								<div class="booked-wzs-160-data">
									<div class="booked-wzs-160-left-img wrz-18"></div>
									<div class="booked-wzs-160-right">
										<div class="booked-wzs-day-deck">
											<div class="booked-wzs-day-val">
												<div class="booked-wzs-day-number">
													<span class="plus">+</span>20
												</div>
												<div class="booked-wzs-day-dergee">
													<div class="booked-wzs-day-dergee-val">&deg;</div>
													<div class="booked-wzs-day-dergee-name">C</div>
												</div>
											</div>
											<div class="booked-wzs-day">
												<div class="booked-wzs-day-d">
													<span class="plus">+</span>16&deg;
												</div>
												<div class="booked-wzs-day-n">
													<span class="plus">+</span>8&deg;
												</div>
											</div>
										</div>
										<div class="booked-wzs-160-info">
											<div class="booked-wzs-160-city">광주</div>
											<div class="booked-wzs-160-date">월요일, 08</div>
										</div>
									</div>
								</div>
								<div class="booked-wzs-center">
									<span class="booked-wzs-bottom-l"> 7일 예보 보기</span>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
						var css_file = document.createElement("link");
						var widgetUrl = location.href;
						css_file.setAttribute("rel", "stylesheet");
						css_file.setAttribute("type", "text/css");
						css_file
								.setAttribute("href",
										'https://s.bookcdn.com/css/w/booked-wzs-widget-160.css?v=0.0.1');
						document.getElementsByTagName("head")[0]
								.appendChild(css_file);
						function setWidgetData_87016(data) {
							if (typeof (data) != 'undefined'
									&& data.results.length > 0) {
								for (var i = 0; i < data.results.length; ++i) {
									var objMainBlock = document
											.getElementById('m-booked-bl-simple-87016');
									if (objMainBlock !== null) {
										var copyBlock = document
												.getElementById('m-bookew-weather-copy-'
														+ data.results[i].widget_type);
										objMainBlock.innerHTML = data.results[i].html_code;
										if (copyBlock !== null)
											objMainBlock.appendChild(copyBlock);
									}
								}
							} else {
								alert('data=undefined||data.results is empty');
							}
						}
						var widgetSrc = "https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=w651419;type=1;scode=2;ltid=3458;domid=593;anc_id=32323;countday=undefined;cmetric=1;wlangID=24;color=137AE9;wwidth=200;header_color=ffffff;text_color=333333;link_color=08488D;border_form=1;footer_color=ffffff;footer_text_color=333333;transparent=0;v=0.0.1";
						widgetSrc += ';ref=' + widgetUrl;
						widgetSrc += ';rand_id=87016';
						var weatherBookedScript = document
								.createElement("script");
						weatherBookedScript.setAttribute("type",
								"text/javascript");
						weatherBookedScript.src = widgetSrc;
						document.body.appendChild(weatherBookedScript)
						

					</script>

				</div>

			</div>
		</div>
		<div id="mainpage">
			<!--  			<script type="text/javascript">
				var d = new Date();
				var week = new Array('일', '월', '화', '수', '목', '금', '토');
				document.write('오늘 요일: ' + week[d.getDay()] + '요일' + '<br />');
			</script>
-->
			<div id="recommend_food">
				<span>오늘은 <%=d%>입니다.
				</span> <br> <span>오늘 저녁 이런 음식은 어떤가요?</span>
			</div>



			<%
				for (int i = 0; i < 9; i++) {
				RestaurantsVO vo = (RestaurantsVO) list.get(i);
			%>
			<div class="col-6" style="height: 570px; margin-bottom:50px;">

				<div class="card">

					<div class="card-header">
						<h3>
							<%=vo.getR_name()%>
							<p id="stsc">
								<small class="text-muted"><%=vo.getTotal_score()%>/5</small>

							</p>
						</h3>
					</div>

					<div>
						<a href="#"><img class="card-img-top"
							src="res_img/<%=vo.getR_num()%>_1.jpg" alt=""></a>

					</div>

					<div class="card-body" style="height: 230px">
						<h5 class="card-title"></h5>
						<a class="card-text"><%=vo.getR_phone()%></a><br> <a
							class="card-text"><%=vo.getR_road_addr()%></a><br> <a
							class="card-text"><%=vo.getR_running_time()%></a><br> <br>
						<p align="center">
							<a href="<%=cpath%>/detail.do?r_num=<%=vo.getR_num()%>"
								class="btn btn-primary" style="position: absolute; left:135px; bottom: 35px;">More</a>
						</p>
						<br>
					</div>

				</div>

			</div>
			<%
				}
			%>

		</div>
		<div id="subbar">
			<span> <br>
				<p>맛있는 선택 Shinedish</p>
			</span>
		</div>
	</div>
</body>

</html>