
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

</head>
<body>
	
<div data-role="page">
  <div data-role="header">
  <h1>Radio Buttons</h1>
  </div>

  <div data-role="main" class="ui-content">
    <form method="post" action="demoform.asp">
      <fieldset data-role="controlgroup">
      <legend>Choose your action:</legend>
        <label for="yes">Yes</label>
        <input type="radio" name="act" id="yes" value="yes">
        <label for="no">No</label>
        <input type="radio" name="act" id="no" value="no">	
      </fieldset>
    </form>
  </div>
  
  <div data-role="footer">
	<div style="text-align:center">
	    <a href="engineer.jsp" data-ajax="false" class="ui-btn ui-corner-all ui-shadow ui-icon-user ui-btn-icon-left ">Save</a>
	</div>
	 </div>
</div>

</body>
</html>