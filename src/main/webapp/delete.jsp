<%-- 
    Document   : delete
    Created on : 2020. 6. 14, 오후 2:37:40
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@page import= "com.mycompany.boarddao.*" %> 

<script language = "javascript">  // 자바 스크립트 시작

function deleteCheck()
  {
   var form = document.deleteform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
 		form.submit();
  }
 </script>
 <%
 	int num = Integer.parseInt(request.getParameter("num"));
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>삭제</title>
 <link rel="stylesheet" href="css/write.css">
 </head>
 <body>
     <div class="table-users">
   <div class="header">게시글 삭제</div>
<table>
<form name=deleteform method=post action="deletecheck.jsp?num=<%=num%>">
  <tr>
   <td>
   <table>
     <tr>
      <td align="center">비밀번호</td>
      <td><input name="password" type="password" size="50" maxlength="100"></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td colspan="2"><input type=button value="삭제" OnClick="javascript:deleteCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
     </div>
</body> 
</html>



