/* UPGRADE FROM 2.3 */
/* pt_projects */
alter table
   pt_projects
add
   (
   reg_time NUMBER(1,0) NULL,
   tab_files NUMBER(1,0) NULL, 
   tab_issues NUMBER(1,0) NULL, 
   tab_msgs NUMBER(1,0) NULL, 
   tab_mstones NUMBER(1,0) NULL, 
   tab_svn NUMBER(1,0) NULL,
   tab_time NUMBER(1,0) NULL,
   tab_todos NUMBER(1,0) NULL
   );
update pt_projects set reg_time = 1 where reg_time IS NULL;
update pt_projects set tab_files = 1 where tab_files IS NULL;
update pt_projects set tab_issues = 1 where tab_issues IS NULL;
update pt_projects set tab_msgs = 1 where tab_msgs IS NULL;
update pt_projects set tab_mstones = 1 where tab_mstones IS NULL;
update pt_projects set tab_svn = 1 where tab_svn IS NULL;
update pt_projects set tab_time = 1 where tab_time IS NULL;
update pt_projects set tab_todos = 1 where tab_todos IS NULL;

/* pt_project_users */
alter table
   pt_project_users
add
   (
   time NUMBER(1,0) NULL
   );
update pt_project_users set timetrack = 0 where timetrack IS NULL;

/* pt_issues */
alter table
   pt_issues
add
   (
   componentID varchar2(35) NULL, 
   versionID varchar2(35) NULL,
   dueDate date
   );

CREATE TABLE  "PT_PROJECT_COMPONENTS" 
   (	"COMPONENTID" CHAR(35) NOT NULL ENABLE, 
	"PROJECTID" CHAR(35) NOT NULL ENABLE, 
	"COMPONENT" VARCHAR2(50), 
	 CONSTRAINT "PK_PT_PROJECT_COMPONENTS" PRIMARY KEY ("COMPONENTID") ENABLE
   )
/
CREATE TABLE  "PT_PROJECT_VERSIONS" 
   (	"VERSIONID" CHAR(35) NOT NULL ENABLE, 
	"PROJECTID" CHAR(35) NOT NULL ENABLE, 
	"VERSION" VARCHAR2(50), 
	 CONSTRAINT "PK_PT_PROJECT_VERSIONS" PRIMARY KEY ("VERSIONID") ENABLE
   )
/