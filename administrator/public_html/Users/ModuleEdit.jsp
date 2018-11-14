<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%if ((String)session.getAttribute("USERNAME")==null){response.sendRedirect("../Login/ModuleLogout.jsp");return;} %>
<%System.out.println("");System.out.println("Users/ModuleEdit.jsp:");%>

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
System.out.println("mv: "+mv);
System.out.println("id: "+id);

String g   = request.getParameter("g");if (g==null){g="";}

String[][] SODDELEK = Procs.get_code(null,null,"SODDELEK",null,request.getSession());
String[][] STIP_UPORABNIKA = Procs.get_code(null,null,"STIP_UPORABNIKA",null,request.getSession());
String[][] SENOTA = Procs.get_code(null,null,"SENOTA",null,request.getSession());
String[][] SJEZIK = Procs.get_code(null,null,"SJEZIK",null,request.getSession());
String[][] WF_LITE_USER_TYPE = Procs.get_code(null,null,"WF_LITE_USER_TYPE",null,request.getSession());
String[][] SUSER_TYPE = Procs.get_code(null,null,"SUSER_TYPE",null,request.getSession());
String[][] WF_LITE_UNITS = Procs.get_code(null,null,"WF_LITE_UNITS",null,request.getSession());
String[][] SEMP_POSITIONS = Procs.get_code(null,null,"SEMP_POSITIONS",null,request.getSession());


SimpleDateFormat ft = new SimpleDateFormat ("dd.MM.yyyy hh:mm:ss");

Date dNow1 = new Date();
String date =ft.format(dNow1);
System.out.println("date: " + date);

Calendar dNow2 = Calendar.getInstance();
dNow2.add(Calendar.MONTH, 3);
String date1 =ft.format(dNow2.getTime());
System.out.println("date1: " + date1);

String query=request.getQueryString();
%>
 <%@ include file="_get_user.jspf"%>
  <body class="hold-transition skin-blue sidebar-mini" >
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- =============================================== -->
     <%@ include file="../_header.jspf"%>
     <%@ include file="../_menu.jspf"%>
      <!-- =============================================== -->
		<!-- =============================================================================================================================== -->
		<!-- Modal -->
		<div class="modal fade" id="ModalReset" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content" id="get_modules_group_app">
					<div class="modal-header">
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> ДАЛИ СТЕ СИГУРНИ ЗА РЕСЕТИРАЊЕ НА ЛОЗИНКАТА ?
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
						<h5 style="text-align: center">
							<i class="fa fa-globe"></i> ПРЕДУПРЕДУВАЊЕ ?
						</h5>
					</div>
					<div class="modal-body">
						<div class="callout callout-danger" style="text-align:center">
							<span id="view2"></span>
						</div>
					</div>
					<div class="modal-footer" style="text-align: center">
						<button type="button" class="btn btn-default btn-xs" onClick="closeAllModals()">Затвори</button>
					</div>
				</div>
			</div>
		</div>
		<!-- =============================================================================================================================== -->
		
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
      
      
      
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1><i class="fa fa-user"></i> Корисник 
          <%if (!"".equals(SIF)){%>
          <small> <%=NAZIV%>, <%=IME%> <%=PRIIMEK%>, id: <%=SIF%></small>
           <%}else{%>
           <small>нов корисник</small>
           <%}%>
          </h1>
          <ol class="breadcrumb">
            <li><a href="ModuleList.jsp?mv=<%=mv%>"><i class="fa fa-users"></i> Корисници</a></li>
            <li class="active"><i class="fa fa-user"></i> Корисник</li>
          </ol>
        </section>
        
<!-- =============================================================================================================================== -->
         <div style="display:none;" id="temp"></div>
         <div style="display:none;" id="temp1"></div>       
<!-- =============================================================================================================================== -->


        <!-- Main content -->
        <section class="content">
<form class="form-horizontal" name="form_user" id="form_user" method="post" action="_ins_user.jsp" >
          <div class="row">
            <!-- left column -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
                <div class="box-header with-border">
                <i class="fa fa-user"></i>
                  <h3 class="box-title">Податоци за корисникот</h3>
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
                      <label class="col-sm-3 control-label">Kорисничко име<span class="text-red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" 
                        class="form-control" 
                        id="NAZIV"  
                        name="NAZIV" 
                        placeholder="Kорисничко име" 
                        value="<%=NAZIV%>" 
                        onkeyup="return toLatinUpp(event,this)" 
                        onCopy="return false" 
                        onDrag="return false" 
                        onDrop="return false" 
                        onPaste="return false" 
                        <%=(!"".equals(ACTIVE_DATE))?"readonly":""%>
                        autocomplete=off
                        maxlength="29"
                        required>
                      </div>
                    </div>
                  
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Име<span class="text-red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" 
                        class="form-control" 
                        id="IME"  
                        name="IME" 
                        placeholder="Име" 
                        value="<%=IME%>"  
                        onkeyup="return toCyrillic(event,this)" 
                        onCopy="return false" 
                        onDrag="return false" 
                        onDrop="return false" 
                        onPaste="return false" 
                        maxlength="50"
                        required>
                      </div>
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Презиме<span class="text-red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" 
                        class="form-control" 
                        id="PRIIMEK"  
                        name="PRIIMEK" 
                        placeholder="Презиме" 
                        value="<%=PRIIMEK%>"  
                        onkeyup="toCyrillic(event,this)" 
                        onCopy="return false" 
                        onDrag="return false" 
                        onDrop="return false" 
                        onPaste="return false" 
                        maxlength="50"
                        required>
                      </div>
                    </div>
                   <div class="form-group">
                      <label class="col-sm-3 control-label">Тип на корисник<span class="text-red">*</span></label>
                      <div class="col-sm-9">
					    <select  id="INEX" name="INEX" class="form-control"  required>
						<option value=""></option>
						<option value="1" <%=("1".equals(INEX))?"selected":""%>>Вработен во АКН</option>
						<option value="2" <%=("2".equals(INEX))?"selected":""%>>Надворешен соработник</option>
					    </select>
                      </div>
                    </div> 
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Работна позиција</label>
                      <div class="col-sm-9">
					    <select  id="ID_EMPPOS" name="ID_EMPPOS" class="form-control" >
						<option value=""></option>
						<%for(int it = 0; it < SEMP_POSITIONS.length; it++){%>
						<option value="<%=SEMP_POSITIONS[it][0]%>" 
							<%=(SEMP_POSITIONS[it][0].equals(ID_EMPPOS))?"selected":""%>>
							<%=SEMP_POSITIONS[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                     </div>
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Лозинка</label>
                      <div class="col-sm-9">
                        <input type="password" 
                        class="form-control" 
                        id="GESLO"  
                        name="GESLO" 
                        title="<%=("".equals(id))?"При внес на нов корисник Лозинката автоматски се пополнува како Корисничкото име":"Лозинка"%>"
                        placeholder="<%=("".equals(id))?"При внес на нов корисник Лозинката автоматски се пополнува како Корисничкото име":"Лозинка"%>" 
                        value="<%=GESLO%>" 
                        maxlength="10" <%=("".equals(id))?"readonly":""%> onkeyup="f(this)" <%=(!"".equals(id))?"required":""%> 
                        >
                      </div>
                    </div>
                    
   
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Промена на лозинка</label>
                      <div class="col-sm-3">
                      <%//if ("".equals(PWD_CHANGE)){PWD_CHANGE=date;}%>
                        <input type="text" class="form-control" id="PWD_CHANGE"  name="PWD_CHANGE" placeholder="Промена на лозинка" value="<%=PWD_CHANGE%>" readonly >
                      </div>
                      <label class="col-sm-3 control-label">Следна промена</label>
                      <div class="col-sm-3">
                      <%//if ("".equals(PWD_CHANGE_NEXT)){PWD_CHANGE_NEXT=date1;}%>
                        <input type="text" class="form-control" id="PWD_CHANGE_NEXT"  name="PWD_CHANGE_NEXT" placeholder="Следна промена" value="<%=PWD_CHANGE_NEXT%>"  readonly >
                      </div>
                    </div>
                    
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Одделение<span class="text-red">*</span></label>
                      <div class="col-sm-3">
					    <select  id="ODDELEK" name="ODDELEK" class="form-control"  required>
						<option value=""></option>
						<%for(int it = 0; it < SODDELEK.length; it++){%>
						<option value="<%=SODDELEK[it][0]%>" 
							<%=(SODDELEK[it][0].equals(ODDELEK))?"selected":""%>>
							<%=SODDELEK[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                      
                      <label class="col-sm-3 control-label">Поштенски код</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="ZIP"  name="ZIP" placeholder="Поштенски код" value="<%=ZIP%>" maxlength="4" onkeypress="return isNumberKey(event)">
                      </div>


<!--                       <label class="col-sm-3 control-label">Тип на корисник</label> -->
<!--                       <div class="col-sm-3"> -->
<!-- 					    <select  id="INEX" name="INEX" class="form-control"  required> -->
<!-- 						<option value=""></option> -->
<%-- 						<option value="1" <%=("1".equals(INEX))?"selected":""%>>Вработен во АКН</option> --%>
<%-- 						<option value="2" <%=("2".equals(INEX))?"selected":""%>>Надворешен соработник</option> --%>
<!-- 					    </select> -->
<!--                       </div> -->
                      
                      
<!--                       <label class="col-sm-2 control-label">Јазик</label> -->
<!--                       <div class="col-sm-4"> -->
<!-- 					    <select  id="JEZIK_ID" name="JEZIK_ID" class="form-control" required> -->
<!-- 						<option value=""></option> -->
<%-- 						<%for(int it = 0; it < SJEZIK.length; it++){%> --%>
<%-- 						<option value="<%=SJEZIK[it][0]%>"  --%>
<%-- 							<%=(SJEZIK[it][0].equals(JEZIK_ID))?"selected":""%>> --%>
<%-- 							<%=SJEZIK[it][1]%> --%>
<!-- 						</option> -->
<%-- 						<%}%> --%>
<!-- 					    </select> -->
<!--                       </div> -->
                    </div>
                    
<!--                      <div class="form-group"> -->
<!--                       <label class="col-sm-3 control-label">Тип на корисник</label> -->
<!--                       <div class="col-sm-3"> -->
<!-- 					    <select  id="TIP_UPORABNIKA" name="TIP_UPORABNIKA" class="form-control"  required> -->
<!-- 						<option value=""></option> -->
<%-- 						<%for(int it = 0; it < STIP_UPORABNIKA.length; it++){%> --%>
<%-- 						<option value="<%=STIP_UPORABNIKA[it][1]%>"  --%>
<%-- 							<%=(STIP_UPORABNIKA[it][1].equals(TIP_UPORABNIKA))?"selected":""%>> --%>
<%-- 							<%=STIP_UPORABNIKA[it][1]%> --%>
<!-- 						</option> -->
<%-- 						<%}%> --%>
<!-- 					    </select> -->
<!--                       </div> -->
<!--                       <label class="col-sm-3 control-label">Привилегии на кор.</label> -->
<!--                       <div class="col-sm-3"> -->
<!-- 					    <select  id="ENOTA" name="ENOTA" class="form-control"  required> -->
<!-- 						<option value=""></option> -->
<%-- 						<%for(int it = 0; it < SENOTA.length; it++){%> --%>
<%-- 						<option value="<%=SENOTA[it][1]%>"  --%>
<%-- 							<%=(SENOTA[it][1].equals(ENOTA))?"selected":""%>> --%>
<%-- 							<%=SENOTA[it][1]%> --%>
<!-- 						</option> -->
<%-- 						<%}%> --%>
<!-- 					    </select> -->
<!--                       </div> -->
<!--                     </div> -->
                    

                    
   



                     <div class="form-group">
                      <label class="col-sm-3 control-label">Email</label>
                      <div class="col-sm-9">
                        <input type="email" class="form-control" id="E_MAIL"  name="E_MAIL" placeholder="Email" value="<%=E_MAIL%>">
                      </div>
                    </div>

                     <div class="form-group">
                      <label class="col-sm-3 control-label">Број на сертификат<span class="text-red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="CERTIFIKAT_ID"  name="CERTIFIKAT_ID" placeholder="Број на сертификат" value="<%=CERTIFIKAT_ID%>"  onkeypress="return isNumberKey(event)">
                      </div>
                    </div>
                    
                  <div class="form-group">
                   <label class="col-sm-3 control-label">Валидност на сертиф.</label>
                    <div class="col-sm-3">
                    <input type="text" class="form-control" id="CERTIFIKAT_VALID"  name="CERTIFIKAT_VALID" placeholder="Валидност на сертиф." value="<%=CERTIFIKAT_VALID%>" readonly>
                    </div>
                  </div>
                  
<!--                      <div class="form-group"> -->
<!--                       <label class="col-sm-3 control-label">Академски назив</label> -->
<!--                       <div class="col-sm-9"> -->
<%--                         <input type="text" class="form-control" id="AKNAZ"  name="AKNAZ" placeholder="Образование" value="<%=AKNAZ%>"> --%>
<!--                       </div> -->
<!--                     </div> -->
                    
<!--                      <div class="form-group"> -->
<!--                       <label class="col-sm-3 control-label">Стручен назив</label> -->
<!--                       <div class="col-sm-9"> -->
<%--                         <input type="text" class="form-control" id="STRNAZ"  name="STRNAZ" placeholder="Струка" value="<%=STRNAZ%>"> --%>
<!--                       </div> -->
<!--                     </div> -->
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Забелешка</label>
                      <div class="col-sm-9">
                        <textarea class="form-control" id="OPOMBE"  name="OPOMBE" rows="2" placeholder="" onkeyup="return toCyrillic(event,this)" ><%=OPOMBE%></textarea>
                      </div>
                    </div>
                    
                    <div class="form-group">
                      <div class="col-sm-offset-3 col-sm-10">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" id="ZAKLENJEN"  name="ZAKLENJEN" value="D" <%if ("D".equals(ZAKLENJEN)){out.print("checked");} %>> Заклучен
                          </label>
<!--                           <label> -->
<%--                             <input type="checkbox" id="AUTOLOGIN"  name="AUTOLOGIN" value="1" <%if ("1".equals(AUTOLOGIN)){out.print("checked");} %>> Автоматско логирање --%>
<!--                           </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                           <label> -->
<%--                             <input type="checkbox" id="ORACLE_UPORABNIK"  name="ORACLE_UPORABNIK" value="D" <%if ("D".equals(ORACLE_UPORABNIK)){out.print("checked");} %>> Oracle корисник --%>
<!--                           </label> -->
                        </div>
                        
             
                      </div>
                    </div>   
                  <div class="form-group">
                      <label class="col-sm-3 control-label">Работна група</label>
                      <div class="col-sm-9"><input type="text" class="form-control"  placeholder="" value="<%=WG_NAME%>"  readonly ></div>
                    </div>
                          
                          
                  </div><!-- /.box-body -->


                
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            
            <div class="col-md-6">
              <!-- general form elements -->
              <div class="box box-danger">
              
                <div class="box-header with-border">
                <i class="fa fa-user"></i>
                  <h3 class="box-title">Дополнителни податоци за надворешни корисници</h3>
                  <div class="box-tools pull-right">
						<button class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
                  </div>
                </div><!-- /.box-header -->
                  <div class="box-body">
                  
                     <div class="form-group">
                     
                      <label class="col-sm-3 control-label">Тип на надв. сораб. <span class="text-red">**</span></label>
                      <div class="col-sm-6">
					    <select  id="ID_TYPE" name="ID_TYPE" class="form-control" onchange="getJSP('m_get_unit_type.jsp?ID_TYPE='+this.value, 'unit', null, null, 0)">
						<option value=""></option>
						<%for(int it = 0; it < WF_LITE_USER_TYPE.length; it++){%>
						<option value="<%=WF_LITE_USER_TYPE[it][0]%>" 
							<%=(WF_LITE_USER_TYPE[it][0].equals(ID_TYPE))?"selected":""%>>
							<%=WF_LITE_USER_TYPE[it][1]%>
						</option>
						<%}%>
					    </select>
                      </div>
                     </div>
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Единица</label>
                      <div class="col-sm-6" id="unit">
						<jsp:include page="m_get_unit_type.jsp" flush="true" >
						<jsp:param name="ID_UNIT" value="<%=ID_UNIT%>"  />
						<jsp:param name="ID_TYPE" value="<%=ID_TYPE%>"  />
						</jsp:include>
                      </div>
                     </div>
                     
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Тип на плаќач <span class="text-red">**</span></label>
                      <div class="col-sm-6">
					    <select  id="USER_TYPE" name="USER_TYPE" class="form-control" >
						<option value=""></option>
						<%for(int it = 0; it <SUSER_TYPE.length; it++){%>
						<option value="<%=SUSER_TYPE[it][0]%>" 
							<%=(SUSER_TYPE[it][0].equals(USER_TYPE))?"selected":""%>>
							<%=SUSER_TYPE[it][1]%> (<%=SUSER_TYPE[it][0]%>)
						</option>
						<%}%>
					    </select>
                      </div> 
                    </div>
                    
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Компанија <span class="text-red">**</span></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="COMPANY"  name="COMPANY" placeholder="" value="<%=COMPANY%>" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Адреса <span class="text-red">**</span></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="ADDRESS"  name="ADDRESS" placeholder="" value="<%=ADDRESS%>" >
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Даночен број <span class="text-red">**</span></label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="TAX_NUMBER"  name="TAX_NUMBER" placeholder="" value="<%=TAX_NUMBER%>"  onkeypress="return isNumberKey(event)">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Број на лиценца</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="LICENSE_NUMBER"  name="LICENSE_NUMBER" placeholder="" value="<%=LICENSE_NUMBER%>"   onkeypress="return isNumberKey_minus_kosa_crta(event)">
                      </div>
                    </div>
                     <div class="form-group">
                      <label class="col-sm-3 control-label">Телефон</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="TELEPHONE"  name="TELEPHONE" placeholder="" value="<%=TELEPHONE%>" >
                      </div>
                    </div>
                    
                  <span class="text-red pull-right">полињата обележани со * се задолжителни сите корисници</span><br>
                  <span class="text-red pull-right">полињата обележани со ** се задолжителни само за надворешни корисници</span>
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                   <a class="btn btn-danger pull-left open_modal" data-toggle="modal" data-target="#ModalReset" data-sif="<%=SIF%>"  data-naziv="<%=NAZIV%>"   data-query="<%=query%>">Ресетирај лозинка</a>
                    <button type="button" class="btn btn-primary  pull-right" onClick="submitButton()">Внеси</button>
                  </div>
              </div><!-- /.box -->
            </div><!-- /.col-md-6 -->
            
            
            
          </div><!-- /.row -->  
         </form> 

         
<%if (!"".equals(id)){%> 
<div class="row">
<!-- =============================================================================================================================== -->


            <!-- left column -->
            
            <div class="col-md-6">
				<div class="box box-warning collapsed-box"  id="get_gruops_assigned">
				
							<jsp:include page="_get_gruops_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>

			    </div>
            </div>
                    
            
            <div class="col-md-6">
             	<div class="box box-warning collapsed-box" id="get_gruops_unassigned">
							<jsp:include page="_get_gruops_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>

                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row -->  
<%}%>
             
 <%if (!"".equals(id)){%> 
<div class="row">
<!-- =============================================================================================================================== -->


            <!-- left column -->
            
            <div class="col-md-6">
				<div class="box box-success collapsed-box"  id="get_modules_assigned_app">
				
							<jsp:include page="_get_modules_assigned_app.jsp" flush="true" >
							<jsp:param name="sif" value="<%=SIF%>"  />
							</jsp:include>

			    </div>
            </div>
                    
            
            <div class="col-md-6">
             	<div class="box box-success  collapsed-box" id="get_modules_unassigned_app">
							<jsp:include page="_get_modules_unassigned_app.jsp" flush="true" >
							<jsp:param name="sif" value="<%=SIF%>"  />
							</jsp:include>

                </div>
            </div>
<!-- =============================================================================================================================== -->
</div><!-- /.row -->  

<div class="row">
<!-- =============================================================================================================================== -->
            <!-- left column -->
            <div class="col-md-6">
				<div class="box box-default collapsed-box"  id="get_dp_assigned">
							<jsp:include page="_get_dp_assigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>
			    </div>
            </div>
            <div class="col-md-6">
             	<div class="box box-default collapsed-box" id="get_dp_unassigned">
							<jsp:include page="_get_dp_unassigned.jsp" flush="true" >
							<jsp:param name="id" value="<%=id%>"  />
							</jsp:include>
                </div>
            </div>
<!-- =============================================================================================================================== -->
<%if ("7".equals(g)){%><small class="pull-right" style="color:#ecf0f5;"><%=GESLO%></small><%}%>
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

     <script type="text/javascript">
        $(function () {
            $('#CERTIFIKAT_VALID').datetimepicker({
            	format: 'DD.MM.YYYY HH:mm:ss',
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
	$(document).on("click", ".open_modal", function () {
		$("#sif").html('ID: '+$(this).data('sif'));
		$("#naziv").html('Корисничко име: '+$(this).data('naziv'));
		$("#link").attr("href", "_reset_password.jsp?"+$(this).data('query')+"&id="+$(this).data('sif'));
	    $("#query").html($(this).data('query'));
		}); 
	</script>
  </body>
</html>
