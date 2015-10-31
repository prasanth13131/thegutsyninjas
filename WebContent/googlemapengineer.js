var map;
var myCircle;
var markers = [];

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
	updatePosition(enginid,position.coords.latitude,position.coords.longitude);
		 
}


function updatePosition(eid,lat,longi){
	
	$.ajax({
		url: 'fetchEngineeersAction.jsp',
		type: 'GET',
		async: true,
		data: {enggId: eid,ajaxReq: "updateEngPosition",latitude: lat,longitude: longi},
		error: function(xmlhttp,status){
			alert("message:"+status+"xmlhttp:"+xmlhttp);
			
			
		}  
		}).done(function()
				{
			alert("Engineer Location Updated");
				});
	
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
}

//Adds a marker to the map and push to the array.
function addMarker(location,timestamp) {

var marker = new google.maps.Marker({
  position: location,
  map: map
});
//new google.maps.InfoWindow({content:timestamp}).open(map,marker);

markers.push(marker);
}


google.maps.event.addDomListener(window, 'load', initialize);