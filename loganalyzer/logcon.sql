
SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE
IF
	EXISTS `logcon_dbmappings`;
CREATE TABLE `logcon_dbmappings` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`DisplayName` VARCHAR ( 64 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`Mappings` VARCHAR ( 1024 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	PRIMARY KEY ( `ID` ) USING BTREE 
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER 
SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;
INSERT INTO `logcon_dbmappings`
VALUES
	( 1, 'SYSLOG_IP', 'Array,uID=>id,timereported=>devicereportedtime,FROMHOST=>fromhost,FromIP=>fromip,IUT=>infounitid,msg=>message,syslogfacility=>facility,syslogseverity=>priority,syslogtag=>syslogtag,procid=>processid,id=>eventid,NTEventLogType=>eventlogtype,sourceproc=>eventsource,category=>eventcategory,user=>eventuser,misc_systenid=>systemid,misc_checksum=>checksum' );
DROP TABLE
IF
	EXISTS `logcon_fields`;
CREATE TABLE `logcon_fields` (
	`FieldID` VARCHAR ( 64 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`FieldDefine` VARCHAR ( 64 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`FieldCaption` VARCHAR ( 255 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`FieldType` INT NOT NULL,
	`Sortable` TINYINT ( 1 ) NOT NULL DEFAULT 0,
	`DefaultWidth` INT NOT NULL,
	`FieldAlign` VARCHAR ( 32 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`SearchField` VARCHAR ( 64 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`SearchOnline` TINYINT ( 1 ) NOT NULL,
	`Trunscate` INT NOT NULL,
	PRIMARY KEY ( `FieldID` ) USING BTREE 
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER 
SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'This table stores custom fields' ROW_FORMAT = Dynamic;
INSERT INTO `logcon_fields`
VALUES
	( 'FromIP', 'SYSLOG_FROMIP', 'IP', 0, 0, 50, 'center', 'IP', 0, 30 );
DROP TABLE
IF
	EXISTS `logcon_views`;
CREATE TABLE `logcon_views` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`DisplayName` VARCHAR ( 255 ) CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`Columns` TEXT CHARACTER 
	SET latin1 COLLATE latin1_swedish_ci NOT NULL,
	`userid` INT NULL DEFAULT NULL,
	`groupid` INT NULL DEFAULT NULL,
	PRIMARY KEY ( `ID` ) USING BTREE 
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER 
SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Stores custom defined user views.' ROW_FORMAT = Dynamic;
INSERT INTO `logcon_views`
VALUES
	( 1, 'SYSLOG_IP', 'timereported, syslogfacility, syslogseverity, FROMHOST, FromIP, syslogtag, procid, IUT, msg', NULL, NULL );

SET FOREIGN_KEY_CHECKS = 1;
UPDATE loganalyzer.logcon_config 
SET propvalue = "utf-8" 
WHERE
	propname = "HeaderDefaultEncoding";