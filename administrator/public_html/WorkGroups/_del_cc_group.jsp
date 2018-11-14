<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("WorkGroups/_del_cc_group.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String cod_dp = request.getParameter("cod_dp");if (cod_dp==null){cod_dp="";}
String cod_cc = request.getParameter("cod_cc");if (cod_cc==null){cod_cc="";}


//int  _id= Integer.parseInt(id);
//int  _sku_sif= Integer.parseInt(sku_sif);

System.out.println("id: "+id);
System.out.println("cod_dp: "+cod_dp);
System.out.println("cod_cc: "+cod_cc);


	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

    try
    {
      sql   = "begin "+ReadDBProperties.getProperty("conn_uname")+".api_work_group_admin.del_wg_cod_cc_admin(?,?,?,?,?); end;";
      conn  = DBConnection.getConnection(session);
      
      cstmt = conn.prepareCall(sql);
      
      cstmt.setString(1,id);   
      cstmt.setString(2,cod_dp); 
      cstmt.setString(3,cod_cc); 
      cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errid
      cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errmsg
      
      cstmt.execute();
      
      errid = cstmt.getString(4);
     errmsg= cstmt.getString(5);
	
	
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("WorkGroups/_del_cc_group.jsp: " + errmsg);
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



