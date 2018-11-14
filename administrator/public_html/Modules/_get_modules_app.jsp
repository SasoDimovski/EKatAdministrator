<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

	System.out.println("");
	System.out.println("Modules/_get_modules_app.jsp: ");
	
	String mv   = request.getParameter("mv");if (mv==null){mv="";}
	System.out.println("mv: "+mv);
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String APL_SIF = null;
	String APL_NAZIV = null;



	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.get_tab_modul_aplication(?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

		
		cstmt.registerOutParameter(1, OracleTypes.VARCHAR); // list
		cstmt.registerOutParameter(2, OracleTypes.CURSOR); // vkupno
		cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String vkupno = cstmt.getString(1);
		String errid = cstmt.getString(3);
		String errmsg = cstmt.getString(4);


		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(2);
			%>

<!-- =============================================================================================================================== -->
<div class="box-header with-border">
	<i class="fa fa-object-group"></i>
	<h5 class="box-title">
		Привилегии<%if (!"0".equals(vkupno)) {%>, апликации&nbsp;&nbsp;<span class="label label-default pull-right"><%=vkupno%></span>
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
			APL_SIF = rs.getString("SIF");if (APL_SIF==null){APL_SIF="";}
			APL_NAZIV = rs.getString("NAZIV");if (APL_NAZIV==null){APL_NAZIV="";}

			
			//System.out.println("IME"+IME);

	%>
	<div class="box box-default collapsed-box box-solid" id="get_modules_app_sub<%=APL_SIF%>">
		<div class="box-header with-border">
			<i class="fa fa-indent"></i>
			<h5 class="box-title"><%=APL_NAZIV%></h5>, <small> id=<%=APL_SIF%></small>

			<div class="box-tools pull-right"> <a
					class="btn btn-btn-xs" data-widget="collapse"  id="get_modules_app_but<%=APL_SIF%>"
					onClick="getModulesApp1('<%=APL_SIF%>','','get_modules_app<%=APL_SIF%>','<%=mv%>')"><i
					class="fa fa-plus"></i></a>
			</div>
			<!-- /.box-tools -->
		</div>
		<!-- /.box-header -->
		<div class="box-body" id="get_modules_app<%=APL_SIF%>" lang="0"></div>
		<!-- /.box-body -->
	</div>
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


