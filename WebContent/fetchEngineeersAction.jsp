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
    	response.getWriter().print(JSONArray.fromObject(englist));
    }
    else if(ajaxreq!=null&&ajaxreq.equalsIgnoreCase("fetchCustomers")){
    	DBOperation db = new DBOperation();
    	String type=request.getParameter("enggType");
    	String id=request.getParameter("id");
    	List<LinkedHashMap<String,String>> englist=db.getCustomers(type,id);
    	response.getWriter().print(JSONArray.fromObject(englist));
    	
    }
    
    
    %>