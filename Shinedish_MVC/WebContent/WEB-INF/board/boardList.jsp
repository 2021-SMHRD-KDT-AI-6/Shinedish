<%@page import="kr.smhrd.model.ReviewsVO"%>
<%@page import="kr.smhrd.model.MembersVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	// Object Casting (��ü ����ȯ! - ���� �߿���!)
	// request.getAttribute("list")�� Ÿ���� Object�̴�!! ArrayList<BoardVO>�� ����ȯ������!
		ArrayList<ReviewsVO> list = (ArrayList<ReviewsVO>)request.getAttribute("list");
	// ���� ������ Object list = request.getAttribute("list");�� �� �� �ִ�.
	String cpath = request.getContextPath(); 	// cpath : /m02
	
	// ���ǰ��� �о���� ���!
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
		  <button type="submit" class="btn btn-default">�α���</button>
		</form>
		<%}else { %>
			<%=members.getM_id()%>��  �湮�� ȯ���մϴ�.
		  <button type="submit" class="btn btn-default" onclick = "outFn()">�α׾ƿ�</button>
		
		<%} %>
	</div>
    <div class="panel-heading">BOARD LIST</div>
    
    <div class="panel-body">
		<table class = "table table-hover table-bordered">
		<tr>
			<td>��ȣ</td>
			<td>����</td>
			<td>�ۼ���</td>
			<td>�ۼ���</td>
			<td>��ȸ��</td>
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
			<button type ="button" class = "btn btn-primary btn-sm" onclick ="location.href='<%=cpath%>/boardForm.do'">�۾���</button>
			</td>
		</tr>
		<% } %>
		</table>
    </div>
    <div class="panel-footer">�ΰ����� ���� ���� �����ڰ���(������) </div>

  </div>
</div>


</body>
</html>