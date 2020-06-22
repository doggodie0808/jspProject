<%@ page language="java" contentType="text/html; charset=UTF-8"
     import=" java.util.*,sec02.ex01.*"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상황별 페이지</title>
</head>
<body>
<%


	MemberDAO memDAO=new MemberDAO();
    List membersList =memDAO.listMembers();
    session.setAttribute("membersList", membersList);
	

 
	String situation = (String)request.getAttribute("situation");
	System.out.println(situation);
	if(situation.equals("1")) {
	out.println("비밀번호가 일치하지않거나 존재하지 않는 ID입니다!!!");
	out.println("<a href='login.html'>비밀번호 다시 입력하러가기</a>");
	} else if(situation.equals("2")) {
	out.println("변경을 위한 비밀번호가 틀렸습니다!!!");
	out.println("<a href='#' onclick='history.back(-1)'; return false;'>비밀번호 다시입력하기</a>");
	} else if(situation.equals("3")) {
	out.println("계정이 생성되었습니다!!!");
	out.println("<a href='login.html'>로그인 하러가기</a>");
	} else if(situation.equals("4")) {
	out.println("계정이 변경되었습니다!!!");
	out.println("<a href='list.jsp'>계정 목록  보러가기</a>");
	} else if(situation.equals("5")) {
	out.println("이미 존재하는 ID입니다.!!!");
	out.println("<a href='member.jsp'>계정 다시  생성하러 가기</a>");
	}

%>
</body>
</html>