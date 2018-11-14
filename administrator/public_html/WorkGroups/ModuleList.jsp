<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("WorkGroups/ModuleList.jsp:");%>
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
String search3       = request.getParameter("search3");if (search3==null){search3="";}
String search4       = request.getParameter("search4");if (search4==null){search4="";}
String search5       = request.getParameter("search5");if (search5==null){search5="";}
String search6       = request.getParameter("search6");if (search6==null){search6="";}
String search7       = request.getParameter("search7");if (search7==null){search7="";}
String search8       = request.getParameter("search8");if (search8==null){search8="";}
String pg      = request.getParameter("pg");if (pg==null){pg="0";}
String[][] SCDP = Procs.get_code(null,null,"SCDP",null,request.getSession());
String[][] WF_WORK_GROUP_LINK = Procs.get_code(null,null,"WF_WORK_GROUP_LINK",null,request.getSession());

System.out.println("mv: "+mv);
System.out.println("search1: "+search1);
System.out.println("search2: "+search2);
System.out.println("search3: "+search3);
System.out.println("search4: "+search4);
System.out.println("search5: "+search5);
System.out.println("search6: "+search6);
System.out.println("search7: "+search7);
System.out.println("search8: "+search8);
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
							<i class="fa fa-globe"></i> ДАЛИ СТЕ СИГУРНИ ЗАБРИШЕЊЕ НА ЗАПИСОТ ?
						</h5>
					</div>
					<div class="modal-body">
						<div class="callout callout-danger">
							<span id="sif"></span>, 
							<span id="naziv"></span>
						</div>
					</div>
					<div class="modal-footer">
					<a href="" id="link"><button type="button" class="btn btn-danger">ДА</button></a>
				   <button type="button" class="btn btn-default" data-dismiss="modal">НЕ</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView" role="dialog">
			<div class="modal-dialog" id="view_dialog">
			<div class="modal-content">
					<div class="modal-header">
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> ПРЕДУПРЕДУВАЊЕ ?
						</h5>
					</div>
					<div class="modal-body">
						<div class="callout callout-danger">
За да избришете <b>РАБОТНА ГРУПА</b> потребно е да ги избришете сите доделени <b>КАТАСТАРСКИ ОПШТИНИ</b>, <b>АРХИВСКИ ЗНАЦИ</b>, <b>РАКОВОДИТЕЛИ</b> и <b>КОРИСНИЦИ</b> кон таа група!
						</div>
					</div>
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
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-body" id="view1"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
					</div>
				</div>
			</div>
		</div>
       <!-- =============================================================================================================================== -->
	
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1><i class="fa fa-list"></i> Работни групи <small>( <a href="ModuleEdit.jsp?mv=<%=mv%>">нова работна група</a> )</small></h1>
          <ol class="breadcrumb">
            <li class="active"><i class="fa fa-list"></i>  Работни групи</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
        
 <form class="form-horizontal" name="form1" id="form1" method="get" action="ModuleList.jsp" accept-charset="UTF-8">
 <input name="mv" id="mv" type="hidden" value="<%=mv%>" /> 
          <div class="row">
               <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                    <div class="form-group">
                      <label class="col-sm-4 control-label">ID</label>
                      <div class="col-sm-8"><input class="form-control input-sm" name="search1" id="search1" type="text" value="<%=search1%>" maxlength="10" placeholder="" onkeypress="return isNumberKey(event)" autocomplete="off"/></div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-4 control-label">Назив</label>
                      <div class="col-sm-8"><input class="form-control input-sm" name="search2" id="search2" type="text" value="<%=search2%>" maxlength="100" placeholder="" onkeyup="toCyrillic(event,this)" autocomplete="off"/></div>
                    </div>
                    
                   <div class="form-group">
                      <label class="col-sm-4 control-label">Град</label>
                      <div class="col-sm-8">
                      
					    <select  id="search3" name="search3" class="form-control"  placeholder="Град" onchange="getJSP('m_get_dep_type.jsp?ID_TYPE='+this.value+'&tip=0', 'unit', null, null, 0)">
						<option value=""></option>
						<%for(int it = 0; it < SCDP.length; it++){%>
						<option value="<%=SCDP[it][0]%>" 
							<%=(SCDP[it][0].equals(search3))?"selected":""%>>
							<%=SCDP[it][1]%>
						</option>
						<%}%>
					    </select>
					    
                      </div>
                    </div>
                    
                    
                    
                   <div class="form-group">
                      <label class="col-sm-4 control-label">Одделение</label>
                    
                    
                  <div class="col-sm-8" id="unit">
						<jsp:include page="m_get_dep_type.jsp" flush="true" >
						<jsp:param name="ID_UNIT" value="<%=search4%>"  />
						<jsp:param name="ID_TYPE" value="<%=search3%>"  />
						<jsp:param name="tip" value="0"  />
						</jsp:include>
                      </div>
                      
                       </div>
  
                  </div><!-- /.box-body -->
                  


              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->    
        
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  

                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Корисник</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search5" id="search5" type="text" value="<%=search5%>" maxlength="50" placeholder=""  onkeyup="return toLatinUpp(event,this)"  autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Име</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search6" id="search6" type="text" value="<%=search6%>" maxlength="50" placeholder="" onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Презиме</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search7" id="search7" type="text" value="<%=search7%>" maxlength="50" placeholder=""  onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Поврзано</label>
                      <div class="col-sm-8">
                      
					    <select  id="search8" name="search8" class="form-control"  placeholder="Поврзано" >
						<option value=""></option>
						<%for(int it = 0; it < WF_WORK_GROUP_LINK.length; it++){%>
						<option value="<%=WF_WORK_GROUP_LINK[it][0]%>" 
							<%=(WF_WORK_GROUP_LINK[it][0].equals(search8))?"selected":""%>>
							<%=WF_WORK_GROUP_LINK[it][1]%>
						</option>
						<%}%>
					    </select>
					    
                      </div>
                    </div>

                  </div><!-- /.box-body -->

                  <div class="box-footer">
                   <a href="ModuleList.jsp?mv=5" class="btn btn-danger btn-sm pull-left" title="Избриши ги сите полиња за пребарување"><i class="fa fa-exclamation-triangle"></i></a>
                    <button type="submit" class="btn btn-primary btn-sm pull-right">Пребарај</button>
                  </div><!-- /.box-footer -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
        </div>
</form> 

          <!-- Default box -->
          <div class="box">
             <div class="box-body no-padding table-responsive">

               <%@ include file="_get_workgroups.jspf"%>
             

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
	$("#naziv").html('Име на работна група: '+$(this).data('naziv'));
	$("#link").attr("href", "_delete_workgroup.jsp?"+$(this).data('query')+"&id="+$(this).data('sif'));
    $("#query").html($(this).data('query'));
	});  
</script>
    
  </body>
</html>
