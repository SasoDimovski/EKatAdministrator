<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}
    String sku_sif   = request.getParameter("sku_sif");if (sku_sif==null){sku_sif="";}
    String skupina_naziv   = request.getParameter("skupina_naziv");if (skupina_naziv==null){skupina_naziv="";}

	System.out.println("");
	System.out.println("Users/_view_modules_group_app.jsp: ");
	System.out.println("sku_sif: " + sku_sif);
	System.out.println("skupina_naziv: " + skupina_naziv);
	
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String SIF = null;//app_sif
	String NAZIV = null;//app_naziv



	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.get_group_applications(?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

		
		cstmt.setString(1, sku_sif);
		cstmt.registerOutParameter(2, OracleTypes.CURSOR); // list
		cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(4);
		String errmsg = cstmt.getString(5);
		String vkupno = cstmt.getString(3);
	

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(2);
			%>

<!-- =============================================================================================================================== -->
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4 class="modal-title">
		<i class="fa fa-object-group"></i>
		<%=skupina_naziv%>,
		<small> id=<%=sku_sif%>
		</small>



	</h4>
</div>
<!-- =============================================================================================================================== -->

<div class="modal-body">
	<%
	if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->

	<%
		while (rs.next()) {
			SIF = rs.getString("SIF");if (SIF==null){SIF="";}
			NAZIV = rs.getString("NAZIV");if (NAZIV==null){NAZIV="";}

			
			//System.out.println("IME"+IME);

	%>
	<div class="box box-danger  box-solid collapsed-box">
		<div class="box-header with-border">
		    <i class="fa fa-list-alt"></i>
			<h5 class="box-title"><%=NAZIV%></h5>, <small> id=<%=SIF%>
		</small>
			<div class="box-tools pull-right">
				<button class="btn btn-box-tool" data-widget="collapse"  onClick="viewModulesGroup('<%=SIF%>','<%=sku_sif%>','', 'view_modules_group<%=SIF%>')">
					<i class="fa fa-plus"></i>
				</button>
			</div>
		</div>
		<div class="box-body" id="view_modules_group<%=SIF%>" lang="0">
        </div>
	</div>

	<%
		}
	%>

	<!-- =============================================================================================================================== -->


	<!-- =============================================================================================================================== -->
	<%
	} else {
%>
	<div class="box-header text-left">
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

<div class="modal-footer">
	<button type="button" class="btn btn-default  btn-xs"
		data-dismiss="modal">Затвори</button>
</div>
