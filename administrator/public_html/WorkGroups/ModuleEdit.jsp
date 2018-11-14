<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("WorkGroups/ModuleList.jsp:");%>
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
    <link rel="stylesheet" href="../LTE/bootstrap/css/bootstrap-datetimepicker.min.css">
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

String[][] SCDP = Procs.get_code(null,null,"SCDP",null,request.getSession());
%>
 <%@ include file="_get_workgroup.jspf"%>
 
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
                    <input name="users_head" id="users_head" type="hidden" value="" />
                    
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">ID</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search1u" id="search1u" type="text" value="<%//=search1%>" maxlength="10" placeholder="ID" onkeypress="return isNumberKey(event)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Име</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search2u" id="search2u" type="text" value="<%//=search2%>" maxlength="100" placeholder="Име" onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Презиме</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search3u" id="search3u" type="text" value="<%//=search3%>" maxlength="100" placeholder="Презиме"  onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Корисничко име</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search4u" id="search4u" type="text" value="<%//=search2%>" maxlength="200" placeholder="Корисничко име"  onkeyup="f(this)" autocomplete="off"/>
                      </div>
                    </div>
                   <div class="form-group pull-center">
                   <label class="col-sm-3 control-label input-sm"></label>
                       <div class="col-sm-8">
                         <button type="button" class="btn btn-danger btn-sm pull-left" onClick="searchUsers_reset()"><i class="fa fa-exclamation-triangle"></i></button>
                         <button type="button" class="btn btn-primary btn-sm pull-right" onClick="searchUsers('<%=id%>','1','1')">Пребарај</button>
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
						<h5 style="text-align: center"><i class="fa fa-globe"></i> ПРЕДУПРЕДУВАЊЕ !</h5>
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
        <section class="content-header">     
          <h1><i class="fa fa-list"></i> Работна група
          <%if (!"".equals(id)&&!"0".equals(id)){%>
          <small> <%=NAME%>, id: <%=ID%></small>
           <%}else{%>
           <small>нова работни група</small>
           <%}%>
          </h1>
          <ol class="breadcrumb">
            <li><a href="ModuleList.jsp?mv=<%=mv%>"><i class="fa fa-list"></i> Работни групи</a></li>
            <li class="active"><i class="fa fa-list"></i> Работна група</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
<form class="form-horizontal" name="form_wg" id="form_wg" method="post" action="_ins_workgroup.jsp" >
          <div class="row">
            <!-- left column -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
                <div class="box-header with-border">
                <i class="fa fa-list"></i>
                  <h3 class="box-title">Податоци за работната група</h3>
                  <div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
                  </div>
                </div><!-- /.box-header -->
                <!-- form start -->
                
                <input name="id" id="id" type="hidden" value="<%=id%>" />
                <input name="query" id="query" type="hidden" value="<%=query%>" />
                 
                  <div class="box-body">
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Назив</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="NAME"  name="NAME" placeholder="Име на работна група" value="<%=NAME%>"  maxlength="100" required autocomplete="off" onkeyup="return toCyrillic(event,this)" >
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Град</label>
                      <div class="col-sm-9">
					    <select  id="COD_DP" name="COD_DP" class="form-control"  placeholder="Град" required onchange="getJSP('m_get_dep_type.jsp?ID_TYPE='+this.value+'&tip=1', 'unit', null, null, 0)">
						<option value=""></option>
						<%for(int it = 0; it < SCDP.length; it++){%>
						<option value="<%=SCDP[it][0]%>" 
							<%=(SCDP[it][0].equals(COD_DP))?"selected":""%>>
							<%=SCDP[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                     </div>
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Одделение</label>
                      <div class="col-sm-9" id="unit">
						<jsp:include page="m_get_dep_type.jsp" flush="true" >
						<jsp:param name="ID_UNIT" value="<%=DEP_ID%>"  />
						<jsp:param name="ID_TYPE" value="<%=COD_DP%>"  />
						<jsp:param name="tip" value="1"  />
						</jsp:include>
                      </div>
                     </div>
                    
             

                    

                           
                  </div><!-- /.box-body -->


                
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
              
                <div class="box-header with-border">
                <i class="fa fa-list"></i>
                  <h3 class="box-title">Поврзано со работната група</h3>
                  <div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
                  </div>
                </div><!-- /.box-header -->
                  <div class="box-body">
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Град</label>
                      <div class="col-sm-9">
					    <select  id="LINK_COD_DP" name="LINK_COD_DP" class="form-control"  placeholder="Град" onchange="getJSP('m_get_workgroups_type.jsp?ID_TYPE='+this.value, 'unit1', null, null, 0)">
						<option value=""></option>
						<%for(int it = 0; it < SCDP.length; it++){%>
						<option value="<%=SCDP[it][0]%>" 
							<%=(SCDP[it][0].equals(LINK_COD_DP))?"selected":""%>>
							<%=SCDP[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                     </div>
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Назив</label>
                      <div class="col-sm-9" id="unit1">
						<jsp:include page="m_get_workgroups_type.jsp" flush="true" >
						<jsp:param name="ID_UNIT" value="<%=ID_WG_PRE%>"  />
						<jsp:param name="ID_TYPE" value="<%=LINK_COD_DP%>"  />
						</jsp:include>
                      </div>
                     </div>
                  
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                    <button type="button" class="btn btn-primary  pull-right" onClick="submitButtonWorkGroup()" >Внеси</button>
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
				<div class="box box-warning collapsed-box"  id="get_dp_assigned">
							<jsp:include page="_get_cc_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="cod_dp" value="<%=COD_DP%>"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-warning collapsed-box" id="get_dp_unassigned">
							<jsp:include page="_get_cc_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>

                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row -->  

<div class="row">
<!-- =============================================================================================================================== -->
            <!-- left column -->
            <div class="col-md-6">
				<div class="box box-danger collapsed-box"  id="get_arhs_assigned">
							<jsp:include page="_get_arhs_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-danger collapsed-box" id="get_arhs_unassigned">
							<jsp:include page="_get_arhs_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>
                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row --> 

<div class="row">
<!-- =============================================================================================================================== -->
            <!-- left column -->
            <div class="col-md-6">
				<div class="box box-success collapsed-box"  id="get_head_assigned">
							<jsp:include page="_get_head_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="count" value="0"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-success collapsed-box" id="get_head_unassigned">
							<jsp:include page="_get_head_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="count" value="0"  />
							</jsp:include>
                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row --> 
<div class="row">
<!-- =============================================================================================================================== -->
            <!-- left column -->
            <div class="col-md-6">
				<div class="box box-default collapsed-box"  id="get_users_assigned">
							<jsp:include page="_get_users_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="count" value="0"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-default collapsed-box" id="get_users_unassigned">
							<jsp:include page="_get_users_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							<jsp:param name="count" value="0"  />
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
    <script src="../LTE/plugins/datetimepicker/moment.min.js"></script>
    <script src="../LTE/bootstrap/js/bootstrap.min.js"></script>
    <script src="../LTE/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="../LTE/plugins/datetimepicker/mk.js"></script>
    <script src="../LTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="../LTE/plugins/fastclick/fastclick.min.js"></script>
    <script src="../LTE/dist/js/app.min.js"></script>
    <script src="../LTE/dist/js/demo.js"></script>
    
    
  </body>
</html>
