<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h1>교과목 수정</h1>
		<form method="post" action="action.jsp" name="frm">
			<input type="hidden" name="mode" value="modify">
			<table border="1" style="width: 70%; height: 70%; text-align: center">
			<%
				request.setCharacterEncoding("UTF-8");
				String id=request.getParameter("id");
				String name="";
				String credit="";
				String lecturer="";
				String week="";
				String start_hour="";
				String end_hour="";
				try{
					Connection conn = Util.getConnection();
					String sql = "SELECT * FROM course_tbl WHERE id = ?";
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					ResultSet rs = pstmt.executeQuery();
					rs.next();
					name = rs.getString(2);
					credit = rs.getString(3);
					lecturer = rs.getString(4);
					week = rs.getString(5);
					start_hour=rs.getString(6);
					while(start_hour.length() < 4){
						start_hour = "0" + start_hour;
					}
					end_hour = rs.getString(7);
					while(end_hour.length() < 4){
						end_hour = "0" + end_hour;
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
			%>
			<tr>
				<td>과목코드</td>
				<td> <input type="text" name="id" style="width: 100%" value="<%=id %>" readonly> </td>
			</tr>
			<tr>
				<td>과목명</td>
				<td> <input type="text" name="name" style="width: 100%" value="<%=name %>" readonly> </td>
			</tr>
			<tr>
				<td>학점</td>
				<td> <input type="text" name="credit" style="width: 100%" value="<%=credit %>" readonly> </td>
			</tr>
			
		</form>
	</section>
</body>
</html>