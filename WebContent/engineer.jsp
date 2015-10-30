<%@ page import="com.thegutsyninjas.*" %>

<%
  DBOperation db = new DBOperation();
 %>
 
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gutsy Ninjas</title>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="googlemapengineer.js"></script>
	<script>
			$(document).ready(function(){
			
			$('#triggerReqBtn').click(function(){
					var url = "service.jsp";
					$(this).attr("href",url);
			});
			
			
			$('.engreq').click(function(){		
			var type=this.id;
			
		deleteMarkers();	

	$.ajax({
	url: 'fetchEngineeersAction.jsp',
	type: 'GET',
	async: false,
	data: {enggType: type,ajaxReq: "fetchCustomers",id: "1"},
	error: function(xmlhttp,status){
		alert("message:"+status+"xmlhttp:"+xmlhttp);
		
		
	}  
	}).done(function(data)
			{
		var customers = eval('('+data+')');
			//lalert(engineers.length+" engineers fetched");
			if(customers.length==0)
			{
			alert("No Customers Available");
			return;
			}	
			for(i=0;i<customers.length;i++)
			{
			addMarker( new google.maps.LatLng(customers[i].CUSTOMER_LAT,customers[i].CUSTOMER_LAT),customers[i].REQUEST_TIME);
			}
			showMarkers();
			});
	
			});
			
			});
	</script>


</head>
<body>
	
		
<div data-role="page" data-theme="c">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch</h1>
    <a href="index.jsp" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-icon-action ui-btn-icon-left ui-btn-icon-notext">Log Out</a>
  </div>

  <div data-role="main" class="ui-content" id="googleMap" style="width:100%;height:380px;">
    
  </div>

  <div data-role="footer"><center>
    <a href="#" id="A" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engreq">Active</a>
    <a href="#" id="Y" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engreq">In Queue</a>
    <a href="#" id="N" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engreq">New</a></center>
  </div>
  <div id="login_button_holder" style="text-align:center">
    <a href="#" id="triggerReqBtn" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ">My Actions</a>
</div>

</div>

</body>
</html>