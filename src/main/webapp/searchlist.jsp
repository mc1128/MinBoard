<%-- 
    Document   : searchlist
    Created on : 2020. 6. 16, 오후 5:34:23
    Author     : Mincheol
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@page import= "java.sql.*,java.util.*"%>
<%@page import= "com.mycompany.boarddao.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 검색</title>
        <style type='text/css'>
            <!--
            a:link {font-family: "";color: black;text-decoration: none;}
            a:visited {font-family: "";color: black;text-decoration: none;}
            a:hover {font-family: "";color: black;text-decoration: underline;}
            
            -->
        
        </style>
<link rel="stylesheet" href="css/listboard.css">
</head>
<body>
            <table border='0' width='600px' cellpadding='0' cellspacing='0'></table>
    <tr>
        <td>
    <center><font size='3'><b> 게시판 </b></font></td></center>
<hr size='1' noshade>
</td>
</tr>
</table>

<div class="table-users">
   <div class="header">검색결과</div>
   
<table cellspacing='0'>
    <tr bgcolor='#1dd1a1'>
        <th><font size='2'><center><b>번호</b></center></font></th>
        <th><font size='2'><center><b>글 제목</b></center></font></th>
        <th><font size='2'><center><b>작성자</b></center></font></th>
        <th><font size='2'><center><b>작성일</b></center></font></th>
        <th><font size='2'><center><b>조회</b></center></font></th>
        </tr>
    <%
    request.setCharacterEncoding("utf-8");
    
    String sk = request.getParameter("sk");
    String sv = request.getParameter("sv");
    
    TblBoardDao td = new TblBoardDao();
    
    ResultSet rs = null;
    
    try{

        
        if(sk == null & sv == null){
            out.println("오류");
        }else if(sk != null & sv.equals("")){
            out.println("오류");
        }else if(sk != null & sv != null){
            String sql = "select * from tblboard where "+sk+"=?";
            PreparedStatement ps = td.getPstmt(sql);
            ps.setString(1, sv);
            rs = ps.executeQuery();
        }
         
        int num, readcount, indent;
        String name, email, title, writedate;
        
        while(rs.next())
        {        
        num = rs.getInt("num");
        name = rs.getString("name");
        email = rs.getString("email");
        title = rs.getString("title");
        writedate = rs.getString("writedate");
        readcount = rs.getInt("readcount");
        indent = rs.getInt("indent");
   %>
        <tr>
    <td align='center'><font size=2 color='black'><%= num %></font></td>
    <td align='left'><%
	for(int j=0;j<indent;j++){
%>		&nbsp;<%
	}
	if(indent!=0){
%>		<font size='2'>[Re]</font> 
<% 
	}
%>
        <a href="write_output.jsp?num=<%=num %>">
            <font size=2 color='black'><%=title %></font></a></td>
    <td align='left'>
        <a href='<%=email %>'>
            <font size=2 color='black'><%=name %></font></a></td>
            <td align='left'><font size=2><%=writedate %></font></td>
            <td align='center'><font size=2><%=readcount %></font></td>
            <% }
            rs.close(); %>
</table>
</div>
       <table border='0' width='600'>
            <tr><td align='right'>
                    <a href="listboard.jsp">[전체목록]</a>
                </td>
            </tr>         
        </table>                
                  
        
    <%        
        }    
    
   catch(SQLException ex) {
        out.println(ex.getMessage());
        ex.printStackTrace();
    
    }

   %>
    </table>
</body>
</html>
