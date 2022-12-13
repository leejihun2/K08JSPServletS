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
	    /* 부모창에서 팝업창을 열때 readonly속성이 적용되어 사용자는
	    내용을 수정할 수 없다. 하지만 Javascript를 이용하면 수정할 수
	    있다. 또한 opener속성을 통해 부모창으로 필요한 데이터를
	    전달할 수 있다. 
	    재입력한 아이디를 부모창의 id입력란에 입력해준다.*/
	    opener.document.registFrm.id.value =
	        document.overlapFrm.retype_id.value;
	        //아이디 중복 확인창을 당아준다.
	        self.close();
	    
	}

	//문서의 로드가 끝난 후 익명함수를 실행한다.
	window.onload = function(){
	//현재 주소창에 입력된 URL을 가져온다. 
	//http://localhost:8282/K05Javascript/pages/id_overapping.html?id=tjoeun
	var url = location.href;
	//가져온 내용을 콘솔에 출력한다.(계속 사용하기)
	console.log(url);
	//물음표(?)와 엠퍼센트(&)를 통해 문자열을 배열로 만든다. 
	//id=tjoeun
	var parameters = (url.slice(url.indexOf('?') + 1,
	    url.length)).split('&');
	//배열중 첫번째 값을 콘솔에 출력한다.
	console.log(parameters[0]);//id=입력된값
	//이퀄(=)을 통해 split한 후 두번째 값을 가져온다.
	//id=tjoeun 를 =로 split하면 [0]=>id, [1]=>tjoeun이 된다.
	returnValue = parameters[0].split('=')[1];
	//사용자가 입력한 이이디를 span태그에 출력한다. 
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
	//중복된 아이디가 있음
	//아이디 중복검사 다시하셈.
	System.out.println("중복아이디 있음");

	%>
	
	
    <h3>다른 아이디를 입력해주세요</h3>
    <form name="overlapFrm" action="id_overapping.jsp">
        <input type="text" name="user_id" size="20">    
        <input type="submit" value="중복검사">;
    </form>
    
	<%
}else{
	//중복된아이디가 없음.
	//이 아이디 쓰셈.
	System.out.println("사용가능");
	%>
	
	<h3>입력한 아이디는 사용가능합니다.^^ </h3>
    <form name="overlapFrm">
        <input type="hidden" name="retype_id" size="20">    
        <input type="button" value="아이디사용하기" onclick="idUse();">
    </form>
    
    
  
    
    <%
    }
    %>

</body>
</html>