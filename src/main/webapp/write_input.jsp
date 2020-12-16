<%-- 
    Document   : wirte_input
    Created on : 2020. 5. 18, 오전 10:31:02
    Author     : Mincheol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*, java.util.*, java.io.*" %>
<%@page import = "com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import= "com.mycompany.boarddao.*" %> 
<%
    request.setCharacterEncoding("UTF-8");

    
    String realFolder = "C:/Users/Mincheol/Documents/NetBeansProjects/BoardDAO/src/main/webapp/filestorage";
    String saveFolder = "/filestorage";
    String encType = "UTF-8";
    
    int sizeLimit = 10 * 1024 * 1024;
    MultipartRequest multi = null;
    multi = new MultipartRequest( request, realFolder, sizeLimit, encType,
            new DefaultFileRenamePolicy());
    
    String originFileName = multi.getOriginalFileName("userFile");
    String fileName = multi.getFilesystemName("userFile");
    File file = multi.getFile("userFile");
    
    String name = multi.getParameter("name");
    String passwd = multi.getParameter("pass");
    String email = multi.getParameter("email");
    String title = multi.getParameter("title");
    String contents = multi.getParameter("contents");    
    

    
    /*
    String drv = "oracle.jdbc.OracleDriver";
    String url = "jdbc:oracle:thin:@203.247.239.1:1521:stud1";
    String user = "mc1128", password="1234";
    Class.forName(drv);
    Connection conn = DriverManager.getConnection(url,user,password);
    PreparedStatement pstmt = null;
    */
    
    Calendar dateIn = Calendar.getInstance();
    String indate = Integer.toString(dateIn.get(Calendar.YEAR)) +"년 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1)+"월 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.DATE))+"일 ";
    indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY))+"시";
    indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE))+"분";
    indate = indate + Integer.toString(dateIn.get(Calendar.SECOND))+"초";
    String writedate = indate;
    
    TblBoardDao td = new TblBoardDao();
    int num = td.getMaxNum("SELECT MAX(NUM) FROM TBLBOARD");
    int max = td.getMaxNum("SELECT MAX(NUM) FROM TBLBOARD");
    int indent = 0;
    int step = 0;
    
    TblBoardBean tb = new TblBoardBean();

    
    /*
    pstmt = conn.prepareStatement("select max(num) from tblboard");
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    int num = rs.getInt(1);
    */
    String strSQL="INSERT INTO tblboard(num, name, passwd, email, title, contents, writedate, readcount, ref, indent, step, step2, filename)";
    strSQL = strSQL + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    
    tb.setNum(num + 1);
    tb.setName(name);
    tb.setPasswd(passwd);
    tb.setEmail(email);
    tb.setTitle(title);
    tb.setContents(contents);
    tb.setWritedate(writedate);
    tb.setReadcount(0);
    tb.setRef(max + 1);
    tb.setIndent(indent);
    tb.setStep(step);
    tb.setStep2(max+1);
    tb.setFilename(fileName);
    
    int n = td.insertATuple(strSQL, tb);
    
    if(n==1){
        out.println("성공");
    }
    else{
        out.println("실패");
    }
    
    /*
    pstmt = conn.prepareStatement(strSQL);
    
    pstmt.setInt(1,num+1);
    pstmt.setString(2,name);
    pstmt.setString(3,pass);
    pstmt.setString(4,email);
    pstmt.setString(5,title);
    pstmt.setString(6,contents);
    pstmt.setString(7,indate);
    pstmt.setInt(8,0);
    
    pstmt.executeUpdate();
    
    pstmt.close();
    conn.close();
    */
%>

<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="listboard.jsp";
  </script>