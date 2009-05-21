/*Table structure for table `pt_activity` */

CREATE TABLE `pt_activity` (
  `activityID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `userID` char(35) NOT NULL,
  `type` varchar(12) default NULL,
  `id` char(35) NOT NULL,
  `name` varchar(100) default NULL,
  `activity` varchar(50) default NULL,
  `stamp` datetime default NULL,
  PRIMARY KEY  (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_carriers` */

CREATE TABLE `pt_carriers` (
  `carrierID` char(35) NOT NULL,
  `carrier` varchar(20) default NULL,
  `countryCode` varchar(2) default NULL,
  `country` varchar(20) default NULL,
  `prefix` varchar(3) default NULL,
  `suffix` varchar(40) default NULL,
  `active` tinyint(1) default NULL,
  PRIMARY KEY  (`carrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_categories` */

CREATE TABLE `pt_categories` (
  `projectID` char(35) NOT NULL,
  `categoryID` char(35) NOT NULL,
  `type` varchar(5) default NULL,
  `category` varchar(80) default NULL,
  PRIMARY KEY  (`projectID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_client_rates` */

CREATE TABLE `pt_client_rates` (
  `rateID` char(35) NOT NULL,
  `clientID` char(35) NOT NULL,
  `category` varchar(150) default NULL,
  `rate` decimal(6,2) default NULL,  
  PRIMARY KEY  (`rateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_clients` */

CREATE TABLE `pt_clients` (
  `clientID` char(35) NOT NULL,
  `name` varchar(150) default NULL,
  `address` text default NULL,
  `city` varchar(150) default NULL,
  `locality` varchar(200) default NULL,
  `country` varchar(35) default NULL,
  `postal` varchar(40) default NULL,
  `phone` varchar(40) default NULL,
  `fax` varchar(40) default NULL,
  `contactName` varchar(60) default NULL,
  `contactPhone` varchar(40) default NULL,
  `contactEmail` varchar(150) default NULL,
  `website` varchar(150) default NULL,
  `notes` text default NULL,
  `active` tinyint(1) default NULL,
  PRIMARY KEY  (`clientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_comments` */

CREATE TABLE `pt_comments` (
  `commentID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `type` varchar(6) default NULL,
  `itemID` char(35) default NULL,
  `userID` char(35) NOT NULL,
  `commentText` text default NULL,
  `stamp` datetime default NULL,
  PRIMARY KEY  (`commentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_files` */

CREATE TABLE `pt_files` (
  `fileID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `title` varchar(200) default NULL,
  `description` text default NULL,
  `categoryID` char(35) NOT NULL,  
  `filename` varchar(150) default NULL,
  `serverfilename` varchar(150) default NULL,
  `filetype` varchar(4) default NULL,
  `filesize` int(9) default NULL,
  `uploaded` datetime default NULL,
  `uploadedBy` char(35) NOT NULL,
  PRIMARY KEY  (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_file_attach` */

CREATE TABLE `pt_file_attach` (
  `itemID` char(35) NOT NULL,
  `fileID` char(35) NOT NULL,
  `type` varchar(6) NOT NULL,
  PRIMARY KEY  (`itemID`,`fileID`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_issues` */

CREATE TABLE `pt_issues` (
  `issueID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `milestoneID` varchar(35) default NULL,
  `shortID` varchar(7) default NULL,
  `issue` varchar(120) default NULL,
  `detail` text default NULL,
  `type` varchar(11) default NULL,
  `severity` varchar(10) default NULL,
  `status` varchar(8) default NULL,
  `relevantURL` varchar(255) default NULL,
  `created` datetime default NULL,
  `createdBy` char(35) NOT NULL,
  `assignedTo` varchar(35) default NULL,
  `updated` datetime default NULL,
  `updatedBy` varchar(35) default NULL,
  `resolution` varchar(12) default NULL,
  `resolutionDesc` text default NULL,
  `componentID` varchar(35) default NULL,
  `versionID` varchar(35) default NULL,
  `dueDate` datetime default NULL,
  PRIMARY KEY  (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_message_notify` */

CREATE TABLE `pt_message_notify` (
  `messageID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `userID` char(35) NOT NULL,
  PRIMARY KEY  (`messageID`,`projectID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_messages` */

CREATE TABLE `pt_messages` (
  `messageID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `milestoneID` varchar(35) default NULL,
  `userID` char(35) NOT NULL,
  `title` varchar(120) default NULL,
  `message` text default NULL,
  `categoryID` char(35) NOT NULL,
  `allowcomments` tinyint(1) default NULL,
  `stamp` datetime default NULL,
  PRIMARY KEY  (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_milestones` */

CREATE TABLE `pt_milestones` (
  `milestoneID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `userID` char(35) NOT NULL,
  `forID` varchar(35) default NULL,
  `name` varchar(50) default NULL,
  `description` text default NULL,
  `dueDate` datetime default NULL,
  `completed` datetime default NULL,
  `rate` decimal(8,2) default NULL,  
  `billed` int(1) default NULL,
  `paid` int(1) default NULL,
  PRIMARY KEY  (`milestoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_project_components` */

CREATE TABLE `pt_project_components` (
  `componentID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `component` varchar(50) default NULL,
  PRIMARY KEY  (`componentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_project_users` */

CREATE TABLE `pt_project_users` (
  `userID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `admin` tinyint(1) default NULL,
  `file_view` int(1) default NULL,
  `file_edit` int(1) default NULL,
  `file_comment` int(1) default NULL,  
  `issue_view` int(1) default NULL,
  `issue_edit` int(1) default NULL,
  `issue_assign` int(1) default NULL,
  `issue_resolve` int(1) default NULL,
  `issue_close` int(1) default NULL,
  `issue_comment` int(1) default NULL,
  `msg_view` int(1) default NULL,
  `msg_edit` int(1) default NULL,
  `msg_comment` int(1) default NULL,
  `mstone_view` int(1) default NULL,
  `mstone_edit` int(1) default NULL,
  `mstone_comment` int(1) default NULL,
  `todolist_view` int(1) default NULL,
  `todolist_edit` int(1) default NULL,
  `todo_edit` int(1) default NULL,
  `todo_comment` int(1) default NULL,
  `time_view` int(1) default NULL,
  `time_edit` int(1) default NULL,
  `bill_view` int(1) default NULL,
  `bill_edit` int(1) default NULL,
  `bill_rates` int(1) default NULL,
  `bill_invoices` int(1) default NULL,
  `bill_markpaid` int(1) default NULL,
  `svn` int(1) default NULL,
  PRIMARY KEY  (`userID`,`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_project_versions` */

CREATE TABLE `pt_project_versions` (
  `versionID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `version` varchar(50) default NULL,
  PRIMARY KEY  (`versionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_projects` */

CREATE TABLE `pt_projects` (
  `projectID` char(35) NOT NULL,
  `ownerID` char(35) NULL,
  `clientID` varchar(35) NULL,
  `name` varchar(50) default NULL,
  `description` text default NULL,
  `display` tinyint(1) default NULL,
  `ticketPrefix` varchar(20) default NULL,
  `added` datetime default NULL,
  `addedBy` char(35) NOT NULL,
  `status` varchar(8) default NULL,
  `svnurl` varchar(100) default NULL,
  `svnuser` varchar(20) default NULL,
  `svnpass` varchar(20) default NULL,
  `logo_img` varchar(150) default NULL,
  `allow_reg` tinyint(1) default NULL,
  `reg_file_view` int(1) default NULL,
  `reg_file_edit` int(1) default NULL,
  `reg_file_comment` int(1) default NULL,
  `reg_issue_view` int(1) default NULL,
  `reg_issue_edit` int(1) default NULL,
  `reg_issue_assign` int(1) default NULL,
  `reg_issue_resolve` int(1) default NULL,
  `reg_issue_close` int(1) default NULL,
  `reg_issue_comment` int(1) default NULL,
  `reg_msg_view` int(1) default NULL,
  `reg_msg_edit` int(1) default NULL,
  `reg_msg_comment` int(1) default NULL,
  `reg_mstone_view` int(1) default NULL,
  `reg_mstone_edit` int(1) default NULL,
  `reg_mstone_comment` int(1) default NULL,
  `reg_time_view` int(1) default NULL,
  `reg_time_edit` int(1) default NULL,
  `reg_todolist_view` int(1) default NULL,
  `reg_todolist_edit` int(1) default NULL,
  `reg_todo_edit` int(1) default NULL,
  `reg_todo_comment` int(1) default NULL,
  `reg_bill_view` int(1) default NULL,
  `reg_bill_edit` int(1) default NULL,
  `reg_bill_rates` int(1) default NULL,
  `reg_bill_invoices` int(1) default NULL,
  `reg_bill_markpaid` int(1) default NULL,
  `reg_svn` int(1) default NULL,
  `tab_billing` int(1) default NULL,
  `tab_files` int(1) default NULL,
  `tab_issues` int(1) default NULL,
  `tab_msgs` int(1) default NULL,
  `tab_mstones` int(1) default NULL,
  `tab_svn` int(1) default NULL,
  `tab_time` int(1) default NULL,
  `tab_todos` int(1) default NULL,
  `issue_svn_link` int(1) default NULL,
  `issue_timetrack` int(1) default NULL,
  PRIMARY KEY  (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_screenshots` */

CREATE TABLE `pt_screenshots` (
  `fileID` char(35) NOT NULL,
  `issueID` char(35) NOT NULL,
  `title` varchar(200) default NULL,
  `description` text default NULL,
  `filename` varchar(150) default NULL,
  `serverfilename` varchar(150) default NULL,
  `filetype` varchar(4) default NULL,
  `filesize` int(9) default NULL,
  `uploaded` datetime default NULL,
  `uploadedBy` char(35) NOT NULL,
  PRIMARY KEY  (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_settings` */

CREATE TABLE `pt_settings` (
  `settingID` char(35) NOT NULL,
  `setting` varchar(50) default NULL,
  `settingValue` varchar(250) default NULL,
  PRIMARY KEY  (`settingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_svn_link` */

CREATE TABLE `pt_svn_link` (
  `linkID` char(35) NOT NULL,
  `projectID` char(35) default NULL,
  `revision` int(5) default NULL,
  `itemID` char(35) default NULL,
  `itemType` varchar(10) default NULL,
  PRIMARY KEY  (`linkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_timetrack` */

CREATE TABLE `pt_timetrack` (
  `timetrackID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `userID` char(35) NOT NULL,
  `dateStamp` datetime default NULL,  
  `hours` decimal(6,2) default NULL,  
  `description` varchar(255) default NULL,
  `itemID` varchar(35) default NULL,
  `itemType` varchar(10) default NULL,
  `rateID` varchar(35) default NULL,
  `billed` int(1) default NULL,
  `paid` int(1) default NULL,
  PRIMARY KEY  (`timetrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_todolists` */

CREATE TABLE `pt_todolists` (
  `todolistID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `title` varchar(100) default NULL,
  `description` text default NULL,
  `milestoneID` varchar(35) default NULL,
  `userID` char(35) NOT NULL,
  `added` datetime default NULL,
  `rank` tinyint(3) default NULL,
  `timetrack` int(1) default NULL,
  PRIMARY KEY  (`todolistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_todos` */

CREATE TABLE `pt_todos` (
  `todoID` char(35) NOT NULL,
  `todolistID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `userID` char(35) NOT NULL,
  `task` varchar(600) default NULL,
  `rank` int(3) default NULL,
  `added` datetime default NULL,
  `due` datetime default NULL,
  `completed` datetime default NULL,
  PRIMARY KEY  (`todoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_user_notify` */

CREATE TABLE `pt_user_notify` (
  `userID` char(35) NOT NULL,
  `projectID` char(35) NOT NULL,
  `email_file_new` tinyint(1) default NULL,
  `mobile_file_new` tinyint(1) default NULL,
  `email_file_upd` tinyint(1) default NULL,
  `mobile_file_upd` tinyint(1) default NULL,
  `email_file_com` tinyint(1) default NULL,
  `mobile_file_com` tinyint(1) default NULL,
  `email_issue_new` tinyint(1) default NULL,
  `mobile_issue_new` tinyint(1) default NULL,
  `email_issue_upd` tinyint(1) default NULL,
  `mobile_issue_upd` tinyint(1) default NULL,
  `email_issue_com` tinyint(1) default NULL,
  `mobile_issue_com` tinyint(1) default NULL,
  `email_msg_new` tinyint(1) default NULL,
  `mobile_msg_new` tinyint(1) default NULL,
  `email_msg_upd` tinyint(1) default NULL,
  `mobile_msg_upd` tinyint(1) default NULL,
  `email_msg_com` tinyint(1) default NULL,
  `mobile_msg_com` tinyint(1) default NULL,
  `email_mstone_new` tinyint(1) default NULL,
  `mobile_mstone_new` tinyint(1) default NULL,
  `email_mstone_upd` tinyint(1) default NULL,
  `mobile_mstone_upd` tinyint(1) default NULL,
  `email_mstone_com` tinyint(1) default NULL,
  `mobile_mstone_com` tinyint(1) default NULL,
  `email_todo_new` tinyint(1) default NULL,
  `mobile_todo_new` tinyint(1) default NULL,
  `email_todo_upd` tinyint(1) default NULL,
  `mobile_todo_upd` tinyint(1) default NULL,
  `email_todo_com` tinyint(1) default NULL,
  `mobile_todo_com` tinyint(1) default NULL,
  `email_time_new` tinyint(1) default NULL,
  `mobile_time_new` tinyint(1) default NULL,
  `email_time_upd` tinyint(1) default NULL,
  `mobile_time_upd` tinyint(1) default NULL,
  `email_bill_new` tinyint(1) default NULL,
  `mobile_bill_new` tinyint(1) default NULL,
  `email_bill_upd` tinyint(1) default NULL,
  `mobile_bill_upd` tinyint(1) default NULL,
  `email_bill_paid` tinyint(1) default NULL,
  `mobile_bill_paid` tinyint(1) default NULL,
  PRIMARY KEY  (`userID`,`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `pt_users` */

CREATE TABLE `pt_users` (
  `userID` char(35) NOT NULL,
  `firstName` varchar(12) default NULL,
  `lastName` varchar(20) default NULL,
  `username` varchar(50) default NULL,
  `password` char(32) default NULL,
  `email` varchar(120) default NULL,
  `phone` varchar(15) default NULL,
  `mobile` varchar(15) default NULL,
  `carrierID` varchar(35) default NULL,
  `lastLogin` datetime default NULL,
  `avatar` tinyint(1) default NULL,
  `style` varchar(20) default NULL,
  `admin` tinyint(1) default NULL,
  `active` tinyint(1) default NULL,
  PRIMARY KEY  (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Add admin & guest users */
INSERT INTO `pt_users` (userID,firstName,lastName,username,password,style,avatar,admin,active) values('FCDCF4CD-16E6-58DE-13EDC6A2B362B22C','Admin','User','admin','21232F297A57A5A743894A0E4A801FC3','blue',0,1,1);
INSERT INTO `pt_users` (userID,firstName,lastName,username,password,style,avatar,admin,active) values('7F16CA08-1372-7975-6F7F9DA33EBD6A09','Guest','User','guest','084E0343A0486FF05530DF6C705C8BB4','blue',0,0,1);

/*Add default settings */
INSERT INTO `pt_settings` values ('FC3D187C-16E6-58DE-133C5098C58225D3','app_title','Project Tracker');
INSERT INTO `pt_settings` values ('FC3D861A-16E6-58DE-1346E4E01F578F52','default_style','blue');
INSERT INTO `pt_settings` values ('E59DED9F-1372-7975-6FCD9DFAE904B617','enable_api','0');
INSERT INTO `pt_settings` values ('E5A50225-1372-7975-6F9777FB42FD45E6','api_key','');
INSERT INTO `pt_settings` values ('50ED062A-16E6-58DE-13EF9FEB2312EE8C','email_subject_prefix','');
INSERT INTO `pt_settings` values ('50ED2D69-16E6-58DE-130067F4C29ABF35','sms_subject_prefix','');
INSERT INTO `pt_settings` values ('1E5ED63A-C938-2FE9-C60035D81F955266','company_name','');
INSERT INTO `pt_settings` values ('1E77669A-963D-735E-C7C22FA82FABC398','company_logo','');
INSERT INTO `pt_settings` values ('5D717D09-1372-7975-6F21844EACDAFC54','invoice_logo','');
INSERT INTO `pt_settings` values ('3D72D1F7-CD23-8BE3-60F9614093F89CCF','hourly_rate','');

/*Add carriers */
INSERT INTO `pt_carriers` values('8464AB28-1372-7975-6F2E9747CA6E4693','AT&T','US','United States','','@txt.att.net',1);
INSERT INTO `pt_carriers` values('8464DE00-1372-7975-6FE886FCD149E667','Boost','US','United States','','@myboostmobile.com',1);
INSERT INTO `pt_carriers` values('84653DF3-1372-7975-6F03DA67DD9FB6A9','Cingular','US','United States','','@txt.att.net',1);
INSERT INTO `pt_carriers` values('846562C1-1372-7975-6F0D79371C491F0C','Helio','US','United States','','@messaging.sprintpcs.com',1);
INSERT INTO `pt_carriers` values('846589B2-1372-7975-6F34C8F27502E0DE','Nextel','US','United States','','@messaging.nextel.com',1);
INSERT INTO `pt_carriers` values('8465AECE-1372-7975-6FAEBDD9F3DDB156','Sprint','US','United States','','@messaging.sprintpcs.com',1);
INSERT INTO `pt_carriers` values('846F02F5-1372-7975-6F6C106050F904CD','T-Mobile','US','United States','','@tmomail.net',1);
INSERT INTO `pt_carriers` values('8465D060-1372-7975-6F83333D63966358','Verizon','US','United States','','@vtext.com',1);
INSERT INTO `pt_carriers` values('8465FEC3-1372-7975-6F5CA6C75C25C7D4','Virgin USA','US','United States','','@vmobl.com',1);
INSERT INTO `pt_carriers` values('84662779-1372-7975-6F8F1751F5B64D4E','Aliant Mobility','CA','Canada','','@chat.wirefree.ca',1);
INSERT INTO `pt_carriers` values('846652B0-1372-7975-6F46C791E680C346','Bell Mobility','CA','Canada','','@txt.bellmobility.ca',1);
INSERT INTO `pt_carriers` values('84667ED1-1372-7975-6F97CD40347FC5CB','Fido','CA','Canada','','@fido.ca',1);
INSERT INTO `pt_carriers` values('8466BB0F-1372-7975-6F6ABCC0603EE274','MTS','CA','Canada','','@text.mtsmobility.com',1);
INSERT INTO `pt_carriers` values('8466DE85-1372-7975-6F261B5E9D329B92','Rogers','CA','Canada','','@pcs.rogers.com',1);
INSERT INTO `pt_carriers` values('8466FEFD-1372-7975-6F8EA4D54A0C57F3','SaskTel','CA','Canada','','@sms.sasktel.com',1);
INSERT INTO `pt_carriers` values('84672060-1372-7975-6F8456BEBA71E39A','Solo Mobile','CA','Canada','','@txt.bell.ca',1);
INSERT INTO `pt_carriers` values('84675A6C-1372-7975-6F496C2375ED2815','TELUS','CA','Canada','','@msg.telus.com',1);
INSERT INTO `pt_carriers` values('84677BCF-1372-7975-6F89C8D24436A08A','Virgin Canada','CA','Canada','','@vmobile.ca',1);
INSERT INTO `pt_carriers` values('8467A2B0-1372-7975-6FEB7589919DC435','O2','UK','United Kingdom','','@mmail.co.uk',1);