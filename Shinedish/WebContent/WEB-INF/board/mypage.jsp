<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>

<%
	String cpath = request.getContextPath(); 	// cpath : /m02
	
	// 세션값을 읽어오는 방법!
	MembersVO members = (MembersVO)session.getAttribute("succ");
	//ArrayList<ReviewsVO> Reviewslist = (ArrayList<ReviewsVO>)request.getAttribute("ReviewsList");
	

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
<link rel="stylesheet" href="css/mypage_mainstyle.css">
<link rel="stylesheet" href="fonts/font.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"> </script>

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<style>
#my_side {
	background-color: rgb(204, 224, 213);
	display: inline-block;
	width: 40%;
	height: 1000px;
	margin: 5px;
	padding: 5px;
}

#an {
	width: 670px;
	height: 1000px;
	background-color: #D9D3C1;
	display: inline-block;
	margin: 5px;
	padding: 5px;
}

#my_review {
	display: inline;
	width: 90%;
	margin: 5px;
	padding: 5px;
	float: right;
}

#re_area {
	/* 
	background-color: #D9D3C1;
	display: inline-block; 
	width: 670px;
	height: 1000px;
	margin-bottom: 100px;
	*/
	
}

#nickname {
	background-color: whitesmoke;
	margin: 10px;
	padding: 15px;
	position: relative;
	top: 10px;
	left: 10px;
	right: 10px;
}

#my_button {
	background-color: rgb(204, 224, 213);
	position: relative;
	top: 10px;
	left: 100px;
	right: 100px;
}

#m_review {
	background-color: whitesmoke;
	margin: 10px;
	padding: 15px;
	position: relative;
	top: 10px;
	left: 10px;
	right: 10px;
}

#m_taste {
	background-color: whitesmoke;
	margin: 10px;
	padding: 15px;
	position: relative;
	top: 10px;
	left: 10px;
	right: 10px;
}

#title {
	border: 2px solid black;
	float: left;
	width: 70%;
	text-align: center;
	font-size: 20px;
	margin-top: 5px;
}

#my_nic {
	border: 2px solid black;
	float: right;
	width: 30%;
	text-align: center;
	font-size: 20px;
	margin-top: 5px;
}

#my_img {
	background-repeat: no-repeat;
	border: 2px solid black;
	float: left;
	width: 40%;
	height: 180px;
	text-align: center;
	font-size: 20px;
	margin-top: 5px;
}

#re_comment {
	border: 2px solid black;
	float: right;
	width: 60%;
	height: 180px;
	text-align: center;
	font-size: 20px;
	margin-top: 5px;
}

#starscore {
	border: 2px solid black;
	float: right;
	width: 100%;
	text-align: center;
	font-size: 20px;
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>

</head>
<body>
	<input type="hidden" name="m_id" value="<%=members.getM_id()%>" />
	<div id="home" style="height: 1200px;">
		<div id="header">

			<div class="logo">
				<a href="#" id="header_logo"
					onclick="location.href='<%=cpath%>/main.do'"><img
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

		<div id="mainpage">
			<div id="my_side">
				<div id="sidebar">
					<div id="nickname"
						style="border: 1px solid black; float: left; width: 90%; text-align: center; font-size: 25px;">
						<strong><%=members.getM_id()%>님 환영합니다.</strong>
					</div>

					<!--  <div style="float: left; width: 20%; text-align: center; font-size: 15px;" id="my_button">
                        <button>정보수정</button>
                    </div>-->
					<div id="my_review_list"></div>
					<div id="m_review"
						style="border: 1px solid black; float: left; width: 90%; text-align: center; font-size: 25px;">
						<strong><a id="myReviewList" onclick="location.href='<%=cpath%>/reviewslist.do?m_id=<%=members.getM_id()%>'">내가 쓴 리뷰 보기</a></strong>
					</div>

					<div id="m_taste"
						style="border: 1px solid black; float: left; width: 90%; text-align: center; font-size: 25px;"
						onclick="location.href='<%=cpath%>/mychoicelist.do?m_id=<%=members.getM_id()%>'">
						<strong>나만의 맛집 보기</strong>
					</div>
				</div>
			</div>

			<div id="an">
				<div id="my_review">
					<div id="re_area" style="background-color: whitesmoke;"></div>
				</div>
			</div>

		</div>

           

		<div id="subbar">
			<span> <br>
				<p style="color: white;">맛있는 선택 Shinedish</p>
			</span>
		</div>
	</div>




</body>

</html>