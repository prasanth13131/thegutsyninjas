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
	<script src="googlemap.js"></script>
	<script>
			$(document).on('pageinit', function() {
			 	 $('#loginbtn').on('click', function() {
			 	  var pwd=$('#loginpin').val();
		
					if(pwd==null||pwd.length==0)
					{
						alert("vPIN cannot be empty");
						return false;
					}
					else if(pwd=="1234")
					{
						$(this).attr('href','#pagehome');
					
					}
					else if(pwd="2345")
					{
						$(this).attr('href','#pageeng');
					}
					else
					{
						alert("Invalid vPIN");
						return false;
					}
			 	 });
			});
	</script>

</head>
<body>
	
	<div data-role="page" data-theme="c" id="pagelogin">
		 <div data-role="header">
		    <h1>vDispatch</h1>
		 </div>
		<div data-role="main" class="ui-content">
			<input type="password" id="loginpin" maxlength=4 size=5></input>
			<a id="loginbtn" class="ui-btn">Login</a>
		</div>
    
	</div>
		
<div data-role="page" data-theme="c" id="pagehome">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch (<%=db.getCustomerName()%>)</h1>
    <a href="login.jsp" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext">Log Out</a>
  </div>

  <div data-role="main" class="ui-content" id="googleMap" style="width:100%;height:380px;">
    
  </div>

  <div data-role="footer"><center>
    <a href="#" id="FIOS" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left">Fios</a>
    <a href="#" id="TV" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left ">Tv</a>
    <a href="#" id="VOICE" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left">Voice</a>
	<a href="#" id="INTE" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left">Internet</a></center>
  </div>
 <div id="login_button_holder" style="text-align:center">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ">Request Assistance</a>
</div>

</div>

<div data-role="page" data-theme="c" id="pageeng">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch (<%=db.getCustomerName()%>)</h1>
    <a href="login.jsp" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext">Log Out</a>
  </div>

  <div data-role="main" class="ui-content" id="googleMap1" style="width:100%;height:380px;">
    
  </div>
 </div>

</body>
</html>