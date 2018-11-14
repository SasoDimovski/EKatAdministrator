<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}

	System.out.println("");
	System.out.println("Users/_get_dp_assigned.jsp: ");
	System.out.println("id: " + id);
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String COD_DP           = null;
    String NAME            = null;


	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_work_group_admin.get_user_cod_dp_admin(?,?,?,?,?); end;";
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
	<i class="fa fa-check-square"></i>
	<h3 class="box-title" title="Доделени одделенија">
		Доделени одделенија&nbsp;&nbsp;<span class="label label-default pull-right"><%=vkupno%></span>
	</h3>

	<%
		if (!"0".equals(vkupno)) {
	%>
	<div class="box-tools pull-right">
		<a class="btn btn-default btn-xs"
			onClick="delDPUsers('<%=id%>','')"
			title="Избриши ги сите доделени одделенија"><i
			class="fa fa-hand-o-right"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			class="btn btn-box-tool" data-widget="collapse"
			id="get_dp_assigned_but"> <i class="fa fa-plus"></i>
		</a>
	</div>
	<%}%>

</div>
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive"   id="get_dp_assigned_sub">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			COD_DP = rs.getString("COD_DP");if (COD_DP==null){COD_DP="";}
			NAME = rs.getString("NAME");if (NAME==null){NAME="";}


	%>

		<tr>
			<td><b><%=NAME%></b>, <b style="color:#999" title="<%=NAME%>"><%=COD_DP%></b></td>
			<td width="5%">

			<a class="btn btn-default btn-xs" title="<%=COD_DP%>"
				onClick="delDPUsers('<%=id%>','<%=COD_DP%>')"><i
					class="fa fa-long-arrow-right"></i></a>

					</td>
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


