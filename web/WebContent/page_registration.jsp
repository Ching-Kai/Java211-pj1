<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="head.jsp" %><!--CSS及JQ-->

	
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/fontawesome.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css" media="all">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script type="text/javascript">
	var account = document.useraddform.account.value;
	var password = document.useraddform.password.value;
	var password1 = document.useraddform.password1.value;
	var username = document.useraddform.username.value;
	var gender = document.useraddform.gender.value;
	var email = document.useraddform.email.value;
	function check_Data() {
		account = document.useraddform.account.value;
		password = document.useraddform.password.value;
		password1 = document.useraddform.password1.value;
		username = document.useraddform.username.value;
		gender = document.useraddform.gender.value;
		email = document.useraddform.email.value;
		var re1 = /^[a-z|A-Z]\w{7,15}$/;
		var re2 = /^[a-z|A-Z|\w]{7,15}$/;
		var re4 = /^.+@[a-z]+\.[a-z]+(\.[a-z]+)?$/;
		if (!re1.test(account)) {
			alert("帳號格式錯誤");
			return false;
		} else if (!re2.test(password)) {
			alert("密碼格式錯誤");
			return false;	
		} else if (password!=password1) {
			alert("兩次密碼不同");
			return false;
		} else if (!re4.test(email)) {
			alert("email格式錯誤");
			return false;
		} else {
			return true;
		}
	}
	</script>
	
</head>
<body class="page registration">
<jsp:include page="header.jsp" />




	<div class="indica">
		<div class="container">
			<div class="col-md-9 posta">
				<h3><strong>會員註冊</strong>
					<label1></label1>
                </h3>
                <form class="form-horizontal regis_form" name="useraddform" method='post' action='useradd.jsp'> 
                 <div class="control-group">
                    <label class="control-label" for="">帳　　號</label><input class="control" type="text" name="account" value="" placeholder="請設定8 到 16 字元,首字必須英文,英文需區分大小寫" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">密　　碼</label><input class="control" name="password" type="password" value="" placeholder="請設定8 到 16 字元,首字必須英文,英文需區分大小寫" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">密碼確認</label><input class="control" name="password1" type="password" value="" placeholder="請再輸入一次密碼" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">暱　　稱</label><input class="control" name="username" type="text" value="" required="required">
                </div>
                <div class="control-group">
                    <label class="control-label" for="">出生日期</label><input class="control" name="birthday" type="date" value="" placeholder="2016-06-06" required="required">
                </div>
                
                <div class="control-group">
                    <label class="control-label" for="">電子信箱</label><input class="control" name='email' type="email" placeholder="abc@abc.com.tw" value="" required="required">
				</div>
				<div style="width: 5%; display:inline;">
				    <label class="control-label" for="">性　　別           </label>
				  	  男<input type='radio' style="width: 5%" name='gender' value="male" required="required">
				  	  女<input type='radio' style="width: 5%" name='gender' value="female">
				</div>
				<br/>
				<br/>
                <div class="control-group contract">
                    <input type="checkbox" required="required">我同意線上交流平台×討論版客戶隱私權政策與客戶服務條款
				</div>
				<div class="control-group">
					<button class="btn btn-warning" type="submit" onclick="return check_Data()">送出</button>
					<button class="btn btn-default" type="reset">重設</button>
				</div>
                </form>
			</div>






<div class="col-md-3  redes">
				<h3>最新 <strong>文章回覆</strong>
					<label3></label3>
				</h3>
				<div class="dicado-top">
					<h5>30 app para download</h5>
				</div>
				<div class="dicado-bottom">
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
					<div class="dicado-1">
						<h6><a href="#">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h6>
						<span class="itac">最新回覆 : Paulo Ricardo<br /><i class="far fa-clock"></i> 3 天前<i
								class="dot_"></i><i class="far fa-comment"></i> 32</span>
					</div>
				</div>
			</div>
		</div>
	</div>








<jsp:include page="foot.jsp" />
</body>
</html>