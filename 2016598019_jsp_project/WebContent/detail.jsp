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
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
  
</head>

<body>

    <div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 정보</h2>
			
			<div class="notice margin-top">				
				<table>
					<thead>
						<tr>
						
							<th>ID</th>
							<th>&nbsp;이름</th>
							<th>전화번호</th>
							<th>이메일 </th>
							<th>학과</th>
							<th>성별</th>
							<th>계절</th>
							<th>자기소개</th>
						</tr>
					</thead>
			<c:choose>

<c:when test="${ membersList==null}" >
   <tr>
    <td colspan=5>
      <b>등록된 회원이 없습니다.</b>
    </td>  
  </tr>
</c:when>  
<c:when test="${membersList!= null}" >
  <c:forEach  var="mem" items="${membersList }" >
   <tr align="center">
     <td>${mem.id}</td>
     <td>${mem.name}</td>
     <td>${mem.tel}</td>
     <td>${mem.email}</td>
     <td>${mem.dept}</td>
     <td>${mem.gender}</td>
     <td>${mem.birth}</td>
     <td>${mem.introduction}</td>
     
     

   </tr>
   </c:forEach>
</c:when>
</c:choose>
			
				</table>
				
			</div>
			
			<div class="search-form margin-top first align-right">
			<form action="list.jsp"  method="get">
			<input type="submit" value="목록">
			</form>
			<c:forEach  var="mem" items="${membersList }" >
			<form action="pwcheck.jsp" method="get">
			<input type="hidden" name="id2" size=10 value="${mem.id}">
			<input type="hidden" name="name2" size=10 value="${mem.name}">
			<input type="submit"  value="수정" />
			</form>
			</c:forEach>
			
			</div>
		</main>
		
			
		</div>
	</div>
<%
	
   MemberDAO memDAO=new MemberDAO();
   

   List membersList =memDAO.listMembers();
   session.setAttribute("membersList", membersList);
   
%> 
    </body>
    
    </html>