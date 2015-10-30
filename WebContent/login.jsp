<%@ page import="com.thegutsyninjas.*" %>

<%
  DBOperation db = new DBOperation();
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
		
		$('#logintrigger').click(function(){
		
		var pwd=$('#loginpin').val();
		
		if(pwd==null||pwd.length==0)
		{
		alert("vPIN cannot be empty");
		}
		else if(pwd=="1234")
		{
		$('#loginform').attr('action','index.jsp');
		$('#loginform').submit();
		}
		else if(pwd="2345")
		{
		$('#loginform').attr('action','engineer.jsp');
		$('#loginform').submit();
		}
		else
		{
		alert("Invalid vPIN")
		}
		
		});
		
		});	
	</script>

</head>
<body>
	
<form id="loginform">
<div data-role="page" data-theme="c">
  <div data-role="header">
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-home ui-btn-icon-left ui-btn-icon-notext ">Home</a>
    <h1>vDispatch</h1>
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-search ui-btn-icon-left ui-btn-icon-notext">Search</a>
  </div>

  <div data-role="main" class="ui-content" id="login" style="width:98%;height:150px;">
  
    <input type="password" id="loginpin" maxlength=4 size=5></input>
    
  </div>

  <div data-role="footer">
<div style="text-align:center">
    <a id="logintrigger" href="#" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left ">Login</a>
</div>
  </div>
  <div id="login_button_holder" style="text-align:center">
    <img src="images/newverizonlogoofficiallarge.png" width="160" height="100">
</div>
</div>
</form>
</body>
</html>