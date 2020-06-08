<%@page import="rvboard.rvboardDAO"%>
<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<%
	int num = Integer.parseInt(request.getParameter("num"));
	int boardnum = Integer.parseInt(request.getParameter("boardnum"));
	//INT PAGENUM = INTEGER.PARSEINT(REQUEST.GETPARAMETER("PAGENUM"));

	rvboardDAO dao = new rvboardDAO();
	
	dao.deletervboard(num);
	
%>

<script type="text/javascript">
	alert("삭제가 완료되었습니다.");
	
</script>
<%
	response.sendRedirect("content.jsp?num="+boardnum);
%>
<body>

</body>
</html>