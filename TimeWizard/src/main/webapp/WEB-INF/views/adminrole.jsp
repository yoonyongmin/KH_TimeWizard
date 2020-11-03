<%@page import="com.minibean.timewizard.model.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Role Change</title>
<link rel="stylesheet" type="text/css" href="resources/css/adminrole.css">
<script src="resources/js/adminrole.js" defer></script>
</head>
<body>


<form>
	<table border="1">
		<col width="200" />
		<col width="100" />
		<col width="100" />
		<tr>
			<td id="title" colspan="5">회원등급 변경</td>
		</tr>
		<tr>
					<td>회원번호</td>
					<td>I   D</td>
					<td>등      급</td>
		</tr>
		<c:forEach var="dto" items="${dto }">
		<tr>
			<td>${dto.user_no }</td>
			<td>${dto.user_id }</td>
			<td>
				<!-- 아래 부분 수정
				<select name="user_role">
					<option value="ADMIN" <%=dto.getUser_role().equals("ADMIN")?"selected":"" %> >관리자</option>
					<option value="ADMIN" <%=dto.getUser_role().equals("USER")?"selected":"" %> >일반회원</option>
				</select>
				-->
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<input class="btn" type="submit" value="변경 완료" />
				<input class="btn" type="button" value="목록" onclick="location.href='adminpage'" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>