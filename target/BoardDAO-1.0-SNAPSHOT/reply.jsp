<%-- 
    Document   : reply
    Created on : 2020. 6. 14, 오후 4:36:04
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" %>
<%@ page import="java.sql.*"%> 
<%@page import= "com.mycompany.boarddao.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script language = "javascript"> 

function replyCheck()
  {
   var form = document.replyform;
   
   if(form.email.value.indexOf("@")+""==="-1"||
                        form.email.value.indexOf(".")+""==="=1"||
                        form.email.value === "")
                {
                    alert("이메일 주소를 입력하세요.");
                    form.email.focus();
                    return false;
                }

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
    String title = ""; 

    TblBoardDao td = new TblBoardDao();
    
    try{
        String sql = "SELECT title FROM tblboard WHERE NUM=" + num;
        ResultSet rs = td.getRs(sql);
        if(rs.next()){
            title = rs.getString(1); 
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
   <div class="header"><%=num %>번 게시글 답글작성</div>
<table>
<form name=replyform method=post action="replycheck.jsp?num=<%=num%>">
  <tr>
   <td>
          
   <table>
     <tr>
         <td bgcolor= "#1dd1a1" align="center"><font color="white">이름</font></td>
      <td><input name=name size=50 placeholder="필수입력" maxlength=50></td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
        <tr>

      <td bgcolor= "#1dd1a1" align="center"><font color="white">이메일</font></td>
      <td><input placeholder="필수입력" name=email size=50  maxlength=50></td>

     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>

      <td bgcolor= "#1dd1a1" align="center"><font color="white">암호</font></td>
      <td><input placeholder="입력" type=password name="password" size="50" maxlength="50"></td>

     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>

      <td bgcolor= "#1dd1a1" align="center"><font color="white">제목</font></td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>

     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>

      <td bgcolor= "#1dd1a1" align="center"><font color="white">내용</font></td>
      <td><textarea name=contents cols=50 rows=13></textarea></td>

     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">

      <td colspan="2"><input type=button value="등록" OnClick="javascript:replyCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">

     </tr>
    </table>
   </td>
  </tr>
 </table>
     </div>
</body> 
</html>