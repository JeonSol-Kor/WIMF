<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>입양 후기 수정</title>
		<link href="/css/board/communityInsert.css" rel="stylesheet">
		
		<!-- css -->
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
		<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
		<link href="/vendor/aos/aos.css" rel="stylesheet">
			
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
		<!-- include summernote css/js -->
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	</head>
	
	<body data-bs-spy="scroll" data-bs-target="#navmenu">
	
		<!-- ======= Header ======= -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<main id="main">
			<div id="container">
				<h3 style="padding-bottom: 2%;">입양 후기 수정</h3>
				<div id="board">
					<form action="/adopt/update.dog" method="post" onsubmit="return validateForm()">
						<div id="board-content">
							<div id="board-subject">
								<input type="hidden" name="adoptNo" value="${adopt.adoptNo }">
								<input type="hidden" name="userId" value="${adopt.userId }">
								<input id="board-subject-value" type="text" name="adoptTitle" value="${adopt.adoptTitle }" placeholder="제목">
							</div>
							<div>
								<p>입양일 : </p><input id="adopt-date" type="date" name="adoptDate">
							</div>
							<textarea id="summernote" name="adoptContent">${adopt.adoptContent }</textarea>
							<div>
								<input id="submit-btn" type="submit" value="수정">
							</div>
							<div>
								<input id="reset-btn" type="reset" value="취소" onClick="location.href='/adopt/list.dog'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</main>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		
		<script>
			const prevAdoptDate = new Date("${adopt.adoptDate}");
			document.getElementById("adopt-date").value = prevAdoptDate.toISOString().split("T")[0];
		
			function validateForm(){
				const title = document.getElementById("board-subject-value").value;
				const adoptDate = document.getElementById("adopt-date").value;
				const content = document.getElementById("summernote").value;
				const currentDate = new Date();
				 
				if(currentDate < new Date(adoptDate)){
					alert("입양일은 미래 날짜를 입력할 수 없습니다.");
					return false;
				}else if(title.trim() == "" || !adoptDate || content.trim() == ""){
					alert("제목과 내용, 입양일을 모두 입력해주세요");
					return false;
				}else{
					return true;
				}
			}
			
			$('#summernote').summernote({
				height: 400,                 // 에디터 높이
				minHeight: null,             // 최소 높이
				maxHeight: null,             // 최대 높이
				focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
		    	placeholder: "내용을 입력하세요",
				lang: "ko-KR",				 // 한글 설정
				
				callbacks: {
					onImageUpload: function(image) {
						var file = image[0];
						var reader = new FileReader();
						
						reader.onloadend = function() {
							var image = $('<img>').attr('src',  reader.result);
							image.attr('width','100%');
							$('#summernote').summernote("insertNode", image[0]);
						}
						reader.readAsDataURL(file);
					}
				}
			});
		</script>
	</body>

</html>