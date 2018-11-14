package Procedures;

import Procedures.DBConnection;
import Procedures.ReadDBProperties;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Vector;
import java.util.Map;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;
import java.security.cert.X509Certificate;
import java.sql.DriverManager;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Procs {
	public Procs() {
	}

	public static String is_admin_user(String username, String password, HttpSession session) {

		Connection conn = null;
		CallableStatement cstmt = null;

		ResultSet rs = null;
		String sql = null;

		String LOGIN = null;
		String rezultat = null;

		System.out.println("");
		System.out.println("Procs/is_admin_user:");

		try {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname") + ".api_admin.is_admin_user(?,?,?,?,?,?); end;";
			conn = DBConnection.getConnection(session);

			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, username); // username
			cstmt.setString(2, password); // password
			cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // admin_status
			cstmt.registerOutParameter(4, OracleTypes.CURSOR);
			cstmt.registerOutParameter(5, OracleTypes.VARCHAR);// errid
			cstmt.registerOutParameter(6, OracleTypes.VARCHAR);// errmsg

			cstmt.execute();

			String errmsg = cstmt.getString(6);
			LOGIN = cstmt.getString(3);

			if (errmsg == null) {
				if (LOGIN.equals("1")) {
					rs = (ResultSet) cstmt.getObject(4);
					if (rs.next()) {
						rezultat = LOGIN;

						session.setAttribute("ID_ADMIN", rs.getString("ID_ADMIN"));
						session.setAttribute("USERNAME", rs.getString("USERNAME"));
						session.setAttribute("PASSWORD", rs.getString("PASSWORD"));
						session.setAttribute("NAME", rs.getString("NAME"));
						session.setAttribute("SURNAME", rs.getString("SURNAME"));
						session.setAttribute("LOGIN", rs.getString("LOGIN"));
						System.out.println("USPESNO LOGIRANJE");
					}
				}
				if (LOGIN.equals("0")) {
					rezultat = LOGIN;
					session.setAttribute("ID_ADMIN", null);
					session.setAttribute("USERNAME", null);
					session.setAttribute("PASSWORD", null);
					session.setAttribute("NAME", null);
					session.setAttribute("SURNAME", null);
					session.setAttribute("LOGIN", null);
					System.out.println("NEUSPESNO LOGIRANJE");
				}
				cstmt.close();
				if (rs != null) {
					rs.close();
				}
				return rezultat;

			} else {
				// handle error
				System.out.println(errmsg);
				cstmt.close();
			}
		} catch (SQLException e) {
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
			return rezultat;
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

		return rezultat;

	}

	public static String[][] get_code(String id, String name, String table_name, String param, HttpSession session) {

		Connection conn = null;
		CallableStatement cstmt = null;
		String[][] code = null;
		ResultSet rs = null;
		String errmsg = null;
		String errid = null;
		String sql = null;

		if (id==null){id="";}
		if (name==null){name="";}
		if (table_name==null){table_name="";}
		if (param==null){param="";}
		
		System.out.println("");
		System.out.println("Procs/get_code:");
		System.out.println("id: " + id);
		System.out.println("name: " + name);
		System.out.println("table_name: " + table_name);
		System.out.println("param: " + param);

		try {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname") + ".api_users.get_codes(?,?,?,?,?,?,?,?); end;";
			conn = DBConnection.getConnection(session);
			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, id);
			cstmt.setString(2, name);
			cstmt.setString(3, table_name);
			cstmt.setString(4, param);
			cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // count
			cstmt.registerOutParameter(6, OracleTypes.CURSOR); // list
			cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errid
			cstmt.registerOutParameter(8, OracleTypes.VARCHAR); // errmsg
			cstmt.execute();

			errid = cstmt.getString(7);
			errmsg = cstmt.getString(8);

			int records = cstmt.getInt(5);
			code = new String[records][4];
			if (errmsg == null) {
				if (records > 0) {
					rs = (ResultSet) cstmt.getObject(6);

					for (int i = 0; rs.next(); i++) {
						code[i][0] = rs.getString("ID");
						// System.out.println(code[i][0]);
						code[i][1] = rs.getString("NAME");
						// System.out.println(code[i][1]);
						code[i][2] = rs.getString("NAME_FULL");
						// System.out.println(code[i][2]);
					}
				}
			} else { // handle error
				System.out.println(errmsg);
				cstmt.close();
			}
			if (rs != null)
				rs.close();
			cstmt.close();

		} catch (SQLException e) {
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

		return code;
	}

	private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

	public static String randomAlphaNumeric(int count) {

		StringBuilder builder = new StringBuilder();

		while (count-- != 0) {

			int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());

			builder.append(ALPHA_NUMERIC_STRING.charAt(character));

		}

		return builder.toString();

	}
	
	public static String is_user_exist(String ID ,String NAZIV , HttpSession session) {

	    Connection conn = null;
	    CallableStatement cstmt = null;
	    String sql = null;


	    try {

	        conn = DBConnection.getConnection(session);
	        sql = "begin ? := " + ReadDBProperties.getProperty("conn_uname") + ".api_users.is_user_exist(?,?); end;";
	        cstmt = conn.prepareCall(sql);

	        cstmt.registerOutParameter(1, OracleTypes.VARCHAR); // 
	        cstmt.setString(2, ID);
	        cstmt.setString(3, NAZIV);

	        

	        cstmt.execute();

	        String rezultat = cstmt.getString(1);

	        cstmt.close();

	        return (rezultat);

	    }

	    catch (SQLException sqle) {
	        sqle.printStackTrace();
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    finally {
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
    public static void getTempUserSession(String certSN, HttpSession session) {

        Connection conn = null;
        CallableStatement cstmt = null;
        String sql = null;

        String TEMPUSERID = null;
        String TEMPUSERNAME = null;
        String CERTIFICATE = certSN;


        try {
			sql = "begin " + ReadDBProperties.getProperty("conn_uname") + ".api_admin.get_user_certificat_id(?, ?,?,?,?,?,?,?); end;";
            conn = DBConnection.getConnection(session);
            System.out.println("conn: " + conn);
            cstmt = conn.prepareCall(sql);

            cstmt.setString(1, certSN); // certSN
            cstmt.registerOutParameter(2, OracleTypes.VARCHAR); // id_admin
            cstmt.registerOutParameter(3, OracleTypes.VARCHAR); // username
            cstmt.registerOutParameter(4, OracleTypes.VARCHAR); // password
            cstmt.registerOutParameter(5, OracleTypes.VARCHAR); // name
            cstmt.registerOutParameter(6, OracleTypes.VARCHAR); // surname

            cstmt.registerOutParameter(7, OracleTypes.VARCHAR); // errid
            cstmt.registerOutParameter(8, OracleTypes.VARCHAR); // errmsg

            cstmt.execute();

            String errid = cstmt.getString(7);
            String errmsg = cstmt.getString(8);

            if (errmsg == null) {
                TEMPUSERID = cstmt.getString(2);
                TEMPUSERNAME = cstmt.getString(3);

                session.setAttribute("TEMPUSERID", TEMPUSERID);
                session.setAttribute("TEMPUSERNAME", TEMPUSERNAME);
                session.setAttribute("TEMPCERTIFICATE", CERTIFICATE);

                System.out.println("ПРОНАЈДЕН СЕРТИФИКАТ");
                System.out.println("Session(TEMPUSERID): " + TEMPUSERID);
                System.out.println("Session(TEMPUSERNAME): " + TEMPUSERNAME);
                System.out.println("Session(CERTIFICATE): " + CERTIFICATE);

            } else {
            	
                session.setAttribute("TEMPERROR", errmsg);
            	//System.out.println("НЕ Е ПРОНАЈДЕН СЕРТИФИКАТ");
                //System.out.println("Session(TEMPERROR): " + errmsg);
                cstmt.close();
            }
        }

        catch (Exception e) {
        	System.out.println("catch on: getTempUserSession");
        	e.printStackTrace();
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            //session.setAttribute("TEMPERROR", e.getMessage());
        }

        finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
    }
	public static String is_sn_exist(String ID ,String SN , HttpSession session) {

	    Connection conn = null;
	    CallableStatement cstmt = null;
	    String sql = null;


	    try {

	        conn = DBConnection.getConnection(session);
	        sql = "begin ? := " + ReadDBProperties.getProperty("conn_uname") + ".api_users.is_cert_exist(?,?); end;";
	        cstmt = conn.prepareCall(sql);

	        cstmt.registerOutParameter(1, OracleTypes.VARCHAR); // 
	        cstmt.setString(2, ID);
	        cstmt.setString(3, SN);

	        

	        cstmt.execute();

	        String rezultat = cstmt.getString(1);

	        cstmt.close();

	        return (rezultat);

	    }

	    catch (SQLException sqle) {
	        sqle.printStackTrace();
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    finally {
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	public static String is_wg_exist(String ID ,String WG , HttpSession session) {

	    Connection conn = null;
	    CallableStatement cstmt = null;
	    String sql = null;


	    try {

	        conn = DBConnection.getConnection(session);
	        sql = "begin ? := " + ReadDBProperties.getProperty("conn_uname") + ".api_work_group_admin.is_group_exist(?,?); end;";
	        cstmt = conn.prepareCall(sql);

	        cstmt.registerOutParameter(1, OracleTypes.VARCHAR); // 
	        cstmt.setString(2, ID);
	        cstmt.setString(3, WG);

	        

	        cstmt.execute();

	        String rezultat = cstmt.getString(1);

	        cstmt.close();

	        return (rezultat);

	    }

	    catch (SQLException sqle) {
	        sqle.printStackTrace();
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    finally {
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
	public static String is_group_exist(String ID ,String GROUP , HttpSession session) {

	    Connection conn = null;
	    CallableStatement cstmt = null;
	    String sql = null;


	    try {

	        conn = DBConnection.getConnection(session);
	        sql = "begin ? := " + ReadDBProperties.getProperty("conn_uname") + ".api_work_group_admin.IS_OISD_GROUP_EXIST(?,?); end;";
	        cstmt = conn.prepareCall(sql);

	        cstmt.registerOutParameter(1, OracleTypes.VARCHAR); // 
	        cstmt.setString(2, ID);
	        cstmt.setString(3, GROUP);

	        

	        cstmt.execute();

	        String rezultat = cstmt.getString(1);

	        cstmt.close();

	        return (rezultat);

	    }

	    catch (SQLException sqle) {
	        sqle.printStackTrace();
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    finally {
	        try {
	            if (cstmt != null) {
	                cstmt.close();
	            }
	            if (conn != null) {
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
}