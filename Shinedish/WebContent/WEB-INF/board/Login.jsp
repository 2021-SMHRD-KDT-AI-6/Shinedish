<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>

<!DOCTYPE html>
<html lang="en">

<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>

<%
	String cpath = request.getContextPath();
// 세션값을 읽어오는 방법!
MembersVO members = (MembersVO) session.getAttribute("succ");
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
<link rel="stylesheet" href="css/login_mainstyle.css">

<!-- search -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<!-- button -->
<link rel="stylesheet" href="css/reviewwrite_buttonstyle.css">

<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.pw.value) {
			alert("비밀번호를 입력하세요");
			inputForm.pw.focus();
			return false;
		}
	}

	function goJoinForm() {
		location.href = "signup.do";
	}
</script>
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
				<%
					if (members == null) {
				%>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">로그인</a>
				<%
					} else {
				%>
				<a href="#" class="menu_list" onclick="outFn()">로그아웃</a>
				<%
					}
				%>
			</div>

		</div>
		
		<div id="line">
			<hr id="header_line" class="line_list">
		</div>
		
		<div id="login_mainpage">
			<div class="m_login_box">
				<table>
					<form name="loginInfo" method="post" action="<%=cpath%>/login.do"
						onsubmit="return checkValue()">
						<table style="width: 575px; height: 300px; text-align: center;">
							<tr bgcolor="gray" height="60px" width="575px">
								<th id="login_text" colspan="2">로그인</th>
							</tr>
							<tr bgcolor="whitesmoke" height="60px" width="300px">
								<td id="login_id" align="right" style="font-size: 25px;">아이디
									:
								<td align="left"><input type="text" name="id"
									placeholder="아이디" style="font-size: 20px;"></td>
								</td>
							</tr>
							<tr bgcolor="whitesmoke" height="60px" width="300px">
								<td id="login_pw" align="right" style="font-size: 25px;">비밀번호
									:
								<td align="left"><input type="password" name="pw"
									placeholder="비밀번호" style="font-size: 20px;"></td>
								</td>
							</tr>
							<td colspan="2" align="center">
								<button class="review_button_name" href="#">로그인</button>
								<button class="review_button_name" type="button"
									onclick="goJoinForm()" />회원가입
								</button>
							</td>
						</table>
					</form>

				</table>
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