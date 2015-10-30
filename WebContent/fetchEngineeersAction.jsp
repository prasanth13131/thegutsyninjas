<%@ page language="java" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    
    %>