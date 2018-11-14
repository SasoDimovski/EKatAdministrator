<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("WorkGroups/_ins_workgroup.jsp: ");

String id = request.getParameter("id");if (id==null||"0".equals(id)){id="";}
String query = request.getParameter("query");if (query==null){query="";}
query = query.replace("&id="+id,"");

String NAME =request.getParameter("NAME");if (NAME==null){NAME="";}
String DEP_ID =request.getParameter("search4");if (DEP_ID==null){DEP_ID="";} 
String ID_WG_PRE =request.getParameter("ID_WG_PRE");if (ID_WG_PRE==null){ID_WG_PRE="";}


System.out.println("id: "+id);
System.out.println("query: "+query);
System.out.println("-----------");
System.out.println("NAME: "+NAME);
System.out.println("NAME: "+NAME);
System.out.println("ID_WG_PRE: "+ID_WG_PRE);


	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

	try {
		

		      sql   = "begin "+ReadDBProperties.getProperty("conn_uname")+".api_work_group_admin.ins_work_group(?,?,?,?,?,?,?); end;";
		      conn  = DBConnection.getConnection(session);
		      
		      cstmt = conn.prepareCall(sql);
		      
		      cstmt.setString(1,id);   
		      cstmt.setString(2, NAME); 
			  cstmt.setString(3, DEP_ID); 
			  cstmt.setString(4, ID_WG_PRE); 
			  cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errid
		      cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // errid
		      cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errmsg
		      
		      cstmt.execute();
		      
		      errid = cstmt.getString(6);
		      errmsg= cstmt.getString(7);
		

		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Applications/_ins_application.jsp: " + errmsg);
			cstmt.close();

		}
	} catch (SQLException e) {
		e.printStackTrace();

		try {
			if (cstmt != null) {
				cstmt.close();
			}
			return;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	} finally {
		try {
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
	}


	response.sendRedirect("ModuleList.jsp?"+query); 
	
%>



