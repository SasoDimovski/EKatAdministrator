<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Users/ModuleList.jsp:");%>
<%@ page import="Procedures.*"%>
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
String search1       = request.getParameter("search1");if (search1==null){search1="";}
String search2       = request.getParameter("search2");if (search2==null){search2="";}
String search3       = request.getParameter("search3");if (search3==null){search3="";}
String search4       = request.getParameter("search4");if (search4==null){search4="";}
String search5       = request.getParameter("search5");if (search5==null){search5="";}String search5_temp="";
String search6       = request.getParameter("search6");if (search6==null){search6="";}String search6_temp="";
String search7       = request.getParameter("search7");if (search7==null){search7="";}String search7_temp="";
String search8       = request.getParameter("search8");if (search8==null){search8="";}String search8_temp="";
String search9       = request.getParameter("search9");if (search9==null){search9="";}
String search91       = request.getParameter("search91");if (search91==null){search91="";}String search91_temp="";
String search10       = request.getParameter("search10");if (search10==null){search10="";}String search10_temp="";
String search11       = request.getParameter("search11");if (search11==null){search11="";}
String pg      = request.getParameter("pg");if (pg==null){pg="0";}
String temp_print      = (String)session.getAttribute("print");
String temp_excel      = (String)session.getAttribute("excel");

System.out.println("mv: "+mv);
System.out.println("search1: "+search1);
System.out.println("search2: "+search2);
System.out.println("search3: "+search3);
System.out.println("search4: "+search4);
System.out.println("search5: "+search5);
System.out.println("search6: "+search6);
System.out.println("search7: "+search7);
System.out.println("search8: "+search8);
System.out.println("search9: "+search9);
System.out.println("search91: "+search91);
System.out.println("search10: "+search10);
System.out.println("search11: "+search11);
System.out.println("pg: "+pg);
System.out.println("temp_print: "+temp_print);
System.out.println("temp_excel: "+temp_excel);

String[][] SODDELEK = Procs.get_code(null,null,"SODDELEK",null,request.getSession());
String[][] SKUPINA = Procs.get_code(null,null,"SKUPINA",null,request.getSession());
String[][] WF_LITE_USER_TYPE = Procs.get_code(null,null,"WF_LITE_USER_TYPE",null,request.getSession());



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
					<a href="" id="link">
						<button type="button" class="btn btn-danger">ДА</button></a>
						<button type="button" class="btn btn-default" data-dismiss="modal">НЕ</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-body" id="view"></div>
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
               <!-- Modal content -->
               <div class="modal-content" id="view1"></div>
             </div>
           </div>
       <!-- =============================================================================================================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView2" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-body" id="view2"></div>
					<div class="modal-footer">
					   <button type="button" class="btn btn-danger btn-xs  pull-left" data-dismiss="modal" onClick="insetModules_search('','')" >Избриши</button>
					   <button type="button" class="btn btn-danger btn-xs  pull-center" data-dismiss="modal" onClick="insetModules_search('0','БЕЗ ДОДЕЛЕНИ ПРИВИЛЕГИИ')" >Без привилегии</button>
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
          <h1><i class="fa fa-users"></i> Корисници <small>( <a href="ModuleEdit.jsp?mv=<%=mv%>">нов корисник</a> )</small></h1>
          <ol class="breadcrumb">
            <li class="active"><i class="fa fa-users"></i> Корисници</li>
          </ol>
        </section>
<!-- =============================================================================================================================== -->
         <div style="display:none;" id="temp"></div>       
<!-- =============================================================================================================================== -->
        <!-- Main content -->
        <section class="content">
        
        

 <form class="form-horizontal" name="form1" id="form1" method="get" action="ModuleList.jsp" accept-charset="UTF-8">
 <input name="mv" id="mv" type="hidden" value="<%=mv%>" /> 
          <div class="row noprint">
            <!-- left column -->
            
            <div class="col-md-4">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                    <div class="form-group">
                      <label class="col-sm-4 control-label">ID</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search1" id="search1" type="text" value="<%=search1%>" maxlength="10" placeholder="" onkeypress="return isNumberKey(event)" autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Корисничко име</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search2" id="search2" type="text" value="<%=search2%>" maxlength="50" placeholder="" onkeyup="return toLatinUpp(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Име</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search3" id="search3" type="text" value="<%=search3%>" maxlength="50" placeholder="" onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Презиме</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search4" id="search4" type="text" value="<%=search4%>" maxlength="50" placeholder=""  onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>

                  </div><!-- /.box-body -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
            
            <div class="col-md-4">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Одделение</label>
                      <div class="col-sm-8">
					    <select  id="search5" name="search5" class="form-control input-sm">
						<option value=""></option>
						<%for(int it = 0; it < SODDELEK.length; it++){%>
						<option value="<%=SODDELEK[it][0]%>" 
							<%=(SODDELEK[it][0].equals(search5))?"selected":""%>>
							<%if (SODDELEK[it][0].equals(search5)){search5_temp=SODDELEK[it][1];}%>
							<%=SODDELEK[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Тип на корисник</label>
                      <div class="col-sm-8">
                        <select  id="search6" name="search6" class="form-control input-sm">
						<option value=""></option>
						<option value="1" <%=("1".equals(search6))?"selected":""%>>Вработен во АКН<%if ("1".equals(search6)){search6_temp="Вработен во АКН";}%></option>
						<option value="2" <%=("2".equals(search6))?"selected":""%>>Надворешен соработник<%if ("2".equals(search6)){search6_temp="Надворешен соработник";}%></option>
					    </select>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Тип на надв. сораб.</label>
                      <div class="col-sm-8">
                        <select  id="search8" name="search8" class="form-control input-sm">
						<option value=""></option>
						<%for(int it = 0; it < WF_LITE_USER_TYPE.length; it++){%>
						<option value="<%=WF_LITE_USER_TYPE[it][0]%>" 
							<%=(WF_LITE_USER_TYPE[it][0].equals(search8))?"selected":""%> title="ID: <%=WF_LITE_USER_TYPE[it][0]%>">
							<%if (WF_LITE_USER_TYPE[it][0].equals(search8)){search8_temp=WF_LITE_USER_TYPE[it][1];}%>
							<%=WF_LITE_USER_TYPE[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                    </div>

                  <div class="form-group">
                      <label class="col-sm-4 control-label">Заклучен</label>
                      <div class="col-sm-8">
                     <div class="checkbox input-sm">
                          <label>
                            <input type="checkbox" id="search10"  name="search10" value="D" <%if ("D".equals(search10)){search10_temp="Да";out.print("checked");} %>>
                          </label>
                        </div>
                      </div>
                    </div>
                    

                  </div><!-- /.box-body -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
           <div class="col-md-4">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Група</label>
                      <div class="col-sm-8">
					    <select  id="search7" name="search7" class="form-control input-sm">
						<option value=""></option>
						<%for(int it = 0; it < SKUPINA.length; it++){%>
						<option value="<%=SKUPINA[it][0]%>" 
							<%=(SKUPINA[it][0].equals(search7))?"selected":""%> title="ID: <%=SKUPINA[it][0]%>">
							<%if (SKUPINA[it][0].equals(search7)){search7_temp=SKUPINA[it][1];}%>
							<%=SKUPINA[it][1]%>
						</option>
						<%}%>
						<option value="0" <%=("0".equals(search7))?"selected":""%> title="ID: 0">БЕЗ ДОДЕЛЕНИ ГРУПИ</option>
						<%if ("0".equals(search7)){search7_temp="БЕЗ ДОДЕЛЕНИ ГРУПИ";}%>
					    </select>
                      </div>
                    </div>

                    <div class="form-group">
                      <label class="col-sm-4 control-label">Привилегија</label>
                      <div class="col-sm-8">
	                     <input name="search9" id="search9"type="hidden" value="<%=search9%>" />
	                     <input class="form-control input-sm open_modal" data-toggle="modal" data-target="#ModalView2" onClick="viewModules_search()"  name="search91" id="search91" type="text" value="<%=search91%>" placeholder="" autocomplete="off" readonly/>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Листај</label>
                      <div class="col-sm-8">
					    <select  id="search11" name="search11" class="form-control input-sm">
						<option value="25" <%=("25".equals(search11))?"selected":""%>>25</option>
						<option value="50" <%=("50".equals(search11))?"selected":""%>>50</option>
						<option value="100" <%=("100".equals(search11))?"selected":""%>>100</option>
						<option value="200" <%=("200".equals(search11))?"selected":""%>>200</option>
						<option value="99999" <%=("99999".equals(search11))?"selected":""%>>сите</option>
					    </select>
                      </div>
                    </div>
  
                  </div><!-- /.box-body -->
                  
                  <div class="box-footer">
                  <a id="dlink"  style="display:none;"></a>
                    <button type="button" class="btn btn-danger btn-sm pull-left noprint" style="margin-right:5px" title="Избриши ги сите полиња за пребарување" onClick="window.open('../Users/ModuleList.jsp?mv=1','_self');"><i class="fa fa-exclamation-triangle"></i></button>
<!--                     <button type="button" class="btn btn-default btn-sm pull-left noprint"  style="margin-right:5px" title="Excel" onClick="Excel()">Excel</button> -->
                    <button type="button" class="btn btn-default btn-sm pull-left noprint"  title="Печати" onClick="Print()">Печати</button>
                    <button type="submit" class="btn btn-primary btn-sm pull-right noprint">Пребарај</button>
                  </div><!-- /.box-footer -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
            
            </div><!-- /.row -->
             </form>
          <!-- Default box -->
          
           <div class="box box-danger screen">
          
                      <div class="box-header text-left ">
                      <h1><i class="fa fa-users"></i> Листа на корисници </h1>
                      </div>
                      <div class="box-body">

								<%if(!"".equals(search1)){%>ID: <b><%=search1%></b><br><%}%>
								<%if(!"".equals(search2)){%>Корисничко име: <b><%=search2%></b><br><%}%>
								<%if(!"".equals(search3)){%>IИме: <b><%=search3%></b><br><%}%>
								<%if(!"".equals(search4)){%>Презиме: <b><%=search4%></b><br><%}%>
								<%if(!"".equals(search5)){%>Одделение: <b><%=search5_temp%></b><br><%}%>
								<%if(!"".equals(search6)){%>Тип на корисник: <b><%=search6_temp%></b><br><%}%>
								<%if(!"".equals(search7)){%>Група: <b><%=search7_temp%></b><br><%}%>
								<%if(!"".equals(search8)){%>Тип на надворешен соработник: <b><%=search8_temp%></b><br><%}%>
								<%if(!"".equals(search9)){%>Привилегија: <b><%=search91%></b><br><%}%>
								<%if(!"".equals(search10)){%>Заклучен: <b><%=search10_temp%></b><br><%}%>
								<%if(!"".equals(search11)){%>Излистани записи: <b><%=("99999".equals(search11))?"Сите":search11%></b><br><%}%>
                        </div>

             </div>        
          
          
          <div class="box">


             <div class="box-body no-padding table-responsive">

               <%@ include file="_get_users.jspf"%>
             

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
	$("#naziv").html('Корисничко име: '+$(this).data('naziv'));
	$("#link").attr("href", "_delete_user.jsp?"+$(this).data('query')+"&id="+$(this).data('sif'));
    $("#query").html($(this).data('query'));
	}); 
</script>

  </body>
</html>
