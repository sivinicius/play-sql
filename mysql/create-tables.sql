DROP TABLE IF EXISTS todo_list.users;

CREATE TABLE IF NOT EXISTS todo_list.users (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL,
	`user_name` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT now(),
	`status` ENUM ('active', 'inactive') NOT NULL DEFAULT ('active'),
	`last_modified` DATETIME DEFAULT now() ON UPDATE  now(),
	PRIMARY KEY (id),
	UNIQUE INDEX id_UNIQUE (id ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

---------------------------------------------------------------------------

DROP TABLE IF EXISTS todo_list.people;

CREATE TABLE IF NOT EXISTS todo_list.people (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(255) NOT NULL,
	`last_name` VARCHAR(255) NOT NULL,
	`date_of_birth` DATE,
	`created_at` DATETIME NOT NULL DEFAULT now(),
  	PRIMARY KEY (id),
  	UNIQUE INDEX id_UNIQUE (id ASC),
  	CONSTRAINT `fk_people_user`
    	FOREIGN KEY (id)
    	REFERENCES todo_list.users (id)
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

---------------------------------------------------------------------------

