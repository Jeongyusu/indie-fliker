<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
					<thead>
						<tr>
							<th>이메일</th>
							<th>비밀번호</th>
							<th>이름</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="user" items="${userLists}">
						<tr>
							<td>${user.userEmail}</td>
							<td>${user.password}</td>
							<td>${user.username}</td>
							<td>${user.tel}</td>
						</tr>
					</c:forEach>
					
					</tbody>
	</table>
</body>
</html>