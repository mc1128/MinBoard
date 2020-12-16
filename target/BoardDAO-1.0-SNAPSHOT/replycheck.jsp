<%-- 
    Document   : replycheck
    Created on : 2020. 6. 14, 오후 4:51:06
    Author     : Mincheol
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*" %>
<%@page import= "com.mycompany.boarddao.*" %>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("utf-8"); 
    
    String filename;
    
    String name = request.getParameter("name");     
    String title = request.getParameter("title"); 
    String email = request.getParameter("email"); 
    String contents = request.getParameter("contents"); 
    String passwd = request.getParameter("password");
    filename = "";
    
    int num = Integer.parseInt(request.getParameter("num"));
    
    Calendar dateIn = Calendar.getInstance();
    String indate = Integer.toString(dateIn.get(Calendar.YEAR)) +"년 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"월 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.DATE))+"일 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY))+"시";
    indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE))+"분";
    indate = indate + Integer.toString(dateIn.get(Calendar.SECOND))+"초";
    String writedate = indate;
    
    TblBoardDao td = new TblBoardDao();
     
   
    try{
        int ref = 0;
        int indent = 0;
        int step = 0;
    
        String sql = "SELECT ref, indent, step FROM tblboard WHERE NUM=" + num;
        ResultSet rs = td.getRs(sql);
        if(rs.next()){
            ref = rs.getInt(1);
            indent = rs.getInt(2);
            step = rs.getInt(3);
        }
        sql = "UPDATE tblboard SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
        td.updateData(sql);
        
        int max = td.getMaxNum("SELECT MAX(NUM) FROM TBLBOARD");
        
        TblBoardBean tb = new TblBoardBean();
        tb.setNum(max+1);
        tb.setName(name);
        tb.setPasswd(passwd);
        tb.setEmail(email);
        tb.setTitle(title);
        tb.setContents(contents);
        tb.setWritedate(writedate);
        tb.setReadcount(0);
        tb.setRef(ref);
        tb.setIndent(indent+1);
        tb.setStep(step+1);
        tb.setStep(max+1);
        tb.setFilename(filename);
        
        String strSQL = "INSERT INTO tblboard (num, name, passwd, email, title, contents, writedate, readcount, ref, indent, step, step2, filename)";
	strSQL = strSQL + "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        
        int n = td.insertReply(strSQL, tb);
        
        if(n==1) {
            out.println("성공");
        }
        else {
            out.println("실패");
        }
         
    }catch(SQLException e){
        out.println(e.toString());
    }
%>

<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="listboard.jsp";
  </script>