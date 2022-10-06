<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>물품 등록 페이지</title>
<meta charset="UTF-8">
<meta name="description" content="loans HTML Template">
<meta name="keywords" content="loans, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="static/img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="/static/css/font-awesome.min.css" />
<link rel="stylesheet" href="/static/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/static/css/flaticon.css" />
<link rel="stylesheet" href="/static/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet" href="/static/css/style.css" />

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
	<!-- Page Preloder -->

	<!-- Header Section -->
	<header class="header-section">
		<a href="index.html" class="site-logo"> <img src="img/logo.png"
			alt="">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index.html">Home</a></li>
				<li><a href="about-us.html">About Us</a></li>
				<li><a href="contact.html" class="active">Contact</a></li>
			</ul>
		</nav>
	</header>
	<!-- Header Section end -->

	<!-- Contact Section end -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<h2>상품 을 등록해 주세요</h2>
					<form action="insertBoard" class="contact-form" method="post"
						enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-6">
							<h5>상품 등록한 업체</h5>
								<input type="text"
									class="form-control" id="admin" name="admin">
							</div>
							<div class="col-md-6">
								<h5>상품 가격</h5>
								<input type="text" class="form-control"
									id="price" name="price">
							</div>
							<div class="col-md-6">
								<h5>제목</h5>
								<input type="text"class="form-control"
									id="title" name="title">
							</div>
							<div class="col-md-6">
								<h5>물품 수령</h5>
								<input type="text"class="form-control"
									id="amount" name="amount">
							</div>
							<div class="col-md-12">
								<h5>상품 내용</h5>
								<textarea class="form-control" id="content"
									name="content" rows="3"></textarea>
							</div>
							<div class="panel-body">
								<div class="image-container">
									<img style="width: 400px;" id="preview-image"
										src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
									<input style="display: block;" type="file" id="input-image"
										name="files">
								</div>
							</div>
						</div>
				</div>
				<div class="col-md-6">
								<button type="submit" class="site-btn btn btn-primary">상품
									등록하기</button>
				</form>
					<button onclick="location.href='getBoardList'" class="site-btn"
						style="margin-top: 20px;">상품 목록으로 돌아가기</button>
				</div>
			</div>
		</div>
		</div>
	</section>

	<!--====== Javascripts & Jquery ======-->
	<script src="/static/js/jquery-3.2.1.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/jquery.slicknav.min.js"></script>
	<script src="/static/js/owl.carousel.min.js"></script>
	<script src="/static/js/jquery-ui.min.js"></script>
	<script src="/static/js/main.js"></script>

<script type="text/javascript">
 function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	        	const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result  
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
 	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
</script>

</body>
</html>
