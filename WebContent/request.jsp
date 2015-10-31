<%@ page import="com.thegutsyninjas.*" %>

<%
  DBOperation db = new DBOperation();
  int requstId =0;
  String action = request.getParameter("action");
  if(action!=null &&  action.equals("need")){
  	String custId = request.getParameter("custId");
    String expertIn = request.getParameter("expertIn");
  	String _lat = request.getParameter("_lat");
  	String _long = request.getParameter("_long");
  	System.out.println(custId+":"+ _lat+":"+_long);
  	requstId = db.insertRequest(custId, expertIn, _lat, _long);
  	System.out.println("Request inserted successfully");
  }else{
  		// load information
  		requstId=Integer.parseInt(request.getParameter("rid"));
  }
 %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gusty Ninjas</title>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
		$(document).ready(function(){
		
		
		});	
	</script>

</head>
<body>
	
<form id="loginform" method="post">
<div data-role="page" data-theme="c">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch</h1>
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-search ui-btn-icon-left ui-btn-icon-notext">Search</a>
  </div>

  <div data-role="main" class="ui-content">
  
   		<div data-role="collapsibleset">
	      <div data-role="collapsible">
	        <h3>Your Request</h3>
	        <p>Request number is <span style="font-weight:bold;color:green;font-size:20px">#<%=requstId %></span></p>
	      </div>
	      <div data-role="collapsible">
	        <h3>Engineer Info</h3>
	        <p>Bob Murge</p>
	        <p>Fios Technician Export</p>
	         <p>#34 North Street, NJ</p>
	         <p>Ph : 123-456-7890</p>
	      </div>
	      <div data-role="collapsible">
	        <h3>Track</h3>
	        <p>google map goes here</p>
	      </div>
	      
   		</div>
    
  </div>

  <div data-role="footer">
  </div>
  <div id="login_button_holder" style="text-align:center">
    <img src="images/newverizonlogoofficiallarge.png" width="160" height="100">
</div>
</div>
</form>
</body>
</html>