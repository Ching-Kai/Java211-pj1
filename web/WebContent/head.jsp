<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&display=swap" rel="stylesheet"> 
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/fontawesome.css" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Infoshare Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<script
		type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link href='http:///fonts.useso.com/css?family=Roboto:400,300,100,500,700,900' rel='stylesheet' type='text/css'>
	<link href='http:///fonts.useso.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
	<script src="js/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://fonticons-free-fonticons.netdna-ssl.com/kits/ffe176a3/publications/72113/woff2.css" media="all">
	<script src="js/responsiveslides.min.js"></script>
	<script src="js/all.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			$("#slider").responsiveSlides({
				auto: true,
				manualControls: '#slider3-pager',
			});
			//討論區按鈕
			$(".gossip_sort").before('<div class="gossip_cover gossip_close">');
			$(".gossip_close").click(function () {
				var $this = $(this);
				$(".gossip_sort").toggleClass("active");
				$("body").toggleClass("active");
				$(".gossip_cover").toggleClass("active");
			});
			//登入按鈕
			$(".sign_btn").click(function () {
				var $this = $(this);
				var login_box = $(".login_box");
				login_box.toggleClass("active");
			});
		});
	</script>
</head>
<body>

</body>
</html>