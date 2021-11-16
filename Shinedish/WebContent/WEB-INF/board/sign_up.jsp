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

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShineDish</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/sign_up_mainstyle.css">
    <link rel="stylesheet" href="fonts/font.css">

    <!-- search -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

    <!-- button -->
    <link rel="stylesheet" href="css/reviewwrite_buttonstyle.css">

    <style>
        #login_form{
            display: flex;
            justify-content: center;
            height: auto;
        }
    </style>
     <script type="text/javascript">
    	function checkValue(){
    		inputForm = eval("document.loginInfo");
    		if(!inputForm.id.value){
    			alert("아이디를 입력하세요");
    			inputForm.id.focus();
    			return false;
    		}
    		if(!inputForm.pw.value){
    			alert("비밀번호를 입력하세요");
    			inputForm.pw.focus();
    			return false;
    		}
    		if(!inputForm.e-mail.value){
    			alert("이메일을 입력하세요");
    			inputForm.e-mail.focus();
    			return false;
    		}
    		
    	}
    	
    	function goJoinForm(){
    		location.href="signup.do";
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
                <a href="#" class="menu_list" onclick="location.href='<%=cpath%>/main.do'">메인</a>
                <a href="#" class="menu_list" onclick="location.href='<%=cpath%>/choice.do'">맛집추천</a>
 				<% if(members != null) { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/mypage.do'">MY페이지</a>
				<% }else { %>
				<a href="#" class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">MY페이지</a>
                <% } %>                
                
                <% if(members == null) { %>
                <a href='<%=cpath%>/gologin.do' class="menu_list" onclick="location.href='<%=cpath%>/gologin.do'">로그인</a>
                <% }else { %>
                <a href='<%=cpath%>/logout.do' class="menu_list" onclick="outFn()">로그아웃</a>
                <% } %>
            </div>

        </div>

        <div id="line"><hr id="header_line" class="line_list"></div>

        <div id="sign_up_mainpage">

            <div class="m_sign_up_box">

                    
                 <table>
                    <form action="<%=cpath%>/signup1.do">
                        <table style="width: 574px; height: 300px; text-align: center;">
                            <tr bgcolor="gray" height="60px" width="600px">
                                <th colspan="2" style="font-size: 25px;">회원가입</th>
                            </tr>
                            <tr bgcolor="whitesmoke" height="60px" width="300px">
                                <td align="right" style="font-size: 25px;">아이디 : <td align="left"><input type="text" id="id" name="id" placeholder="아이디" style="font-size: 20px;"></td></td>
                            </tr>
                            <tr bgcolor="whitesmoke" height="60px" width="300px">
                                <td align="right" style="font-size: 25px;">비밀번호 : <td align="left"><input type="password"  id="pw" name="pw" placeholder="비밀번호" style="font-size: 20px;"></td></td>
                            </tr>
                            <tr bgcolor="whitesmoke" height="60px" width="300px">
                                <td align="right" style="font-size: 25px;">비밀번호 확인 : <td align="left"><input type="password" id="r_pw" name="repw" placeholder="비밀번호 확인" style="font-size: 20px;"></td></td>
                            </tr>
                            <tr bgcolor="whitesmoke" height="60px" width="300px">
                                <td align="right" style="font-size: 25px;">이메일 : <td align="left"><input type="text" name="e-mail" placeholder="e-mail" style="font-size: 20px;"></td></td>
                            </tr>
                            <tr bgcolor="whitesmoke" height="60px" width="300px">
                                <td align="right" style="font-size: 25px;">생일<td align="left"><input type="date" name="date" style="font-size: 20px;"></td></td>
                            </tr>
                            <td colspan="2" align="center"><br>
                                <input type="reset" value="작성취소" style="font-size: 25px;">
                                <input type="submit" value="회원가입" style="font-size: 25px;">
                            </td>
                        </table>
                    </form>
                </table>
        </div>
        <br>  <br>  <br>  <br>  <br>  <br>
        <!-- Page footer -->
        <div id="footer">
            <span>  <br>  
                <p style="color: white;">맛있는 선택 Shinedish</p>
            </span>
        </div>

        </div>

    </div>
</body>

</html>