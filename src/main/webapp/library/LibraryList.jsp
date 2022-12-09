<%@page import="library.board.LibraryDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="library.board.LibraryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

LibraryDAO dao = new LibraryDAO();

Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null) {
	
	param.put("searchField", searchField);
	param.put("searchWord",searchWord);
}

int totalCount = dao.selectCount(param);

List<LibraryDTO> boardLists = dao.selectList(param);
System.out.println("============dfdfdfdfd==========" + boardLists.size());
for(LibraryDTO a : boardLists){
	System.out.println(a.getCode() + " " + a.getTitle() + " ");
}

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>목록 보기(List)</h2>
    
    <form method="get">  
    
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="book_title">제목</option> 
                <option value="book_status">글쓴이</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table border="1" width="90%">
        <tr>
            <th width="10%">코드</th>
            <th width="40%">장르</th>
            <th width="15%">제목</th>
            <th width="10%">글쓴이</th>
            <th width="15%">정보</th>
        </tr>
        
<%
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    int virtualNum = 0; 
    
    for (LibraryDTO dto : boardLists) {
    	
        virtualNum = totalCount--;   
%>
        <tr align="center">
        
            <td align="center"><%= dto.getCode() %></td>    
                   
            <td align="center"><%= dto.getTitle() %></td>  
                     
            <td align="center"><%= dto.getGenre() %></td> 
                      
            <td align="center"><%= dto.getAuthor() %></td>  
             
            <td align="center"><%= dto.getStatus() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>

</html>