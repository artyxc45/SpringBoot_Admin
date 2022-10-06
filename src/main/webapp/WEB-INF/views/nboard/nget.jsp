<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<link href="/static/resources/css/bootstrap.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header" align="center">공지 사항</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row" align="center">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <h5 class="panel-heading">${nboard.ntitle}</h5>
      <!-- /.panel-heading -->
      <div class="panel-body">

        
		<!-- 
        <div class="form-group">
          <label>NTitle</label> <input class="form-control" name='ntitle'
             value='${nboard.ntitle}' readonly="readonly">
        </div>
         -->
        <div class="form-group">
          <textarea class="form-control" rows="3" name='ncontent'
            readonly="readonly">${nboard.ncontent}</textarea>
        </div>

		<div class="form-group">
          <label>글 번호</label> <input class="form-control center" name='nbno'
             value='${nboard.nbno}' readonly="readonly">
        </div>

        <div class="form-group">
          <label>작성자</label> <input class="form-control center" name='nwriter' value='${nboard.nwriter}'
             readonly="readonly">
        </div>
<div align="center" style="margin-top: 1rem;">
<button data-oper='list' class="btn btn-outline-light" onclick="location.href='list'">List 보여주세요!</button>
<button data-oper='modify' class="btn btn-outline-light" onclick="location.href='modify?nbno=${nboard.nbno}'">Modify 수정!</button>
</div>
<!-- page 317 jsp 소스 코딩 시작 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 시작 -->
<form id='operForm' action="/board/modify" method="get">
	<input type='hidden' id='nbno' name='nbno' value='<c:out value="${board.nbno}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
</body>
</html>