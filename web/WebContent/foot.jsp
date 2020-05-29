<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, sql_connection.Connection_sql"%>
    <%
	Connection_sql conn = new Connection_sql();
	conn.connection();
	Connection con = conn.con;
	Statement stm = conn.stm;
	ResultSet result = conn.result;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>


	







<i class="line"> </i>
<div class="melhores">
		<div class="container">
			<li><i class="cup"> </i></li>
			<li>
				<h3>精選文章！</h3>
			</li>
			<li>
				<p>快來看看大家最想知道的事情！</p>
			</li>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- melhores -->
	<!-- comopasser -->
	

	<div class="comopasser">
	
	<div class="container">
			<%
String title="",user_id="",arti_txt="",board="";

String sql2="",sql3="";

String username="";
int view_num=0,board_id=0;
Statement stm2,stm3;
stm2 = con.createStatement();
stm3=con.createStatement();
int count1 =0;
	String sql="select user_id ,SUBSTRING(title,1,27),SUBSTRING(arti_txt,1,40),view_num,board_id from gossipboard.article order by view_num;"; 
	try{
		result=stm.executeQuery(sql);
	while(result.next()){
		count1++;
		if(count1 > 4){
		break;
		}
		user_id=result.getString(1);
		title=result.getString(2);
		arti_txt=result.getString(3);
		view_num=result.getInt(4);
		board_id=result.getInt(5);
		try{
			sql2="select username from gossipboard.user where user_id ='"+user_id+"';";
			
			//System.out.print(user_id);
			
			ResultSet result1=stm2.executeQuery(sql2);
			while(result1.next()){
			username=result1.getString(1);
			}
		}catch (Exception e){
		
		}
		try{
			sql3="select board_name from gossipboard.board where board_id ='"+board_id+"';";
			
			//System.out.print(user_id);
			
			ResultSet result2=stm3.executeQuery(sql3);
			while(result2.next()){
			board=result2.getString(1);
			}
		}catch (Exception e){
		
		}
		
		
		
	%>
		<div class="col-md-3 comopasser-top" >
		

			<a href="single.html"><img src="images/15.jpg" class="img-responsive" alt=""></a>
			<a class="gos_btn gamsbtn" href="http://localhost:8080/web/article_list.jsp?board_id=<%=board_id%>"><%= board %></a>
			<div class="comopasser-bottom" style="width:260px;height:280px">
				<h3><a href="single.html"><%= title %> </a></h3>
				<p><%= arti_txt %></p>
				<div class="curtir">
					<li><%= username %></li>
					<li><a class="cap" href="#"><i class="fas fa-comment-dots"></i><%= view_num %></a></li>
				</div>
			</div>
		</div>
	
	<%
	}
	}catch (Exception e){
	
	}
	%>
	
	
	
<!-- 			<div class="col-md-3 comopasser-top"> -->
<!-- 				<a href="single.html"><img src="images/15.jpg" class="img-responsive" alt=""></a> -->
<!-- 				<a class="gos_btn anasbtn" href="single.html">Games</a> -->
<!-- 				<div class="comopasser-bottom"> -->
<!-- 					<h3><a href="single.html">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h3> -->
<!-- 					<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p> -->
<!-- 					<div class="curtir"> -->
<!-- 						<li>Paulo Ricardo</li> -->
<!-- 						<li><a class="cap" href="#"><i class="fas fa-comment-dots"></i>253</a></li> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-3 comopasser-top"> -->
<!-- 				<a href="single.html"><img src="images/15.jpg" class="img-responsive" alt=""></a> -->
<!-- 				<a class="gos_btn avisbtn" href="single.html">Games</a> -->
<!-- 				<div class="comopasser-bottom"> -->
<!-- 					<h3><a href="single.html">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h3> -->
<!-- 					<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p> -->
<!-- 					<div class="curtir"> -->
<!-- 						<li>Paulo Ricardo</li> -->
<!-- 						<li><a class="cap" href="#"><i class="fas fa-comment-dots"></i>253</a></li> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-3 comopasser-top"> -->
<!-- 				<a href="single.html"><img src="images/15.jpg" class="img-responsive" alt=""></a> -->
<!-- 				<a class="gos_btn cinmsbtn" href="single.html">Games</a> -->
<!-- 				<div class="comopasser-bottom"> -->
<!-- 					<h3><a href="single.html">Xbox Series X 主機將如期在年底上市 但部分遊戲可能延期</a></h3> -->
<!-- 					<p>目前微軟確定將會在美國東岸時間5月7日上午11點展示以Xbox Series X硬體實際執行的遊戲畫面，預期也能確認屆時會有哪些遊戲作品登上Xbox Series X。</p> -->
<!-- 					<div class="curtir"> -->
<!-- 						<li>Paulo Ricardo</li> -->
<!-- 						<li><a class="cap" href="#"><i class="fas fa-comment-dots"></i>253</a></li> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- comopasser -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<p>本站所刊載之圖文內容等版權皆屬原作者所有，非經同意請勿轉載<br />Copyright &copy; 線上交流平台×討論版 All Rights Reserved.</p>
			<!--<div class="social">
				<ul>
					<li><a href="#"><i class="facebk1"> </i></a></li>
					<li><a href="#"><i class="twiter1"> </i></a></li>
					<li><a href="#"><i class="rss"> </i></a></li>
					<li><a href="#"><i class="gopl"> </i></a></li>
					<li><a href="#"><i class="flik"> </i></a></li>
					<li><a href="#"><i class="drible"> </i></a></li>
					<li><a href="#"><i class="in"> </i></a></li>
					<li><a href="#"><i class="pp1"> </i></a></li>
					<div class="clearfix"></div>
				</ul>
			</div>-->
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- footer -->
</body>
</html>