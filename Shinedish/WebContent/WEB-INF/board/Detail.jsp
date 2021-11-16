<%@page import="java.util.List"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	// Object Casting (객체 형변환! - 제일 중요함!)
	// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
		RestaurantsVO vo = (RestaurantsVO)request.getAttribute("vo");
		
	// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
		String cpath = request.getContextPath(); 	// cpath : /m02
		MembersVO members = (MembersVO)session.getAttribute("succ");

	// 세션값을 읽어오는 방법!
		//RestaurantsVO vo = (RestaurantsVO)session.getAttribute("succ");
	 //RestaurantsVO vo = new RestaurantsVO();
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
<title>RstDetail_page</title>

<!-- font -->
<meta charset="utf-8">
<link rel="stylesheet" href="fonts/font.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/rstdetail_mainstyle.css">

<!-- search -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<!-- category -->
<!-- <script src="https://code.jquery.com/jquery-1x.12.0.min.js"></script> -->

<!-- slider -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
        $(document).ready(function(){
          $('.slider_list').bxSlider();
        });
    </script>
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="css/slider.css">

<!-- button -->
<link rel="stylesheet" href="css/rstdetail_buttonstyle.css">

</head>

<body>
	<div id="shinedish">

		<!-- Page header -->
		<div id="header">

			<div class="logo">
				<a href="#" id="header_logo"
					onclick="location.href='<%=cpath%>/main.do'"> <img
					src="img/SH_logo.png" alt="로고"></a>
			</div>

			<div class="search_box">
				<form action="<%=cpath%>/Search.do" method="post" id="search_form">
					<input class="search-txt" type="text" name="Search"
						placeholder="Type to search"> <i class="fas fa-search"
						onclick="document.getElementById('search_form').submit()"
						style="color: white; width: 37px; height: 37px; float: right; border-radius: 50%; background: orange; display: flex; justify-content: center; align-items: center; padding: 5px; margin-right: 5px;"></i>
				</form>

			</div>

			<div class="menu">
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/main.do'">홈</a> <a href="#"
					class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
				<% if(members != null) { %>
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/mypage.do'">MY페이지</a>
				<% }else { %>
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/gologin.do'">MY페이지</a>
				<% } %>

				<% if(members == null) { %>
				<a href='<%=cpath%>/gologin.do' class="menu_list">로그인</a>
				<% }else { %>
				<a href='<%=cpath%>/logout.do' class="menu_list" onclick="outFn()">로그아웃</a>
				<% } %>
				<!-- <a href='<%=cpath%>/gologin.do' class="menu_list">로그인</a> -->
			</div>

		</div>

		<div id="line">
			<hr id="header_line" class="line_list">
		</div>


		<div id="line">
			<div id="line_list" class="line_img">맛집 사진</div>
		</div>

		<!-- Page mainpage -->
		<div id="mainpage">

			<!-- Page slider-->
			<div id="slider">

				<div class="slider_list">
					<li>
						<div class="lim">
							<img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_1.jpg" alt=""><img
								class="slider_list_img" src="res_img/<%=vo.getR_num()%>_2.jpg"
								alt=""><img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_3.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="lim">
							<img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_4.jpg" alt=""><img
								class="slider_list_img" src="res_img/<%=vo.getR_num()%>_5.jpg"
								alt=""><img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_1.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="lim">
							<img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_2.jpg" alt=""><img
								class="slider_list_img" src="res_img/<%=vo.getR_num()%>_3.jpg"
								alt=""><img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_4.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="lim">
							<img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_5.jpg" alt=""><img
								class="slider_list_img" src="res_img/<%=vo.getR_num()%>_1.jpg"
								alt=""><img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_2.jpg" alt="">
						</div>
					</li>
					<li>
						<div class="lim">
							<img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_3.jpg" alt=""><img
								class="slider_list_img" src="res_img/<%=vo.getR_num()%>_4.jpg"
								alt=""><img class="slider_list_img"
								src="res_img/<%=vo.getR_num()%>_5.jpg" alt="">
						</div>
					</li>
				</div>

				<!-- Page rst -->
				<div id="line">
					<hr class="line_list">
				</div>

				<div id="line">
					<div id="line_list">맛집 정보</div>
				</div>

				<div id="rst">
					<div class="rst_box"
						style="width: 100%; height: 370px; background-color: #D9D3C1;">
						<div class="rst_inf" style="height: 340px;">
							<li><a class="rst_inf_list" href="#">맛집이름 : <%=vo.getR_name()%></a></li>
							<li><a class="rst_inf_list" href="#">별점 : <%=vo.getTotal_score()%></a></li>
							<li><a class="rst_inf_list" href="#">주소 : <%=vo.getR_road_addr()%></a></li>
							<li><a class="rst_inf_list" href="#">전화번호 : <%=vo.getR_phone()%></a></li>
							<li><a class="rst_inf_list" href="#">영업시간 : <%=vo.getR_running_time()%></a></li>
						</div>
					</div>
				</div>


				<!-- Page rst_button -->
				<div id="rst_button">
					<li style="display: inline-block;">
					<span>
						<% if (members == null) { %>
					<a href="#"><button class="rst_button_name" id="rst_pick" type="button"
									onclick="location.href='<%=cpath%>/gologin.do'">찜하기</button></a>
						<%	} else { %> 
						<a href="#"><button class="rst_button_name" id="rst_pick" type="button"
									onclick="location.href='<%=cpath%>/mychoiceinsert.do?m_id=<%=members.getM_id()%>&r_num=<%=vo.getR_num()%>'">찜하기</button></a>
						<% } %>
					</span>
					<span>
						<% if (members == null) { %>
						<a href="#"><button class="rst_button_name" id="rst_review"
									type="button" onclick="location.href='<%=cpath%>/gologin.do'">리뷰쓰기</button></a>
						<%	} else { %> 
						<a href="#"><button class="rst_button_name" id="rst_review"
									type="button" onclick="location.href='<%=cpath%>/reviewswrite.do?r_num=<%=vo.getR_num()%>'">리뷰쓰기</button></a>
						<% } %>
					</span></li>
				</div>

				<div id="line">
					<hr class="line_list">
				</div>

				<!-- Page map -->
				<div id="line">
					<div id="line_list">맛집주변 카페</div>
				</div>

				<div id="map">

					<div class="map_inf_img">
						<iframe id="map_img_iframe"
							src="res_map/res_map_<%=vo.getR_num()%>.html" name="site"
							frameborder=0 framespacing=0 marginheight=0 marginwidth=0
							scrolling=no vspace=0 width="100%"></iframe>
					</div>

				</div>

				<!-- Page map_button -->
				<div id="map_button">
					<li style="display: inline-block;"><span><a
							href="img/res_map_T0001.html" target="_blank"><button
									class="map_button_name" id="map_view" type="button">지도
									크게보기</button></a></span></li>
				</div>

				<!-- Page review -->
				<div id="line">
					<hr class="line_list">
				</div>

				<div id="line">
					<div id="line_list" class="line_review">리뷰 정보</div>
				</div>
				<div id="review">

					<%
						List<ReviewsVO> list = (List<ReviewsVO>) request.getAttribute("list");
						for (int i = 0; i < list.size(); i++) {
							ReviewsVO rvo = (ReviewsVO) list.get(i);
				%>
					<div class="review_box">
						<div class="review_list" style="width: 1100px; height: 340px;">
							<div class="review_photo">
								<img class="review_photo_img" src="<%=rvo.getReview_pic1()%>">
							</div>
							<div class="review_write" style="width: 65%; height: 300px;">
								<p style="font-size:20px;"> <%=rvo.getReview_content()%>
								</p>
							</div>
						</div>
						<div class="review_star">
							<span><%=rvo.getR_rating() %>/5</span>
						</div>
					</div>
					<hr>
					<%
							}
						%>

					<!-- Page review_button -->
					<div class="review_button_box">
						<div class="review_button_list">
							<span><a href="#" id="review_button"><button
										class="review_button_name" id="review_load" type="button">더
										보기</button></a></span>
						</div>
					</div>

				</div>

				<script>
					$(function() {
						$(".div").slice(0, 16).show();
						$("#review_button").click(function(e) {
							e.preventDefault();
							$("div:hidden").slice(0, 16).show();
							if ($("div:hidden").length == 0) {
								alert("No more divs");
							}
						});
					});
				</script>






				<!-- Page footer -->
				<div id="line">
					<hr class="line_list">
				</div>

				<div id="footer" style="font-size: 1rem;">
					<span> <br>
						<p style="color: white;">맛있는 선택 Shinedish</p>
					</span>
				</div>

			</div>


			<!-- <script type="text/javascript"
			src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
			<script type="text/javascript">
				let formData = {
					location : '',
					mood : ''
				}

				$('.location').on('click', function() {
					$('#locationList > span').html($(this).html());
					formData.location = $(this).html();
				})

				$('.mood').on('click', function() {
					$('#moodList > span').html($(this).html());
					formData.mood = $(this).html();
				})

				$('#choice').on(
						'click',
						function() {

							// window > 열린 창에 해당하는 객체
							// location > 현재 위치
							window.location = "choice.do?r_addr_gu="
									+ formData.location
									+ "&choice.do?mood_num=" + formData.mood;

						})
			</script>
</body>

</html>