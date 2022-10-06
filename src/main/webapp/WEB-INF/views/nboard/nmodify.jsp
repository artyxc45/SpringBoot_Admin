<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/static/resources/css/bootstrap.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center;">
    <h3>글 수정</h3>
    <hr>
    <form action="updateNBoard" method="post">
        <input type="hidden" name="nbno" value="${NBoard.nbno}"/>
        <table style="width: 700px; margin: auto">
        <tr>
            <td style="color: black;">글 번호</td>
            <td><input style="text-align: center;" type="text" name="nbno" readonly="readonly" value="${NBoard.nbno}"/></td>
        </tr>
        <tr>
            <td style="color: black;">제목</td>
            <td><input style="text-align: center;" type="text" name="ntitle" value="${nboard.ntitle}"/></td>
        </tr>
        <tr>
            <td style="color: black;">작성자</td>
            <td><input style="text-align: center;" type="text" name="nwriter" readonly="readonly" value="${nboard.nwriter}"/></td>
        </tr>
        <tr>
            <td style="color: black;">내용</td>
            <td><textarea name="ncontent" cols="40" rows="10">${nboard.ncontent}</textarea></td>
        </tr>
            <tr>
                <td colspan="2">
                    <div style="text-align: center;">
                        <input type="submit" value="수정"/>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <hr>
    <a href="/board/register" style="color: black;">글등록</a>
    <a href="/board/deleteNBoard?nbno=${NBoard.nbno}" style="color: black;">글삭제</a>
    <a href="/board/list" style="color: black;">글목록</a>
</div>
</body>
</html>