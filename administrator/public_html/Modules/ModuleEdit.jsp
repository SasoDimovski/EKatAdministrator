<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Modules/ModuleEdit.jsp:");%>
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
 <%@ include file="_get_modul.jspf"%>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- =============================================== -->
     <%@ include file="../_header.jspf"%>
     <%@ include file="../_menu.jspf"%>
      <!-- =============================================== -->

<!-- =============================================================================================================================== -->
	<!-- Modal -->
		<div class="modal fade" id="ModalView" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-search-plus"></i> ПРЕБАРУВАЊЕ
					</h4>
				</div>
					<div class="modal-body form-horizontal">
					
                    <input name="count" id="count" type="hidden" value="" />
                    <input name="apl_sif" id="apl_sif" type="hidden" value="" />
                    
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">ID</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search1" id="search1" type="text" value="<%//=search1%>" maxlength="10" placeholder="ID" onkeypress="return isNumberKey(event)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Име</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search2" id="search2" type="text" value="<%//=search2%>" maxlength="100" placeholder="Име" onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Презиме</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search3" id="search3" type="text" value="<%//=search3%>" maxlength="100" placeholder="Презиме"  onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Корисничко име</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search4" id="search4" type="text" value="<%//=search2%>" maxlength="200" placeholder="Корисничко име"  onkeyup="f(this)" autocomplete="off"/>
                      </div>
                    </div>
                   <div class="form-group pull-center">
                   <label class="col-sm-3 control-label input-sm"></label>
                       <div class="col-sm-8">
                         <button type="button" class="btn btn-danger btn-sm pull-left" onClick="searchUsers_reset1()"><i class="fa fa-exclamation-triangle"></i></button>
                         <button type="button" class="btn btn-primary btn-sm pull-right" onClick="searchUsers1('<%=id%>','1','1')">Пребарај</button>
                       </div>
                    </div>
  
					</div>
					
					<div class="modal-body form-horizontal" id="view"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->   
       <!-- =============================================================================================================================== -->
		           <!-- Modal -->
		           <div class="modal fade" id="ModalView1" role="dialog">
		             <div class="modal-dialog  modal-lg">
		               <!-- Modal content-->
		               <!-- ======================================================================================== -->
		               <div class="modal-content" id="view1"></div>
		               <!-- ======================================================================================== -->
		             </div>
		           </div>
		<!-- =============================================================================================================================== -->
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
		
		
<!-- =============================================================================================================================== -->
         <div style="display:none;" id="temp"></div>       
<!-- =============================================================================================================================== -->



      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1><i class="fa fa-indent"></i> Привилегија
          

          </h1>
          <ol class="breadcrumb">
            <li><a href="ModuleList.jsp?mv=<%=mv%>"><i class="fa fa-indent"></i> Привилегии</a></li>
            <li class="active"><i class="fa fa-indent"></i> Привилегија</li>
          </ol>
           <%if (!"".equals(id)&&!"0".equals(id)){%>
           <h1>
          <small><b class="text-red" title="Име на апликација"><%=APLIKACIJA_NAZIV%></b> <b title="Име на привилегија"><%=NAZIV%></b> <span class="text-green"  title="Датотека"><%=DATOTEKA%></span> <span class="text-red" title="Тип на модул"><%=TIP_MODUL_NAZIV%></span> <span class="text-yellow" title="ID"><%=SIF%></span> <span class="text-aqua" title="ID Parent"><%=MOD_SIF%></span></small>
           </h1>
           <%}%>
        </section>

        <!-- Main content -->
        <section class="content">

<div class="row">
<!-- =============================================================================================================================== -->
            <!-- left column -->
            <div class="col-md-6">
				<div class="box box-success collapsed-box"  id="get_users_assigned">
							<jsp:include page="_get_users_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="apl_sif" value="<%=APL_SIF%>"  />
							<jsp:param name="count" value="0"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-success collapsed-box" id="get_users_unassigned">
							<jsp:include page="_get_users_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="apl_sif" value="<%=APL_SIF%>"  />
							<jsp:param name="count" value="0"  />
							</jsp:include>
                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row --> 
<div class="row">      
             
             
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
