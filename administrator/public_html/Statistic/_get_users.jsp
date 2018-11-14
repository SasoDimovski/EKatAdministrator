<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
	String search1u   = request.getParameter("search1u");if (search1u==null){search1u="";}
	String search2u   = request.getParameter("search2u");if (search2u==null){search2u="";}
	String search3u   = request.getParameter("search3u");if (search3u==null){search3u="";}
	String search4u   = request.getParameter("search4u");if (search4u==null){search4u="";}
	
	System.out.println("");
	System.out.println("Statistic/_get_users.jsp: ");
	
	System.out.println("search1u: " + search1u);
	System.out.println("search2u: " + search2u);
	System.out.println("search3u: " + search3u);
	System.out.println("search4u: " + search4u);

    
    
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
    String SIF            = null;
    String IME            = null;
    String PRIMEK             = null;
    String NAZIV            = null;

    

    int n =1;

	try {

        sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_users.get_user_data(?,?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
	    cstmt.setString(1, search1u); // upo_sif
	    cstmt.setString(2, search2u); // p_ime
	    cstmt.setString(3, search3u); // p_priimek
	    cstmt.setString(4, search4u); // p_naziv
	    cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // vkupno
	    cstmt.registerOutParameter(6, OracleTypes.CURSOR); // list

	    cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(8, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(7);
		String errmsg = cstmt.getString(8);
		String vkupno = cstmt.getString(5);
		int vkupno_int=Integer.parseInt(vkupno);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(6);
			%>



<div class="box-body no-padding table-responsive" id="get_users">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			
			SIF = rs.getString("SIF");if (SIF==null){SIF="";}
			IME = rs.getString("IME");if (IME==null){IME="";}
			PRIMEK = rs.getString("PRIIMEK");if (PRIMEK==null){PRIMEK="";}
			NAZIV = rs.getString("NAZIV");if (NAZIV==null){NAZIV="";}



			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>

		<tr>
			<td><b><%=PRIMEK%> <%=IME%></b> <b style="color:#999"><%=NAZIV%></b> <b class="text-yellow" title="ID"><%=SIF%></b></td>
			<td width="5%"><a class="btn btn-default btn-xs" title="<%=SIF%>" onClick="insetUsers_search('<%=NAZIV%>')"><i class="fa fa-long-arrow-left"></i></a></td>
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


