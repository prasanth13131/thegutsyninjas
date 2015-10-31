<%@ page import="com.thegutsyninjas.*" %>

<%
  DBOperation db = new DBOperation();
String engid=request.getParameter("enggid");
int activecounts=db.getActiveCustomersCount(engid);
int queuecounts=db.getQueueCustomersCount(engid);
int newcounts=db.getNewCustomersCount(engid);
  
 %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gusty Ninjas</title>
	<script>
	var enginid="<%=engid%>";
	var act="<%=activecounts%>";
	var que="<%=queuecounts%>";
	var newc="<%=newcounts%>";
	</script>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
		$(document).ready(function(){
		
			$('#active-trigger').click(function(){
				
				if(act==0)
					{
					alert("You have no active customers");
					}
				else
					{
					var url = "action.jsp?enggid="+enginid;
					$(this).attr("href",url);
					}
			});
			
			$('#queue-trigger').click(function(){
							
							if(que==0)
								{
								alert("You have no customers in your queue");
								}
							else
								{
								var url = "queue.jsp?enggid="+enginid;
								$(this).attr("href",url);
								}
						});
			
			$('#new-trigger').click(function(){
				
				if(newc==0)
					{
					alert("No New Customer Service Tickets");
					}
				else
					{
					var url = "new.jsp?enggid="+enginid;
					$(this).attr("href",url);
					}
			});
			
				$('#manage-trigger').click(function(){
					{
					var url = "manage.jsp";
					$(this).attr("href",url);
					}
			});
		
		});	
	</script>

</head>
<body>
	
<div data-role="page" data-theme="c">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch</h1>
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-search ui-btn-icon-left ui-btn-icon-notext">Search</a>
  </div>

  <div data-role="main" class="ui-content">
  
   		<ul data-role="listview" data-inset="true">
	      <li data-role="divider">Actions</li>
	      <li>
	        <a href="#" id="active-trigger" data-ajax="false">
	       	 <h2>Active - (<%=activecounts %>)</h2>
	        	<p>Change Status of Active User to Serviced</p>
	        </a>
	      </li>
	      <li>
	         <a href="#" id="queue-trigger" data-ajax="false">
	        <h2>Queue - (<%=queuecounts %>)</h2>
	        <p>View Customers in Service Queue.</p>
	        </a>

	      </li>
	      <li>
	        <a href="#" id="new-trigger" data-ajax="false">
	        <h2>New - (<%=newcounts %>)</h2>
	        <p>View Open Customer Service Tickets.</p>
	        </a>
	      </li>
	      <li>
	        <a href="#" id="manage-trigger" data-ajax="false">
	        <h2>Manage Account</h2>
	        <p>Administrator Activities</p>
	        </a>
	      </li>
	    </ul>
	    
	   
    
  </div>

  <div data-role="footer">
  </div>
  <div id="login_button_holder" style="text-align:center">
    <img src="images/newverizonlogoofficiallarge.png" width="160" height="100">
</div>
</div>
</body>
</html>