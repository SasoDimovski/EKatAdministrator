<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Groups/_del_modules_group.jsp: ");

String sif = request.getParameter("sif");if (sif==null){sif="";}
String apl_sif = request.getParameter("apl_sif");if (apl_sif==null){apl_sif="";}
String mod_sif = request.getParameter("mod_sif");if (mod_sif==null){mod_sif="";}


System.out.println("sif: "+sif);
System.out.println("apl_sif: "+apl_sif);
System.out.println("mod_sif: "+mod_sif);


	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

	try {
		

			sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.revoke_group_modul(?,?,?,?,?,?); end;";
					conn = DBConnection.getConnection(session);
					
					cstmt = conn.prepareCall(sql);
					
					cstmt.setString(1, sif); //  
					cstmt.setString(2, apl_sif); //
					cstmt.setString(3, mod_sif); // 
					cstmt.setString(4, null); // 
					cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errid
					cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // errmsg
			
					cstmt.execute();
			
					errid = cstmt.getString(5);
					errmsg = cstmt.getString(6);
	
	
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Groups/_del_modules_group.jsp: " + errmsg);
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


	//response.sendRedirect("ModuleList.jsp?"+query); 
	
%>



