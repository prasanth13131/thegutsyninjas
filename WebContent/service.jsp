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
  	
  	requstId = db.insertRequest(custId, expertIn, _lat, _long);
  	System.out.println("Request inserted successfully");
  }else{
  		// load information
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
	        <a href="#">
	       	 <h2>Active</h2>
	        	<p>Google Chrome is a free, open-source web browser. Released in 2008.</p>
	        </a>
	        <a href="action.jsp" data-ajax="true">Download Browser</a>
	      </li>
	      <li>
	        <a href="#">
	        <h2>New</h2>
	        <p>Firefox is a web browser from Mozilla. Released in 2004.</p>
	        </a>
	        <a href="new.jsp" data-ajax="true">Download Browser</a>
	      </li>
	      <li>
	        <a href="#">
	        <h2>Prasant</h2>
	        <p>Firefox is a web browser from Mozilla. Released in 2004.</p>
	        </a>
	        <a href="hh.jsp" data-ajax="true">Download Browser</a>
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