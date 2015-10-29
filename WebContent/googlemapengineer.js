var map;
var myCircle;

function initialize() {
	 var latlng = new google.maps.LatLng(-34.397, 150.644);
	var mapProp = {
			center:latlng,
		    zoom:14,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
	map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	if (navigator.geolocation) {
        navigator.geolocation.watchPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
     }
}

function showPosition(position) {
   alert(position.coords.latitude);
	var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    
    map.setCenter(latlng);
		 
		 	myCircle = new google.maps.Circle({
		 	   center:latlng,
		 	   radius:1000,
		 	   strokeColor:"#0000FF",
		 	   strokeOpacity:0.8,
		 	   strokeWeight:2,
		 	   fillColor:"#000000",
		 	   fillOpacity:0.4
		 	 	});
				 myCircle.setMap(map);	
		 
}

google.maps.event.addDomListener(window, 'load', initialize);