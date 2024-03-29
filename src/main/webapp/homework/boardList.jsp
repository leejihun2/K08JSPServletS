<%@page import="utils.BoardHomePage2"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
BoardHomeDAO dao = new BoardHomeDAO(application);

    Map<String, Object> param = new HashMap<String, Object>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");

    if (searchWord != null) {
    	
    	param.put("searchField", searchField);
    	param.put("searchWord",searchWord);
    }
    int totalCount = dao.selectCount(param);

    int pageSize =
    	Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = 
    	Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

    int totalPage = (int)Math.ceil((double)totalCount / pageSize);

    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    if (pageTemp != null && !pageTemp.equals(""))
    	pageNum = Integer.parseInt(pageTemp);

    int start = (pageNum - 1) * pageSize + 1;
    int end = pageNum * pageSize;
    param.put("start", start);
    param.put("end", end);
    
    List<BoardHomeDTO> boardLists = dao.selectListPage(param);

    dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단 네비게이션 인클루드 -->
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
    	<!-- 좌측 네비게이션 인클루드 -->
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small>
            -현재 페이지 : <%= pageNum %> (전체 :<%= totalPage %>)</h3>
            <div class="row ">
                <!-- 검색부분 -->
                <form method="get">
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="searchField" class="form-control">
                            <option value="title">제목</option>
                            <option value="id">작성자</option>
                            <option value="content">내용</option>
                        </select>
                        <input type="text" name="searchWord" class="form-control" style="width: 150px;"/>
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-secondary" >
                                <i class="bi bi-search" style='font-size:20px'></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row mt-3 mx-1">
                <table class="table table-bordered table-hover table-striped">
                    <colgroup>
                        <col width="60px" />
                        <col width="*" />
                        <col width="120px" />
                        <col width="120px" />
                        <col width="80px" />
                        <col width="60px" />
                    </colgroup>
                    <thead>
                        <tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>첨부</th>
                        </tr>
                    </thead>
                    <tbody>
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
    int countNum = 0;
    for (BoardHomeDTO dto : boardLists)
{
    	virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
       /*  virtualNum = totalCount--;    */
%>
        <tr align="center">
        
            <td><%= virtualNum %></td>
            
            <td align="left"> 
                <a href="boardView.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            
            <td align="center"><%= dto.getId() %></td>    
            
            <td align="center"><%= dto.getPostdate() %></td>      
              
            <td align="center"><%= dto.getVisitcount() %></td>   
            
             <td class="text-center"><i class="bi bi-pin-angle-fill" style="font-size:20px"></i></td>
        </tr>
<%
    }
}
%>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col d-flex justify-content-center">
                    <button type="button" class="btn btn-primary" onclick="location.href='boardWrite.jsp';">글쓰기</button>
                    <button type="button" class="btn btn-warning" onclick="location.href='boardList.jsp';">리스트보기</button>
                    <button type="button" class="btn btn-dark">Reset</button>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <ul class="pagination justify-content-center">
                     <% System.out.println("현재경로" + request.getRequestURI()); %> 		
        			 <%= BoardHomePage2.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI()) %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
 	<!-- 하단 인클루드 -->
   	<%@ include file="./inc/bottom.jsp" %>
</div>
</body>
</html>

