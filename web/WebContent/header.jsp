<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>




<div class="gossip_sort">
		<span><i class="far fa-comments"></i>交流討論平台</span>
		<ul>
			<li><a href="" title="美術攝影">美術攝影</a></li>
			<li><a href="" title="美術攝影">美術攝影</a></li>
			<li><a href="" title="美術攝影">美術攝影</a></li>
			<li><a href="" title="美術攝影">美術攝影</a></li>
			<li><a href="" title="美術攝影">美術攝影</a></li>
		</ul>
	</div>
	<!-- banner -->
<div class="header">
		<div class="container">
			<div class="header-left">
				<div class="logo">
					<a href="index.html"><h1 title="線上交流平台×討論版">線上交流平台<span>×</span>討論版</h1></a>
				</div>
				<div class="gossip_sort_button gossip_close">
					<span><i class="fas fa-align-left"></i>討論版</span>
				</div>
				<div class="person">
					<p>A personal blog about everything.</p>
				</div>
			</div><div class="header-right">
				<div class="login">
					<a class="sign_btn" href="#"><i class="fas fa-user-circle"></i>登入</a><a href="registered.html"><i class="fas fa-user-plus"></i>註冊</a>
			
					<div class="login_box">
						<form name="" action="Usercheck.jsp" method="post">
							<span class="login_title">使用者登入</span>
							<div><label for="account">帳號</label><input name="account" value=""></div>
							<div><label for="password">密碼</label><input name="password" value=""></div>
							<div class="sign_btn"><a class="for_pw" href="#">忘記密碼</a><button type="submit">登入</button></div>
						</form>
					</div>
				</div>

				<div class="search-box">
					<div id="sb-search" class="sb-search">
						<form>
							<input class="sb-search-input" placeholder="Enter your search term..." type="search"
								name="search" id="search">
							<button class="sb-search-submit" type="submit" value="">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
			<!-- search-scripts -->
			<script src="js/classie.js"></script>
			<script src="js/uisearch.js"></script>
			<script>
				new UISearch(document.getElementById('sb-search'));
			</script>
			<!-- //search-scripts -->

			<!--<div class="clearfix"> </div>-->
		</div>
	</div>
</body>
</html>