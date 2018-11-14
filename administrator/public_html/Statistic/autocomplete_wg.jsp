<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%><%@page import="java.sql.*"%><%@page import="java.util.*"%><%@ page import="java.io.IOException.*"%><%@ page import="javax.servlet.ServletException.*"%><%@ page import="java.io.UnsupportedEncodingException"%><%@ page import="java.net.URLDecoder"%><%@ page import="java.net.URLEncoder"%><%@ page import="Procedures.*"%><%
request.setCharacterEncoding("UTF-8");
try{
System.out.println("");	
System.out.println("autocomplite_wg.jsp: ");


String query = (String)request.getParameter("term");
if (query==null){query="";}
if (query!=null){
query=query.trim();;
//query = URLEncoder.encode( query, "ISO-8859-1" ); // H%C3%A9l%C3%A8ne
//query = URLDecoder.decode( query, "UTF-8" ); // and finally : Hélène
query = query.toUpperCase();
}
System.out.println("query: "+query);


String conn_url = ReadDBProperties.getProperty("conn_url");
String conn_usr = ReadDBProperties.getProperty("conn_uname");
String conn_pas = ReadDBProperties.getProperty("conn_pass");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection connection = DriverManager.getConnection(conn_url,conn_usr,conn_pas);

Statement statement = connection.createStatement() ;
// String sql="select * from WF_WORK_GROUP WHERE upper(NAME) LIKE '"+query+"%' ORDER BY NAME ASC";
String sql="select * from WF_WORK_GROUP_CIR WHERE NAME_LAT LIKE '"+query+"%' ORDER BY NAME ASC";
//String sql="select * from WF_WORK_GROUP ORDER BY NAME ASC";

ResultSet resultset = statement.executeQuery(sql) ; 
System.out.println("sql: "+sql);

String s[]=null;


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
String search="[";
while(resultset.next())
{
	search=search+"\""+resultset.getString("NAME")+"\",";
}

if (search != null && search.length() > 0) {search = search.substring(0, search.length() - 1);}
search=search+"]";
out.print(search);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//        List li = new ArrayList();
 
//        while(resultset.next())
//        {
//            li.add(resultset.getString("NAME"));
//        }
 
//        String[] str = new String[li.size()];
//        Iterator it = li.iterator();
 
//        int i = 0;
//        while(it.hasNext())
//        {
//            String p = (String)it.next();
//            str[i] = p;
//            i++;
//        }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////




//   System.out.println("str: "+str.length);
//   if (str.length!=0){
//   /////////////////////////////////////////////////////////////////////////////////////////////////////////////
//     //jQuery related start
//        String result="[";
//        int cnt=1;
//        for(int j=0;j<str.length;j++)
//        {
//            if(str[j].toUpperCase().startsWith(query.toUpperCase()))
//            { 
//         	  result=result+"\""+str[j]+"\",";
//               //out.print("\""+str[j]+"\",");
//               if(cnt>=1000)// 5=How many results have to show while we are typing(auto suggestions)
//               break;
//               cnt++;
//             }
//        }
//        if (result != null && result.length() > 0) {result = result.substring(0, result.length() - 1);}
//        result=result+"]";
//        out.print(result);
//     //jQuery related end
//   /////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   }


 resultset.close();
 //st.close();
 connection.close();
  
 }
 catch(Exception e){
 e.printStackTrace();
 }%>