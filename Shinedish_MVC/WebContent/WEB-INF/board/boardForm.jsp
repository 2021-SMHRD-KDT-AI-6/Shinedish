<%@page import="kr.smhrd.model.MembersVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 	String cpath = request.getContextPath(); 	// cpath : /m02
	// 세션값을 읽어오는 방법!
	MembersVO members = (MembersVO)session.getAttribute("succ");
%>
	<!-- 글씨기 뷰(view) 만들기 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body> 
 
<div class="container">
  <h2>MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">게시판 글쓰기</div>
    <div class="panel-body">
    <!-- form을 보내줄 서블릿을 연결해줘야한다! action ="" => BoardInsertCentroller.java-->
	 <form class="form-horizontal" action="<%=cpath%>/boardInsert.do" method="post">
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="title">제목:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="title" placeholder="Enter title">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="contents">내용:</label>
	     <div class="col-sm-10">
		  <textarea class="form-control" rows="5" name="contents"></textarea>
		</div>
	  </div>
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="writer">작성자:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="writer" value ="<%=members.getM_name()%>" readonly="readonly">
	    </div>
	  </div>	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10" align = "center">
	      <button type="submit" class="btn btn-primary btn-xs" >등록</button>
	      <button type="reset" class="btn btn-warning btn-xs" >취소</button>
	    </div>
	  </div>
	 </form>
    </div>
    <div class="panel-footer">인공지능 융합 서비스 개발자과정(정선희) </div>

  </div>
</div>