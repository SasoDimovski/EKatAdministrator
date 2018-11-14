<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String sif   = request.getParameter("sif");if (sif==null){sif="";}
	String mv   = request.getParameter("mv");if (mv==null){mv="";}
    
	System.out.println("");
	System.out.println("Modules/_get_arh_proc.jsp: ");
	System.out.println("sif: " + sif);
	System.out.println("mv: "+mv);
	
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String id_ptype= null;
	String name= null;

	String css = "";
	String css1 = "";

	String random = null; 

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.get_proctypes_admin(?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, sif);

		cstmt.registerOutParameter(2, OracleTypes.CURSOR); // list
		cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();
		
		
		String vkupno = cstmt.getString(3);
		String errid = cstmt.getString(4);
		String errmsg = cstmt.getString(5);
		String query=request.getQueryString();
	

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(2);
			%>

<!-- =============================================================================================================================== -->
<ul class="list-group">
<!-- =============================================================================================================================== -->


<%
	if (!"0".equals(vkupno)) {

%>
<!-- =============================================================================================================================== -->

<%
		while (rs.next()) {

			//System.out.println("MOD_NAZIV: "+MOD_NAZIV+", "+next_level);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV);
			
			id_ptype= rs.getString("id_ptype");if (id_ptype==null){id_ptype="";}
			name= rs.getString("name");if (name==null){name="";}

					
	%>
	





	<h5 style="margin-left:20px"><b title=""><%=id_ptype%></b>, <span class="text-default"  title=""><%=name%></span></h5>
	


	


<%
		}
	%>

<!-- =============================================================================================================================== -->

 </ul>
<!-- =============================================================================================================================== -->
<%
	} else {
%>
<div style="margin-left:20px">
0
</div>

<%
	}

			rs.close();
			cstmt.close();
			// conn.close();
		} else {
		
		%>

<div class="box-header text-left">
	<br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br>
	
</div>
<%
           cstmt.close();
           
		}
	} catch (SQLException e) {
		e.printStackTrace();
		try {
			if (rs != null) {
				rs.close();
			}
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	} finally {
		try {
			if (rs != null) {
				rs.close();
			}
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
	}
%>

