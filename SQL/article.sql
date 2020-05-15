CREATE database if not exists gossipboard CHARACTER SET utf8 collate utf8_general_ci;
USE gossipboard;
CREATE TABLE if not exists article(
	arti_id int(10) NOT NULL auto_increment primary key,
	title character(100) NOT NULL,
    arti_date timestamp NOT NULL default current_timestamp,
    arti_update timestamp NOT NULL on update current_timestamp,
	arti_file character(100),
    view_num int(10) default 0,
    board_id int(10) NOT NULL,
    user_id char(10) NOT NULL
    ) character set = utf8 collate = utf8_general_ci ;

    