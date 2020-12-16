<%-- 
    Document   : wirte
    Created on : 2020. 5. 18, 오전 10:30:43
    Author     : Mincheol
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>등록</title>
        <link rel="stylesheet" href="css/write.css">
        <script language="javaScript">
            function Check()
            {
                if(Write.name.value.length < 1){
                    alert("이름을 입력하세요.");
                    Write.name.focus();
                    return false;
                }
                if(Write.pass.value.length < 1){
                    alert("암호를 입력하세요.");
                    Write.pass.focus();
                    return false;
                }
                if(Write.email.value.indexOf("@")+""==="-1"||
                        Write.email.value.indexOf(".")+""==="=1"||
                        Write.email.value === "")
                {
                    alert("이메일 주소를 입력하세요.");
                    Write.email.focus();
                    return false;
                }
                if(Write.title.value.length <1){
                    alert("제목을 입력하세요.");
                    Write.write_title.focus();
                    return false;
                }
                if(Write.contents.value.length <1){
                    alert("내용을 입력하세요.");
                    Write.content.focus();
                    return false;
                }
                
                Write.submit();
            }
            </script>
    </head>
    <body>
        <table border="0" width="600" cellpadding='0' cellspacing='0'>
            <tr>
                <td>
            <center><font size='3'><b>글작성</b></font></center>
            <hr size='1' noshade>
                </td>
            </tr>
        </table>
        <div class="table-users">
   <div class="header">작성폼</div>
   
        <form Name='Write' Action='write_input.jsp' Method='post' 
              Enctype='multipart/form-data' onsubmit="return Check()">
            <table border="0" width="600" cellpadding='0' cellspacing='0'>
            <tr>
                <td bgcolor="#1dd1a1">
            <font color="white" size='2'><center><b>이름</b></center></font>
                </td>
                <td>
                    <input type='text' size='12' name='name' placeholder="필수입력">
                </td>
            </tr>
            
            <tr>
                <td bgcolor="#1dd1a1">
            <font color="white" size='2'><center><b>암호</b></center></font>
                </td>
                <td>
                    <input type='password' size='12' name='pass' placeholder="필수입력">
                </td>
            </tr>
            
            <tr>
                <td bgcolor="#1dd1a1">
            <font color="white" size='2'><center><b>이메일</b></center></font>
                </td>
                <td>
                    <font size='2'><input type='text' size='40' maxlength='50' name='email' placeholder="입력"></font>
                </td>
            </tr>
            
            <tr><td colspan='2'>
                    <hr size='1' noshade>
                </td>
            </tr>
            
            <tr>
                <td bgcolor="#1dd1a1">
            <font color="white" size='2'><center><b>파일명</b></center></font>
                </td>
                <td>
                    <font size='2'><input type='file' size='40' maxlength='50' name='userFile'></font>
                </td>
            </tr>
            
            <tr><td colspan='2'>
                    <hr size='1' noshade>
                </td>
            </tr>
            
            <tr >
                <td bgcolor="#1dd1a1" >
            <font color="white" size='2'><center><b >제목</b></center></font>
                </td>
                <td>
                    <font size='2'><input type='text' size='70' maxlength='50' name='title'  placeholder="입력"></font>
                </td>
            </tr>
            
            <tr>
                <td bgcolor="#1dd1a1">
            <font color="white"  size='2'><center><b>내용</b></center></font>
                </td>
                <td>
                    <font size='2'><textarea cols='70' rows='15' wrap='virtual' name='contents'></textarea></font>
                </td>
            </tr>
            
            <tr><td colspan='2'>
                    <hr size='1' noshade>
                </td>
            </tr>
            
            <tr><td align='center' colspan='2' width='100%'>
                    <table>
                        <tr>
                            <td width='300' align='center'>
                                <input Type='Reset' value="재작성">
                            </td>
                            <td width='300' align='center'>
                                <input Type='Submit' value="입력">
                            </td></tr></table></td>
            </tr>
            </table>
        </form>
        </div>
    </body>
</html>
