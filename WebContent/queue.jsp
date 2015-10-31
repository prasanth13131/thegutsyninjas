<%@ page import="com.thegutsyninjas.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashMap" %>
<%
  DBOperation db = new DBOperation();
String ENGINEER_ID=request.getParameter("enggid");
List<LinkedHashMap<String,String>> englist=db.getCustomers("Y",ENGINEER_ID);
LinkedHashMap<String,String> customerrequest = null;
  
 %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gusty Ninjas</title>
	<script>
	var enginid="<%=ENGINEER_ID%>";

	</script>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script>
		$(document).ready(function(){
			$('.newreq').click(function(){	
				var reid=this.id;
				if(confirm("Make Active?"))
				{
				$.ajax({
					url: 'fetchEngineeersAction.jsp',
					type: 'GET',
					async: false,
					data: {enggId: enginid, requID: reid,ajaxReq: "updateRequest",status: "A"},
					error: function(xmlhttp,status){
						alert("message:"+status+"xmlhttp:"+xmlhttp);
						
						
					}  
					}).done(function()
							{
						alert("Service Records Updated");
							});

					var url = "engineer.jsp";
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
	      <li data-role="divider">Make Active Service:</li>
	      <%
	      for(int i=0;i<englist.size();i++)
	      {
	    	  customerrequest=englist.get(i);
	      
	      %>
	      <li>
	        <a href="#" id="<%=customerrequest.get("REQUEST_ID") %>" data-ajax="false" class="newreq">
	       	 <h2>Customer (ID-<%=customerrequest.get("CUSTOMER_ID") %>)</h2>
	        	<p>Request Time - <%=customerrequest.get("REQUEST_TIME") %></p>
	        </a>
	      </li>
	      
	      <%
	      }
	      %>

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