<%@ page import="java.io.*,com.thegutsyninjas.*" %>

<%

DBOperation db = new DBOperation();
response.setContentType("text/event-stream");
response.setCharacterEncoding("UTF-8");
	 while(true){
			
			PrintWriter writer = response.getWriter();
			writer.write("data: "+ db.getRequest() +"\n\n");
			writer.flush();
			writer.close();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
	}
		
		
%>