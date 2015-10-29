function initialize() {
	if (navigator.geolocation) {
        navigator.geolocation.watchPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
     }
}


    
function showPosition(position) {
    //alert(position.coords.latitude+' , '+position.coords.longitude);
    //'38.9847719','-77.5619419' - guindy
    var mapProp = {
		    center:new google.maps.LatLng(position.coords.latitude,position.coords.longitude),
		    zoom:15,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
    
    var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		 
}

google.maps.event.addDomListener(window, 'load', initialize);