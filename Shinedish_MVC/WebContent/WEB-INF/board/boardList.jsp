<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// Object Casting (객체 형변환! - 제일 중요함!)
	// request.getAttribute("list")는 타입이 Object이다!! ArrayList<BoardVO>로 형변환해주자!
		ArrayList<ReviewsVO> list = (ArrayList<ReviewsVO>)request.getAttribute("list");
	// 위에 문장은 Object list = request.getAttribute("list");로 쓸 수 있다.
	String cpath = request.getContextPath(); 	// cpath : /m02
	
	// 세션값을 읽어오는 방법!
	MembersVO members = (MembersVO)session.getAttribute("succ");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function outFn(){
  		location.href = "<%=cpath%>/logout.do";
  	}
  </script>
</head>
<body>

<div class="container">
  <h2>MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    	<% if(members ==null){%>
	    <form class="form-inline" action="<%=cpath%>/login.do" method = "post">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <input type="text" class="form-control" id="id" name = 'id'>
		  </div>
		  <div class="form-group">
		    <label for="password">Password:</label>
		    <input type="password" class="form-control" id="pwd" name = 'password'>
		  </div>
		  <button type="submit" class="btn btn-default">로그인</button>
		</form>
		<%}else { %>
			<%=members.getM_id()%>님  방문을 환영합니다.
		  <button type="submit" class="btn btn-default" onclick = "outFn()">로그아웃</button>
		
		<%} %>
	</div>
    <div class="panel-heading">BOARD LIST</div>
    
    <div class="panel-body">
		<table class = "table table-hover table-bordered">
		<tr>
			<td>번호</td>
			<td>별점</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<% for(ReviewsVO vo : list) { %>
		<tr>
			<td><%=vo.getReview_num()%></td>
			<td><a href="<%=cpath%>/boardContent.do?idx=<%=vo.getReview_num()%>"><%=vo.getR_rating()%></a></td>
			<td><%=vo.getUser_id()%></td>
			<td><%=vo.getReg_date()%></td>
			<td><%=vo.getR_cnt()%></td>
		</tr>	
		<%	} %>
		<% if(members !=null){ %>
		<tr>
			<td colspan ="5">
			<button type ="button" class = "btn btn-primary btn-sm" onclick ="location.href='<%=cpath%>/boardForm.do'">글쓰기</button>
			</td>
		</tr>
		<% } %>
		</table>
    </div>
    <div class="panel-footer">인공지능 융합 서비스 개발자과정(정선희) </div>

  </div>
</div>


</body>
</html>