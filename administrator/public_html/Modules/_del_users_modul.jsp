<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Modules/_del_users_modul.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String id_user = request.getParameter("id_user");if (id_user==null){id_user="";}
String apl_sif = request.getParameter("apl_sif");if (apl_sif==null){apl_sif="";}


//int  _id= Integer.parseInt(id);
//int  _sku_sif= Integer.parseInt(sku_sif);

System.out.println("id: "+id);
System.out.println("id_user: "+id_user);
System.out.println("apl_sif: "+apl_sif);


	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

    try
    {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.revoke_right_modul_user(?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);
		
		cstmt = conn.prepareCall(sql);
		
		cstmt.setString(1, id_user); //  
		cstmt.setString(2, apl_sif); //
		cstmt.setString(3, id); // 
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
			System.out.println("Modules/_del_users_modul.jsp: " + errmsg);
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



