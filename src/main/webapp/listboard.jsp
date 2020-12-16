<%-- 
    Document   : listboard
    Created on : 2020. 5. 17, 오후 6:25:34
    Author     : Mincheol
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*,java.util.*"%>
<%@page import= "com.mycompany.boarddao.*"%> 

<%
	final int ROWSIZE = 10;
	final int BLOCK = 5;

	int pg = 1;
	
	if(request.getParameter("pg")!=null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1);
	int end = (pg*ROWSIZE);
	
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type='text/css'>
            a:link { color: red; text-decoration: none;}
            a:visited { color: black; text-decoration: none;}
            a:hover { color: blue; text-decoration: underline;}          
        </style>
        <link rel="stylesheet" href="css/listboard.css">
        <title>게시판</title>
    </head>
    <body>
        <%!
            /*
            request.setCharacterEncoding("euc-kr");
            
            String drv = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@203.247.239.1:1521:stud1";
            String user = "mc1128", password="1234";
            Class.forName(drv);
            Connection conn = DriverManager.getConnection(url,user,password);
            Statement stmt = conn.createStatement();
            String strSQL = "SELECT * FROM tblboard ORDER BY num DESC";
            ResultSet rs= stmt.executeQuery(strSQL);          */


            int num, readcount, ref, indent, step, step2;
            String name, passwd, email, title, contents, writedate;
            TblBoardDao td = new TblBoardDao();
            String sql = "SELECT * FROM tblboard ORDER BY ref DESC, step ASC";
            List list = td.makeList(sql);
   

        %>
        <%
            int total = 0;
            
            String sqlCount = "SELECT COUNT(*) FROM tblboard";
                ResultSet rs = td.getRs(sqlCount);
                if(rs.next()){ 
                    total = rs.getInt(1); 
                }
                int sort=1;
                
            String sqlSort = "SELECT NUM from tblboard order by ref desc, step asc";
		
            rs = td.getRs(sqlSort);
	
		
		while(rs.next()){
			int stepNum = rs.getInt(1);
			sql = "UPDATE tblboard SET STEP2=" + sort + " where NUM=" +stepNum;
		 	td.updateData(sql);
		 	sort++;
		}
                   
                allPage = (int)Math.ceil(total/(double)ROWSIZE);
		
		if(endPage > allPage) {
			endPage = allPage;
		}
		
                   
                String sqlList = "SELECT num, name, title, email, writedate, readcount, indent from tblboard where STEP2 >="+start + " and STEP2 <= "+ end +" order by step2 asc";
		rs = td.getRs(sqlList);
        %>
        <table border='0' width='600px' cellpadding='0' cellspacing='0'></table>
    <tr>
        <td>
    <center><a href="index.html"><font size='3'><b>게시판</b></font></a></td></center>
<hr size='1' noshade>
</td>
</tr>
</table>

<div class="table-users">
   <div class="header">총 게시물 : <%=total%>개</div>
   
<table cellspacing='0'>
    <tr bgcolor='#1dd1a1'>
        <th><font size='2'><center><b>번호</b></center></font></th>
        <th><font size='2'><center><b>글 제목</b></center></font></th>
        <th><font size='2'><center><b>작성자</b></center></font></th>
        <th><font size='2'><center><b>작성일</b></center></font></th>
        <th><font size='2'><center><b>조회</b></center></font></th>
        </tr> 
<%
    int num, readcount, indent;
    String name, email, title, writedate;
    while(rs.next()){
        num = rs.getInt("num");
        name = rs.getString("name");
        email = rs.getString("email");
        title = rs.getString("title");
        writedate = rs.getString("writedate");
        readcount = rs.getInt("readcount");
        indent = rs.getInt("indent");
    
    /*
    Iterator it = list.iterator();
    TblBoardBean tb= null;
    while(it.hasNext()){
        tb= (TblBoardBean)it.next();
        num = tb.getNum();
        name = tb.getName();
        passwd = tb.getPasswd();
        email = tb.getEmail();
        title = tb.getTitle();
        contents = tb.getContents();
        writedate = tb.getWritedate();
        readcount = tb.getReadcount();
        ref = tb.getRef();
        indent = tb.getIndent();
        step = tb.getStep();
        step2 = tb.getStep2();
*/
%>
<% 
    
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
        <a href="write_output.jsp?num=<%=num %>&pg=<%=pg%>">
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
<hr size='1' noshade>
<table border='0' width='95%'>
     <tr>
	<td align="center">
		<%
			if(pg>BLOCK) {
		%>
			[<a href="listboard.jsp?pg=1">◀◀</a>]
			[<a href="listboard.jsp?pg=<%=startPage-1%>">◀</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="listboard.jsp?pg=<%=i%>"><%=i%></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="listboard.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="listboard.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
                
</table>   
                <table ><tr background-color="white">
<td align='center'><a align='center' href='write.jsp'>[등록]</a></td>
		</tr></table>
                <table >
                    <tr background-color="white">
        <td align='center'>
            <form action="<%=request.getContextPath()%>/searchlist.jsp" method="post">
            <select name="sk"><!-- 검색키 : search key -->
                <option value="name">이름</option>
                <option value="title">제목</option>
                <option value="contents">내용</option>
                <option value="email">이메일</option>
            </select>
        <input type="text" placeholder="Search..." name="sv"><!-- 검색값 : search value -->
        <input type="submit" value="검색">
    </form></td>
		</tr></table> 
    <%/*
        rs.close();
        stmt.close();
        conn.close();*/
    %>
    </body>
</html>
