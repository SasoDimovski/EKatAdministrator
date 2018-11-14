<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@page import="java.sql.*"%><%@page import="java.util.*"%><%@ page import="java.io.IOException.*"%><%@ page import="javax.servlet.ServletException.*"%><%@ page import="java.io.UnsupportedEncodingException"%><%@ page import="java.net.URLDecoder"%><%@ page import="java.net.URLEncoder"%><%@ page import="Procedures.*"%><%
request.setCharacterEncoding("UTF-8");
try{
System.out.println("");	
System.out.println("autocomplite_wg1.jsp: ");


String search9 = (String)request.getParameter("search9");

if (search9==null){search9="";}
if (search9!=null){
	search9=search9.trim();;
	//search9 = URLEncoder.encode( search9, "ISO-8859-1" ); // H%C3%A9l%C3%A8ne
	//search9 = URLDecoder.decode( search9, "UTF-8" ); // and finally : Hélène
}

System.out.println("search9: "+search9);

String conn_url = ReadDBProperties.getProperty("conn_url");
String conn_usr = ReadDBProperties.getProperty("conn_uname");
String conn_pas = ReadDBProperties.getProperty("conn_pass");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection(conn_url,conn_usr,conn_pas);

Statement statement = connection.createStatement() ;
String sql="select ID,NAME,ID_DEP from WF_WORK_GROUP ORDER BY NAME ASC";
ResultSet resultset = statement.executeQuery(sql) ; 
System.out.println("sql: "+sql);

String s[]=null;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//String search="[";
%>
	<option></option>
	<%
while(resultset.next())
{
	//search=search+"\""+resultset.getString("NAME")+"\",";
%>
	<option id="<%=resultset.getString("ID")%>" <%if (resultset.getString("NAME").trim().equals(search9)) {out.print("selected");}%>><%=resultset.getString("NAME")%></option>
	<%
}

//if (search != null && search.length() > 0) {search = search.substring(0, search.length() - 1);}
//search=search+"]";
//out.print(search);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

 resultset.close();
 //st.close();
 connection.close();
  
 }
 catch(Exception e){
 e.printStackTrace();
 }%>