<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>
  <!-- 액션태그 jsp를 forward 시킬때 페이지로 가게 하라! -->
<jsp:forward page = "main.do"/>
<%
	// Object Casting (객체 형변환! - 제일 중요함!)
// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>) request.getAttribute("list");
//ArrayList<Near_restaurantsVO> near_list = (ArrayList<Near_restaurantsVO>) request.getAttribute("list");

// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
String cpath = request.getContextPath(); // cpath : /m02
MembersVO members = (MembersVO)session.getAttribute("succ");

// 세션값을 읽어오는 방법!
//UserVO user = (UserVO)session.getAttribute("succ");

//시간 구하기, 객체 생성
//java.util.Date d= new java.util.Date();

Date d = new Date();
%>
<!DOCTYPE html>
<html lang="en">
  <script type="text/javascript">
  	function outFn(){
  		location.href = "<%=cpath%>/logout.do";
  	}
  </script>
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
                <a href="http://localhost:13681/sd/Main.jsp" id="header_logo"><img src="img/SH_logo.png" alt="로고"></a>
            </div>

            <div class="search_box">
                <input class="search-txt" type="text" name="" placeholder="Type to search">
                <a class="search-btn" href=""><i class="fas fa-search"></i></a>
            </div>

            <div class="menu">
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/main.do'">메인</a> <a
					href="#" class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">MY페이지</a> 
				 <% if(members == null) { %>
                <a href='<%=cpath%>/gologin.do' class="menu_list" >로그인</a>
                <% }else { %>
                <a href='<%=cpath%>/logout.do' class="menu_list" onclick="outFn()">로그아웃</a>
                <% } %>
				<!-- <a href='<%=cpath%>/gologin.do' class="menu_list">로그인</a> -->
			</div>

        </div>
        <div id="mainpic">
            <div>
                <div class="frame">
                    <div id="m-booked-bl-simple-87016">
                        <div class="booked-wzs-160-110 weather-customize" style="background-color:#137AE9;width:200px;"
                            id="width2" href="https://weather.naver.com/">
                            <div class="booked-wzs-160-110_in">
                                <div class="booked-wzs-160-data">
                                    <div class="booked-wzs-160-left-img wrz-18"></div>
                                    <div class="booked-wzs-160-right">
                                        <div class="booked-wzs-day-deck">
                                            <div class="booked-wzs-day-val">
                                                <div class="booked-wzs-day-number"><span class="plus">+</span>20</div>
                                                <div class="booked-wzs-day-dergee">
                                                    <div class="booked-wzs-day-dergee-val">&deg;</div>
                                                    <div class="booked-wzs-day-dergee-name">C</div>
                                                </div>
                                            </div>
                                            <div class="booked-wzs-day">
                                                <div class="booked-wzs-day-d"><span class="plus">+</span>16&deg;</div>
                                                <div class="booked-wzs-day-n"><span class="plus">+</span>8&deg;</div>
                                            </div>
                                        </div>
                                        <div class="booked-wzs-160-info">
                                            <div class="booked-wzs-160-city">광주</div>
                                            <div class="booked-wzs-160-date">월요일, 08</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="booked-wzs-center"><span class="booked-wzs-bottom-l"> 7일 예보 보기</span></div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                    var css_file = document.createElement("link");
                        var widgetUrl = location.href; css_file.setAttribute("rel", "stylesheet"); css_file.setAttribute("type", "text/css"); css_file.setAttribute("href", 'https://s.bookcdn.com/css/w/booked-wzs-widget-160.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file);
                        function setWidgetData_87016(data) {
                            if (typeof (data) != 'undefined' && data.results.length > 0) {
                                for (var i = 0; i < data.results.length; ++i) {
                                    var objMainBlock = document.getElementById('m-booked-bl-simple-87016');
                                    if (objMainBlock !== null) {
                                        var copyBlock = document.getElementById('m-bookew-weather-copy-' + data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code;
                                        if (copyBlock !== null) objMainBlock.appendChild(copyBlock);
                                    }
                                }
                            }
                            else { alert('data=undefined||data.results is empty'); }
                        }
                        var widgetSrc = "https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=w651419;type=1;scode=2;ltid=3458;domid=593;anc_id=32323;countday=undefined;cmetric=1;wlangID=24;color=137AE9;wwidth=200;header_color=ffffff;text_color=333333;link_color=08488D;border_form=1;footer_color=ffffff;footer_text_color=333333;transparent=0;v=0.0.1"; widgetSrc += ';ref=' + widgetUrl; widgetSrc += ';rand_id=87016';
                        var weatherBookedScript = document.createElement("script"); weatherBookedScript.setAttribute("type", "text/javascript"); weatherBookedScript.src = widgetSrc; document.body.appendChild(weatherBookedScript)</script>
                </div>
                
            </div>
        </div>
        <div id="mainpage">
            <div id="recommend_food">
                <span>오늘은 금요일 입니다.</span>
                <br>
                <span>친구들끼리 회식은 어떤가요? ㅇ ㅅㅇ)?</span>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <hr >
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card">
                    <div class="card-header">
                        My Card
                        <p id="stsc">
                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                        </p>
                    </div>
                    <div>
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Lorem</h5>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam egestas sed
                            sem ut malesuada.</p>
                        <a href="#" class="btn btn-primary">More</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="subbar">
            <span>
                <br>
                <p>맛있는 선택 Shinedish</p>
            </span>
        </div>
    </div>
</body>

</html>