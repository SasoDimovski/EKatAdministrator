<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("WorkGroups/_is_wg_exist.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String wg = request.getParameter("wg");if (wg==null){wg="";}

System.out.println("id: "+id);
System.out.println("wg: "+wg);

String is_wg_exist = Procs.is_wg_exist(id,wg,request.getSession());

System.out.println("is_wg_exist: "+is_wg_exist);
%>
 <input name="is_wg_exist" id="is_wg_exist" type="hidden" value="<%=is_wg_exist%>" />
 <input name="is_wg_exist_temp" id="is_wg_exist_temp" type="hidden" value="" />

