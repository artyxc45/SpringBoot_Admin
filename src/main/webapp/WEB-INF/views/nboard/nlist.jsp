<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/static/resources/css/bootstrap.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" align="center">
	<div class="col-lg-12">
		<h1 class="page-header" onclick="location.href='list'">공지 사항</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body" align="center">
				<!-- Page 237 소스 코딩 시작 -->
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr class="table-primary">
							<th scope="row">게시글 번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<c:forEach items="${nlist}" var="nboard">
						<tr class="table-primary">
							<td><c:out value="${nboard.nbno}" /></td>
							<td><a class='move' href='<c:out value="${nboard.nbno}"/>'>
									<c:out value="${nboard.ntitle}" />
							</a></td>
							<td><c:out value="${nboard.nwriter}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${nboard.nregdate}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				<button id='regBtn' type="button" class="btn btn-outline-light" onclick="location.href='register'">글 작성</button>
				
			</div>
			
			<form id='actionForm' action="list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			</form>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>			
<script type="text/javascript">
	$(document).ready(function() {
						// Page 312 위에 자바스크립트 소스 코딩 시작
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');
									// }); Page 312 위에 자바스크립트 소스 코딩 끝
									
									// Page 312 아래 자바스크립트 소스 코딩 시작
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit(); // actionForm 자체를 submit() 처리 시켜줍니다.
								});
								// Page 312 아래 자바스크립트 소스 코딩 끝						

						// Page 315 자바스크립트 소스 코딩 시작
						$(".move").on("click",function(e) {
								e.preventDefault();
								actionForm.append("<input type='hidden' name='nbno' value='" + $(this).attr("href") + "'>");
								actionForm.attr("action","/board/get");
								actionForm.submit();
								});
						// Page 315 자바스크립트 소스 코딩 끝

						// Page 342 자바스크립트 소스 코딩 시작
						var searchForm = $("#searchForm");
						
						$("#searchForm button").on("click", function(e) {
							if(!searchForm.find("option:selected").val()){
								alert("검색 종류를 선택해 주시기 바랍니다!");
								return false;
							}
							
							if(!searchForm.find("input[name='keyword']").val()){
								alert("키워드를 입력해 주시기 바랍니다!");
								return false;
							}
							
							// 여러 문제들 중에서 검색 버튼을 클릭하면 검색은
							// 1페이지를 하도록 수정 처리합니다.
							searchForm.find("input[name='pageNum']").val("1");
							// 브라우저에서 검색 버튼을 클릭하면 form 태그의
							// 전송은 막고, 페이지의 번호는 1이 되도록 처리합니다.
							// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
							e.preventDefault();
							searchForm.submit();			
						});
					});
						// Page 342 자바스크립트 소스 코딩 끝
</script>
</body>
</html>