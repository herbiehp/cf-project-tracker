<cfsetting enablecfoutputonly="true">

<cfparam name="url.p" default="">
<cfparam name="url.t" default="">
<cfif session.user.admin>
	<cfset project = application.project.get(projectID=url.p)>
<cfelse>
	<cfset project = application.project.get(session.user.userid,url.p)>
</cfif>
<cfset projectUsers = application.project.projectUsers(url.p)>
<cfset todolist = application.todolist.get(url.p,url.tl)>
<cfset todo = application.todo.get(todoID=url.t)>
<cfset comments = application.comment.get(url.p,'todo',url.t)>

<!--- Loads header/footer --->
<cfmodule template="#application.settings.mapping#/tags/layout.cfm" templatename="main" title="#application.settings.app_title# &raquo; #project.name#" project="#project.name#" projectid="#url.p#" svnurl="#project.svnurl#">

<cfhtmlhead text='<script type="text/javascript">
	$(document).ready(function(){
		$(''.date-pick'').datepicker(); 
	});
</script>
'>

<cfoutput>
<a name="top"></a>
<div id="container">
<cfif project.recordCount>
	<!--- left column --->
	<div class="left">
		<div class="main">

				<div class="header">
					<cfif project.todos gt 1>
					<span class="rightmenu">
						<a href="todos.cfm?p=#url.p#&t=#url.tl#" class="back">View complete to-do list</a>
					</span>
					</cfif>
					
					<h2 class="comments">Comments on this to-do from <a href="todos.cfm?p=#url.p#&t=#url.tl#">#todolist.title#</a></h2>
				</div>
				<div class="content">
				 	<div class="wrapper">
					
					<h3 class="pl30"><input type="checkbox" name="todoID" id="c#url.t#" value="1" onclick="mark_todo('#url.t#','#url.tl#');"<cfif isDate(todo.completed)> checked="checked"</cfif> /> <span id="t#url.t#"><cfif isDate(todo.completed)><strike>#todo.task#</strike><cfelse>#todo.task#</cfif></span></h3>
					<h4 class="pl50"><cfif compare(todo.lastname,'')> <span class="g">#todo.firstName# #todo.lastName#</span></cfif><cfif isDate(todo.due)> - due on #DateFormat(todo.due,"mmm d, yyyy")#</cfif></h4>

					<a name="comments" />
					<div class="commentbar">Comments (<span id="cnum">#comments.recordCount#</span>)</div>

					<cfloop query="comments">
					<div id="#commentID#">
					<cfif userID eq session.user.userID>
					<a href="##" onclick="return delete_comment('#commentID#');"><img src="./images/delete.gif" height="16" width="16" border="0" style="float:right;padding:5px;" /></a>
					</cfif>
					<cfif application.isCF8 or application.isBD or application.isRailo>
					<img src="<cfif avatar>#application.settings.userFilesMapping#/avatars/#userID#_48.jpg<cfelse>./images/noavatar48.gif</cfif>" height="48" width="48" border="0" style="float:left;border:1px solid ##ddd;" />
					</cfif>
					<div class="commentbody">
					<span class="b">#firstName# #lastName#</span> said on #DateFormat(stamp,"ddd, mmm d")# at <cfif application.settings.clockHours eq 12>#TimeFormat(stamp,"h:mmtt")#<cfelse>#TimeFormat(stamp,"HH:mm")#</cfif><br />
					#commentText#
					</div>
					</div>
					</cfloop>						
					
					<cfif project.todos eq 2>
					<form action="#cgi.script_name#?#cgi.query_string#" method="post" name="add" id="add" class="frm" onsubmit="return confirm_comment();">
					<div class="b">Leave a comment...</div>
					<cfscript>
						basePath = 'includes/fckeditor/';
						fckEditor = createObject("component", "#basePath#fckeditor");
						fckEditor.instanceName	= "comment";
						fckEditor.value			= '';
						fckEditor.basePath		= basePath;
						fckEditor.width			= "100%";
						fckEditor.height		= 150;
						fckEditor.ToolbarSet	= "Basic";
						fckEditor.create(); // create the editor.
					</cfscript>
	
					<div id="preview" class="sm" style="display:none;margin:15px 0;">
					<fieldset style="padding:10px;"><legend style="padding:0 5px;font-weight:bold;font-size:1em;">Comment Preview (<a href="##" onclick="$('##preview').hide();">X</a>)</legend>
					<div id="commentbody"></div>
					</fieldset>
					</div>
	
					<input type="button" class="button" value="Preview" onclick="comment_preview();" /> or 
					<input type="submit" class="button" name="submit" value="Post Comment" />
					</form>
					</cfif>	





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
		<cfif compare(project.logo_img,'')>
			<img src="#application.settings.userFilesMapping#/projects/#project.logo_img#" border="0" alt="#project.name#" /><br />
		</cfif>
			
		<div class="header"><h3>Comment Notification</h3></div>
		<div class="content">
			<ul>
				
			</ul>
			<p>If you post a comment, you'll automatically be<br />subscribed to receive email notifications.</p>
		</div>
	</div>
<cfelse>
	<div class="alert">Project Not Found.</div>
</cfif>
</div>
</cfoutput>

</cfmodule>

<cfsetting enablecfoutputonly="false">