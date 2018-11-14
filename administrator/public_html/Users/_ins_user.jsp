<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Users/_ins_user.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String query = request.getParameter("query");if (query==null){query="";}
query = query.replace("&id="+id,"");

String NAZIV = request.getParameter("NAZIV");if (NAZIV==null){NAZIV="";}
String GESLO = request.getParameter("GESLO");if (GESLO==null){GESLO="";}
String OPOMBE = request.getParameter("OPOMBE");if (OPOMBE==null){OPOMBE="";}
String IME = request.getParameter("IME");if (IME==null){IME="";}
String PRIIMEK = request.getParameter("PRIIMEK");if (PRIIMEK==null){PRIIMEK="";}
String ODDELEK = request.getParameter("ODDELEK");if (ODDELEK==null){ODDELEK="";}
String INEX = request.getParameter("INEX");if (INEX==null){INEX="";}

String E_MAIL = request.getParameter("E_MAIL");if (E_MAIL==null){E_MAIL="";}
String CERTIFIKAT_ID = request.getParameter("CERTIFIKAT_ID");if (CERTIFIKAT_ID==null){CERTIFIKAT_ID="";}
String CERTIFIKAT_VALID = request.getParameter("CERTIFIKAT_VALID");if (CERTIFIKAT_VALID==null){CERTIFIKAT_VALID="";}
String PWD_CHANGE = request.getParameter("PWD_CHANGE");if (PWD_CHANGE==null){PWD_CHANGE="";}
String PWD_CHANGE_NEXT = request.getParameter("PWD_CHANGE_NEXT");if (PWD_CHANGE_NEXT==null){PWD_CHANGE_NEXT="";}
String ZAKLENJEN = request.getParameter("ZAKLENJEN");if (ZAKLENJEN==null){ZAKLENJEN="";}if ("".equals(ZAKLENJEN)){ZAKLENJEN="N";}

String ID_TYPE = request.getParameter("ID_TYPE");if (ID_TYPE==null){ID_TYPE="";}

// String TIP_UPORABNIKA = request.getParameter("TIP_UPORABNIKA");if (TIP_UPORABNIKA==null){TIP_UPORABNIKA="";}
// String JEZIK_ID = request.getParameter("JEZIK_ID");if (JEZIK_ID==null){JEZIK_ID="";}
// String ORACLE_UPORABNIK = request.getParameter("ORACLE_UPORABNIK");if (ORACLE_UPORABNIK==null){ORACLE_UPORABNIK="";}if ("".equals(ORACLE_UPORABNIK)){ORACLE_UPORABNIK="N";}
// String AUTOLOGIN = request.getParameter("AUTOLOGIN");if (AUTOLOGIN==null){AUTOLOGIN="";}if ("".equals(AUTOLOGIN)){AUTOLOGIN="0";}
// String ENOTA = request.getParameter("ENOTA");if (ENOTA==null){ENOTA="";}


// String AKNAZ = request.getParameter("AKNAZ");if (AKNAZ==null){AKNAZ="";}
// String STRNAZ = request.getParameter("STRNAZ");if (STRNAZ==null){STRNAZ="";}


String ADDRESS = request.getParameter("ADDRESS");if (ADDRESS==null){ADDRESS="";} 
String TAX_NUMBER = request.getParameter("TAX_NUMBER");if (TAX_NUMBER==null){TAX_NUMBER="";}
String ZIP = request.getParameter("ZIP");if (ZIP==null){ZIP="";} 
String TELEPHONE = request.getParameter("TELEPHONE");if (TELEPHONE==null){TELEPHONE="";};
String USER_TYPE = request.getParameter("USER_TYPE");if (USER_TYPE==null){USER_TYPE="";} 
String COMPANY = request.getParameter("COMPANY");if (COMPANY==null){COMPANY="";}
String LICENSE_NUMBER = request.getParameter("LICENSE_NUMBER");if (LICENSE_NUMBER==null){LICENSE_NUMBER="";}
String ID_UNIT = request.getParameter("ID_UNIT");if (ID_UNIT==null){ID_UNIT="";}
String ID_EMPPOS = request.getParameter("ID_EMPPOS");if (ID_EMPPOS==null){ID_EMPPOS="";}


String ACTIVE = "1";
String PREDLOG_PROMENI = request.getParameter("ID_TYPE");if (ID_TYPE==null){ID_TYPE="";}

String JEZIK_ID = "2";
String TIP_UPORABNIKA = "Navaden";
String ENOTA = "REFERENT";

String AUTOLOGIN = "0";
String ORACLE_UPORABNIK = "N";
String AKNAZ = "";
String STRNAZ = "";




System.out.println("id: "+id);
System.out.println("query: "+query);
System.out.println("-----------");
System.out.println("NAZIV: "+NAZIV);
System.out.println("GESLO: "+GESLO);
System.out.println("OPOMBE: "+OPOMBE);
System.out.println("IME: "+IME);
System.out.println("PRIIMEK: "+PRIIMEK);
System.out.println("ODDELEK: "+ODDELEK);
System.out.println("INEX: "+INEX);
System.out.println("AKNAZ: "+AKNAZ);
System.out.println("STRNAZ: "+STRNAZ);
System.out.println("E_MAIL: "+E_MAIL);
System.out.println("CERTIFIKAT_ID: "+CERTIFIKAT_ID);
System.out.println("CERTIFIKAT_VALID: "+CERTIFIKAT_VALID);
System.out.println("PWD_CHANGE: "+PWD_CHANGE);
System.out.println("PWD_CHANGE_NEXT: "+PWD_CHANGE_NEXT);
System.out.println("ZAKLENJEN: "+ZAKLENJEN);
System.out.println("ID_TYPE: "+ID_TYPE);

System.out.println("");
System.out.println("ADDRESS: "+ADDRESS);
System.out.println("TAX_NUMBER: "+TAX_NUMBER);
System.out.println("ZIP: "+ZIP);
System.out.println("TELEPHONE: "+TELEPHONE);
System.out.println("USER_TYPE: "+USER_TYPE);
System.out.println("COMPANY: "+COMPANY);
System.out.println("ID_UNIT: "+ID_UNIT);
System.out.println("LICENSE_NUMBER: "+LICENSE_NUMBER);
System.out.println("ACTIVE: "+ACTIVE);
System.out.println("PREDLOG_PROMENI: "+PREDLOG_PROMENI);
System.out.println("ID_EMPPOS: "+ID_EMPPOS);

System.out.println("");
System.out.println("JEZIK_ID: "+JEZIK_ID);
System.out.println("TIP_UPORABNIKA: "+TIP_UPORABNIKA);
System.out.println("ENOTA: "+ENOTA);
System.out.println("AUTOLOGIN: "+AUTOLOGIN);
System.out.println("ORACLE_UPORABNIK: "+ORACLE_UPORABNIK);
System.out.println("AKNAZ: "+AKNAZ);
System.out.println("STRNAZ: "+STRNAZ);





	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

	try {
		
		if ("".equals(id)) {
				sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_users.ins_user(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
				conn = DBConnection.getConnection(session);
		
				cstmt = conn.prepareCall(sql);
		
				cstmt.setString(1, NAZIV); // 
				cstmt.setString(2, GESLO); // 
				cstmt.setString(3, OPOMBE); // 
				cstmt.setString(4, IME); // 
				cstmt.setString(5, PRIIMEK); // 
				cstmt.setString(6, ODDELEK); // 
				cstmt.setString(7, ZAKLENJEN); // 
				cstmt.setString(8, AKNAZ); // 
				cstmt.setString(9, STRNAZ); // 
				cstmt.setString(10, AUTOLOGIN); // 
				cstmt.setString(11, ENOTA); // 
				cstmt.setString(12, TIP_UPORABNIKA); // 
				cstmt.setString(13, ORACLE_UPORABNIK); // 
				cstmt.setString(14, E_MAIL); // 
				cstmt.setString(15, JEZIK_ID); // 
				cstmt.setString(16, CERTIFIKAT_ID); // 
				cstmt.setString(17, CERTIFIKAT_VALID); // 
				cstmt.setString(18, PWD_CHANGE); // 
				cstmt.setString(19, PWD_CHANGE_NEXT); // 
				cstmt.setString(20, INEX); // 
				cstmt.setString(21, ID_TYPE); //
				cstmt.setString(22, ADDRESS); //
				cstmt.setString(23, TAX_NUMBER); //
				cstmt.setString(24, ZIP); //
				cstmt.setString(25, TELEPHONE); //
				cstmt.setString(26, USER_TYPE); //
				cstmt.setString(27, COMPANY); //
				cstmt.setString(28, ACTIVE); //
				cstmt.setString(29, LICENSE_NUMBER); //
				cstmt.setString(30, PREDLOG_PROMENI); //
				cstmt.setString(31, ID_UNIT); //
				cstmt.setString(32, ID_EMPPOS); //
				

				cstmt.registerOutParameter(33, OracleTypes.VARCHAR); // 
				cstmt.registerOutParameter(34, OracleTypes.VARCHAR); // errid
		
				cstmt.execute();
		
				errid = cstmt.getString(33);
				errmsg = cstmt.getString(34);
		
		
		}
		if (!"".equals(id)) {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname")+ ".api_users.upd_user(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			conn = DBConnection.getConnection(session);
	
			cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, id); // 
			cstmt.setString(2, NAZIV); // 
			cstmt.setString(3, GESLO); // 
			cstmt.setString(4, OPOMBE); // 
			cstmt.setString(5, IME); // 
			cstmt.setString(6, PRIIMEK); // 
			cstmt.setString(7, ODDELEK); // 
			cstmt.setString(8, ZAKLENJEN); // 
			cstmt.setString(9, AKNAZ); // 
			cstmt.setString(10, STRNAZ); // 
			cstmt.setString(11, AUTOLOGIN); // 
			cstmt.setString(12, ENOTA); // 
			cstmt.setString(13, TIP_UPORABNIKA); // 
			cstmt.setString(14, ORACLE_UPORABNIK); // 
			cstmt.setString(15, E_MAIL); // 
			cstmt.setString(16, JEZIK_ID); // 
			cstmt.setString(17, CERTIFIKAT_ID); // 
			cstmt.setString(18, CERTIFIKAT_VALID); // 
			cstmt.setString(19, PWD_CHANGE); // 
			cstmt.setString(20, PWD_CHANGE_NEXT); //
			cstmt.setString(21, INEX); // 
			cstmt.setString(22, ID_TYPE); // 
			cstmt.setString(23, ADDRESS); //
			cstmt.setString(24, TAX_NUMBER); //
			cstmt.setString(25, ZIP); //
			cstmt.setString(26, TELEPHONE); //
			cstmt.setString(27, USER_TYPE); //
			cstmt.setString(28, COMPANY); //
			cstmt.setString(29, ACTIVE); //
			cstmt.setString(30, LICENSE_NUMBER); //
			cstmt.setString(31, PREDLOG_PROMENI); //
			cstmt.setString(32, ID_UNIT); //
			cstmt.setString(33, ID_EMPPOS); //
	
			cstmt.registerOutParameter(34, OracleTypes.VARCHAR); // 
			cstmt.registerOutParameter(35, OracleTypes.VARCHAR); // errid
	
			cstmt.execute();
	
			errid = cstmt.getString(34);
			errmsg = cstmt.getString(35);
	
	
	}
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Users/_ins_user.jsp: " + errmsg);
			cstmt.close();

		}
	} catch (SQLException e) {
		e.printStackTrace();

		try {
			if (cstmt != null) {
				cstmt.close();
			}
			return;
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	} finally {
		try {
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
	}


	response.sendRedirect("ModuleList.jsp?"+query); 
	
%>



