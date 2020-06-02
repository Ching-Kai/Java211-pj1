<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp"
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
<script type="text/javascript" src="js/fun.js"></script>
</head>
<body class="page article_in">
	<jsp:include page="header.jsp" /><!--頁頭-->
	<div class="indica">
		<div class="container">
                <%
				
                //會員session
        		Object acc_ID = session.getAttribute("account");
				Object acc_user_id = session.getAttribute("user_id");
				String sql="";
				String board_id = request.getParameter("board_id");
				String arti_id = request.getParameter("arti_id");

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
	        		int count=0;
	        		String view_sum = "";
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
							result2 = stm2.executeQuery("select * from article_reply inner join user using(user_id) where arti_id="+result.getString("arti_id"));
							
						} catch (Exception e) {
							e.printStackTrace();
							System.out.println("查詢發生錯誤!");
						}
						
						count = new Search_count().count(result2);
						view_sum = result.getString("view_num");
						

				%>
                <div class="article_storey">
                    <div class="author_box col-md-3">
                        <div class="head_img"><img src="images/author/img_h.jpeg" title="talkabc123的大頭照" /></div>
                        <span class="auth_num">樓主</span>
                        <a class="author" href="javascript: void(0)"><%=result.getString("account") %></a>
                        <span>暱稱<font><%=result.getString("username") %></font></span>
                        <span>性別<font><%=gender %></font></span>
                        <span>生日<font><%=result.getString("birthday") %></font></span>
                    </div>
                    <div class="article_box col-md-9">
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
                                    <font>瀏覽人數 <%=view_sum %></font>
                                </span>
                            </div>
                        </div>
                        <div class="article_txt">
                            <%=result.getString("arti_txt") %>
                        </div>
                        <div class="other_fun">
                        	<a title="跳轉至進階發文" href="article_reply.jsp?arti_id=<%=result.getString("arti_id") %>&board_id=<%=board_id %>"><i class="fas fa-comment-alt"></i> 回覆</a>
                        	<% 
                        		String acc_id= result.getString("account");
                    			String user_id= result.getString("user_id");
                        		if(acc_id.equals((String)acc_ID) && user_id.equals((String)acc_user_id)) {
                        			%>
                        			<span class="edit_but" title="修改文章"><i class="fas fa-pen"></i> 編輯<span class="edit_sele">
                        				<a href="article_edit.jsp?arti_id=${param.arti_id}&board_id=<%=board_id %>">修改文章</a>
                        				<a href="javascript:void(0);" onclick="cofirm_mes('確定要刪除嗎?', 'MemberArticleDelete?arti_id=${param.arti_id}&board_id=<%=board_id %>')">刪除文章</a></span>
                        			</span>
                        			<%
                        		}
                        	%>
                        
                        </div>
                        
				<%				
					}
					result2.close();
					result.close();
					stm.close();

	                HttpSession $session = request.getSession();
	                Object se = $session.getAttribute("arti"+arti_id);
                	int n = Integer.valueOf(view_sum);
                	
                	//清除瀏覽過的文章session
                	//request.getSession().removeValue("arti"+arti_id);
	                if(se==null){
	                	n = Integer.valueOf(view_sum);
	                	sql ="update article set view_num = "+(n+=1) +" where arti_id="+arti_id;
	                	PreparedStatement upstm = con.prepareStatement(sql);
	                	upstm.executeUpdate();
	                	upstm.close();
	                	//設定文章session
	                    request.getSession().setAttribute("arti"+arti_id, arti_id);
	                }
						
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
                    <div class="author_box col-md-3">
                        <div class="head_img"><img src="images/author/img_h.jpeg" title="talkabc123的大頭照" /></div>
                        <span class="auth_num"><%=i %> 樓</span>
                        <a class="author" href="<%=result2.getString("user_id") %>"><%=result2.getString("account") %></a>
                        <span>暱稱<font><%=result2.getString("username") %></font></span>
                        <span>性別<font><%=gender %></font></span>
                        <span>生日<font><%=result2.getString("birthday") %></font></span>
                    </div>
                    <div class="article_box col-md-9">
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
                        <div class="other_fun"><a title="跳轉至進階發文" href='article_reply.jsp?arti_id=<%=arti_id %>&board_id=<%=board_id %>&reply_id=<%=result2.getString("reply_id") %>&user_id=<%=result2.getString("user_id") %>'><i class="fas fa-comment-alt"></i> 回覆</a>
                        <% 
                        		String user_id = result2.getString("user_id");
                				String reply_id = result2.getString("reply_id");
                        		if(user_id.equals((String)acc_user_id)) {
                        			%>                        			
                        			<span class="edit_but" title="修改文章"><i class="fas fa-pen"></i> 編輯
                        				<span class="edit_sele">
                        					<a href="article_editply.jsp?arti_id=<%=arti_id %>&reply_id=<%=reply_id %>&board_id=<%=board_id %>">修改回覆</a>
                        					<a href="javascript:void(0);" onclick="cofirm_mes('確定要刪除嗎?', 'MemberArticleReplyDelete?arti_id=${param.arti_id}&board_id=<%=board_id %>&reply_id=<%=reply_id %>')">刪除回覆</a></span>
                        				</span>
                        			</span>
                        			<%
                        		}
                        %>
                        </div>
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
	<jsp:include page="foot.jsp" /><!--頁尾 -->
</body>
</html>