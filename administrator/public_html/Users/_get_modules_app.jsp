<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String app_sif   = request.getParameter("app_sif");if (app_sif==null){app_sif="";}
    String sif   = request.getParameter("sif");if (sif==null){sif="";}
    String mod_sif   = request.getParameter("mod_sif");if (mod_sif==null){mod_sif="";}
    String prava   = request.getParameter("prava");if (prava==null){prava="";}
    String pregled   = request.getParameter("pregled");if (pregled==null){pregled="";}
    
	System.out.println("");
	System.out.println("Users/_get_modules_app.jsp: ");
	System.out.println("app_sif: " + app_sif);
	System.out.println("sif: " + sif);
	System.out.println("mod_sif: " + mod_sif);
	System.out.println("prava: " + prava);
	System.out.println("pregled: " + pregled);
	
	
	
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


	String random = null; 

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_grants.GET_USER_MODULS(?,?,?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, app_sif);
		cstmt.setString(2, sif);
		cstmt.setString(3, mod_sif);
		cstmt.setString(4, prava);


		cstmt.registerOutParameter(5, OracleTypes.CURSOR); // list
		cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(8, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();
		
		
		String vkupno = cstmt.getString(6);
		String errid = cstmt.getString(7);
		String errmsg = cstmt.getString(8);
		
	

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(5);
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
			//random=Procs.randomAlphaNumeric(12);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV+", "+next_level);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV);
	%>
<%if (!"".equals(mod_sif)) {%>
<div style="margin-left: 40px">
<%}else{%>
<div>
<%}%>

	<h5>
	<%if (!"0".equals(next_level)) {%>
		<button style="cursor:pointer;padding-left:2px;padding-right:2px" onClick="getModulesApp('<%=sif%>','<%=app_sif%>','<%=MOD_SIF%>','<%=MOD_SIF%><%=prava%>','<%=prava%>','<%=pregled%>')"  data-toggle="collapse"
			data-target="#<%=MOD_SIF%><%=prava%>"  id="2<%=MOD_SIF%><%=prava%>"><b title="Име на привилегија"><%=MOD_NAZIV%></b> <span class="text-green" title="Датотека"><%=MOD_DATOTEKA%></span> <span class="text-yellow" title="ID"><%=MOD_SIF%></span></button>
<%-- 			<small id="1exp<%=MOD_SIF%><%=prava%>"><i class="fa fa-plus"></i></small> --%>
	<%}else{%>
	<b title="Име на привилегија"><%=MOD_NAZIV%></b> <span class="text-green" title="Датотека"><%=MOD_DATOTEKA%> <span class="text-yellow" title="ID"><%=MOD_SIF%></span>
	<%}%>
	&nbsp;
	<%if ("0".equals(prava)&&!"1".equals(pregled)) {%>
	<small onClick="insModulesUser('<%=sif%>','<%=APL_SIF%>','<%=MOD_SIF%>','<%=MOD_SIF%><%=prava%>','<%=prava%>')"  title="Додели ја привилегијата '<%=MOD_DATOTEKA%>, <%=MOD_NAZIV%>' и сите нејзини подпривилегии" class="linkStrelka"><i class="fa fa-arrow-left "></i></small>
	<%}%>
	<%if ("1".equals(prava)&&!"1".equals(pregled)) {%>
	<small onClick="delModulesUser('<%=sif%>','<%=APL_SIF%>','<%=MOD_SIF%>','<%=MOD_SIF%><%=prava%>','<%=prava%>')"  title="Избриши ја привилегијата  '<%=MOD_DATOTEKA%>, <%=MOD_NAZIV%>' и сите нејзини подпривилегии" class="linkStrelka"><i class="fa fa-arrow-right "></i></small>
	<%}%>
	</h5>
	

	
	



	<div id="<%=MOD_SIF%><%=prava%>" class="collapse" lang="0">
<%--     <div id="exp<%=MOD_SIF%><%=prava%>" class="collapse" lang="0" style="display:block"> --%>
	
<%-- 							<jsp:include page="_get_modules_app.jsp" flush="true" > --%>
<%-- 							<jsp:param name="app_sif" value="<%=app_sif%>"  /> --%>
<%-- 							<jsp:param name="sif" value="<%=sif%>"  /> --%>
<%-- 							<jsp:param name="mod_sif" value="<%=MOD_SIF%>"  /> --%>
<%-- 							<jsp:param name="prava" value="<%=prava%>"  /> --%>
<%-- 							</jsp:include> --%>
	
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
<!-- <div class="box-header text-left"> -->
<!-- 	<br> <strong>Нема записи !</strong><br> <br> -->
<!-- </div> -->

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

