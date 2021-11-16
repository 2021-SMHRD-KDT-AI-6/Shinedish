<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>

 <form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
 
<%

	System.out.println(request.getContextPath());
	String cpath = request.getContextPath(); 	// cpath : /m02
	// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
	String r_num = (String)request.getAttribute("r_num");

	// 세션값을 읽어오는 방법!
	MembersVO members = (MembersVO)session.getAttribute("succ");
	RestaurantsVO vo = (RestaurantsVO)request.getAttribute("vo");
	String r_name = (String)vo.getR_name();
%>

<%@ page import="java.util.*" %>
 
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
<title>ReviewWrite_page</title>

<!-- font -->
<meta charset="utf-8">
<link rel="stylesheet" href="fonts/font.css">

<!-- css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/reviewwrite_mainstyle.css">

<!-- search -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<!-- button -->
<link rel="stylesheet" href="css/reviewwrite_buttonstyle.css">

</head>
<body>

	<div id="shinedish">

		<!-- Page header -->
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
					onclick="location.href='<%=cpath%>/main.do'">홈</a> <a href="#"
					class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
 				<% if(members != null) { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/mypage.do'">MY페이지</a>
				<% }else { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">MY페이지</a>
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
		<!-- Page mainpage -->
		<div id="review_mainpage">

			<!-- Page map -->
			<div id="line">
				<div id="line_list">리뷰 쓰기</div>
			</div>

			<div id="review" style="height:950px;">

				<div class="review_box">
 
					<div class="review_inf" style="width:820px; height:900px;">


  					<form action = '<%=cpath%>/reviewsinsert.do' method ='post' enctype="multipart/form-data">
  					<input type ="hidden"  class = "r_num" name = "r_num" value=<%=r_num %>>
  					<input type ="hidden"  class = "m_id" name = "m_id" value="<%=members.getM_id()%>">
						<div class="review_inf_write" style="width:800px; height:65px; padding-bottom:5px;">
							<div style="height:45px; float:left; font-size:25px; margin:5px; padding:5px;"><strong>사진첨부</strong></div>
							<p><input class = "review_inf_img" type = "file" name ="photo" value = "" style="margin:5px; padding:7px; border:0px; width:650px; float:right; height:45px;"></p>
						</div>
						<div class="review_inf_write" style="width:800px; height:450px;">
							<p><textarea class = "review_inf_content" type = "text" name ="review" value = "" style="width:780px; height:440px;" maxlength="150"></textarea></p>
						</div>
						<div class="review_inf_star" style="width:800px;">

							<div class="star-rating space-x-4 mx-auto">
								<input class="rating" type="radio" id="5-stars" name="rating" value="5"
									v-model="ratings" /> <label for="5-stars" class="star pr-4">★</label>
								<input class="rating" type="radio" id="4-stars" name="rating" value="4"
									v-model="ratings" /> <label for="4-stars" class="star">★</label>
								<input class="rating" type="radio" id="3-stars" name="rating" value="3"
									v-model="ratings" /> <label for="3-stars" class="star">★</label>
								<input class="rating" type="radio" id="2-stars" name="rating" value="2"
									v-model="ratings" /> <label for="2-stars" class="star">★</label>
								<input class="rating" type="radio" id="1-star" name="rating" value="1"
									v-model="ratings" /> <label for="1-star" class="star">★</label>
							</div>

						</div>
						<div>
			
						<button type = "submit" class = "btn btn-primary btn-sm">확인</button>
			    		<button type = "reset" class = "btn btn-warning btn-sm">취소</button>
			    		</div>
						
    				</form>
					</div>

				</div>

			</div>

		</div>

		<!-- Page footer -->
		<div id="footer">
			<span> <br>
				<p style="color: white;">맛있는 선택 Shinedish</p>
			</span>
		</div>

	</div>

</body>
</html>