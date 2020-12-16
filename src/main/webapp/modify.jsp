<%-- 
    Document   : modify
    Created on : 2020. 6. 14, 오후 3:12:13
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" %>
<%@ page import="java.sql.*"%> 
<%@page import= "com.mycompany.boarddao.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language = "javascript"> 

function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.contents.value )
   {
    alert( "내용을 적어주세요" );
    form.contents.focus();
    return;
   }  
 		form.submit();
  } 
</script>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    String name = ""; 
    String passwd = ""; 
    String title = ""; 
    String contents = "";
    TblBoardDao td = new TblBoardDao();
    
    try{
        String sql = "SELECT name, passwd, title, contents FROM tblboard WHERE NUM=" + num;
        ResultSet rs = td.getRs(sql);
        if(rs.next()){
            name = rs.getString(1); 
            passwd = rs.getString(2); 
            title = rs.getString(3); 
            contents = rs.getString(4);
        }
    }catch(SQLException e){ 
        out.println( e.toString() ); 
    }
%>
    

<html>
 <head>
 <title>게시판</title>
 <link rel="stylesheet" href="css/write.css">
 </head>
 <body>
     <div class="table-users">
   <div class="header">게시글 수정</div>
<table>
<form name=modifyform method=post action="modifycheck.jsp?num=<%=num%>">
  <tr>
   <td>   
   <table>
     <tr>
      <td bgcolor= "#1dd1a1"><font color="white">이름</font></td>
      <td><%=name%><input type=hidden name=name size=50  maxlength=50 value="<%=name%>"></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td bgcolor= "#1dd1a1"><font color="white">암호</font></td>
      <td><input type=password name="password" size=50 maxlength="50"></td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td bgcolor= "#1dd1a1"><font color="white">제목</font></td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td bgcolor= "#1dd1a1"><font color="white">내용</font></td>
      <td><textarea name=contents cols=50 rows=13><%=contents%></textarea></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="left">
      <td colspan="2"><input type=button value="수정" OnClick="javascript:modifyCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
     </tr> 
    </table>
   </td>
  </tr>
 </table>
     </div>
</body> 
</html>
