<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String app_sif   = request.getParameter("app_sif");if (app_sif==null){app_sif="";}
    String sku_sif   = request.getParameter("sku_sif");if (sku_sif==null){sku_sif="";}
    String mod_sif   = request.getParameter("mod_sif");if (mod_sif==null){mod_sif="";}

    
	System.out.println("");
	System.out.println("Users/_view_modules_group.jsp: ");
	System.out.println("app_sif: " + app_sif);
	System.out.println("sku_sif: " + sku_sif);
	System.out.println("mod_sif: " + mod_sif);
	
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String APL_SIF = null;
	String APL_NAZIV = null;
	String MOD_SIF = null;
	String MOD_NAZIV = null;
	String MOD_DATOTEKA = null;
	String next_level = null;
	//int next_tree_lev = 0;
	String random = null; 
	String temp= ""; 

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.get_tree_aplication(?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);

		cstmt.registerOutParameter(1, OracleTypes.CURSOR); // list
		cstmt.setString(2, app_sif);
		cstmt.setString(3, sku_sif);
		cstmt.setString(4, mod_sif);
		
		cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();
		
		
		String vkupno = cstmt.getString(5);
		String errid = cstmt.getString(6);
		String errmsg = cstmt.getString(7);
		
	

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(1);
			%>

<!-- =============================================================================================================================== -->

<!-- =============================================================================================================================== -->


<%
	if (!"0".equals(vkupno)) {

%>
<!-- =============================================================================================================================== -->

<%
		while (rs.next()) {
			APL_SIF = rs.getString("APL_SIF");if (APL_SIF==null){APL_SIF="";}
			APL_NAZIV = rs.getString("APL_NAZIV");if (APL_NAZIV==null){APL_NAZIV="";}
			MOD_SIF = rs.getString("MOD_SIF");if (MOD_SIF==null){MOD_SIF="";}
			MOD_NAZIV = rs.getString("MOD_NAZIV");if (MOD_NAZIV==null){MOD_NAZIV="";}
			MOD_DATOTEKA = rs.getString("DATOTEKA");if (MOD_DATOTEKA==null){MOD_DATOTEKA="";}
			next_level = rs.getString("next_level");if (next_level==null){next_level="";}
			//next_tree_lev = Integer.parseInt(tree_lev)+1;
			random=Procs.randomAlphaNumeric(12);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV+", "+next_level);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV);
			
	
	%>
<%if (!"".equals(mod_sif)) {temp="margin-left: 40px";}%>
<div style="<%=temp%>">


	<h5>
	<%if (!"0".equals(next_level)) {%>
		<button  style="cursor:pointer;padding-left:2px;padding-right:2px" onClick="viewModulesGroup('<%=app_sif%>','<%=sku_sif%>','<%=MOD_SIF%>','exp<%=random%>')"  data-toggle="collapse"
			data-target="#exp<%=random%>"  id="2exp<%=random%>" ><b title="Име на привилегија"><%=MOD_NAZIV%></b> <span class="text-red" title="Датотека"><%=MOD_DATOTEKA%></span> <span class="text-yellow" title="ID"><%=MOD_SIF%></span></button> 
<%-- 			<small id="1exp<%=random%>"><i class="fa fa-plus"></i></small> --%>
	<%}else{%>
	<b title="Име на привилегија"><%=MOD_NAZIV%></b> <span class="text-red" title="Датотека"><%=MOD_DATOTEKA%> <span class="text-yellow" title="ID"><%=MOD_SIF%></span>
	<%}%>
	</h5>
	

	
	



	<div id="exp<%=random%>" class="collapse" lang="0"></div>
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

