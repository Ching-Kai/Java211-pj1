<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, java.util.*, sql_connection.Connection_sql, admin.other.Search_count, java.util.Date, java.io.*, java.text.*"%>
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
<title>Insert title here</title>
	<%@include file="head.jsp"%><!--CSS及JQ-->
	<link href="css/style_page.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body class="page article_in">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
                <%
				String board_id = request.getParameter("board_id");
				String arti_id = request.getParameter("arti_id");
				if(board_id == null || arti_id == null)
					%>
					<script>
						alert("發生錯誤!!");
						location.href='index.jsp';
					</script>
					<%
				String sql="";
				try {
					sql = "select * from (select * from article where board_id="+board_id+" ";
					sql += "and arti_id="+arti_id+") article inner join board using(board_ID) ";
					sql += "inner join user using(user_id) group by arti_id";
					result = stm.executeQuery(sql);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
                %>
            <div class="col-md-9 posta">
				<%		

	        		Statement stm2 = con.createStatement();
	        		ResultSet result2 = conn.result;
	        		
					while(result.next()){
						String gender = result.getString("gender");
						if(gender.equals("man")){
							gender = "男";
						}else if(gender.equals("woman")){
							gender = "女";
						}else{
							gender = "錯誤!!";
						}
						
						//計算回覆數量
						try {
							result2 = stm2.executeQuery("select * from article_reply where arti_id="+result.getString("arti_id"));
							
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("查詢發生錯誤!");
						}
						
						int count = new Search_count().count(result2);

				%>
                <div class="article_storey">
                    <div class="author_box">
                        <div class="head_img"><img src="images/author/img_h.jpeg" title="talkabc123的大頭照" /></div>
                        <span class="auth_num">樓主</span>
                        <a class="author" href="?user_id=<%=result.getString("user_id") %>"><%=result.getString("account") %></a>
                        <span>暱稱<font><%=result.getString("username") %></font></span>
                        <span>性別<font><%=gender %></font></span>
                        <span>生日<font><%=result.getString("birthday") %></font></span>
                    </div>
                    <div class="article_box">
                        <div class="info_box">

                            <strong><%=result.getString("title") %></strong>
                            <div>
                                <span class="art_s"><a class="sort" href=""><%=result.getString("board_name") %></a></span>
                                <span class="art_num">
                                    <font><%=result.getString("arti_date") %></font>
                                    <%
                                    	//result = stm.executeQuery("select");
                                    %>
                                    <font><i class="far fa-comment"></i> <%=count %></font>
                                    <font>瀏覽人數 <%=result.getString("view_num") %></font>
                                </span>
                            </div>
                        </div>
                        <div class="article_txt">
                            <%=result.getString("arti_txt") %>
                        </div>
                        <div class="other_fun"><a title="跳轉至進階發文" href="arti_id=<%=result.getString("arti_id") %>"><i class="fas fa-comment-alt"></i> 回覆</a><span class="edit_but" title="修改文章"><i class="fas fa-pen"></i> 編輯<span class="edit_sele"><a href="">修改</a><a href="">刪除</a></span></span></div>
                        
				<%				
					}
					result2.close();
					result.close();
					stm.close();
						
				%>
                    </div>
                    <div class="clearfix"> </div>                    
                </div>
                
                <!--回覆-->
                <%
				try {
					result2 = stm2.executeQuery("select * from (select * from article_reply where arti_id="+arti_id+") article_reply inner join user using(user_id) group by reply_id");
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("查詢發生錯誤!");
				}
				int i=0;
				while(result2.next()){
				String gender = result2.getString("gender");
				if(gender.equals("man")){
					gender = "男";
				}else if(gender.equals("woman")){
					gender = "女";
				}else{
					gender = "錯誤!!";
				}
				i++;
                %>
                <div class="article_storey">
                    <div class="author_box">
                        <div class="head_img"><img src="images/author/img_h.jpeg" title="talkabc123的大頭照" /></div>
                        <span class="auth_num"><%=i %> 樓</span>
                        <a class="author" href="<%=result2.getString("user_id") %>"><%=result2.getString("account") %></a>
                        <span>暱稱<font><%=result2.getString("username") %></font></span>
                        <span>性別<font><%=gender %></font></span>
                        <span>生日<font><%=result2.getString("birthday") %></font></span>
                    </div>
                    <div class="article_box">
                        <div class="info_box">
                            <div>
                                <span class="art_num">
                                    <font>回覆日期：<%=result2.getString("reply_date") %></font>
                                </span>
                            </div>
                        </div>
                        <div class="article_txt">
                            <%=result2.getString("reply_txt") %>
                        </div>
                        <div class="other_fun"><a title="跳轉至進階發文" href="<%=result2.getString("reply_id") %>"><i class="fas fa-comment-alt"></i> 回覆</a></div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <%
				}
				result2.close();
				stm2.close();
				con.close();
                %>
                <!--回覆end-->
            </div>
            <jsp:include page="ide/right_side.jsp" /><!--右側篇幅 -->
            <div class="clearfix"> </div>
					<div class="p_index">
						<span><a href="#"><i class="fas fa-angle-left"></i></a></span>
						<ul>
							<li><a href="#">1</a></li>
						</ul>
						<span><a href="#"><i class="fas fa-angle-right"></i></a></span>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>

	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>