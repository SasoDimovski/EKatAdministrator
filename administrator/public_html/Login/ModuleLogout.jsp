<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
System.out.println("");
System.out.println("Login/ModuleLogout.jsp:----------");

if(session!=null){
    session.invalidate();
}
    response.sendRedirect("../index.html");
%>