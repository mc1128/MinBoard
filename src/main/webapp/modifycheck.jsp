<%-- 
    Document   : modifycheck
    Created on : 2020. 6. 14, 오후 3:46:21
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%@page import= "com.mycompany.boarddao.*" %>
<!DOCTYPE html>
<%
    String name = ""; 
    String passwd = ""; 
    String password = "";
    
    TblBoardDao td = new TblBoardDao();
    
    try{
        request.setCharacterEncoding("utf-8"); 
        int num = Integer.parseInt(request.getParameter("num"));
        
        String title = request.getParameter("title"); 
        String contents = request.getParameter("contents"); 
        String passw = request.getParameter("password");
    
        String sql = "SELECT passwd FROM tblboard WHERE NUM=" + num;
        ResultSet rs = td.getRs(sql);
        if(rs.next()){
            passwd = rs.getString(1); 
        }
        if(passwd.equals(passw)){ 
            sql = "UPDATE tblboard SET TITLE='" + title+ "' , CONTENTS='"+ contents +"' WHERE NUM=" + num; 
            td.updateData(sql); %>
    <script language=javascript> 
    self.window.alert("글이 수정되었습니다."); 
    location.href="write_output.jsp?num=<%=num%>"; 
    </script>        
            
    <%
        }else{
            %>
                
                <script language=javascript> self.window.alert("비밀번호를 틀렸습니다."); 
                    location.href="javascript:history.back()"; 
                </script>
            
                <%}
    }catch(SQLException e){ 
        out.println( e.toString() ); 
    }

%>
