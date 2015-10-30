<%@ page import="com.thegutsyninjas.*" %>

<%
  DBOperation db = new DBOperation();
 %>
 
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gutsy Ninjas</title>
	<script>
	var ctxPath="<%=request.getContextPath()%>"
	</script>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="googlemap.js"></script>
	<script>
			$(document).ready(function(){
			
			$('.engtype').click(function(){
			
			var type=this.id;
			deleteMarkers();
			showEngineers(type);
			
			});
			
			});
	</script>

</head>
<body>
	
		
<div data-role="page" data-theme="c">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch (<%=db.getCustomerName()%>)</h1>
    <a href="index.jsp" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-icon-action ui-btn-icon-left ui-btn-icon-notext">Log Out</a>
  </div>

  <div data-role="main" class="ui-content" id="googleMap" style="width:100%;height:380px;">
    
  </div>

  <div data-role="footer"><center>
    <a href="#" id="FIOS" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engtype">Fios<img src="images/FIOS.png"></a>
    <a href="#" id="TV" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engtype">Tv<img src="images/TV.png"></a>
    <a href="#" id="VOICE" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engtype">Voice<img src="images/VOICE.png"></a>
	<a href="#" id="INTE" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left engtype">Internet<img src="images/INTE.png"></a></center>
  </div>
 <div id="login_button_holder" style="text-align:center">
    <a href="request.jsp?action=need&custId=1&_lat=13.00&_long=17.00&expertIn=FIOS" data-ajax="false"class="ui-btn ui-corner-all ui-shadow ">Request Assistance</a>
</div>

</div>

</body>
</html>