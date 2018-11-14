<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

	System.out.println("");
	System.out.println("Modules/_get_arh.jsp: ");
	
	String mv   = request.getParameter("mv");if (mv==null){mv="";}
	System.out.println("mv: "+mv);
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String arh_sign = null;
	String NAME = null;
	String NAME_SHORT = null;




	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.get_arhsign_admin(?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

		cstmt.registerOutParameter(1, OracleTypes.CURSOR); // list
		cstmt.registerOutParameter(2, OracleTypes.VARCHAR); // vkupno

		cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String vkupno = cstmt.getString(2);
		String errid = cstmt.getString(3);
		String errmsg = cstmt.getString(4);


		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(1);
			%>

<!-- =============================================================================================================================== -->
<div class="box-header with-border">
	<i class="fa fa-object-group"></i>
	<h5 class="box-title">
		Привилегии<%if (!"0".equals(vkupno)) {%>, апликации&nbsp;&nbsp;<span class="label label-default pull-right"><%=vkupno%></span>
		<button type="button" class="btn btn-default btn-sm pull-left noprint"  title="Печати" onClick="javascript:window.print()">Печати</button>
	<%
		}
	%>

	</h5>

	<%
		if (!"0".equals(vkupno)) {
	%>
	<div class="box-tools pull-right"> <a class="btn btn-box-tool btn-xs" data-widget="collapse" id="get_modules_app_but"><i class="fa fa-minus"></i></a>
	</div>
	<%
		}
	%>

</div>
<!-- =============================================================================================================================== -->

<div class="box-body" id="get_modules_unassigned_app_sub">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->


		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()) {
			arh_sign = rs.getString("arh_sign");if (arh_sign==null){arh_sign="";}
			NAME = rs.getString("NAME");if (NAME==null){NAME="";}
			NAME_SHORT= rs.getString("NAME");if (NAME_SHORT==null){NAME_SHORT="";}
			int length = NAME.length( );
			if (length>50){NAME_SHORT = NAME.substring(0,50) + "...";}

			
			//System.out.println("IME"+IME);

	%>

	
<button style="cursor:pointer;padding-left:2px;padding-right:2px" onClick="getProcTip('<%=arh_sign%>','get_arh<%=arh_sign%>','<%=mv%>')"  data-toggle="collapse"
			data-target="#<%=arh_sign%>"  id="2<%=arh_sign%>"><b title=""><%=arh_sign%></b>, <span class="text-danger"  title=""><%=NAME_SHORT%></span>
</button>
	
<div id="get_arh<%=arh_sign%>" lang="0"></div>
	<!-- /.box -->

	<%
		}
	%>

		<!-- =============================================================================================================================== -->


	<!-- =============================================================================================================================== -->
	<%
	} else {
%>
	<div class="box-header text-left"><strong>Нема записи !</strong></div>

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


