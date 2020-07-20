CREATE database users;

USE users;

SET FOREIGN_KEY_CHECKS=0 
;

/* Create Tables */

CREATE TABLE `Bicycle`
(
	`serial` VARCHAR(20) NOT NULL,
	`state` VARCHAR(50) NULL,
	`owner_doc_type` INT NULL,
	`owner_doc_num` VARCHAR(50) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`serial` ASC)
)

;

CREATE TABLE `Bicycle_Photo`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`bicycle_serial` VARCHAR(50) NOT NULL,
	`url` VARCHAR(200) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Document_type`
(
	`id` INT NOT NULL,
	`description` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_Document_type` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `Role`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`description` VARCHAR(20) NULL,
	CONSTRAINT `PK_Table1` PRIMARY KEY (`id` ASC)
)

;

CREATE TABLE `User`
(
	`id` INT NULL,
	`name` VARCHAR(50) NULL,
	`username` VARCHAR(20) NULL,
	`role` INT NULL,
	`document_type` INT NOT NULL,
	`document number` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_User` PRIMARY KEY (`document_type` ASC, `document number` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `Bicycle` 
 ADD INDEX `IXFK_Bicycle_User` (`owner_doc_type` ASC)
;

ALTER TABLE `Bicycle` 
 ADD INDEX `IXFK_Bicycle_User_02` (`owner_doc_type` ASC, `owner_doc_num` ASC)
;

ALTER TABLE `Bicycle_Photo` 
 ADD INDEX `IXFK_Bicycle_Photos_Bicycle` (`bicycle_serial` ASC)
;

ALTER TABLE `User` 
 ADD INDEX `IXFK_User_Document_type` (`document_type` ASC)
;

ALTER TABLE `User` 
 ADD INDEX `IXFK_User_Role` (`role` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `Bicycle` 
 ADD CONSTRAINT `FK_Bicycle_User_02`
	FOREIGN KEY (`owner_doc_type`, `owner_doc_num`) REFERENCES `User` (`document_type`,`document number`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Bicycle_Photo` 
 ADD CONSTRAINT `FK_Bicycle_Photos_Bicycle`
	FOREIGN KEY (`bicycle_serial`) REFERENCES `Bicycle` (`serial`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User` 
 ADD CONSTRAINT `FK_User_Document_type`
	FOREIGN KEY (`document_type`) REFERENCES `Document_type` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `User` 
 ADD CONSTRAINT `FK_User_Role`
	FOREIGN KEY (`role`) REFERENCES `Role` (`id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1 
;
