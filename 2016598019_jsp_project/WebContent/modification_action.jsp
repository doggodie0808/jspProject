<%@ page language="java" contentType="text/html; charset=UTF-8"
     import=" java.util.*,sec02.ex01.*"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>    
<html>
<head>
<meta charset="TF-8">
<jsp:useBean  id="m" class="sec02.ex01.MemberBean" />
<jsp:setProperty name="m" property="*"  />
<%
	
   MemberDAO memDAO=new MemberDAO();
   memDAO.updateMember(m);
   List membersList =memDAO.listMembers();
   request.setAttribute("membersList", membersList);
   request.setAttribute("situation", "4");
   
%> 
</head>
<body>
<jsp:forward  page="output.jsp" />
</body>
</html>
