<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%System.out.println("");System.out.println("Login/ModuleLogin.jsp:");%>
<%@ page import="Procedures.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


	
  <link rel="stylesheet" href="../LTE/bootstrap/css/bootstrap.min.css">
<link href="css/style.css" rel="stylesheet">

<script src="../js/main.js"></script>
<script src="../js/ajaxCaller.js"></script>

<title>:: AKN ADMINISTRATOR ::</title>
</head>
	
<!--PROVERKA LOGIRANJE////////////////////////////////////////////////////////////////////////////////////////////////-->
<%
System.out.println("");
System.out.println("ModuleLogin.jsp:----------");

String username = request.getParameter("username"); if(username == null || "null".equals(username)) {username="";}
String password = request.getParameter("password"); if(password == null || "null".equals(password)) {password="";}
String is_admin_user ="";


System.out.println("username: "+username);
System.out.println("password: "+password);
//System.out.println("request.getSession(): "+request.getSession());

if (!username.equals("")) {
	is_admin_user = Procs.is_admin_user(username,password,request.getSession());
	if (is_admin_user.equals("1")) {
		response.sendRedirect("../Main/ModuleMain.jsp");return;
	}
}
%>
<!--////////////////////////////////////////////////////////////////////////////////////////////////-->
<body>



<!-- Modal -->
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">

  <div class="modal-dialog  modal-sm">

    <!-- Modal content-->
    <div class="modal-content">
    
    
      <div class="modal-header">
        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
        <h5 class="text-center">апликација за управување со кориснички права</h5>
      </div>
      
      
      <div class="modal-body">
          <form class="form col-md-12 center-block" action="ModuleLogin.jsp" method="post">
            <div class="form-group">
              <input type="text" class="form-control" id="username" name="username" placeholder="Корисничко име" autocomplete="off" value="<%=((String)session.getAttribute("TEMPUSERNAME")!=null)?(String)session.getAttribute("TEMPUSERNAME"):""%>" readonly>
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="password" name="password" placeholder="Лозинка" autocomplete="off">
              <%if (is_admin_user.equals("0")) {%>
             <h6 class="text-center" style="color:#ab0000">Погрешно <strong>Корисничко име</strong> или <strong>Лозинка</strong> </h6>
             <%}%>
            </div>
            <div class="form-group">
              <button class="btn btn-success btn-block">Најава</button>
            </div>
          </form>
      </div>

      
      <div class="modal-footer">
        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
      </div>
      
      
    </div>

  </div>
</div>
	

</body>
  
</html>