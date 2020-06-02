<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error</title>
<%@include file="head.jsp" %><!--CSS及JQ-->
</head>
<body>
<jsp:include page="header.jsp" /><!--頁頭-->
<div class="indica">
		<div class="container">
				<div class="col-md-3 dicado">
				<h1>error</h1>
				</div>
				<div class="col-md-6 posta">
				</div>
								
			<jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
		</div>
	</div>

<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>