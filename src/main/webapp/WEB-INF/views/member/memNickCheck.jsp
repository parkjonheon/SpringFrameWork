<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memIdCheck.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script>
  'usestrict';
  	// 중복 아이디 체크
  	function sendCheck(){
  		opener.window.document.myForm.nickName.value = '${nickName}';
  		opener.window.document.myForm.name.focus();
  		window.close();
  	}
  	
  	// 중복 아이디 다시 체크
  	function nickCheck(){
  		let nick = myForm.nick.value; 
  	  
  	  if(nick == ""){
  		  alert("닉네임을 입력하세요!");
  		  childForm.nick.focus();
  	  }
  	  else{
  			childForm.submit();
  	  }
  	}
  </script>
</head>
<body>

<p><br/></p>
<div class="container">
  <h3>아이디 체크폼</h3>
  <c:if test="${res == 1}">
  	<h4><font color="blue">${nickName}</font> 닉네임은 사용 가능합니다.</h4>
  	<p><input type ="button" value="창닫기" onclick="sendCheck()" /></p>
  </c:if>
  <c:if test="${res != 1}">
  	<h4><font color="blue">${nickName}</font> 닉네임은 이미 사용중인 아이디 입니다.</h4>
  	<form name="childForm" method="post" action="${ctp}/memNickCheck.mem">
  		<p>
	  		<input type ="text" name="nick"/>
		  	<input type ="button" value="아이디검색" onclick="nickCheck()" />
		  </p>  	
  	</form>
  </c:if>
</div>
<p><br/></p>

</body>
</html>