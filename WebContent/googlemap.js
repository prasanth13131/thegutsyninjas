

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
	var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
    var mapProp = {
		    center:latlng,
		    zoom:15,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
    
    var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
    
    new google.maps.InfoWindow({
   	   content:'Bob Marley'
   	   }).open(map,new google.maps.Marker({position: {lat: 13.003196, lng: 80.200601}, map: map}));
		 new google.maps.InfoWindow({
       	   content:'Arumugam'
       	   }).open(map,new google.maps.Marker({position: {lat: 13.006102, lng: 80.203112}, map: map}));
		 new google.maps.InfoWindow({
       	   content:'Radhika'
       	   }).open(map,new google.maps.Marker({position: {lat: 13.007440, lng: 80.201234}, map: map}));
		 new google.maps.InfoWindow({
       	   content:'Babu'
       	   }).open(map,new google.maps.Marker({position: {lat: 13.013196, lng: 80.203601}, map: map}));
		 
		 var myCircle = new google.maps.Circle({
		 	   center:latlng,
		 	   radius:500,
		 	   strokeColor:"#0000FF",
		 	   strokeOpacity:0.8,
		 	   strokeWeight:2,
		 	   fillColor:"#000000",
		 	   fillOpacity:0.4
		 	 	});
				 myCircle.setMap(map);	
		 
}

google.maps.event.addDomListener(window, 'load', initialize);