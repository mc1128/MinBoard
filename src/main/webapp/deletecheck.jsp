<%-- 
    Document   : deletecheck
    Created on : 2020. 6. 14, 오후 2:54:21
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.sql.*"%>  
<%@page import= "com.mycompany.boarddao.*" %>
			
<%
	request.setCharacterEncoding("UTF-8");
	String drv="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/mysql?serverTimezone=Asia/Seoul";
        String user="root", password="as123123";
        String passwd = null;
	int num = Integer.parseInt(request.getParameter("num"));
	String passw = request.getParameter("password");
	
	try{
				
		Connection conn = DriverManager.getConnection(url,user,password);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT passwd FROM tblboard WHERE NUM=" + num;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				passwd = rs.getString(1);
		 }
		 
		 if(passwd.equals(passw)) {
			   			
			sql = "DELETE FROM tblboard WHERE NUM=" + num;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="listboard.jsp";
  			</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>
