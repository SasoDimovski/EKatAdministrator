<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Users/_is_sn_exist.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String sn = request.getParameter("sn");if (sn==null){sn="";}

System.out.println("id: "+id);
System.out.println("sn: "+sn);

String is_sn_exist = Procs.is_sn_exist(id,sn,request.getSession());

System.out.println("is_sn_exist: "+is_sn_exist);
%>
 <input name="is_sn_exist" id="is_sn_exist" type="hidden" value="<%=is_sn_exist%>" />
 <input name="is_sn_exist_temp" id="is_sn_exist_temp" type="hidden" value="" />

