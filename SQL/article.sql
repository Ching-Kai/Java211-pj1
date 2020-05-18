CREATE TABLE if not exists article(
	arti_id int(10) NOT NULL auto_increment primary key,
	title character(100) NOT NULL,
    arti_date timestamp NOT NULL default current_timestamp,
    arti_update timestamp NOT NULL on update current_timestamp,
	arti_txt nvarchar(100),
    view_num int(10) default 0,
    board_id int(10) NOT NULL,
    user_id char(10) NOT NULL
    ) character set = utf8 collate = utf8_general_ci ;

CREATE TABLE if not exists article_reply(
	reply_id int(10) NOT NULL auto_increment primary key,
	reply_txt nvarchar(100),
    reply_date timestamp NOT NULL default current_timestamp,
    reply_update timestamp NOT NULL on update current_timestamp,
    arti_id int(10) NOT NULL,
    user_id char(10) NOT NULL
    ) character set = utf8 collate = utf8_general_ci ;
    
CREATE TABLE if not exists user(
  `account_ID` INT NOT NULL AUTO_INCREMENT,
  `account` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `account_right` VARCHAR(45) NOT NULL DEFAULT 'G',
  PRIMARY KEY (`account_ID`),
  UNIQUE INDEX `account_UNIQUE` (`account` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 collate = utf8_general_ci ;

CREATE TABLE  if not exists board(
  `board_ID` INT NOT NULL AUTO_INCREMENT,
  `board_name` VARCHAR(45) NULL,
  PRIMARY KEY (`board_ID`),
  UNIQUE INDEX `board_name_UNIQUE` (`board_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8 collate = utf8_general_ci ;