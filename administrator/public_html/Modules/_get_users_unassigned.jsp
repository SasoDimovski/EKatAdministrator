<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String id   = request.getParameter("id");if (id==null){id="";}
    String count   = request.getParameter("count");if (count==null){count="";}
    String apl_sif   = request.getParameter("apl_sif");if (apl_sif==null){apl_sif="";}
    
    String search1   = request.getParameter("search1");if (search1==null){search1="";}
    String search2   = request.getParameter("search2");if (search2==null){search2="";}
    String search3   = request.getParameter("search3");if (search3==null){search3="";}
    String search4   = request.getParameter("search4");if (search4==null){search4="";}
    
    String view_search   = request.getParameter("view_search");if (view_search==null){view_search="";}

    
    
    int m   = 0;
    if ("0".equals(count)){m=30;}
    if ("1".equals(count)){m=3000000;}


	System.out.println("");
	System.out.println("Modules/_get_users_unassigned.jsp: ");
	System.out.println("id: " + id);

	System.out.println("search1: " + search1);
	System.out.println("search2: " + search2);
	System.out.println("search3: " + search3);
	System.out.println("search4: " + search4);
	System.out.println("view_search: " + view_search);
	System.out.println("count: " + count);
	System.out.println("apl_sif: " + apl_sif);
	
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
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.get_modul_user(?,?,?,?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

	    cstmt.setString(1, id); // 
	    cstmt.setString(2, "0"); // upo_sif
	    cstmt.setString(3, search1); // upo_sif
	    cstmt.setString(4, search2); // p_ime
	    cstmt.setString(5, search3); // p_priimek
	    cstmt.setString(6, search4); // p_naziv
	    cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // vkupno
	    cstmt.registerOutParameter(8, OracleTypes.CURSOR); // list
	    cstmt.registerOutParameter(9, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(10, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(9);
		String errmsg = cstmt.getString(10);
		String vkupno = cstmt.getString(7);
		int vkupno_int=Integer.parseInt(vkupno);

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(8);
			%>

<!-- =============================================================================================================================== -->
<%if ("".equals(view_search)) {%>
	<div class="box-header with-border">
	<i class="fa fa-square-o"></i>
		<h3 class="box-title">Корисници&nbsp;&nbsp;<span class="label label-success pull-right"><%=vkupno%></span></h3>
	
		<%if (!"0".equals(vkupno)) {%>
		<div class="box-tools pull-right">
		<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#ModalView" onClick="openModalSearch1('<%=count%>','<%=apl_sif%>')">пребарај</a>
			<a class="btn btn-success btn-xs"
				onClick="insUsersModul('<%=id%>','','<%=count%>','<%=apl_sif%>')"
				title="Додели ги сите недоделени корисници"><i
				class="fa  fa-hand-o-left"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <a
				class="btn btn-box-tool" data-widget="collapse"
				id="get_users_unassigned_but"> <i class="fa fa-plus"></i>
			</a>
		</div>
		<%}%>
	
	</div>
<%}%>	
<!-- =============================================================================================================================== -->

<div class="box-body no-padding table-responsive" id="get_arhs_unassigned_sub">
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
			<%if ("".equals(view_search)) {%>
			<a class="btn btn-success btn-xs" title="<%=SIF%>" onClick="insUsersModul('<%=id%>','<%=SIF%>','0','<%=apl_sif%>')"><i class="fa fa-long-arrow-left"></i></a>
			<%}%>
			<%if (!"".equals(view_search)) {%>
			<a class="btn btn-success btn-xs" title="<%=SIF%>"  data-dismiss="modal" onClick="insUsersModul('<%=id%>','<%=SIF%>','0','<%=apl_sif%>')"><i class="fa fa-long-arrow-left"></i></a>
			<%}%>
			</td>
		</tr>
		<%
		n=n+1;
		}

	%>

		<!-- =============================================================================================================================== -->
	</table>
	<%if ("".equals(view_search)&&"0".equals(count)&&(vkupno_int>m)) {%>
		<div class="box-footer pull-right">
			<a class="btn btn-default btn-xs" onClick="getUsersModul('<%=id%>','unassig','1','<%=apl_sif%>')" title="прикажи ги сите">прикажи ги сите</a>
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


