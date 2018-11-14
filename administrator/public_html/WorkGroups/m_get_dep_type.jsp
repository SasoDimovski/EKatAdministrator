<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>

<% 


String ID_UNIT   = request.getParameter("ID_UNIT");if (ID_UNIT==null){ID_UNIT="";}
String ID_TYPE   = request.getParameter("ID_TYPE");if (ID_TYPE==null){ID_TYPE="";}
String tip   = request.getParameter("tip");if (tip==null){tip="";}

System.out.println("ID_UNIT: "+ID_UNIT);
System.out.println("ID_TYPE: "+ID_TYPE);
System.out.println("tip: "+tip);

String[][] SWGDEPARTMENT = Procs.get_code(null,null,"SWGDEPARTMENT",ID_TYPE,request.getSession());


%>

					    <select  id="search4" name="search4" class="form-control" <%=("1".equals(tip))?"required":""%>>
						<option value=""></option>
						<%for(int it = 0; it < SWGDEPARTMENT.length; it++){%>
						<option value="<%=SWGDEPARTMENT[it][0]%>" 
							<%=(SWGDEPARTMENT[it][0].equals(ID_UNIT))?"selected":""%>>
							<%=SWGDEPARTMENT[it][1]%>
						</option>
						<%}%>
					    </select>