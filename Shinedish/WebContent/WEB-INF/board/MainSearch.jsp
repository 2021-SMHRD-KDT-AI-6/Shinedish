<%@page import="java.util.Date"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// Object Casting (객체 형변환! - 제일 중요함!)
// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>) request.getAttribute("list");
ArrayList<RestaurantsVO> Searchlist = (ArrayList<RestaurantsVO>) request.getAttribute("Searchlist");
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
                <a href="#" id="header_logo" onclick="location.href='<%=cpath%>/main.do'"><img src="img/SH_logo.png" alt="로고"></a>
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
		
		<div id="line"><hr id="header_line" class="line_list"></div>
		
		<div id="mainpage">

			<%
				for (RestaurantsVO vo : Searchlist ) {
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
</body>

</html>