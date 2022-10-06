<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link href="/static/resources/css/bootstrap.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
<h3>글쓰기</h3>
<hr>
<form action="registerNBoard" method="post">
    <table style="width: 700px; margin: auto">
        <tr>
            <td style="color: black;">제목</td>
            <td><input type="text" name="ntitle"/></td>
        </tr>
        <tr>
            <td style="color: black;">작성자</td>
            <td><input type="text" name="nwriter" readonly="readonly" value='<sec:authentication property="principal.nickname"/>' /></td>
        </tr>
        <tr>
            <td style="color: black;">내용</td>
            <td><textarea name="ncontent" cols="40" rows="10"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록"/>
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>