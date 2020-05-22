<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>

<%@include file="head.jsp" %><!--CSS及JQ-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/fontawesome.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css" media="all">
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body  class="page registration">

<jsp:include page="header.jsp" /><!--頁頭-->>


	<div class="indica">
		<div class="container">
			<div class="col-md-9 posta">
				<h3><strong>忘記密碼</strong>
					<label1></label1>
                </h3>
<form class="form-horizontal regis_form" name="useraddform" method='post' action='forgot'>  <div class="control-group">
                    <label class="control-label" for="">帳　　號</label><input class="control" type="text" name="account" value="" placeholder="請設定8 到 16 字元,首字必須英文,英文需區分大小寫" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">出生日期</label><input class="control" name="birthday" type="date" value="" placeholder="2016-06-06" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">電子信箱</label><input class="control" name='email' type="email" placeholder="abc@abc.com.tw" value="" required="required">
				</div>
				<br/>
				<br/>
				<div class="control-group">
					<button class="btn btn-warning" type="submit" onclick="return check_Data()">送出</button>
					<button class="btn btn-default" type="reset">重設</button>
				</div>
                </form>
</div>
</div>
</div>
<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>