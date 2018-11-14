<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Applications/ModuleList.jsp:");%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.Calendar.*"%>
<%@ page import="java.util.TimeZone.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <title>:: AKN ADMINISTRATOR ::</title>
    

    <link rel="stylesheet" href="../LTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../LTE/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../LTE/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../LTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../LTE/dist/css/skins/_all-skins.min.css">

	<script src="../js/main.js"></script>
	<script src="../js/ajaxCaller.js"></script>
	
  </head>
  
<%
String mv   = request.getParameter("mv");if (mv==null){mv="";}
String id   = request.getParameter("id");if (id==null){id="";}
String query=request.getQueryString();
System.out.println("mv: "+mv);
System.out.println("id: "+id);
System.out.println("query: "+query);


%>
 <%@ include file="_get_application.jspf"%>
 
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- =============================================== -->
     <%@ include file="../_header.jspf"%>
     <%@ include file="../_menu.jspf"%>
      <!-- =============================================== -->

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <section class="content-header">     
          <h1><i class="fa fa-list"></i> Апликација 
          <%if (!"".equals(id)&&!"0".equals(id)){%>
          <small> <%=NAZIV%>, id: <%=SIF%></small>
           <%}else{%>
           <small>нова апликација</small>
           <%}%>
          </h1>
          <ol class="breadcrumb">
            <li><a href="ModuleList.jsp?mv=<%=mv%>"><i class="fa fa-list"></i> Апликации</a></li>
            <li class="active"><i class="fa fa-list"></i> Апликација</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
<form class="form-horizontal" name="form1" method="post" action="_ins_application.jsp">
          <div class="row">
            <!-- left column -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
                <div class="box-header with-border">
                <i class="fa fa-object-group"></i>
                  <h3 class="box-title">Податоци за апликацијата</h3>
                  <div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
                  </div>
                </div><!-- /.box-header -->
                <!-- form start -->
                
                <input name="id" id="id" type="hidden" value="<%=SIF%>" />
                <input name="query" id="query" type="hidden" value="<%=query%>" />
                 
                  <div class="box-body">
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Име на апликација</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="NAZIV"  name="NAZIV" placeholder="Име на апликација" value="<%=NAZIV%>"  maxlength="100" required autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Скратено име на апл.</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="K_NAZIV"  name="K_NAZIV" placeholder="Скратено име на апликација" value="<%=K_NAZIV%>" autocomplete="off">
                      </div>
                    </div> 
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Корисничко име</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="USERNAME"  name="USERNAME" placeholder="Корисничко име" maxlength="30" value="<%=USERNAME%>" autocomplete="off">
                      </div> 
             
                      <label class="col-sm-1 control-label">Лозинка</label>
                      <div class="col-sm-4"> 
                        <input type="text" class="form-control" id="PASSWORD"  name="PASSWORD" placeholder="Лозинка" maxlength="30" value="<%=PASSWORD%>" autocomplete="off">
                      </div>
                    </div>
                   
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Име на датотека</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="IME_DATOTEKA"  name="IME_DATOTEKA" placeholder="Име на датотека"  maxlength="30" value="<%=IME_DATOTEKA%>" autocomplete="off">
                      </div>

                      <label class="col-sm-1 control-label">База</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="DB_NAME"  name="DB_NAME" placeholder="Име на база"  maxlength="30" value="<%=DB_NAME%>" autocomplete="off">
                      </div>
                    </div> 
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Патека до апликација</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="POT_APL"  name="POT_APL" placeholder="Патека до апликација" value="<%=POT_APL%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Забелешка</label>
                      <div class="col-sm-9">
                        <textarea class="form-control" id="OPOMBE"  name="OPOMBE" rows="2" placeholder="Забелешка"><%=OPOMBE%></textarea>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Нет СЕРВЕР</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="NET_SERVER"  name="NET_SERVER" placeholder="Нет СЕРВЕР" value="<%=NET_SERVER%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Проект</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="PROJEKT"  name="PROJEKT" placeholder="Проект" value="<%=PROJEKT%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                     
                    <div class="form-group">
                      <div class="col-sm-offset-3 col-sm-10">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" id="ZAKLENJENA"  name="ZAKLENJENA" value="D" <%if ("D".equals(ZAKLENJENA)){out.print("checked");} %>> Заклучена
                          </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <label>
                            <input type="checkbox" id="SKUPINA_PODATKOV"  name="SKUPINA_PODATKOV" value="D" <%if ("D".equals(SKUPINA_PODATKOV)){out.print("checked");} %>> Група на податоци
                          </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <label>
                            <input type="checkbox" id="AVTOM_DODAJANJE_MODULOV"  name="AVTOM_DODAJANJE_MODULOV" value="D" <%if ("D".equals(AVTOM_DODAJANJE_MODULOV)){out.print("checked");} %>> Автом. доделување на модули
                          </label>
                        </div>
                      </div>
                    </div>
                    

                           
                  </div><!-- /.box-body -->


                
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
              
                <div class="box-header with-border">
                <i class="fa fa-object-group"></i>
                  <h3 class="box-title">Незадолжителни податоци за апликацијата</h3>
                  <div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
                  </div>
                </div><!-- /.box-header -->
                  <div class="box-body">
                  
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Дебагирање</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="DEBUG"  name="DEBUG" placeholder="Дебагирање" value="<%=DEBUG%>"  maxlength="1"   onkeypress="return isNumberKey(event)" onpaste="return false" autocomplete="off">
                      </div>
                    </div>
                          
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Помош</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="HELP_TIP"  name="HELP_TIP" placeholder="Помош" value="<%=HELP_TIP%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">WINDOWS патека</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="WIN_HELP_POT"  name="WIN_HELP_POT" placeholder="WINDOWS патека" value="<%=WIN_HELP_POT%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">WEB патека</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="WEB_HELP_POT"  name="WEB_HELP_POT" placeholder="WEB патека" value="<%=WEB_HELP_POT%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Датотека за помош</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="HLP_FILE"  name="HLP_FILE" placeholder="Датотека за помош" value="<%=HLP_FILE%>"  maxlength="100" autocomplete="off">
                      </div>
                    </div>
                  
                    <div class="form-group">
                      <div class="col-sm-offset-3 col-sm-10">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" id="RLS_CONN"  name="RLS_CONN" value="1" <%if ("1".equals(RLS_CONN)){out.print("checked");} %>> RSL конекција
                          </label>
                        </div>
                      </div>
                    </div>
                  
                  
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary  pull-right">Внеси</button>
                  </div>
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            
            
            
          </div><!-- /.row -->  
         </form>          
             
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


      <%@ include file="../_footer.jspf"%>
      <%@ include file="../_sidebar.jspf"%>
    </div><!-- ./wrapper -->


    <script src="../LTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="../LTE/bootstrap/js/bootstrap.min.js"></script>
    <script src="../LTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="../LTE/plugins/fastclick/fastclick.min.js"></script>
    <script src="../LTE/dist/js/app.min.js"></script>
    <script src="../LTE/dist/js/demo.js"></script>
    
    
  </body>
</html>
