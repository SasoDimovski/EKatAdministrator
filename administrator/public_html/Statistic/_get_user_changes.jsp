<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%
	String id   = request.getParameter("id");if (id==null){id="";}
	
	System.out.println("");
	System.out.println("Statistic/_get_user_changes.jsp: ");
	
	System.out.println("id: " + id);

    
	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;
	String sql = null;
	

 
	String SIF = "";
	String NAZIV = "";
	String GESLO = "";
	String OPOMBE = "";
	String IME = "";
	String PRIIMEK = "";
	String ODDELEK = "";
	String DP_NAME = "";
	String INEX = "";
	String ZAKLENJEN = "";
	String AKNAZ = "";
	String STRNAZ	 = "";
	String AUTOLOGIN = "";
	String ENOTA = "";
	String TIP_UPORABNIKA = "";
	String ORACLE_UPORABNIK = "";
	String E_MAIL = "";
	String JEZIK_ID = "";
	String CERTIFIKAT_ID = "";
	String CERTIFIKAT_VALID = "";
	String PWD_CHANGE = "";
	String PWD_CHANGE_NEXT = "";
	
	String HIS_STATUS = "";
	String HIS_CREATED_DATE = "";
	String HIS_CREATED_USER = "";
	String ID = "";

	String ADDRESS = "";
	String TAX_NUMBER = "";
	String ZIP = "";
	String TELEPHONE = "";
	String USER_TYPE = "";
	String COMPANY = "";
	String ACTIVE = "";
	String LICENSE_NUMBER = "";
	String ID_TYPE = "";
	String NAME = "";
	String SHORT_NAME = "";
	String PREDLOG_PROMENI = "";
	String ID_UNIT = "";
	String ID_EMPPOS = "";
	String EMPPOS_NAME = "";
	String ID_WG = "";
	String WG_NAME= "";
	String PAYER_TYPE= "";
	String unit_name= "";
	
	

    int n =1;

	try {

        sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_users.get_his_user_data(?,?,?,?); end;";
		conn = DBConnection.getConnection(session);

		//System.out.println("sql: " + sql);
		
		cstmt = conn.prepareCall(sql);
	    cstmt.setString(1, id); // upo_sif

	    cstmt.registerOutParameter(2, OracleTypes.CURSOR); // list

	    cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // errid
	    cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // errmsg

		cstmt.execute();

		String errid = cstmt.getString(3);
		String errmsg = cstmt.getString(4);


		if (errmsg == null) {
			rs = (ResultSet) cstmt.getObject(2);
			%>



<div class="box-body no-padding table-responsive" id="get_user_changes">

		<%
		if (rs.next()) {
			
			SIF = rs.getString("SIF");if (SIF==null){SIF="";}
			NAZIV = rs.getString("NAZIV");if (NAZIV==null){NAZIV="";}
			GESLO = rs.getString("GESLO");if (GESLO==null){GESLO="";}
			OPOMBE = rs.getString("OPOMBE");if (OPOMBE==null){OPOMBE="";}
			IME = rs.getString("IME");if (IME==null){IME="";}
			PRIIMEK = rs.getString("PRIIMEK");if (PRIIMEK==null){PRIIMEK="";}
			ODDELEK = rs.getString("ODDELEK");if (ODDELEK==null){ODDELEK="";}
			DP_NAME = rs.getString("DP_NAME");if (DP_NAME==null){DP_NAME="";}
			INEX = rs.getString("INEX");if (INEX==null){INEX="";}
			ZAKLENJEN = rs.getString("ZAKLENJEN");if (ZAKLENJEN==null){ZAKLENJEN="";}
			AKNAZ = rs.getString("AKNAZ");if (AKNAZ==null){AKNAZ="";}
			STRNAZ = rs.getString("STRNAZ");if (STRNAZ==null){STRNAZ="";}
			AUTOLOGIN = rs.getString("AUTOLOGIN");if (AUTOLOGIN==null){AUTOLOGIN="";}
			ENOTA = rs.getString("ENOTA");if (ENOTA==null){ENOTA="";}
			TIP_UPORABNIKA = rs.getString("TIP_UPORABNIKA");if (TIP_UPORABNIKA==null){TIP_UPORABNIKA="";}
			ORACLE_UPORABNIK = rs.getString("ORACLE_UPORABNIK");if (ORACLE_UPORABNIK==null){ORACLE_UPORABNIK="";}
			E_MAIL = rs.getString("E_MAIL");if (E_MAIL==null){E_MAIL="";}
			JEZIK_ID = rs.getString("JEZIK_ID");if (JEZIK_ID==null){JEZIK_ID="";}
			CERTIFIKAT_ID = rs.getString("CERTIFIKAT_ID");if (CERTIFIKAT_ID==null){CERTIFIKAT_ID="";}
			CERTIFIKAT_VALID = rs.getString("CERTIFIKAT_VALID");if (CERTIFIKAT_VALID==null){CERTIFIKAT_VALID="";}
			PWD_CHANGE = rs.getString("PWD_CHANGE");if (PWD_CHANGE==null){PWD_CHANGE="";}
			PWD_CHANGE_NEXT = rs.getString("PWD_CHANGE_NEXT");if (PWD_CHANGE_NEXT==null){PWD_CHANGE_NEXT="";}

// 			HIS_STATUS = rs.getString("HIS_STATUS");if (HIS_STATUS==null){HIS_STATUS="";}
// 			HIS_CREATED_DATE = rs.getString("HIS_CREATED_DATE");if (HIS_CREATED_DATE==null){HIS_CREATED_DATE="";}
// 			HIS_CREATED_USER = rs.getString("HIS_CREATED_USER");if (HIS_CREATED_USER==null){HIS_CREATED_USER="";}
// 			ID = rs.getString("ID");if (ID==null){ID="";}
			
			ADDRESS = rs.getString("ADDRESS");if (ADDRESS==null){ADDRESS="";}
			TAX_NUMBER = rs.getString("TAX_NUMBER");if (TAX_NUMBER==null){TAX_NUMBER="";}
			ZIP = rs.getString("ZIP");if (ZIP==null){ZIP="";}
			TELEPHONE = rs.getString("TELEPHONE");if (TELEPHONE==null){TELEPHONE="";}
			USER_TYPE = rs.getString("USER_TYPE");if (USER_TYPE==null){USER_TYPE="";}
			COMPANY = rs.getString("COMPANY");if (COMPANY==null){COMPANY="";}
			ACTIVE = rs.getString("ACTIVE");if (ACTIVE==null){ACTIVE="";}
			LICENSE_NUMBER = rs.getString("LICENSE_NUMBER");if (LICENSE_NUMBER==null){LICENSE_NUMBER="";}
			ID_TYPE = rs.getString("ID_TYPE");if (ID_TYPE==null){ID_TYPE="";}
			NAME = rs.getString("NAME");if (NAME==null){NAME="";}
			SHORT_NAME = rs.getString("SHORT_NAME");if (SHORT_NAME==null){SHORT_NAME="";}
			PREDLOG_PROMENI = rs.getString("PREDLOG_PROMENI");if (PREDLOG_PROMENI==null){PREDLOG_PROMENI="";}
			ID_UNIT = rs.getString("ID_UNIT");if (ID_UNIT==null){ID_UNIT="";}
			ID_EMPPOS = rs.getString("ID_EMPPOS");if (ID_EMPPOS==null){ID_EMPPOS="";}
			EMPPOS_NAME = rs.getString("EMPPOS_NAME");if (EMPPOS_NAME==null){EMPPOS_NAME="";}
			ID_WG = rs.getString("ID_WG");if (ID_WG==null){ID_WG="";}
			WG_NAME= rs.getString("WG_NAME");if (WG_NAME==null){WG_NAME="";}
			PAYER_TYPE= rs.getString("PAYER_TYPE");if (PAYER_TYPE==null){PAYER_TYPE="";}
			unit_name= rs.getString("unit_name");if (unit_name==null){unit_name="";}
			
			

			//System.out.println("COD_CC_NAME"+COD_CC_NAME);

	%>


	<!-- =============================================================================================================================== -->
	<table class="table table-hover table-striped table-condensed">
		<!-- =============================================================================================================================== -->
		
		      <tr><td>1. <b class="text-yellow">ID:</b> <%=SIF%></td></tr>
			  <tr><td>2. <b class="text-yellow">Корисничко име:</b> <%=NAZIV%></td></tr>
			  <tr><td>3. <b class="text-yellow">Име:</b> <%=IME%></td></tr>
			  <tr><td>4. <b class="text-yellow">Презиме:</b> <%=PRIIMEK%></td></tr>
			  <tr><td>5. <b class="text-yellow">Тип на корисник:</b> 
					  <%=("1".equals(INEX))?"Вработен во АКН":""%>
					  <%=("2".equals(INEX))?"Надворешен соработник":""%>
                  </td>
              </tr>
			  <tr><td>6. <b class="text-yellow">Работна позиција:</b> <%=EMPPOS_NAME%></td></tr>
			  <tr><td>7. <b class="text-yellow">Лозинка:</b> xxxxxxxxxx</td></tr>
			  <tr><td>8. <b class="text-yellow">Промена на лозинка:</b> <%=PWD_CHANGE%></td></tr>
			  <tr><td>9. <b class="text-yellow">Следна промена:</b> <%=PWD_CHANGE_NEXT%></td></tr>
			  <tr><td>10. <b class="text-yellow">Одделение:</b> <%=DP_NAME%></td></tr>
			  <tr><td>11. <b class="text-yellow">Поштенски код:</b> <%=ZIP%></td></tr>
			  <tr><td>12. <b class="text-yellow">Email:</b> <%=E_MAIL%></td></tr>
			  <tr><td>13. <b class="text-yellow">Број на сертификат:</b> <%=CERTIFIKAT_ID%></td></tr>
			  <tr><td>14. <b class="text-yellow">Валидност на сертификат:</b> <%=CERTIFIKAT_VALID%></td></tr>
			  <tr><td>15. <b class="text-yellow">Забелешка:</b> <%=OPOMBE%></td></tr>
<%-- 			  <tr><td>16. <b class="text-yellow">Работна група:</b> <%=WG_NAME%></td></tr> --%>
			  <tr><td>16. <b class="text-yellow">Тип на надворешен соработник:</b>  <%=NAME%></td></tr>
			  <tr><td>17. <b class="text-yellow">Единица:</b> <%=unit_name%></td></tr>
			  <tr><td>18. <b class="text-yellow">Тип на плаќач:</b> <%=PAYER_TYPE%></td></tr>
			  <tr><td>19. <b class="text-yellow">Компанија:</b> <%=COMPANY%></td></tr>
			  <tr><td>20. <b class="text-yellow">Даночен број:</b> <%=TAX_NUMBER%></td></tr>
			  <tr><td>21. <b class="text-yellow">Број на лиценца:</b> <%=LICENSE_NUMBER%></td></tr>
			  <tr><td>22. <b class="text-yellow">Телефон:</b> <%=TELEPHONE%></td></tr>
			  <tr><td>23. <b class="text-yellow">Заклучен:</b> <%if ("D".equals(ZAKLENJEN)){out.print("ДА");} else{out.print("НЕ");}%></td></tr>
		


		<!-- =============================================================================================================================== -->
	</table>

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


