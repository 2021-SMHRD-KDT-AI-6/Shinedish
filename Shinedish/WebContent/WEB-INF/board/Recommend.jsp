<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>


<%
	// Object Casting (객체 형변환! - 제일 중요함!)
// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
	ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>) request.getAttribute("list");

// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
	String cpath = request.getContextPath(); // cpath : /m02
	MembersVO members = (MembersVO)session.getAttribute("succ");

// 세션값을 읽어오는 방법!
//RestaurantsVO vo = (RestaurantsVO)session.getAttribute("succ");
//RestaurantsVO vo = new RestaurantsVO();
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShineDish</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/taste_mainstyle.css">
    <link rel="stylesheet" href="fonts/font.css">

    <!-- search -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    
    <style>
        
        #home {
            width: 1200px;
            height: 2700px;
            margin: 0 auto;
        }

        #mainbar {
            background-color: whitesmoke;
            width: 100%;
            height: 60px;
        }

        #maintag {
            overflow: auto;
            background-size: 100%;
            background-repeat: no-repeat;
            width: 100%;
            height: 300px;
        }

        #subbar {
            text-align: center;
            background-color: gray;
            width: 100%;
            height: 100px;
        }

        #m_logo {
            display: inline-block;
        }

        #upbar {
            display: inline-block;
            margin-top: 20px;
        }

        #category {
        	background-color: #D9D3C1;
            width: 100%;
            height: 200px;
            overflow: auto;
            background-size: 100%;
            background-repeat: no-repeat;
            padding: 5px;
            margin: 5px;
            border: 1px solid
        }

        .category_list {
            width: 100%;
            height: 30px;
        }

        .category_list_01 {
            float: left;
            width: 30%;
            height: 160px;
            padding: 5px;
            margin: 5px;
        }

        .lim {
            display: block;
        }

        #maintag {
            width: 100%;
            padding: 10px;
            height: auto;
        }

    </style>

</head>

<body>
	<div id="home">
		<div id="header">

			<div class="logo">
				<a href="#" id="header_logo"
					onclick="location.href='<%=cpath%>/main.do'">
					<img src="img/SH_logo.png" alt="로고"></a>
			</div>

			<div class="search_box">
				<form action="<%=cpath%>/Search.do" method="post" id="search_form">
					<input class="search-txt" type="text" name="Search"
						placeholder="Type to search"> <i class="fas fa-search"
						onclick="document.getElementById('search_form').submit()"
						style="color: white; width: 37px; height: 37px; float: right; border-radius: 50%; 
						background: orange; display: flex; justify-content: center; align-items: center; padding: 5px; margin-right: 5px;"></i>
				</form>

			</div>

			<div class="menu">
				<a href="#" class="menu_list"
					onclick="location.href='<%=cpath%>/main.do'">홈</a> <a
					href="#" class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
 				<% if(members != null) { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/mypage.do'">MY페이지</a>
				<% }else { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">MY페이지</a>
                <% } %>				 
                
                <% if(members == null) { %>
                <a href='<%=cpath%>/gologin.do' class="menu_list" >로그인</a>
                <% }else { %>
                <a href='<%=cpath%>/logout.do' class="menu_list" onclick="outFn()">로그아웃</a>
                <% } %>
				<!-- <a href='<%=cpath%>/gologin.do' class="menu_list">로그인</a> -->
			</div>

		</div>


		<div id="maintag">
			
		<!-- Page Category -->
		<div id="category">

			<div class="category_list">

				<div class="category1">
					<li class="category_list_01" id="locationList"><span>Click 01 - 지역</span>
						<ul class="sub" style="display: none">
							<li><a class="location" href="#">동구</a></li>
							<li><a class="location" href="#">서구</a></li>
							<li><a class="location" href="#">남구</a></li>
							<li><a class="location" href="#">북구</a></li>
							<li><a class="location" href="#">광산구</a></li>
						</ul>
					</li>
				</div>

                <div class="category1">
                    <li class="category_list_01" id="foodList"><span>Click 02 - 음식 종류</span>
                        <ul class="sub" style="display:none">
                            <li><a class="food" href="#">한식</a></li>
                            <li><a class="food" href="#">양식</a></li>
                            <li><a class="food" href="#">중식</a></li>
                            <li><a class="food" href="#">일식</a></li>
                        </ul>
                    </li>
                </div>          


				<div class="category1">
					<li class="category_list_01" id="moodList"><span>Click 03 - 분위기</span>
						<ul class="sub" style="display: none">
							<li><a class="mood" href="#">Good Mood</a></li>
							<li><a class="mood" href="#">Good Price</a></li>
							<li><a class="mood" href="#">Good View</a></li>
							<li><a class="mood" href="#">Exotic Mood</a></li>
						</ul></li>
				</div>

				<div class="category1">
					<button id="choice">Choice</button>
				</div>


				<script>
                    $(".category1").click(function () {
                        if ($(this).find(".sub").is(":visible")) {
                            $(this).find(".sub").css("display", "none");
                        }
                        else {
                            $(this).find(".sub").css("display", "block");
                        }
                    })
                </script>

			</div>

		</div>

		</div>

		<div>
			<%
				for (int i = 0; i < list.size(); i++) {
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

					<div class="card-body"  style="height: 230px">
						<h5 class="card-title"></h5>
						<a class="card-text"><%=vo.getR_phone()%></a><br> <a
							class="card-text"><%=vo.getR_road_addr()%></a><br> <a
							class="card-text"><%=vo.getR_running_time()%></a><br> <br>
						<p align="center">
							<a href="<%=cpath%>/detail.do?r_num=<%=vo.getR_num()%>"
								class="btn btn-primary" style="position: absolute; left:135px; bottom: 35px;">상세보기</a>
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
				<p style="color: white;">맛있는 선택 Shinedish</p>
			</span>
		</div>
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		let formData = {
				location : '',
				food :'',
				mood : ''
		}
		
		$('.location').on('click', function(){
			$('#locationList > span').html($(this).html());
			formData.location = $(this).html();
		})
		
		$('.food').on('click', function(){
			$('#foodList > span').html($(this).html());
			formData.food = $(this).html();
		})
		
		$('.mood').on('click', function(){
			$('#moodList > span').html($(this).html());
			formData.mood = $(this).html();
		})
		
		$('#choice').on('click', function(){
			
			// window > 열린 창에 해당하는 객체
			// location > 현재 위치
			window.location = "choice.do?r_addr_gu=" + formData.location + "&r_foodtype=" + formData.food + "&mood_num=" + formData.mood;
			
		});
	</script>
</body>

</html>