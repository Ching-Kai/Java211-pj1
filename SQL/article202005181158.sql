SELECT * FROM gossipboard.article;
insert into article(title, arti_txt, view_num, board_id, user_id, arti_update) 
	values("《樂高旋風忍者 電影》即日起至 5 月 22 日開放限時免費下載 領取後將可永久保留",
			"TT Games 宣布",
            "1",
            "5",
            "20",current_timestamp);
update article set title="《碧藍幻想》x《偶像大師 灰姑娘女孩》第 8 彈合作活動「再次開始的天空之旅」開跑",
					arti_txt = "由 Cygames 開發營運的手機／網頁王道 RPG 遊戲" where arti_id="1";