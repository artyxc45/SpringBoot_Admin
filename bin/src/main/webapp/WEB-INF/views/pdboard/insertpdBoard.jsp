<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
</head>
<body>
	 
	<h2> 게시글 작성 </h2>
	 
	<div class="container">
		<form action="insertBoard" method="post"enctype="multipart/form-data">
			<div class="form-group">
				        <label for="subject">제목</label>        <input type="text"
					class="form-control" id="title" name="title">      
			</div>
			<div class="form-group">
				        <label for="writer">작성자</label>        
				<input type="text" class="form-control" id="admin" name="admin">      
			</div>
			<div class="form-group">
				        <label for="content">내용</label>        
				<textarea class="form-control" id="content" name="content" rows="3"></textarea>
			</div>
			<div class="form-group">
				        <label for="content">가격</label>        
				<input type="text" class="form-control" id="price" name="price">
			</div>
			            <input type="file" name="files"><!-- 추가 -->
			<button type="submit" class="btn btn-primary">작성</button>
		</form>
 </div>
</body>
</html>
