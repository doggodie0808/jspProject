<%@ page language="java" contentType="text/html; charset=UTF-8"
     import="java.util.*, sec02.ex01.*"
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
    <!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 목록</h2>
			
			<div class="notice margin-top">				
				<table>
					<thead>
						<tr>
						
							<th>ID</th>
							<th>&nbsp;이름</th>
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
     <td><a href="pre_detail.jsp?id=${mem.id}">${mem.id}</a></td>
     <td>${mem.name}</td>

   </tr>
   </c:forEach>
</c:when>
</c:choose>
			
				</table>
			</div>
			
			<div class="search-form margin-top first align-right">
			<br>	
				<form name="f" action="search.jsp" method=get>
					<fieldset>
						<legend class="hidden">학생 분류</legend>
						<label class="hidden">학과</label>
						<select name="a">
							<option  value="default">전체</option>
							<option  value="Computer">컴퓨터공학부</option>
							<option  value="Communications">정보통신학부</option>
							<option  value="Contents">IT콘텐츠학과</option>
							<option  value="Korean">국어국문학과</option>							
						</select> 
						<input type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
		</main>
		
		</div>
	</div>

    </body>
    
    </html>