<%@ page import="com.thegutsyninjas.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedHashMap" %>

<%
  DBOperation db = new DBOperation();
String ENGINEER_ID=request.getParameter("enggid");
List<LinkedHashMap<String,String>> englist=db.getCustomers("A",ENGINEER_ID);
LinkedHashMap<String,String> customerrequest = englist.get(0);
String REQUEST_ID=customerrequest.get("REQUEST_ID");
String CUSTOMER_ID=customerrequest.get("CUSTOMER_ID");
  
 %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>The Gutsy Ninjas</title>
		<script>
	var enginid="<%=ENGINEER_ID%>";
	var reqid="<%=REQUEST_ID%>";
	var custid="<%=CUSTOMER_ID%>";
	</script>
	<link rel="stylesheet" href="themes/seenu1.min.css" />
	<link rel="stylesheet" href="themes/jquery.mobile.icons.min.css" />
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile.structure-1.4.5.min.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script type="text/javascript">	
	
	$(document).ready(function(){
		
			$('#update-serviced').click(function(){
				
				if($("input[name='act']:checked").val()=="yes")
				{
				
				$.ajax({
					url: 'fetchEngineeersAction.jsp',
					type: 'GET',
					async: false,
					data: {requID: reqid,ajaxReq: "updateRequest",status: "C"},
					error: function(xmlhttp,status){
						alert("message:"+status+"xmlhttp:"+xmlhttp);
						
						
					}  
					}).done(function()
							{
						alert("Service Ticket Closed");
							});
				
				}

					var url = "engineer.jsp";
					$(this).attr("href",url);

			});
			
	});
			
			</script>

</head>
<body>
	
<div data-role="page">
  <div data-role="header">
  <h1>Request Serviced #<%=REQUEST_ID%></h1>
  </div>

  <div data-role="main" class="ui-content">
    <form method="post">
      <fieldset data-role="controlgroup">
      <legend>Mark Customer as Serviced: Customer #<%=CUSTOMER_ID%></legend>
        <label for="yes">Yes</label>
        <input type="radio" name="act" id="yes" value="yes">
        <label for="no">No</label>
        <input type="radio" name="act" id="no" value="no">	
      </fieldset>
    </form>
  </div>
  
  <div data-role="footer">
	<div style="text-align:center">
	    <a href="#" id="update-serviced" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left ">Save</a>
	</div>
	 </div>
</div>

</body>
</html>