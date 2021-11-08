<%@page import="kr.smhrd.model.UserVO"%>
<%@page import="kr.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	String cpath = request.getContextPath(); 	// cpath : /m02
	
	// 회원인증을 했는지 여부를 확인? 세션값을 읽어오는 방법!
	UserVO user = (UserVO)session.getAttribute("succ");
%>   
    
    
<!DOCTYPE html>
<html lang = "en">
<head>

  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type ="text/javascript">
  	function delFn(idx){
  		// 삭제페이지로 이동시켜야 한다.
  		// alert("DEL");
  		location.href="<%=cpath%>/boardDelete.do?idx="+idx;
  	}
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
      <% if(user ==null){%>
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
			<%=user.getUsername()%>님  방문을 환영합니다.
		  <button type="submit" class="btn btn-default" onclick = "outFn()">로그아웃</button>
		
		<%} %>
    </div> 		
    <div class="panel-body">
    <form action = '<%=cpath%>/boardUpdate.do' method ='post'>
    <input type ="hidden" name = "idx" value="<%=vo.getIdx()%>">
    	<table class="table table-bordered">
	    	<tr>
	    	<td>제목</td>
	    	<td><input class = "form-control" type = "text" name ="title" value = "<%=vo.getTitle()%>"></td>
	    	</tr>
	    	<tr>
	    	<td>내용</td>
	    	<td><textarea class="form-control" rows="7" name = "contents"><%=vo.getContents()%></textarea></td>
	    	</tr>
	    	<tr>
	    	<td>작성자</td>
	    	<td><%=vo.getWriter()%></td>
	    	</tr>
	    	<tr>
	    	<td>작성일</td>
	    	<td><%=vo.getIndate().split(" ")[0]%></td>
	    	</tr>
	    	<tr>
	    	<td colspan = "2" align = "center">
	    		<button type = "submit" class = "btn btn-primary btn-sm">수정</button>
	    		<button type = "reset" class = "btn btn-warning btn-sm">취소</button>
	    		<button type = "button" class = "btn btn-info btn-sm" onclick = "delFn(<%=vo.getIdx()%>)">삭제</button>
	    		<button type = "button" class = "btn btn-success btn-sm" onclick = "location.href='<%=cpath%>/boardList.do'">리스트</button>
	    		</td>
	    	</tr>
    	</table>
    </form>
    
    
    </div>
    <div class="panel-footer">인공지능 융합 서비스 개발자과정(정선희) </div>

  </div>
</div>
</body>
</html>