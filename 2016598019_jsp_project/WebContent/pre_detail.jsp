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
   String idInfo = request.getParameter("id");
   MemberDAO memDAO=new MemberDAO();
   List membersList =memDAO.detailMembers(idInfo);
   System.out.println(idInfo);
   request.setAttribute("membersList", membersList);
%> 
</head>
<body>
<jsp:forward  page="detail.jsp" />
</body>
</html>
