<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}

	System.out.println("");
	System.out.println("WorkGroups/_get_arhs_unassigned.jsp: ");
	System.out.println("id: " + id);
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String ARH_SIGN            = "";
    String NAME            = "";
    String NAME_SHORT            = "";



	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_work_group_admin.get_wg_noarhsign_admin(?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

	    cstmt.setString(1, id); // 
	    cstmt.registerOutParameter(2, OracleTypes.VARCHAR); // vkupno
	    cstmt.registerOutParameter(3, OracleTypes.CURSOR); // list
	    cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(4);
		String errmsg = cstmt.getString(5);
		String vkupno = cstmt.getString(2);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(3);
			%>

<!-- =============================================================================================================================== -->
<div class="box-header with-border">
<i class="fa fa-square-o"></i>
	<h3 class="box-title" title="Недоделени архивски знаци">
		Недоделени архивски знаци&nbsp;&nbsp;<span
			class="label label-danger pull-right"><%=vkupno%></span>
	</h3>

	<%
		if (!"0".equals(vkupno)) {
	%>
	<div class="box-tools pull-right">
		<a class="btn btn-danger btn-xs"
			onClick="insArhsWorkGroup('<%=id%>','')"
			title="Додели ги сите недоделени архивски знаци"><i
			class="fa  fa-hand-o-left"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			class="btn btn-box-tool" data-widget="collapse"
			id="get_arhs_unassigned_but"> <i class="fa fa-plus"></i>
		</a>
	</div>
	<%}%>

</div>
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive" id="get_arhs_unassigned_sub">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			ARH_SIGN = rs.getString("ARH_SIGN");if (ARH_SIGN==null){ARH_SIGN="";}
			NAME = rs.getString("NAME");if (NAME==null){NAME="";}
			NAME_SHORT= rs.getString("NAME");if (NAME_SHORT==null){NAME_SHORT="";}
			int length = NAME.length( );
			if (length>40){NAME_SHORT = NAME.substring(0,27) + "...";}

			
			//System.out.println("IME"+IME);

	%>

		<tr>

			<td><b><%=ARH_SIGN%></b>, <b style="color:#999" title="<%=NAME%>"><%=NAME_SHORT%></b></td>
			<td width="5%"><a class="btn btn-danger btn-xs" title="<%=ARH_SIGN%>"
				onClick="insArhsWorkGroup('<%=id%>','<%=ARH_SIGN%>')"><i
					class="fa fa-long-arrow-left"></i></a></td>
		</tr>
		<%
		}
	%>

		<!-- =============================================================================================================================== -->
	</table>
	<!-- =============================================================================================================================== -->
	<%
	} else {
%>
<!-- 	<div class="box-header text-left"> -->
<!-- 		<br> <strong>Нема записи !</strong><br> <br> -->
<!-- 	</div> -->

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


