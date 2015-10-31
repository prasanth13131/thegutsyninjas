<%@ page language="java" %>
    <%@ page import="com.thegutsyninjas.DBOperation" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.LinkedHashMap" %>
    <%@ page import="net.sf.json.JSONArray" %>
    <%
    String ajaxreq=request.getParameter("ajaxReq");
    if(ajaxreq!=null&&ajaxreq.equalsIgnoreCase("fetchEngineers")){
    	DBOperation db = new DBOperation();
    	String type=request.getParameter("enggType");
    	List<LinkedHashMap<String,String>> englist=db.getEngineers(type);
    	response.setHeader("Cache-Control", "no-cache");
    	response.getWriter().print(JSONArray.fromObject(englist));
    }
    else if(ajaxreq!=null&&ajaxreq.equalsIgnoreCase("fetchCustomers")){
    	DBOperation db = new DBOperation();
    	String type=request.getParameter("enggType");
    	String id=request.getParameter("id");
    	List<LinkedHashMap<String,String>> englist=db.getCustomers(type,id);
    	response.setHeader("Cache-Control", "no-cache");
    	response.getWriter().print(JSONArray.fromObject(englist));
    	
    }
    else if(ajaxreq!=null&&ajaxreq.equalsIgnoreCase("updateEngPosition")){
    	DBOperation db = new DBOperation();
    	String lat=request.getParameter("latitude");
    	String longi=request.getParameter("longitude");
    	String id=request.getParameter("enggId");
    	db.updateEngPosition(id,lat,longi);
    	

    	
    }
    else if(ajaxreq!=null&&ajaxreq.equalsIgnoreCase("updateRequest")){
    	DBOperation db = new DBOperation();
    	String status=request.getParameter("status");
    	String reqid=request.getParameter("requID");
    	String engid=request.getParameter("enggId");
    	db.updateRequestStatus(reqid,status,engid);

    	

    	
    }
    
    
    %>