var map;
var myCircle;
var markers = [];
var infowindow;

var gds=new google.maps.DirectionsService;
var gdr=new google.maps.DirectionsRenderer;

function initialize() {
	 var latlng = new google.maps.LatLng(-34.397, 150.644);
	var mapProp = {
			center:latlng,
		    zoom:14,
		    mapTypeId:google.maps.MapTypeId.ROADMAP
		  };
	map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
	
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
	
	
	
	if (navigator.geolocation) {
        navigator.geolocation.watchPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
     }
}

function showPosition(position) {
   
	var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	map.setCenter(latlng);
	myCircle.setCenter(latlng);
	custlat=position.coords.latitude;
	custlong=position.coords.longitude;
	getEngineerPosition(engid);
		 
}


function getEngineerPosition(eid){
	
	var englat;
	var englong;
	$.ajax({
		url: 'fetchEngineeersAction.jsp',
		type: 'GET',
		async: false,
		data: {enggId: eid,ajaxReq: "getEngPosition"},
		error: function(xmlhttp,status){
			alert("message:"+status+"xmlhttp:"+xmlhttp);
			
			
		}  
		}).done(function(data)
				{
				var engpos = eval('('+data+')');
				if(engpos.length==0)
				{
				alert("Location Unvailable");
				return;
				}
				englat=engpos[0].LATITUDE;
				englong=engpos[0].LONGITUDE;
				
				});

	calculateAndDisplayRoute(gds,gdr,new google.maps.LatLng(englat,englong),new google.maps.LatLng(custlat,custlong));
}


//Sets the map on all markers in the array.
function setMapOnAll(map) {
for (var i = 0; i < markers.length; i++) {
  markers[i].setMap(map);
}
}

//Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
setMapOnAll(null);
}

//Shows any markers currently in the array.
function showMarkers() {
setMapOnAll(map);
}

//Deletes all markers in the array by removing references to them.
function deleteMarkers() {
clearMarkers();
markers = [];
gdr.setMap(null);

}

function calculateAndDisplayRoute(directionsService, directionsDisplay, originate, endpoint) {
	
	directionsDisplay.setMap(map);
	
	  directionsService.route({
	    origin: originate,
	    destination: endpoint,
	    travelMode: google.maps.TravelMode.DRIVING
	  }, function(response, status) {
	    if (status === google.maps.DirectionsStatus.OK) {
	      directionsDisplay.setDirections(response);
	    } else {
	      window.alert('Directions request failed due to ' + status);
	    }
	  });
	}



//Adds a marker to the map and push to the array.
function addMarker(location,timestamp,cid,type) {

var marker = new google.maps.Marker({
  position: location,
  map: map
});

marker['infowindow'] = new google.maps.InfoWindow({
    content: "Customer ID: "+cid+"\n Request Time: "+timestamp
});

google.maps.event.addListener(marker, 'mouseover', function() {
this['infowindow'].open(map, this);
});

marker.addListener('click', function() {
    calculateAndDisplayRoute(gds,gdr,new google.maps.LatLng(englat,englong),location);
  });

//new google.maps.InfoWindow({content:timestamp}).open(map,marker);

markers.push(marker);
}


//google.maps.event.addDomListener(window, 'load', initialize);