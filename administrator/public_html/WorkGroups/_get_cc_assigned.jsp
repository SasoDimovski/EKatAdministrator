<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}
    String pregled   = request.getParameter("pregled");if (pregled==null){pregled="";}

	System.out.println("");
	System.out.println("WorkGroups/_get_cc_assigned.jsp: ");
	System.out.println("id: " + id);
	System.out.println("pregled: " + pregled);
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
    String COD_DP            = "";
    String COD_DP_NAME       = "";
    String COD_CC            = "";;
    String COD_CC_NAME       = "";
    
//     String TEMP       = "";

    

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_work_group_admin.get_wg_cod_cc_admin(?,?,?,?,?); end;";
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
<%if ("1".equals(pregled)) {%>	<button type="button" class="close" data-dismiss="modal">&times;</button><%}%>
	<i class="fa fa-check-square-o "></i>
	<h3 class="box-title" title="Доделени КО">
		Доделени катастарски општини&nbsp;&nbsp;<span class="label label-warning pull-right"><%=vkupno%></span>
	</h3>

	<%
		if (!"0".equals(vkupno)&&!"1".equals(pregled)) {
	%>
	<div class="box-tools pull-right">
		<a class="btn btn-warning btn-xs"
			onClick="delCCWorkGroup('<%=id%>','','')"
			title="Избриши ги сите доделени КО"><i
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
			COD_DP_NAME = rs.getString("DP_NAME");if (COD_DP_NAME==null){COD_DP_NAME="";}
			COD_CC = rs.getString("COD_CC");if (COD_CC==null){COD_CC="";}
			COD_CC_NAME = rs.getString("NAME");if (COD_CC_NAME==null){COD_CC_NAME="";}
//             if (!_cod_dp.equals(COD_DP)){TEMP =TEMP+"1";}
			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>

		<tr>
			<td><b><%=COD_CC_NAME%></b>, <b style="color:#8B0000"><%=COD_CC%></b>, <b style="color:#999"><%=COD_DP_NAME%></b></td>
			<td width="5%">
	<%if (!"1".equals(pregled)) {%>
			<a class="btn btn-warning btn-xs"
				onClick="delCCWorkGroup('<%=id%>','<%=COD_DP%>','<%=COD_CC%>')"><i
					class="fa fa-long-arrow-right"></i></a>
		<%}%>
					</td>
		</tr>
		<%
		}
	%>

		<!-- =============================================================================================================================== -->
	</table>
<input name="is_cod_dp_right" id="is_cod_dp_right" type="hidden" value="<%=COD_DP%>" />
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


