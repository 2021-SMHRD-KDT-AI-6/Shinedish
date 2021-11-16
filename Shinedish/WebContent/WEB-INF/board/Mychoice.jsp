<%@page import="kr.smhrd.model.MychoiceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.model.RestaurantsVO"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>

<%//mypage 찜하기 리스트 보여주기
	String cpath = request.getContextPath(); 	// cpath : /m02
	// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
	String r_num = (String)request.getAttribute("r_num");
	String m_id = (String)request.getAttribute("m_id");
	
	// 세션값을 읽어오는 방법!
	MembersVO members = (MembersVO)session.getAttribute("succ");
	ArrayList<RestaurantsVO> list = (ArrayList<RestaurantsVO>) request.getAttribute("list");
	List<MychoiceVO> myChoicelist = (List<MychoiceVO>) request.getAttribute("myChoicelist");
	List<ReviewsVO> myreviewsList = (List<ReviewsVO>) request.getAttribute("myreviewsList");

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
<style>
.col-6 {
	display: inline-block;
	width: 32%;
	height: 465px;
	top: 10px;
	left: 10px;
	right: 10px;
	margin: 5px;
}
</style>

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
		<!-- Page mainpage -->
		<div id="mainpage" style="height: auto;">
			<div style="width: 100%; text-align: center;">
				<span style="font-size: 40px;"><strong>나만의 맛집들</strong></span>
			</div>
			<div style="width:100%; height: auto; display:inline-block; position:relative; margin-bottom:50px;">
				<%
					for (int i = 0; i < myChoicelist.size(); i++) {
					MychoiceVO vo = (MychoiceVO) myChoicelist.get(i);
				%>
				<div class="col-6" style="height: 400px; margin-bottom: 50px;">

					<div class="card">

						<div class="card-header">
							<h3 class="an">
								<%=vo.getR_name()%>
								<p id="stsc"></p>
							</h3>
						</div>

						<div>
							<a href="#"><img class="card-img-top"
								src="res_img/<%=vo.getR_num()%>_1.jpg" alt=""></a>

						</div>

						<div class="card-body" style="height: 80px">
							<h5 class="card-title"></h5>
							<p align="center">
								<a href="<%=cpath%>/detail.do?r_num=<%=vo.getR_num()%>"
									class="btn btn-primary"
									style="position: absolute; left: 120px; bottom: 20px;">상세보기</a>
							</p>
							<br>
						</div>

					</div>

				</div>
				<%
					}
				%>
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