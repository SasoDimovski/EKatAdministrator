<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Applications/_ins_application.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String query = request.getParameter("query");if (query==null){query="";}
query = query.replace("&id="+id,"");

String NAZIV =request.getParameter("NAZIV");if (NAZIV==null){NAZIV="";}
String K_NAZIV =request.getParameter("K_NAZIV");if (K_NAZIV==null){K_NAZIV="";} 
String OPOMBE =request.getParameter("OPOMBE");if (OPOMBE==null){OPOMBE="";}
String POT_APL =request.getParameter("POT_APL");if (POT_APL==null){POT_APL="";}
String IME_DATOTEKA =request.getParameter("IME_DATOTEKA");if (IME_DATOTEKA==null){IME_DATOTEKA="";}
String USERNAME =request.getParameter("USERNAME");if (USERNAME==null){USERNAME="";}
String PASSWORD = request.getParameter("PASSWORD");if (PASSWORD==null){PASSWORD="";}
String DB_NAME =request.getParameter("DB_NAME");if (DB_NAME==null){DB_NAME="";}
String DEBUG =request.getParameter("DEBUG");if (DEBUG==null){DEBUG="";}
String PROJEKT =request.getParameter("PROJEKT");if (PROJEKT==null){PROJEKT="";}
String HELP_TIP =request.getParameter("HELP_TIP");if (HELP_TIP==null){HELP_TIP="";}
String WIN_HELP_POT =request.getParameter("WIN_HELP_POT");if (WIN_HELP_POT==null){WIN_HELP_POT="";}
String WEB_HELP_POT =request.getParameter("WEB_HELP_POT");if (WEB_HELP_POT==null){WEB_HELP_POT="";}
String HLP_FILE =request.getParameter("HLP_FILE");if (HLP_FILE==null){HLP_FILE="";}
String RLS_CONN =request.getParameter("RLS_CONN");if (RLS_CONN==null){RLS_CONN="";}if ("".equals(RLS_CONN)){RLS_CONN="0";}
String ZAKLENJENA =request.getParameter("ZAKLENJENA");if (ZAKLENJENA==null){ZAKLENJENA="";}if ("".equals(ZAKLENJENA)){ZAKLENJENA="N";}
String SKUPINA_PODATKOV =request.getParameter("SKUPINA_PODATKOV");if (SKUPINA_PODATKOV==null){SKUPINA_PODATKOV="";}if ("".equals(SKUPINA_PODATKOV)){SKUPINA_PODATKOV="N";}
String NET_SERVER =request.getParameter("NET_SERVER");if (NET_SERVER==null){NET_SERVER="";}
String AVTOM_DODAJANJE_MODULOV =request.getParameter("AVTOM_DODAJANJE_MODULOV");if (AVTOM_DODAJANJE_MODULOV==null){AVTOM_DODAJANJE_MODULOV="";}if ("".equals(AVTOM_DODAJANJE_MODULOV)){AVTOM_DODAJANJE_MODULOV="N";}

System.out.println("id: "+id);
System.out.println("query: "+query);
System.out.println("-----------");
System.out.println("NAZIV: "+NAZIV);
System.out.println("K_NAZIV: "+K_NAZIV);
System.out.println("OPOMBE: "+OPOMBE);
System.out.println("POT_APL: "+POT_APL);
System.out.println("IME_DATOTEKA: "+IME_DATOTEKA);
System.out.println("USERNAME: "+USERNAME);
System.out.println("PASSWORD: "+PASSWORD);
System.out.println("DB_NAME: "+DB_NAME);
System.out.println("DEBUG: "+DEBUG);
System.out.println("PROJEKT: "+PROJEKT);
System.out.println("HELP_TIP: "+HELP_TIP);
System.out.println("WIN_HELP_POT: "+WIN_HELP_POT);
System.out.println("WEB_HELP_POT: "+WEB_HELP_POT);
System.out.println("HLP_FILE: "+HLP_FILE);
System.out.println("RLS_CONN: "+RLS_CONN);
System.out.println("ZAKLENJENA: "+ZAKLENJENA);
System.out.println("SKUPINA_PODATKOV: "+SKUPINA_PODATKOV);
System.out.println("NET_SERVER: "+NET_SERVER);
System.out.println("AVTOM_DODAJANJE_MODULOV: "+AVTOM_DODAJANJE_MODULOV);

	Connection conn = null;
	CallableStatement cstmt = null;
	String sql = null;

	String errid = null;
	String errmsg = null;

	try {
		
		if ("".equals(id)) {
				sql = "begin " + ReadDBProperties.getProperty("conn_uname")
						+ ".api_codes.ins_aplication(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
				conn = DBConnection.getConnection(session);
		
				cstmt = conn.prepareCall(sql);
		
				cstmt.setString(1, NAZIV); // 
				cstmt.setString(2, K_NAZIV); // 
				cstmt.setString(3, OPOMBE); // 
				cstmt.setString(4, POT_APL); // 
				cstmt.setString(5, IME_DATOTEKA); // 
				cstmt.setString(6, USERNAME); // 
				cstmt.setString(7, PASSWORD); // 
				cstmt.setString(8, DB_NAME); // 
				cstmt.setString(9, DEBUG); // 
				cstmt.setString(10, PROJEKT); // 
				cstmt.setString(11, HELP_TIP); // 
				cstmt.setString(12, WIN_HELP_POT); // 
				cstmt.setString(13, WEB_HELP_POT); // 
				cstmt.setString(14, HLP_FILE); // 
				cstmt.setString(15, RLS_CONN); // 
				cstmt.setString(16, ZAKLENJENA); // 
				cstmt.setString(17, SKUPINA_PODATKOV); // 
				cstmt.setString(18, NET_SERVER); // 
				cstmt.setString(19, AVTOM_DODAJANJE_MODULOV); // 
		
				cstmt.registerOutParameter(20, OracleTypes.VARCHAR); // 
				cstmt.registerOutParameter(21, OracleTypes.VARCHAR); // errid
		
				cstmt.execute();
		
				errid = cstmt.getString(20);
				errmsg = cstmt.getString(21);
		
		
		}
		if (!"".equals(id)) {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname")
					+ ".api_codes.upd_aplication(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); end;";
			conn = DBConnection.getConnection(session);
	
			cstmt = conn.prepareCall(sql);
			
			cstmt.setString(1, id); // 
			cstmt.setString(2, NAZIV); // 
			cstmt.setString(3, K_NAZIV); // 
			cstmt.setString(4, OPOMBE); // 
			cstmt.setString(5, POT_APL); // 
			cstmt.setString(6, IME_DATOTEKA); // 
			cstmt.setString(7, USERNAME); // 
			cstmt.setString(8, PASSWORD); // 
			cstmt.setString(9, DB_NAME); // 
			cstmt.setString(10, DEBUG); // 
			cstmt.setString(11, PROJEKT); // 
			cstmt.setString(12, HELP_TIP); // 
			cstmt.setString(13, WIN_HELP_POT); // 
			cstmt.setString(14, WEB_HELP_POT); // 
			cstmt.setString(15, HLP_FILE); // 
			cstmt.setString(16, RLS_CONN); // 
			cstmt.setString(17, ZAKLENJENA); // 
			cstmt.setString(18, SKUPINA_PODATKOV); // 
			cstmt.setString(19, NET_SERVER); // 
			cstmt.setString(20, AVTOM_DODAJANJE_MODULOV); // 
	
			cstmt.registerOutParameter(21, OracleTypes.VARCHAR); // 
			cstmt.registerOutParameter(22, OracleTypes.VARCHAR); // errid
	
			cstmt.execute();
	
			errid = cstmt.getString(21);
			errmsg = cstmt.getString(22);
	
	
	}
		
		if (errmsg != null) {
			// handle error
			%>
            <div class="box-header text-left"><br>errid: <strong><%=errid%></strong><br>errmsg: <strong><%=errmsg%></strong><br><br></div>
            <%
			System.out.println("Applications/_ins_application.jsp: " + errmsg);
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



