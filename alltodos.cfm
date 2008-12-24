<cfsetting enablecfoutputonly="true">

<cfif session.user.admin>
	<cfset projects = application.project.get()>
<cfelse>
	<cfset projects = application.project.get(session.user.userid)>
</cfif>

<cfquery name="active_projects" dbtype="query">
	select * from projects where status = 'Active'
</cfquery>
<cfquery name="onhold_projects" dbtype="query">
	select * from projects where status = 'On-Hold'
</cfquery>
<cfquery name="arch_projects" dbtype="query">
	select * from projects where status = 'Archived'
</cfquery>
<cfif not projects.recordCount>
	<cfset QueryAddRow(projects)>
	<cfset QuerySetCell(projects, "projectID", "0")>
</cfif>
<cfset visible_project_list = "">
<cfloop query="projects">
	<cfif todos gt 0>
		<cfset visible_project_list = listAppend(visible_project_list,projectID)>
	</cfif>
</cfloop>
<cfset todos = application.todo.get('','','false','p.name,tl.title,t.task',session.assignedTo,visible_project_list,'','true')>
<cfset projectUsers = application.project.projectUsers(projectIDlist=visible_project_list)>
<cfif compare(session.assignedTo,'')>
	<cfset user = application.user.get(session.assignedTo)>
</cfif>

<!--- Loads header/footer --->
<cfmodule template="#application.settings.mapping#/tags/layout.cfm" templatename="main" title="#application.settings.app_title# &raquo; To-Dos">

<cfoutput>
<div id="container">
	<!--- left column --->
	<div class="left">
		<div class="main">

				<div class="header">
					<h2 class="todo"><cfif compare(session.assignedTo,'')>#user.firstName# #user.lastName#'s<cfelse>Everyone's</cfif> to-do items across all projects</h2>
				</div>
				<div class="content">
				 	<div class="wrapper">
					</cfoutput>

					<cfif todos.recordCount>
					 	
					<cfoutput>
					<div id="listWrapper">
					</cfoutput>
					
					<cfoutput query="todos" group="name">
						<h3 class="padtop padbottom list"><a href="project.cfm?p=#projectID#">#name#</a></h3>
						
						<table id="alltodos">	
							<cfoutput group="title">
								<cfquery name="todos_notcompleted" dbtype="query">
									select * from todos where todolistID = '#todolistID#' and completed IS NULL
								</cfquery>
								<cfif todos_notcompleted.recordCount>
								<tr>
									<td><a href="todos.cfm?p=#projectID#&t=#todolistID#">#title#</a></td>
									<td>
										<ul>
										<cfoutput>
										<li id="cb#todoID#"><input type="checkbox" name="todoID" value="#todoID#" onclick="all_mark_complete('#projectID#','#todolistID#','#todoID#');" /> #task#<cfif not compare(session.assignedTo,'') and compare(lastname,'')> <span class="g">(#firstName# #lastName#)</span></cfif></li>
										</cfoutput>
										</ul>							
									</td>
								</tr>
								</cfif>
							</cfoutput>

						</table>
						
					</cfoutput>
					
					<cfoutput>
					</div>
					</cfoutput>

					<cfelse>
						<cfoutput><div class="warn">There are no to-do items.</div></cfoutput> 	
					</cfif>					 	
					 	
					<cfoutput>
					</div>
				</div>
			
		</div>
		<div class="bottom">&nbsp;</div>
		<div class="footer">
			<cfinclude template="footer.cfm">
		</div>	  
	</div>

	<!--- right column --->
	<div class="right">

		<form action="#cgi.script_name#" method="post">
		<div class="b">Show to-dos assigned to:</div>
		<select name="assignedTo" onchange="this.form.submit();">
			<option value="">Anyone</a>
			<option value="#session.user.userid#"<cfif not compare(session.assignedTo,session.user.userID)> selected="selected"</cfif>>Me (#session.user.firstName# #session.user.lastName#)</a>
			<cfloop query="projectUsers">
				<cfif compare(session.user.userid,userID)>
				<option value="#userID#"<cfif not compare(session.assignedTo,userID)> selected="selected"</cfif>>#lastName#, #firstName#</option>
				</cfif>
			</cfloop>
		</select>
		</form><br />

		<cfif active_projects.recordCount>
		<div class="header"><h3>Your projects</h3></div>
		<div class="content">
			<ul>
				<cfloop query="active_projects">
					<li><a href="project.cfm?p=#projectID#">#name#</a></li>
				</cfloop>
			</ul>
		</div>
		</cfif>
		
		<cfif onhold_projects.recordCount>
		<div class="header"><h3>On-Hold projects</h3></div>
		<div class="content">
			<ul>
				<cfloop query="onhold_projects">
					<li><a href="project.cfm?p=#projectID#">#name#</a></li>
				</cfloop>
			</ul>
		</div>
		</cfif>
		
		<cfif arch_projects.recordCount>
		<div class="header"><h3>Archived projects</h3></div>
		<div class="content">
			<ul>
				<cfloop query="arch_projects">
					<li><a href="project.cfm?p=#projectID#">#name#</a></li>
				</cfloop>
			</ul>
		</div>
		</cfif>

	</div>
		
</div>
</cfoutput>

</cfmodule>

<cfsetting enablecfoutputonly="false">