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
<script src="${pageContext.request.contextPath }/resources/js/pagination.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<body>
	<div class="container">
		<div id="articleList">
		
		</div>
		<table>
			<thead>
				<tr>
					<td class="col-md-1"><b>번호</b></td>
					<td class="col-md-7"><b>제목</b></td>
					<td class="col-md-1" align="right"><b>작성자</b></td>
					<td class="col-md-1" align="right"><b>작성 날짜</b></td>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${empty articleList}">
					<tr>
						<td colspan="4" align="center">--- 등록된 글이 없습니다 ---</td>
					</tr>
				</c:when>
				<c:otherwise>

					<c:forEach items="${articleList }" var="article">
						<tr>
							<td> ${article.id }</td>
							<td><a href="/article/${article.id }">${article.title }</a></td>
							<td align="right">${article.writer }</td>
							<td align="right">${article.regDate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
		<div id="pagination">
			<script type="text/javascript">
			
			</script>
		</div>
		
	</div>
</body>
</html>