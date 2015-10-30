<!DOCTYPE HTML>
<html>
<head>
	<title>Receiver</title>
	<style>
		body {
			font-family: sans-serif;
		}
	</style>
</head>
<body>

	Data from Server: <span id="foo"></span>
	
	<br><br>
	<button onclick="start()">Start</button>

	<script>
	function start() {


		var eventSource = new EventSource("broadcast.jsp");
		eventSource.onmessage = function(event) {
			document.getElementById('foo').innerHTML = event.data;
		}
	}
		
	</script>
</body>
</html>