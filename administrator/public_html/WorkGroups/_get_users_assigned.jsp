<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}
    String count   = request.getParameter("count");if (count==null){count="";}
    String pregled   = request.getParameter("pregled");if (pregled==null){pregled="";}
    
    int m   = 0;
    if ("0".equals(count)){m=30;}
    if ("1".equals(count)){m=3000000;}


	System.out.println("");
	System.out.println("WorkGroups/_get_users_assigned.jsp: ");
	System.out.println("id: " + id);
	System.out.println("pregled: " + pregled);
	
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
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_work_group_admin.get_wg_users_admin(?,?,?,?,?); end;";
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
		int vkupno_int=Integer.parseInt(vkupno);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(3);
			%>

<!-- =============================================================================================================================== -->
<div class="box-header with-border">
<%if ("1".equals(pregled)) {%>	<button type="button" class="close" data-dismiss="modal">&times;</button><%}%>
	<i class="fa fa-check-square-o"></i>
	<h3 class="box-title" title="Доделени корисници">
		Доделени корисници&nbsp;&nbsp;<span class="label label-default pull-right"><%=vkupno%></span>
	</h3>

	<%
		if (!"0".equals(vkupno)&&!"1".equals(pregled)) {
	%>
	<div class="box-tools pull-right">
		<a class="btn btn-default btn-xs"
			onClick="delUsersWorkGroup('<%=id%>','','0')"
			title="Избриши ги сите доделени корисници"><i
			class="fa fa-hand-o-right"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
			class="btn btn-box-tool" data-widget="collapse"
			id="get_users_assigned_but"> <i class="fa fa-plus"></i>
		</a>
	</div>
	<%}%>

</div>
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive"   id="get_users_assigned_sub">
	<%
			if (!"0".equals(vkupno)) {

%>
	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->

		<%
		while (rs.next()&&n<m) {
			SIF = rs.getString("SIF");if (SIF==null){SIF="";}
			IME = rs.getString("IME");if (IME==null){IME="";}
			PRIMEK = rs.getString("PRIIMEK");if (PRIMEK==null){PRIMEK="";}
			NAZIV = rs.getString("NAZIV");if (NAZIV==null){NAZIV="";}


			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>

		<tr>
			<td><b><%=PRIMEK%> <%=IME%></b> <b style="color:#999"><%=NAZIV%></b> <b class="text-yellow" title="ID"><%=SIF%></b></td>
			<td width="5%">
			  <%if (!"1".equals(pregled)) {%>
			  <a class="btn btn-default btn-xs" title="<%=SIF%>" onClick="delUsersWorkGroup('<%=id%>','<%=SIF%>','0')"><i class="fa fa-long-arrow-right"></i></a>
			  <%}%>
			</td>
		</tr>
		<%
		n=n+1;
		}
	%>

		<!-- =============================================================================================================================== -->
	</table>
	<%if ("0".equals(count)&&(vkupno_int>m)) {%>
		<div class="box-footer pull-right">
			<a class="btn btn-default btn-xs" onClick="getUsersWorkGroup('<%=id%>','assig','1')" title="прикажи ги сите">прикажи ги сите</a>
		</div>
	<%}%>
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


