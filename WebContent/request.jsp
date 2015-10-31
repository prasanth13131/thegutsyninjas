<%@ page import="com.thegutsyninjas.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashMap" %>
<%
  DBOperation db = new DBOperation();
  int requstId =0;
  String custId=null; 
  String expertIn=null; 
  String _lat=null;
  String _long=null;
  String reqtime=null;
  String tech_id=null;
  String reqstatus="B";
  String action = request.getParameter("action");
  if(action!=null &&  action.equals("need")){
  	custId = request.getParameter("custId");
    expertIn = request.getParameter("expertIn");
  	_lat = request.getParameter("_lat");
  	_long = request.getParameter("_long");
  	System.out.println(custId+":"+ _lat+":"+_long);
  	requstId = db.insertRequest(custId, expertIn, _lat, _long);
  	System.out.println("Request inserted successfully");
  }else{
  		// load information
  		requstId=Integer.parseInt(request.getParameter("rid"));
  		String reqid=request.getParameter("rid");
  		List<LinkedHashMap<String,String>> englist=db.getRequestDetailsOfCustomer(reqid);
  		System.out.println("Records::"+englist.size());
  		LinkedHashMap<String,String> customerrequest = englist.get(0);
  		custId = customerrequest.get("CUSTOMER_ID");
  	    expertIn = customerrequest.get("EXPERT_IN");
  	  	_lat = customerrequest.get("CUSTOMER_LAT");
  	  	_long = customerrequest.get("CUSTOMER_LONG");
  	  reqtime = customerrequest.get("REQUEST_TIME");
  	  tech_id=customerrequest.get("ENGINEER_ID");
  	reqstatus=customerrequest.get("IS_ACCEPTED");
  	System.out.println(custId+""+expertIn+""+_lat);
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
	<script src="engineertrackingmap.js"></script>
	<script>
	var engid="<%=tech_id%>";
	var status="<%=reqstatus%>";
		$(document).ready(function(){
		
			
			$("#maptrack").click(function(){
				if(status=="Y")
					{
				initialize();
					}
			});
		
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
	        <h3>Your Info</h3>
	        <p>Alex Daniels</p>
	        <p>Customer ID: 1</p>
	        <p>Technician Requested: <%= expertIn %></p>
	        <%if(action==null) {%>
	        <p>Request Time: <%= reqtime %></p>
	        <%} %>
	      </div>
	      <div data-role="collapsible">
	        <h3>Engineer Info</h3>
	        
	        <%if(reqstatus.equals("N")) {%>
	        	<p>An Engineer will be assigned to you shortly</p>
	         <%}else{ %>
	         <p>Bob Murge</p>
	        <p>Fios Technician Export</p>
	         <p>#34 North Street, NJ</p>
	         <p>Ph : 123-456-7890</p>
	         
	         <%
	         }
	        %>
	      </div>
	      
	       <div data-role="collapsible">
	        <h3 id="maptrack">Track</h3>
	        <%if(reqstatus.equals("N")) {%>
	        	<p>An Engineer will be assigned to you shortly</p>
	         <%}else{ %>
	         <div data-role="main" class="ui-content" id="googleMap" style="width:100%;height:380px;">    
 			 </div>
	         
	         <%} %>

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