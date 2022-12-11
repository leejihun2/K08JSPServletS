<%@page import="utils.JSFunction"%>
<%@page import="homework.board.BoardHomeDAO"%>
<%@page import="homework.board.BoardHomeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String userPwd = request.getParameter("user_pw");
String userName = request.getParameter("user_name");
String userId = request.getParameter("user_id");

BoardHomeDTO dto = new BoardHomeDTO();
dto.setPass(userPwd);
dto.setName(userName);
dto.setId(userId);


BoardHomeDAO dao = new BoardHomeDAO(application);

int iResult = dao.updateModify(dto);

dao.close();

if (iResult == 1) {
	
	JSFunction.alertLocation("회원정보수정 성공", "boardList.jsp", out);
}
else {
	
	request.setAttribute("LoginErrMsg", "회원정보수정 오류입니다.");
	request.getRequestDispatcher("boardModifyForm.jsp")
		.forward(request, response);
	
}
%>