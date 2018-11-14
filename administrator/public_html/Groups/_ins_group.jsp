<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Groups/_ins_group.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String query = request.getParameter("query");if (query==null){query="";}
query = query.replace("&id="+id,"");

String NAZIV =request.getParameter("NAZIV");if (NAZIV==null){NAZIV="";} 
String OPOMBE =request.getParameter("OPOMBE");if (OPOMBE==null){OPOMBE="";}

System.out.println("id: "+id);
System.out.println("query: "+query);
System.out.println("-----------");
System.out.println("NAZIV: "+NAZIV);
System.out.println("OPOMBE: "+OPOMBE);


	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

	try {
		
		if ("".equals(id)) {
				sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.ins_skupina(?,?,?,?); end;";
				conn = DBConnection.getConnection(session);
		
				cstmt = conn.prepareCall(sql);
		
				cstmt.setString(1, NAZIV); // 
				cstmt.setString(2, OPOMBE); // 

		
				cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // 
				cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errid
		
				cstmt.execute();
		
				errid = cstmt.getString(3);
				errmsg = cstmt.getString(4);
		
		
		}
		if (!"".equals(id)) {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.upd_skupina(?,?,?,?,?); end;";
			conn = DBConnection.getConnection(session);
	
			cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, id); // 
			cstmt.setString(2, NAZIV); //  
			cstmt.setString(3, OPOMBE); // 
	
			cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // 
			cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errid
	
			cstmt.execute();
	
			errid = cstmt.getString(4);
			errmsg = cstmt.getString(5);
	
	
	}
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Groups/_ins_group.jsp: " + errmsg);
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



