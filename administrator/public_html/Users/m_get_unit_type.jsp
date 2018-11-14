<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>

<% 


String ID_UNIT   = request.getParameter("ID_UNIT");if (ID_UNIT==null){ID_UNIT="";}
String ID_TYPE   = request.getParameter("ID_TYPE");if (ID_TYPE==null){ID_TYPE="";}

System.out.println("ID_UNIT: "+ID_UNIT);
System.out.println("ID_TYPE: "+ID_TYPE);

String[][] WF_LITE_UNITS = Procs.get_code(null,null,"WF_LITE_UNITS",ID_TYPE,request.getSession());


%>

					    <select  id="ID_UNIT" name="ID_UNIT" class="form-control" >
						<option value=""></option>
						<%for(int it = 0; it < WF_LITE_UNITS.length; it++){%>
						<option value="<%=WF_LITE_UNITS[it][0]%>" 
							<%=(WF_LITE_UNITS[it][0].equals(ID_UNIT))?"selected":""%>>
							<%=WF_LITE_UNITS[it][1]%>
						</option>
						<%}%>
					    </select>