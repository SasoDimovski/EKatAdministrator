<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Applications/ModuleList.jsp:");%>
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
String search1       = request.getParameter("search1");if (search1==null){search1="";}
String search2       = request.getParameter("search2");if (search2==null){search2="";}
String pg      = request.getParameter("pg");if (pg==null){pg="0";}

System.out.println("mv: "+mv);
System.out.println("search1: "+search1);
System.out.println("search2: "+search2);
System.out.println("pg: "+pg);


%>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- =============================================== -->
     <%@ include file="../_header.jspf"%>
     <%@ include file="../_menu.jspf"%>
      <!-- =============================================== -->

		<!-- =============================================================================================================================== -->
		<!-- Modal -->

		<div class="modal fade" id="ModalDel" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" id="get_modules_group_app">


					<div class="modal-header">

						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> ДАЛИ СТЕ СИГУРНИ ЗА
							БРИШЕЊЕ НА ЗАПИСОТ ?
						</h5>
					</div>
					<div class="modal-body">

						<div class="callout callout-danger">

							<span id="sif"></span>, 
							<span id="naziv"></span>


						</div>
					</div>

					<div class="modal-footer">
					<a href="" id="link">
						<button type="button" class="btn btn-danger">ДА</button></a>
						<button type="button" class="btn btn-default" data-dismiss="modal">НЕ</button>
					</div>

				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1><i class="fa fa-list"></i> Апликации <small>( <a href="ModuleEdit.jsp?mv=<%=mv%>">нова апликација</a> )</small></h1>
          <ol class="breadcrumb">
            <li class="active"><i class="fa fa-list"></i>  Апликации</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header">
                   <form name="form1" id="form1" method="get" action="ModuleList.jsp" accept-charset="UTF-8">
                   <input name="mv" id="mv" type="hidden" value="<%=mv%>" /> 
                     <div class="col-xs-1">ID:<input class="form-control input-sm" name="search1" id="search1" type="text" value="<%=search1%>" maxlength="10" placeholder="ID" onkeypress="return isNumberKey(event)" autocomplete="off"/></div>
                     <div class="col-xs-2">Име на апликација:<input class="form-control input-sm" name="search2" id="search2" type="text" value="<%=search2%>" maxlength="100" placeholder="Име на апликација" autocomplete="off"/></div>
                    <div class="col-xs-1"><br><button class="btn btn-primary btn-sm">Пребарај</button></div>
                   </form>  
            </div>
            
            
             <div class="box-body no-padding table-responsive">

               <%@ include file="_get_applications.jspf"%>
             

            </div><!-- /.box-body -->


          </div><!-- /.box -->
             
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
<script>
$(document).on("click", ".open_modal", function () {
	$("#sif").html('ID: '+$(this).data('sif'));
	$("#naziv").html('Име на апликација: '+$(this).data('naziv'));
	$("#link").attr("href", "_delete_application.jsp?"+$(this).data('query')+"&id="+$(this).data('sif'));
    $("#query").html($(this).data('query'));
	}); 
</script>
    
  </body>
</html>
