<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
    String app_sif   = request.getParameter("app_sif");if (app_sif==null){app_sif="";}
    String mod_sif   = request.getParameter("mod_sif");if (mod_sif==null){mod_sif="";}
	String mv   = request.getParameter("mv");if (mv==null){mv="";}
    
	System.out.println("");
	System.out.println("Modules/_get_modules.jsp: ");
	System.out.println("app_sif: " + app_sif);
	System.out.println("mod_sif: " + mod_sif);
	System.out.println("mv: "+mv);
	
	
	
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	String APLIKACIJA_NAZIV= null;
	String TIP_MODUL_NAZIV= null;
	String APL_SIF= null;
	String SIF= null;
	String NAZIV= null;
	String DATOTEKA= null;
	String MOD_SIF= null;
	String TIP_SIF= null;
	String IMPVAR= null;
	String ZAKLENJEN= null;
	String NEXT_LEVEL= null;
	
	
	String css = "";
	String css1 = "";

	String random = null; 

	try {
		sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_codes.get_tab_moduls(?,?,?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, app_sif);
		cstmt.setString(2, mod_sif);

		cstmt.registerOutParameter(3, OracleTypes.CURSOR); // list
		cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // vkupno
		cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // errid
		cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();
		
		
		String vkupno = cstmt.getString(4);
		String errid = cstmt.getString(5);
		String errmsg = cstmt.getString(6);
		String query=request.getQueryString();
	

		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(3);
			%>

<!-- =============================================================================================================================== -->
<ul class="list-group">
<!-- =============================================================================================================================== -->


<%
	if (!"0".equals(vkupno)) {

%>
<!-- =============================================================================================================================== -->

<%
		while (rs.next()) {

			//System.out.println("MOD_NAZIV: "+MOD_NAZIV+", "+next_level);
			//System.out.println("MOD_NAZIV: "+MOD_NAZIV);
			
			APLIKACIJA_NAZIV= rs.getString("APLIKACIJA_NAZIV");if (APLIKACIJA_NAZIV==null){APLIKACIJA_NAZIV="";}
			TIP_MODUL_NAZIV= rs.getString("TIP_MODUL_NAZIV");if (TIP_MODUL_NAZIV==null){TIP_MODUL_NAZIV="";}
			APL_SIF= rs.getString("APL_SIF");if (APL_SIF==null){APL_SIF="";}
			SIF= rs.getString("SIF");if (SIF==null){SIF="";}
			NAZIV= rs.getString("NAZIV");if (NAZIV==null){NAZIV="";}
		    DATOTEKA= rs.getString("DATOTEKA");if (DATOTEKA==null){DATOTEKA="";}
		    MOD_SIF= rs.getString("MOD_SIF");if (MOD_SIF==null){MOD_SIF="";}
		    TIP_SIF= rs.getString("TIP_SIF");if (TIP_SIF==null){TIP_SIF="";}
		    IMPVAR= rs.getString("IMPVAR");if (IMPVAR==null){IMPVAR="";}
		    ZAKLENJEN= rs.getString("ZAKLENJEN");if (ZAKLENJEN==null){ZAKLENJEN="";} 
		    NEXT_LEVEL= rs.getString("NEXT_LEVEL");if (NEXT_LEVEL==null){NEXT_LEVEL="";}
					
	%>
	

<%if (!"".equals(mod_sif)) {%>
<div style="margin-left: 40px">
<%}else{%>
<div>
<%}%>

	<h5>
	<%if (!"0".equals(NEXT_LEVEL)) {%>
		<button style="cursor:pointer;padding-left:2px;padding-right:2px" onClick="getModulesApp1('<%=app_sif%>','<%=SIF%>','<%=SIF%>','<%=mv%>')"  data-toggle="collapse"
			data-target="#<%=SIF%>"  id="2<%=MOD_SIF%>"><b title="Име на привилегија"><%=NAZIV%></b> <span class="text-green"  title="Датотека"><%=DATOTEKA%></span>
			 <span class="text-red"><%=TIP_MODUL_NAZIV%></span>
			  <span class="text-yellow" title="ID"><%=SIF%></span>
			   <span class="text-aqua" title="ID Parent"><%=MOD_SIF%></span></button>
			   <a href="ModuleEdit.jsp?mv=<%=mv%>&apl_sif=<%=APL_SIF%>&id=<%=SIF%>" title="Измени во записот"><button><i class="fa fa-edit"></i></button></a>
	<%}else{%>
	<b title="Име на привилегија"><%=NAZIV%></b> <span class="text-green"  title="Датотека"><%=DATOTEKA%></span> <span class="text-red" title="Тип на модул"><%=TIP_MODUL_NAZIV%></span> <span class="text-yellow" title="ID"><%=SIF%></span> <span class="text-aqua" title="ID Parent"><%=MOD_SIF%></span>
	<a href="ModuleEdit.jsp?mv=<%=mv%>&apl_sif=<%=APL_SIF%>&id=<%=SIF%>" title="Измени во записот"><button><i class="fa fa-edit"></i></button></a>
	<%}%>

	</h5>
	

	
	



	<div id="<%=SIF%>" class="collapse" lang="0">

	
	</div>
</div>
<%
		}
	%>

<!-- =============================================================================================================================== -->

 </ul>
<!-- =============================================================================================================================== -->
<%
	} else {
%>
<div class="box-header text-left">
	 <strong>Нема записи !</strong>
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

