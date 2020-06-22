<%@ page language="java" contentType="text/html; charset=UTF-8"
     import=" java.util.*,sec02.ex01.*"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 체크</title>
<%
   String id = request.getParameter("id2");
   String name = request.getParameter("name2");
   System.out.println(id);
   System.out.println(name);

%> 
</head>
<body>
<h3>본인 여부 확인</h3>
<hr>
<form name="fo" method="get" action="check">
사용자 ID : 현재 선택된 학생 ID 보여주기<br>
		<input type="hidden" name="user_id" size="20" value="<%=id%>">
		<input type="hidden" name="user_name" size="20" value="<%=name%>">
비밀 번호 : <input type="password" name="user_pwd" value=""><br>
           <input type="submit" value="수정">           
</form>
</body>
</html>