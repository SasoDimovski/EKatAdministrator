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
    <link rel="stylesheet" href="css/style.css">

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
 <%@ include file="_get_group.jspf"%>
 
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- =============================================== -->
     <%@ include file="../_header.jspf"%>
     <%@ include file="../_menu.jspf"%>
      <!-- =============================================== -->
      		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView2" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="text-align: center"><i class="fa fa-globe"></i> ПРЕДУПРЕДУВАЊЕ ?</h5>
					</div>
					<div class="modal-body">
						<div class="callout callout-danger" style="text-align:center">
							<span id="view2"></span>
						</div>
					</div>
					<div class="modal-footer">
					    <button type="button" class="btn btn-default btn-xs pull-left" data-dismiss="modal" >Затвори</button>
					    <button type="button" id="view2_but" class="btn btn-danger btn-xs pull-right" style="display:none"  onClick="" data-dismiss="modal" >Потврди</button>
						
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <section class="content-header">     
          <h1><i class="fa fa-list"></i> Група 
          <%if (!"".equals(id)&&!"0".equals(id)){%>
          <small> <%=NAZIV%>, id: <%=SIF%></small>
           <%}else{%>
           <small>нова група</small>
           <%}%>
          </h1>
          <ol class="breadcrumb">
            <li><a href="ModuleList.jsp?mv=<%=mv%>"><i class="fa fa-list"></i> Групи</a></li>
            <li class="active"><i class="fa fa-list"></i> Група</li>
          </ol>
        </section>
<!-- =============================================================================================================================== -->
         <div style="display:none;" id="temp"></div>       
<!-- =============================================================================================================================== -->
        <!-- Main content -->
        <section class="content">
<form class="form-horizontal" name="form_group" id="form_group" method="post" action="_ins_group.jsp">
          <div class="row">
            <!-- left column -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
                <div class="box-header with-border">
                <i class="fa fa-object-group"></i>
                  <h3 class="box-title">Податоци за Група</h3>
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
                      <label class="col-sm-3 control-label">Име на група</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="NAZIV"  name="NAZIV" placeholder="Име на апликација" value="<%=NAZIV%>"  maxlength="100" required autocomplete="off" onkeyup="toCyrillicUpp(event,this)">
                      </div>
                    </div>
                    
                    
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Забелешка</label>
                      <div class="col-sm-9">
                        <textarea class="form-control" id="OPOMBE"  name="OPOMBE" rows="2" placeholder="Забелешка" onkeyup="toCyrillic(event,this)" ><%=OPOMBE%></textarea>
                      </div>
                    </div>
                    

                    

                           
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                   <button type="button" class="btn btn-primary  pull-right" onClick="submitButtonGroup()" >Внеси</button>
                  </div>
                
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            

            
            
          </div><!-- /.row -->  
         </form>          
             
 <%if (!"0".equals(id)){%> 
<div class="row">
<!-- =============================================================================================================================== -->


            <!-- left column -->
            
            <div class="col-md-6">
				<div class="box box-success collapsed-box"  id="get_modules_assigned_app">
				
							<jsp:include page="_get_modules_assigned_app.jsp" flush="true" >
							<jsp:param name="sif" value="<%=id%>"  />
							</jsp:include>

			    </div>
            </div>
                    
            
            <div class="col-md-6">
             	<div class="box box-success  collapsed-box" id="get_modules_unassigned_app">
							<jsp:include page="_get_modules_unassigned_app.jsp" flush="true" >
							<jsp:param name="sif" value="<%=id%>"  />
							</jsp:include>

                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row -->  
<%}%> 
             
             
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
