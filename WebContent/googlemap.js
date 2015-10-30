var map;
var myCircle;
var markers = [];

function initialize() {
	//alert('hi');
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
		
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        alert("Geolocation is not supported by this browser.");
     }
}

function showPosition(position) {
   
	custlat=position.coords.latitude;
	custlong=position.coords.longitude;
	var latlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
   
//    new google.maps.InfoWindow({
//   	   content:'Bob Marley'
//   	   }).open(map,new google.maps.Marker({position: {lat: 13.003196, lng: 80.200601}, map: map}));
//		 new google.maps.InfoWindow({
//       	   content:'Arumugam'
//       	   }).open(map,new google.maps.Marker({position: {lat: 13.006102, lng: 80.203112}, map: map}));
//		 new google.maps.InfoWindow({
//       	   content:'Radhika'
//       	   }).open(map,new google.maps.Marker({position: {lat: 13.007440, lng: 80.201234}, map: map}));
//		 new google.maps.InfoWindow({
//       	   content:'Babuji'
//       	   }).open(map,new google.maps.Marker({position: {lat: 13.013196, lng: 80.203601}, map: map}));
//		 
		map.setCenter(latlng);
		myCircle.setCenter(latlng);
		
		showEngineers("ALL");
		
		 
}

function showEngineers(type)
{
	
	$.ajax({
	url: 'fetchEngineeersAction.jsp',
	type: 'GET',
	async: false,
	data: {enggType: type,ajaxReq: "fetchEngineers"},
	error: function(xmlhttp,status){
		alert("message:"+status+"xmlhttp:"+xmlhttp);
		
		
	}  
	}).done(function(data)
			{
		var engineers = eval('('+data+')');
			//lalert(engineers.length+" engineers fetched");	
		for(i=0;i<engineers.length;i++)
			{
			addMarker( new google.maps.LatLng(engineers[i].LATITUDE,engineers[i].LONGITUDE),engineers[i].EXPERT_IN);
			}
			showMarkers();
			});
	
	}


//Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

//Adds a marker to the map and push to the array.
function addMarker(location,type) {
	var image=ctxPath+'/images/'+type+'.png';
  var marker = new google.maps.Marker({
    position: location,
    map: map,
    icon: image
  });
  markers.push(marker);
}


google.maps.event.addDomListener(window, 'load', initialize);