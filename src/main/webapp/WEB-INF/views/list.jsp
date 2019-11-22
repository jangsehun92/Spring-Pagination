<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	if("${resultMap.pagination.startPage}" > 1){
		$("#pagination").append("<li class=''><a href='/articles' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	}else{
		$("#pagination").append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
	}
					
	if("${resultMap.pagination.page}" > 1){
		$("#pagination").append("<li class=''><a href='/articles?page="+(Number("${resultMap.pagination.page}")-1)+"' aria-label='Previous'><span aria-hidden='true'>&lang;</span></a></li>");
	}else{
		$("#pagination").append("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&lang;</span></a></li>");
	}
					
	for(var iCount = "${resultMap.pagination.startPage}"; iCount <= "${resultMap.pagination.endPage}"; iCount++) {
		if (iCount == "${resultMap.pagination.page}") {
			$("#pagination").append("<li class='active'><a href='#'>"+iCount+"<span class='sr-only'></span></a></li>");
		} else {
			$("#pagination").append("<li class=''><a href='/articles"+"?page="+iCount+"'>" + iCount + "<span class='sr-only'></span></a></li>");
		}
	}
					
	if("${resultMap.pagination.page}" < "${resultMap.pagination.totalPage}"){
		$("#pagination").append("<li class=''><a href='/articles?page="+(Number("${resultMap.pagination.page}")+1)+"' aria-label='Next'><span aria-hidden='true'>&rang;</span></a></li>");
	}else{
		$("#pagination").append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&rang;</span></a></li>");
	}
					
	if("${resultMap.pagination.endPage}" < "${resultMap.pagination.totalPage}"){
		$("#pagination").append("<li class=''><a href='/articles?page=${resultMap.pagination.totalPage}' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	}else{
		$("#pagination").append("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
	}
})
</script>
<body>
	<div class="container">
		<div id="main">
			<h1>게시판</h1>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<td class="col-md-1"><b>번호</b></td>
					<td class="col-md-7"><b>제목</b></td>
					<td class="col-md-1" align="right"><b>작성자</b></td>
					<td class="col-md-1" align="right"><b>작성 날짜</b></td>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${empty resultMap.articleList}">
					<tr>
						<td colspan="4" align="center">--- 등록된 글이 없습니다 ---</td>
					</tr>
				</c:when>
				<c:otherwise>

					<c:forEach items="${resultMap.articleList }" var="article">
						<tr>
							<td> ${article.id }</td>
							<td>${article.title }</td>
							<td align="right">${article.writer }</td>
							<td align="right">${article.regDate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<div id="pagination-div">
				<nav aria-label="..." style="text-align: center;">
					<ul class="pagination" id="pagination">
					
					</ul>
				</nav>
		</div>
		
		
	</div>
</body>
</html>