
	//跳出訊息+轉址
	function msg(txt, path){
		if(msg != null){
			alert(txt);
		}
		//預設
		var default_path = location.pathname;
		//alert(default_path);
		if(path == null){
			location.href=default_path;
		}else{
			location.href=path;
		}
	};
	
	//詢問訊息+轉址
	function cofirm_mes(mes, href){
		var str = href;
		if(mes != null){
			if(confirm(mes)){
				location.href=str;
			}
		}else{
			location.href=str;
		}
	};	
	
	//送該表單
	function cofirm_mesf(myform, mes){
		var form = document.getElementById(myform);
		if(confirm(mes)){
			form.submit();
		}
	};