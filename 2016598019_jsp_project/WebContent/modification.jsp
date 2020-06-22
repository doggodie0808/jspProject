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
<%
   String id = (String)request.getAttribute("check.id");
   String name = (String)request.getAttribute("check.name");
   MemberDAO memDAO=new MemberDAO();
%> 
<meta charset="UTF-8">
<title>Form Example</title></head>
<body>
    <h3>회원 정보</h3>
    <form action="modification_action.jsp" method="post">
	     ID : <input type="text" name="id" value="<%=id%>" readonly/><br/>
	        이름 :  <input type="text"  name="name" value="<%=name%>" readonly/> <br/>    
	        비밀번호 : <input type="password" name="pwd" /> <br/>
	        
	        전화번호 :  <input type="text"  name="tel" /> <br/>
	        이메일 :  <input type="text"  name="email" /> <br/>
	        학부 : 
              <input type="checkbox" name="dept" value="Computer" /> 컴퓨터공학부 
              <input type="checkbox" name="dept" value="Communications" /> 정보통신학부  
              <input type="checkbox" name="dept" value="Contents" /> IT콘텐츠학과  
              <input type="checkbox" name="dept" value="Korean" /> 국어국문학과 <br/>
	        성별 :
              <input type="radio"  name="gender"  value="male" />남자 
              <input type="radio"  name="gender"  value="female" />여자<br/>
	        
	        태어난 계절:
              <select name="birth">
                 <option value="Spring"> 봄 
                 <option value="Summer"> 여름 
                 <option value="Fall"> 가을 
                 <option value="Winter"> 겨울                 
              </select>  <br/>
	        자기소개:<br/>
              <textarea cols="30" rows="10" name="introduction"></textarea> <br/>
        <input type="submit" value="전송" />        
    </form>
</body>
</html>