<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-16"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#movingDiv {
	top: 50px;
	transition: top 0.3s ease-in-out; /* 움직임에 애니메이션 효과를 주기 위해 transition 속성을 사용합니다. */
	border-radius: 15px;
	box-shadow: rgba(0, 0, 0, 0.12) 0px 6px 16px;;
	height: 660px;
	padding-top : 25px; 
	border : 1px solid rgb(221,221,221);
}
.col-lg-9 .blog-post {
    display: inline-block;
    width: calc(33.33% - 30px);
    margin-right: 20px;
    margin-bottom: 20px;
    vertical-align: top;
}
.post-im img{
	width: 100%;
	height: 170px;
	border-radius: 3px;
}
.blog-page .blog-post .post-content {
	padding: 20px 14px;
}
.post-content {
	height: 160px;
}
@media (max-width: 1199px) {
	.col-lg-9 .blog-post {
	    width: calc(50% - 30px);
	}
}

@media (max-width: 767px) {
    .col-lg-9 .blog-post {
        width: 100%;
        margin-right: 0;
    }
}
.blog-post {
	cursor: pointer;
}
.widget .search-blog-input .input:before {
	top:10px;
}
</style>
<div class="container" style="margin-top: 20px; position: relative; overflow: hidden;">

	<!-- Blog Posts -->
	<div class="blog-page">
	<div class="row">
		<div id="listDiv" class="col-lg-9 col-md-8 padding-right-30">
			<div id="postDiv" style="height: 800px;">

			</div>
			<!-- Pagination -->
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12">
					<!-- Pagination -->
					<div class="pagination-container margin-bottom-40">
						<nav class="pagination" id="pagingArea">
							<!-- 페이징 처리 나올 곳 -->
						</nav>
					</div>
				</div>
			</div>
			<!-- Pagination / End -->

		</div>

	<!-- Blog Posts / End -->


	<!-- Widgets -->
	<div class="col-lg-3 col-md-4" id="movingDiv">
		<div class="sidebar right">

			<!-- Widget -->
			<div class="widget">
				<h3 class="margin-top-0 margin-bottom-25">게시글 검색</h3>
				<div class="search-blog-input">
					<div class="input">
						<input class="search-field" type="text" id="title"placeholder="제목을 입력해주세요" value=""/>
						<input type="hidden" id="page"/>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- Widget / End -->

			<!-- Widget -->
			<div class="widget margin-top-40">

				<h3>인기 게시글</h3>
				<hr/>
					<ul class="widget-tabs">
						<!-- 인기게시글 출력 -->
						<c:forEach items="${popList }" var="pop">
							<li class="pop-content" data-tboardno="${pop.tboardNo }">
								<div class="widget-content">
										<div class="widget-thumb">
										<a href="#"><img src="${pageContext.request.contextPath}${pop.travelImgPath }" alt=""></a>
									</div>
									
									<div class="widget-text">
										<h5>${pop.tboardTitle } </h5>
										<span>${pop.tboardRegDate } | ${pop.tboardWriter }</span>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>
						</c:forEach>
					</ul>
				<hr/>
				<!-- 버튼 -->
				<div class="widget margin-top-0">
					<button class="button fullwidth margin-top-0" id="insertBtn"> 새 글 등록</button>
				</div>
				<!-- 버튼 끝 -->
			</div>
			<!-- Widget / End-->



			<div class="clearfix"></div>
			<div class="margin-bottom-40"></div>
		</div>
	</div>
	</div>
	<!-- Sidebar / End -->

</div>
</div>
<script>
var msg = "${msg}";

if(msg.trim() !== "" && msg.trim() !== null) {
	alert(msg);
}

// 위젯 따라 다니기
window.addEventListener('scroll', function() {
	var movingDiv = document.getElementById('movingDiv');
	var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	var container = document.querySelector('.blog-page');
	var containerHeight = container.offsetHeight;
	var movingDivWidth = movingDiv.offsetWidth;
	var maxLeft = containerHeight - movingDivWidth;
	
	var maxLeftPercentage = 80;
	var maxLeftDynamic = (containerHeight * maxLeftPercentage) / 100;
	
	var leftPosition = Math.min(scrollTop, maxLeftDynamic);
	if (leftPosition < 0) {
		return false;
	} else {
		if (leftPosition <= maxLeftDynamic - 530) {
			movingDiv.style.transform = 'translateY(' + leftPosition + 'px)';
		}
	}
});

var insertBtn = document.querySelector("#insertBtn");
insertBtn.addEventListener("click",function(){
	location.href="/tripBoard/register";
});
var pageContext = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/scripts/tripboard/tripboard.js"></script>