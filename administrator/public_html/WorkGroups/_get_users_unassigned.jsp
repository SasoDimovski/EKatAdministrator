<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}
    String count   = request.getParameter("count");if (count==null){count="";}
    
    String search1u   = request.getParameter("search1u");if (search1u==null){search1u="";}
    String search2u   = request.getParameter("search2u");if (search2u==null){search2u="";}
    String search3u   = request.getParameter("search3u");if (search3u==null){search3u="";}
    String search4u   = request.getParameter("search4u");if (search4u==null){search4u="";}
    
    String view_search   = request.getParameter("view_search");if (view_search==null){view_search="";}

    
    
    int m   = 0;
    if ("0".equals(count)){m=30;}
    if ("1".equals(count)){m=3000000;}


	System.out.println("");
	System.out.println("WorkGroups/_get_users_unassigned.jsp: ");
	System.out.println("id: " + id);

	System.out.println("search1u: " + search1u);
	System.out.println("search2u: " + search2u);
	System.out.println("search3u: " + search3u);
	System.out.println("search4u: " + search4u);
	System.out.println("view_search: " + view_search);
	System.out.println("count: " + count);
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
    String SIF            = null;
    String IME            = null;
    String PRIMEK             = null;
    String NAZIV            = null;
    
    String ID_WG            = null;
    String GROUP_NAME            = null;
    

    int n =1;

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_work_group_admin.get_wg_nousers_admin(?,?,?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

	    cstmt.setString(1, id); // 
	    cstmt.setString(2, search1u); // upo_sif
	    cstmt.setString(3, search2u); // p_ime
	    cstmt.setString(4, search3u); // p_priimek
	    cstmt.setString(5, search4u); // p_naziv
	    cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // vkupno
	    cstmt.registerOutParameter(7, OracleTypes.CURSOR); // list
	    cstmt.registerOutParameter(8, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(9, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(8);
		String errmsg = cstmt.getString(9);
		String vkupno = cstmt.getString(6);
		int vkupno_int=Integer.parseInt(vkupno);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(7);
			%>

<!-- =============================================================================================================================== -->
<%if ("".equals(view_search)) {%>
	<div class="box-header with-border">
	<i class="fa fa-square-o"></i>
		<h3 class="box-title" title="Недоделени корисници">Недоделени корисници&nbsp;&nbsp;<span class="label label-default pull-right"><%=vkupno%></span></h3>
	
		<%if (!"0".equals(vkupno)) {%>
		<div class="box-tools pull-right">
		<a class="btn btn-primary  btn-xs" data-toggle="modal" data-target="#ModalView" onClick="openModalSearch('<%=count%>','users')">пребарај</a>
<!-- 			<a class="btn btn-default btn-xs" -->
<%-- 				onClick="insUsersWorkGroup('<%=id%>','','<%=count%>')" --%>
<!-- 				title="Додели ги сите недоделени корисници"><i -->
<!-- 				class="fa  fa-hand-o-left"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				 <a
				class="btn btn-box-tool" data-widget="collapse"
				id="get_users_unassigned_but"> <i class="fa fa-plus"></i>
			</a>
		</div>
		<%}%>
	
	</div>
<%}%>	
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive" id="get_users_unassigned_sub">
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
			ID_WG = rs.getString("ID_WG");if (ID_WG==null){ID_WG="";}
			GROUP_NAME = rs.getString("GROUP_NAME");if (GROUP_NAME==null){GROUP_NAME="";}


			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>

		<tr>
			<td><b <%if (!ID_WG.equals("")){out.print("style='color:#b10000'");}%>><%=PRIMEK%> <%=IME%></b> <b style="color:#999"><%=NAZIV%></b> <b class="text-yellow" title="ID"><%=SIF%></b></td>
			<td width="5%"><a class="btn btn-default btn-xs" title="<%=SIF%>" onClick="insUsersWorkGroup('<%=id%>','<%=SIF%>','0','<%=GROUP_NAME%>')"><i class="fa fa-long-arrow-left"></i></a></td>
		</tr>
		<%
		n=n+1;
		}

	%>

		<!-- =============================================================================================================================== -->
	</table>
	<%if ("".equals(view_search)&&"0".equals(count)&&(vkupno_int>m)) {%>
		<div class="box-footer pull-right">
			<a class="btn btn-default btn-xs" onClick="getUsersWorkGroup('<%=id%>','unassig','1')" title="прикажи ги сите">прикажи ги сите</a>
		</div>
	<%}%>
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


