<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Statistic/ModuleList.jsp:");%>
<%@ page import="Procedures.*"%>
<%@ page import="java.io.UnsupportedEncodingException"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.net.URLEncoder"%>
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
    <link rel="stylesheet" href="../LTE/plugins/select2/select2.css">
    <link rel="stylesheet" href="../LTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../LTE/dist/css/skins/_all-skins.min.css">
        <!-- Select2 -->

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    


    

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
String search6       = request.getParameter("search6");if (search6==null){search6="";}
String search7       = request.getParameter("search7");if (search7==null){search7="";}String search7_temp="";
String search8       = request.getParameter("search8");if (search8==null){search8="";}
String search81       = request.getParameter("search81");if (search81==null){search81="";}String search81_temp="";
String search9       = request.getParameter("search9");if (search9==null){search9="";}
//if (search9!=null){search9 = URLEncoder.encode( search9, "ISO-8859-1" ); search9 = URLDecoder.decode( search9, "UTF-8" ).trim();}; 
if (search9!=null){search9 = search9.trim();}; 
String pg      = request.getParameter("pg");if (pg==null){pg="0";}


System.out.println("mv: "+mv);
System.out.println("search1: "+search1);
System.out.println("search2: "+search2);
System.out.println("search3: "+search3);
System.out.println("search4: "+search4);
System.out.println("search5: "+search5);
System.out.println("search6: "+search6);
System.out.println("search7: "+search7);
System.out.println("search8: "+search8);
System.out.println("search81: "+search81);
System.out.println("search9: "+search9);

System.out.println("pg: "+pg);
String temp_print      = (String)session.getAttribute("print");
String temp_excel      = (String)session.getAttribute("excel");

String[][] SODDELEK = Procs.get_code(null,null,"SODDELEK",null,request.getSession());
String[][] SKUPINA = Procs.get_code(null,null,"SKUPINA",null,request.getSession());

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
		<div class="modal fade" id="ModalView1" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> Направена промена на основни податоци
						</h5>
					</div>
					<div class="modal-body" id="view1"></div>
					<div class="modal-footer">
					<button type="button" class="btn btn-default btn-xs" onClick="window.print()">Принт</button>
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
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
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">
						<i class="fa fa-search-plus"></i> ПРЕБАРУВАЊЕ ПО КОРИСНИЦИ
					</h4>
				</div>
					<div class="modal-body form-horizontal">
					
                    <input name="count" id="count" type="hidden" value="" />
                    <input name="users_head" id="users_head" type="hidden" value="" />
                    
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">ID</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search1u" id="search1u" type="text" value="<%//=search1%>" maxlength="10" placeholder="" onkeypress="return isNumberKey(event)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Име</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search2u" id="search2u" type="text" value="<%//=search2%>" maxlength="100" placeholder="" onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Презиме</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search3u" id="search3u" type="text" value="<%//=search3%>" maxlength="100" placeholder=""  onkeyup="toCyrillic(event,this)" autocomplete="off"/>
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-3 control-label input-sm">Корисничко име</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search4u" id="search4u" type="text" value="<%//=search2%>" maxlength="200" placeholder=""  onkeyup="f(this)" autocomplete="off"/>
                      </div>
                    </div>
                   <div class="form-group pull-center">
                   <label class="col-sm-3 control-label input-sm"></label>
                       <div class="col-sm-8">
                         <button type="button" class="btn btn-danger btn-sm pull-left" onClick="searchAdminUsers_reset()"><i class="fa fa-exclamation-triangle"></i></button>
                         <button type="button" class="btn btn-primary btn-sm pull-right" onClick="searchAdminUsers()">Пребарај</button>
                       </div>
                    </div>
  
					</div>
					
					<div class="modal-body form-horizontal" id="view"></div>
					<div class="modal-footer">
					    <button type="button" class="btn btn-danger btn-xs  pull-left" data-dismiss="modal"   onClick="insetUsers_search('')">Избриши</button>
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->  
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView2" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> ПРЕДУПРЕДУВАЊЕ !
						</h5>
					</div>
					<div class="modal-body">
						<div class="callout callout-danger" style="text-align:center">
							<span id="view2"></span>
						</div>
					</div>
					<div class="modal-footer" style="text-align: center">
						<button type="button" class="btn btn-default btn-xs"  data-dismiss="modal" >Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView3" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> Администратори
						</h5>
					</div>
					<div class="modal-body" id="view3"></div>
					<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-xs  pull-left" data-dismiss="modal"  onClick="insetAdminUsers_search('')">Избриши</button>
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalView4" role="dialog">
			<div class="modal-dialog  modal-lg" id="view_dialog">
				<div class="modal-content">
					<div class="modal-body" id="view4"></div>
					<div class="modal-footer">
					   <button type="button" class="btn btn-danger btn-xs  pull-left" data-dismiss="modal" onClick="insetModules_search_stat('','')" >Избриши</button>
<!-- 					   <button type="button" class="btn btn-danger btn-xs  pull-center" data-dismiss="modal" onClick="insetModules_search('0','БЕЗ ДОДЕЛЕНИ ПРИВИЛЕГИИ')" >Без привилегии</button> -->
						<button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
       
		<!-- =============================================================================================================================== -->
		
		
		
		
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
          
          
          <%if ("6".equals(mv)) {%><i class="fa fa-book text-red"></i> Статистика, корисници<%}%> 
          <%if ("7".equals(mv)) {%><i class="fa fa-book text-yellow"></i> Статистика, групи<%}%> 
          <%if ("8".equals(mv)) {%><i class="fa fa-book text-aqua"></i> Статистика, работни групи<%}%> 
          
          
          </h1>
          <ol class="breadcrumb">
            <li class="active">
            
            
          <%if ("6".equals(mv)) {%><i class="fa fa-book text-red"></i> Статистика / Корисници<%}%> 
          <%if ("7".equals(mv)) {%><i class="fa fa-book text-yellow"></i>Статистика / Групи<%}%> 
          <%if ("8".equals(mv)) {%><i class="fa fa-book text-aqua"></i> Статистика / Работни групи<%}%> 
            
            </li>
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
                  
                  <%if ("6".equals(mv)||"7".equals(mv)||"8".equals(mv)) {%>
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Датум од</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="search1"  name="search1" placeholder="" value="<%=search1%>" readonly>
                      </div>
                    </div>
                  <%}%>
                  <%if ("6".equals(mv)||"7".equals(mv)||"8".equals(mv)) {%>
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Датум до</label>
                      <div class="col-sm-8">
                        <input type="text" class="form-control" id="search2"  name="search2" placeholder="" value="<%=search2%>" readonly>
                      </div>
                    </div>
                   <%}%>
                <%if ("7".equals(mv)) {%>   
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
<%-- 						<option value="0" <%=("0".equals(search7))?"selected":""%> title="ID: 0">БЕЗ ДОДЕЛЕНИ ГРУПИ</option> --%>
<%-- 						<%if ("0".equals(search7)){search7_temp="БЕЗ ДОДЕЛЕНИ ГРУПИ";}%> --%>
					    </select>
                      </div>
                    </div>
                <%}%>
                 <%if ("7".equals(mv)) {%> 
                  <div class="form-group">
                      <label class="col-sm-4 control-label">Привилегија</label>
                      <div class="col-sm-8">
	                     <input name="search8" id="search8"type="hidden" value="<%=search8%>" />
	                     <input class="form-control input-sm open_modal" data-toggle="modal" data-target="#ModalView4" onClick="viewModules_search_stat()"  name="search81" id="search81" type="text" value="<%=search81%>" placeholder="" autocomplete="off" readonly/>
                      </div>
                    </div>
                <%}%>
                
                  </div><!-- /.box-body -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
            
            <div class="col-md-4">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                    <%if ("6".equals(mv)||"7".equals(mv)||"8".equals(mv)) {%>
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Администратор</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search3" id="search3" type="text" value="<%=search3%>" placeholder="" autocomplete="off" readonly onClick="viewAdminUsers()"/>
                      </div>
                    </div>
                   <%}%>
                    <%if ("6".equals(mv)||"8".equals(mv)) {%>
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Корисник</label>
                      <div class="col-sm-8">
                         <input class="form-control input-sm" name="search4" id="search4" type="text" value="<%=search4%>"  placeholder="" autocomplete="off" readonly onClick="openAdminUsersModalSearch ()"/>
                      </div>
                    </div>
                   <%}%>
                   <%if ("8".equals(mv)) {%>
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Работна група</label>
                      <div class="col-sm-8">
                        <input class="form-control input-sm" name="search9" id="search9" type="text" value="<%=search9%>" maxlength="70" placeholder="" onkeyup="" autocomplete="off"/>
                      </div>
                    </div>
                   <%}%>
<%--                   <%if ("8".equals(mv)) {%> --%>
<!--                   <div class="form-group"> -->
<!--                     <label class="col-sm-4 control-label">Работна група</label> -->
<!--                     <div class="col-sm-8"> -->
<!--                     <select class="form-control input-sm select2" name="search9" id="search9"> -->
<%--                          <jsp:include page="autocomplete_wg1.jsp" flush="true"> --%>
<%--                          <jsp:param name="searc" value="<%=search9%>"  /> --%>
<%--                          </jsp:include> --%>
<!--                     </select> -->
<!--                     </div> -->
<!--                   </div>/.form-group -->
<%--                    <%}%> --%>
                   
<!--                     <input name="autocomplete_wg" id="autocomplete_wg" type="hidden" value="" />  -->
                   
                   
<!-- <div class="ui-widget"> -->
<!--   <label for="birds">Birds: </label> -->
<!--   <input id="birds"> -->
<!-- </div> -->
 

                   
                  </div><!-- /.box-body -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
           <div class="col-md-4">
              <!-- general form elements -->
              <div class="box box-danger">

                  <div class="box-body">
                  
                  <%if ("6".equals(mv)||"8".equals(mv)) {%>
                   <div class="form-group">
                      <label class="col-sm-4 control-label">Град</label>
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
                    <%}%>
                    
                    <div class="form-group">
                      <label class="col-sm-4 control-label">Листај</label>
                      <div class="col-sm-8">
					    <select  id="search6" name="search6" class="form-control input-sm">
						<option value="25" <%=("25".equals(search6))?"selected":""%>>25</option>
						<option value="50" <%=("50".equals(search6))?"selected":""%>>50</option>
						<option value="100" <%=("100".equals(search6))?"selected":""%>>100</option>
						<option value="200" <%=("200".equals(search6))?"selected":""%>>200</option>
						<option value="9999999" <%=("9999999".equals(search6))?"selected":""%>>сите</option>
					    </select>
                      </div>
                    </div>
  
                  </div><!-- /.box-body -->
                  
                  <div class="box-footer">
                  <a id="dlink"  style="display:none;"></a>
                    <button type="button" class="btn btn-danger btn-sm pull-left noprint" style="margin-right:5px" title="Избриши ги сите полиња за пребарување" onClick="window.open('ModuleList.jsp?mv=<%=mv%>','_self');"><i class="fa fa-exclamation-triangle"></i></button>
<!--                     <button type="button" class="btn btn-default btn-sm pull-left noprint"  style="margin-right:5px" title="Excel" onClick="Excel()">Excel</button> -->
                    <button type="button" class="btn btn-default btn-sm pull-left noprint"  title="Печати" onClick="Print()">Печати</button>
                    <button type="button" class="btn btn-primary btn-sm pull-right noprint" onClick="searchStatisticUsers('<%=mv%>')">Пребарај</button>
                  </div><!-- /.box-footer -->

              </div><!-- /.box -->
            </div><!-- /.col-md-4 -->
            
            
            
            </div><!-- /.row -->
             </form>
          <!-- Default box -->
          
           <div class="box box-danger screen">
          
                      <div class="box-header text-left ">
                      <h1>
          <%if ("6".equals(mv)) {%><i class="fa fa-book text-red"></i> Статистика, корисници<%}%> 
          <%if ("7".equals(mv)) {%><i class="fa fa-book text-yellow"></i> Статистика, групи<%}%> 
          <%if ("8".equals(mv)) {%><i class="fa fa-book text-aqua"></i> Статистика, работни групи<%}%> 
                      </h1>
                      </div>
                      <div class="box-body">

								<%if(!"".equals(search1)){%>Датум од: <b><%=search1%></b><br><%}%>
								<%if(!"".equals(search2)){%>Датум до: <b><%=search2%></b><br><%}%>
								<%if(!"".equals(search3)){%>Администратор: <b><%=search3%></b><br><%}%>
								<%if(!"".equals(search4)){%>Корисник: <b><%=search4%></b><br><%}%>
								<%if(!"".equals(search5)){%>Одделение: <b><%=search5_temp%></b><br><%}%>
								<%if(!"".equals(search7)){%>Група: <b><%=search7_temp%></b><br><%}%>
								<%if(!"".equals(search8)){%>Привилегија: <b><%=search81%></b><br><%}%>
								<%if(!"".equals(search9)){%>Работна група: <b><%=search9%></b><br><%}%>
								<%if(!"".equals(search6)){%>Излистани записи: <b><%=("9999999".equals(search6))?"Сите":search6%></b><br><%}%>

                        </div>

             </div>        
          
          
          <div class="box">


             <div class="box-body no-padding table-responsive">
					<%if ("6".equals(mv)) {%>
				               <%@  include file="_get_statistic_users.jspf"%>
				    <%}%>
					<%if ("7".equals(mv)) {%>
				               <%@  include file="_get_statistic_groups.jspf"%>
				    <%}%>
					<%if ("8".equals(mv)) {%>
				               <%@  include file="_get_statistic_work_groups.jspf"%>
				    <%}%>
				    
            </div><!-- /.box-body -->


          </div><!-- /.box -->
             
             
             
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


      <%@ include file="../_footer.jspf"%>
      <%@ include file="../_sidebar.jspf"%>
    </div><!-- ./wrapper -->


    <script src="../LTE/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="../LTE/plugins/jQueryUI/jquery-ui.min.js"></script>
    <script src="../LTE/plugins/select2/select2.full.js"></script>
    
    <script src="../LTE/plugins/datetimepicker/moment.min.js"></script>
    <script src="../LTE/bootstrap/js/bootstrap.min.js"></script>
    <script src="../LTE/plugins/datetimepicker/bootstrap-datetimepicker.min.js"></script>
    <script src="../LTE/plugins/datetimepicker/mk.js"></script>
    <script src="../LTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="../LTE/plugins/fastclick/fastclick.min.js"></script>
    <script src="../LTE/dist/js/app.min.js"></script>
    <script src="../LTE/dist/js/demo.js"></script>

     <script type="text/javascript">
        $(function () {
            $('#search1,#search2').datetimepicker({
            	format: 'DD.MM.YYYY',
            	locale: 'mk',
            	showClear: true,
            	showClose: true,
            	ignoreReadonly: true,
            	focusOnShow: false,
            	allowInputToggle: true,   
            });
        });
    </script>
        <script>
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
      });
      
//       $(function(){
//     	  // turn the element to select2 select style
//     	  $('.select2').select2({
//     	    placeholder: "Select a state"
//     	  }).on('change', function(e) {
//     	    var data = $(".select2 option:selected").text();
//     	    $("#search9").val(data);
//     	  });

//     	});
      </script>
    
<script>
$(document).on("click", ".open_modal", function () {
	$("#sif").html('ID: '+$(this).data('sif'));
	$("#naziv").html('Корисничко име: '+$(this).data('naziv'));
	$("#link").attr("href", "_delete_user.jsp?"+$(this).data('query')+"&id="+$(this).data('sif'));
    $("#query").html($(this).data('query'));
	}); 
</script>

<script>
// $( function() {
//     var availableTags = ["са","AppleScript","Asp","BASIC",
//       "C",
//       "C++",
//       "Clojure",
//       "COBOL",
//       "ColdFusion",
//       "Erlang",
//       "Fortran",
//       "Groovy",
//       "Haskell",
//       "Java",
//       "JavaScript",
//       "Lisp",
//       "Perl",
//       "PHP",
//       "Python",
//       "Ruby",
//       "Scala",
//       "Scheme"
//     ];
//     var eee =decodeURIComponent($( "#autocomplete_wg" ).val().replace(/'/g, "\""));
//     $( "#tags" ).autocomplete({
//     // source: availableTags
//      source: eee
//     });
//   } );
  </script>
  
  <script>
//   $( function() {
//     var cache = {};
//     $( "#birds" ).autocomplete({
//       minLength: 2,
//       source: function( request, response ) {
//         var term = request.term;
//         if ( term in cache ) {
//           response( cache[ term ] );
//           return;
//         }
 
//         $.getJSON( "autocomplete_wg.jsp", request, function( data, status, xhr ) {
//           cache[ term ] = data;
//           response( data );
//         });
//       }
//     });
//   } );
  </script>
  
  
  
  
  
<script>
// $(document).ready(function(){
// 	var eee =$( "#autocomplete_wg" ).val().replace(/'/g, "\"");
// 	//var eee =$( "#autocomplete_wg" ).value.replace("'", "\"");
//     $("#tags").click(function(){
//         alert(eee);
//     });
// });


$(function() {
	 //var eee =$( "#tags" ).val();
	 //alert(eee);
	//alert(value);
    $("#search9").autocomplete({
    	source: "autocomplete_wg.jsp"
    });
    
   // alert($("#tags").val());
});
</script>

  </body>
</html>
