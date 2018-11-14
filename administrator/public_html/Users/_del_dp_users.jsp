<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Users/_del_dp_users.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String id_dp = request.getParameter("id_dp");if (id_dp==null){id_dp="";}


//int  _id= Integer.parseInt(id);
//int  _sku_sif= Integer.parseInt(sku_sif);

System.out.println("id: "+id);
System.out.println("id_dp: "+id_dp);



	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

    try
    {
      sql   = "begin "+ReadDBProperties.getProperty("conn_uname")+".api_work_group_admin.DEL_USER_COD_DP(?,?,?,?); end;";
      conn  = DBConnection.getConnection(session);
      
      cstmt = conn.prepareCall(sql);
      
      cstmt.setString(1,id);   
      cstmt.setString(2,id_dp); 
      cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // errid
      cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errmsg
      
      cstmt.execute();
      
      errid = cstmt.getString(3);
     errmsg= cstmt.getString(4);
	
	
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Users/_del_dp_users.jsp: " + errmsg);
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



