<%@page import="homework.board.BoardHomeDTO"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String id = (String)session.getAttribute("UserId");
String userId = request.getParameter("usrId");

BoardHomeDAO dao = new BoardHomeDAO(application);

boolean isDup = dao.dupChkID(userId);

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idUse() {
		
	    opener.document.regiFrm.user_id.value =
	    	
	    	document.getElementById('user_id').innerHTML;
	    	opener.document.regiFrm.user_id.readOnly = true;
	    	
	        self.close();
	    
	}

	window.onload = function(){
		
	var url = location.href;
	
	console.log(url);
	
	var parameters = (url.slice(url.indexOf('?') + 1,
	    url.length)).split('&');
	
	console.log(parameters[0]); 
	
	returnValue = parameters[0].split('=')[1];
	
	document.getElementById('user_id').innerHTML = returnValue;
	}




</script>


</head>
<body>
    <h2>아이디 중복확인 하기</h2>


    <h4>부모창에서 입력한 아이디 :
    <span id="user_id"></span>
    <%-- <%= userId %> --%></h4>
    <%
    

if(!isDup){
	System.out.println("중복아이디 있음");

	%>
	
	
    <h3>다른 아이디를 입력해주세요</h3>
    <form name="overlapFrm1" action="id_overapping.jsp">
        <input type="text" name="user_id"  size="20">    
        <input type="submit" value="중복검사">;
    </form>
    
	<%
}else{
	System.out.println("사용가능");
	%>
	
	<h3>입력한 아이디는 사용가능합니다.^^ </h3>
    <form name="overlapFrm2">
        <input type="hidden" name="retype_id" size="20">    
        <input type="button" value="아이디사용하기" onclick="idUse();">
    </form>
    
    
  
    
    <%
    }
    %>

</body>
</html>