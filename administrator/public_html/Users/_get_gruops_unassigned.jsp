<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}

	System.out.println("");
	System.out.println("Users/_get_gruops_unassigned.jsp: ");
	System.out.println("id: " + id);
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String SKU_SIF = null;
	String SKUPINA_NAZIV = null;



	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.get_user_groups(?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);
		
		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
		
		cstmt.registerOutParameter(1, OracleTypes.CURSOR); // list
		cstmt.setString(2, id);
		cstmt.setString(3, null);
		cstmt.setString(4, "0");
		cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errmsg
		
		cstmt.execute();
		
		String errid = cstmt.getString(6);
		String errmsg = cstmt.getString(7);
		String vkupno = cstmt.getString(5);
		


		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(1);
			%>

<!-- =============================================================================================================================== -->
<div class="box-header with-border">
<i class="fa fa-square"></i>
	<h3 class="box-title" title="Недоделени групи">
		Недоделени групи&nbsp;&nbsp;<span
			class="label label-warning pull-right"><%=vkupno%></span>
	</h3>

	<%
		if (!"0".equals(vkupno)) {
	%>
	<div class="box-tools pull-right">
		<a class="btn btn-warning btn-xs"
			onClick="insGroupUser('<%=id%>','0','1')"
			title="Додели ги сите недоделени групи"><i
			class="fa  fa-hand-o-left"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			class="btn btn-box-tool" data-widget="collapse"
			id="get_gruops_unassigned_but"> <i class="fa fa-plus"></i>
		</a>
	</div>
	<%}%>

</div>
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive" id="get_gruops_unassigned_sub">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			SKU_SIF = rs.getString("SKU_SIF");if (SKU_SIF==null){SKU_SIF="";}
			SKUPINA_NAZIV = rs.getString("SKUPINA_NAZIV");if (SKUPINA_NAZIV==null){SKUPINA_NAZIV="";}

			
			//System.out.println("IME"+IME);

	%>

		<tr>

			<td><a href="#" data-toggle="modal" data-target="#ModalView1" onClick="viewModulesGroupApp('<%=SKU_SIF%>','<%=SKUPINA_NAZIV%>')"><%=SKUPINA_NAZIV%></a></td>
			<td width="5%"><a class="btn btn-warning btn-xs"
				onClick="insGroupUser('<%=id%>','<%=SKU_SIF%>','0')"><i
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


