<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

	System.out.println("");
	System.out.println("Statistic/_get_users_admin.jsp: ");

	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
    String SIF            = null;
    String IME            = null;
    String PRIMEK             = null;
    String NAZIV            = null;
    String PASSWORD            = null;
    
    

    int n =1;

	try {

        sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_users.get_admin_user(?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

	    cstmt.registerOutParameter(1, OracleTypes.CURSOR); // list
	    cstmt.registerOutParameter(2, OracleTypes.VARCHAR); // vkupno
	    cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(3);
		String errmsg = cstmt.getString(4);
		String vkupno = cstmt.getString(2);
		int vkupno_int=Integer.parseInt(vkupno);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(1);
			%>



<div class="box-body no-padding table-responsive" id="get_users_admin">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			
			SIF = rs.getString("id_admin");if (SIF==null){SIF="";}
			IME = rs.getString("name");if (IME==null){IME="";}
			PRIMEK = rs.getString("surname");if (PRIMEK==null){PRIMEK="";}
			NAZIV = rs.getString("username");if (NAZIV==null){NAZIV="";}
			PASSWORD= rs.getString("password");if (PASSWORD==null){PASSWORD="";}



			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>

		<tr>
			<td><b><%=PRIMEK%> <%=IME%></b> <b style="color:#999"><%=NAZIV%></b> <b class="text-yellow" title="ID"><%=SIF%></b></td>
			<td width="5%"><a class="btn btn-default btn-xs" title="<%=SIF%>" onClick="insetAdminUsers_search('<%=NAZIV%>')"><i class="fa fa-long-arrow-left"></i></a></td>
		</tr>
		<%
		n=n+1;
		}

	%>

		<!-- =============================================================================================================================== -->
	</table>

	<!-- =============================================================================================================================== -->
	<%
	} else {
%>
	<div class="box-footer text-left">
		<br> <strong>Нема записи !</strong><br> <br>
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
		<br>
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
</div>


