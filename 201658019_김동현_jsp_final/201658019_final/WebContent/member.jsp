<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Example</title></head>
<body>
    <h3>ȸ�� ����</h3>
    <form action="member" method="post">
	     ID : <input type="text" name="id" /><br/>
	        ��й�ȣ : <input type="password" name="pwd" /> <br/>
	        �̸� :  <input type="text"  name="name" /> <br/>
	        ��ȭ��ȣ :  <input type="text"  name="tel" /> <br/>
	        �̸��� :  <input type="text"  name="email" /> <br/>
	        �к� : 
              <input type="checkbox" name="dept" value="Computer" /> ��ǻ�Ͱ��к� 
              <input type="checkbox" name="dept" value="Communications" /> ��������к�  
              <input type="checkbox" name="dept" value="Contents" /> IT�������а�  
              <input type="checkbox" name="dept" value="Korean" /> ������а� <br/>
	        ���� :
              <input type="radio"  name="gender"  value="male" />���� 
              <input type="radio"  name="gender"  value="female" />����<br/>
	        
	        �¾ ����:
              <select name="birth">
                 <option value="Spring"> �� 
                 <option value="Summer"> ���� 
                 <option value="Fall"> ���� 
                 <option value="Winter"> �ܿ�                 
              </select>  <br/>
	        �ڱ�Ұ�:<br/>
              <textarea cols="30" rows="10" name="introduction"></textarea> <br/>
        <input type="submit" value="����" />        
    </form>
</body>
</html>