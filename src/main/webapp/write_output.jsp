<%-- 
    Document   : write_output
    Created on : 2020. 5. 18, 오전 10:31:14
    Author     : Mincheol
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*, java.util.*"%>
<%@page import= "com.mycompany.boarddao.*" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>게시판</title>
        <style type='text/css'>
            <!--
            a:link {font-family: "";color: black;text-decoration: none;}
            a:visited {font-family: "";color: black;text-decoration: none;}
            a:hover {font-family: "";color: black;text-decoration: underline;}
            
            -->
        
        </style>
        <link rel="stylesheet" href="css/write.css">
    </head>
    <body>
        <%
            String numStr = request.getParameter("num");
            int num = Integer.parseInt(numStr);
            
            /*
            String drv = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@203.247.239.1:1521:stud1";
            String user = "mc1128", password="1234";
            Class.forName(drv);
            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        
            try{
                String strSQL = "SELECT * FROM tblboard ORDER BY num DESC";
                pstmt = conn.prepareStatement(strSQL);
                pstmt.setInt(1, Integer.parseInt(num));
                
                rs= pstmt.executeQuery();
                rs.next();
                
                String name = rs.getString("name");
                String email = rs.getString("email");
                String title = rs.getString("title");
                String writedate = rs.getString("writedate");
                int readcount = rs.getInt("readcount");
            */
            TblBoardDao td = new TblBoardDao();
            String sql = "select * from tblboard where num="+ numStr+"";
            List list = td.makeList(sql);
            
            Iterator it = list.iterator();
            TblBoardBean tb= null;
            
            int readcount;
            String name, writedate, title, contents, filename;
            
            while(it.hasNext()){
                tb= (TblBoardBean)it.next();
                //num = tb.getNum();
                name = tb.getName();
                //passwd = tb.getPasswd();
                //email = tb.getEmail();
                title = tb.getTitle();
                contents = tb.getContents();
                writedate = tb.getWritedate();
                readcount = tb.getReadcount();
                filename = tb.getFilename();
        
    
        %>
        <center><font size='3'><b> <%=num %>번 </b></font></td>
        <div class="table-users">
   <div class="header">게시글</div>
        <table border='0' width='600' cellpadding='0' cellspacing='0'>
            <tr>
                <td><hr size='1' noshade>           
                </td>
            </tr>           
        </table>
        
        <table border='0' width='600'>
            <tr><td align='left'>
                    <font size='2'>작성자 : <%=name %></font>
                </td>
                <td align='right'>
                    <font size='2'>작성일 : <%=writedate %>, 조회수: <%=readcount %></font>
                </td>
            </tr>         
        </table>
                
                <table border="0" width="600" cellpadding='3' cellspacing='3'>
                    <tr bgcolor='#1dd1a1'>
                        <td align='center'>
                            <font size='3' color ='white'><b><%=title %></b>
                        </td>
                    </tr>                    
                </table>
                
                <table border="0" width="600" cellpadding='5' cellspacing='10'>
                    <tr bgcolor='ededed'>
                        <td>
                            <font size='2' color=''><%=contents %></font>
                        </td>
                    </tr>                    
                </table>
                        
        <table border='0' width='600'>
            <tr><td align='right'>
                    <a href="down.jsp?filename=<%=filename %>"><font size='2'><%=filename %><font size='2'></font></a>
                </td>
            </tr>         
        </table>


        <table border='0' width='600' cellpadding='0' cellspacing='0'>
            <tr>
                <td><hr size='1' noshade>           
                </td>
            </tr>           
        </table>                        
        </div>      
        <table border='0' width='600'>
            <tr><td align='right'>
                    <a href="write.jsp">[글쓰기]</a>
                    <a href="delete.jsp?num=<%=num%>">[삭제]</a>
                    <a href="modify.jsp?num=<%=num%>">[수정]</a>
                    <a href="reply.jsp?num=<%=num%>">[답글]</a>
                    <a href="listboard.jsp">[목록보기]</a>
                </td>
            </tr>         
        </table>                
                        
        <% 
            sql = "UPDATE tblboard SET readcount=readcount+1 WHERE num =" + numStr+"";
            int n = td.updateReadcount(sql);
            }
            /*
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(num));
            pstmt.executeUpdate();
            }catch(SQLException e){
            out.print("SQL에러"+ e.getSQLState()+ "|" + e.toString());
} catch (Exception ex){
    out.print("JSP에러"+ ex.toString());
} finally{
    rs.close();
    pstmt.close();
    conn.close(); 
} */
          
        %>
</center>      
    </body>
</html>
