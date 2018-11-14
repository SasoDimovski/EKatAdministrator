
function viewChangesAdminUser(id) {
	
	  $('#ModalView1').modal('show');
	  getJSP('_get_user_changes.jsp?id='+id, 'view1',null, null, 1);
} 
function insetUsers_search(naziv) {
	 document.getElementById('search4').value=naziv;
	  $('#ModalView').modal('hide');
} 
function searchAdminUsers () {
	if (document.getElementById('search1u').value==''&&document.getElementById('search2u').value==''&&document.getElementById('search3u').value==''&&document.getElementById('search4u').value==''){
		  document.getElementById('view2').innerHTML='Пополнете барем едно од полињата за пребарување!';
		  $('#ModalView2').modal('show');
	      return false;
	     }
    search1   = document.getElementById('search1u').value;
    search2   = document.getElementById('search2u').value;
    search3   = document.getElementById('search3u').value;
    search4   = document.getElementById('search4u').value;


    getJSP('_get_users.jsp?search1u='+search1+'&search2u='+search2+'&search3u='+search3+'&search4u='+search4, 'view',null, null, 1);
      
    }
function searchAdminUsers_reset () {
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1u').value = '';
	document.getElementById('search2u').value = '';
	document.getElementById('search3u').value = '';
	document.getElementById('search4u').value = '';
}
function openAdminUsersModalSearch () {
	document.getElementById('count').value = count;
	document.getElementById('users_head').value = users_head;
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1u').value = '';
	document.getElementById('search2u').value = '';
	document.getElementById('search3u').value = '';
	document.getElementById('search4u').value = '';
	$('#ModalView').modal('show');
}
function insetAdminUsers_search(naziv) {
	 document.getElementById('search3').value=naziv;
	  $('#ModalView3').modal('hide');
} 

function viewAdminUsers() {
	$('#ModalView3').modal('show');
	//getJSP('_get_modules_app_search.jsp', 'view2',null, null, 0);
	getJSP('_get_users_admin.jsp', 'view3',null, null, 1);
}


function searchStatisticUsers(mv) {
	//alert(document.getElementById('id').value)
	//alert(document.getElementById('is_user_exist').value)
	//return true;

	//return false;
if (mv==6){
			if (document.getElementById('search3').value==''&&document.getElementById('search4').value==''){
			  document.getElementById('view2').innerHTML='Задожително е барем едно од полињата „Администратор“ или „Корисник“!';
			  $('#ModalView2').modal('show');return false;}
			  
		//	if (document.getElementById('search2').value==''){
		//		  document.getElementById('view2').innerHTML='Полето „Датум до“ е задолжително!';
		//		  $('#ModalView2').modal('show');return false;}
           }  
	  document.getElementById('form1').submit();
    
}
// =============================================================================================================================== 
function getProcTip(sif, div, mv) {
	    getJSP('_get_arh_proc.jsp?sif='+sif+'&mv='+mv, div, null, null, 0);
} 
// =============================================================================================================================== 

function Print () {
	getJSP('set_session.jsp?temp=print', 'temp',null, 'Print1 ()', 1);
}
function Print1 () {document.getElementById('form1').submit()}

function Excel () {
	getJSP('set_session.jsp?temp=excel', 'temp',null, 'Print1 ()', 1);
}



var tableToExcel = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
        return function (table, name, filename) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }

            document.getElementById("dlink").href = uri + base64(format(template, ctx));
            document.getElementById("dlink").download = filename;
            document.getElementById("dlink").click();

        }
    })()
    

// =============================================================================================================================== 
function openModalSearch1 (count,apl_sif) {
	document.getElementById('count').value = count;
	document.getElementById('apl_sif').value = apl_sif;
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1').value = '';
	document.getElementById('search2').value = '';
	document.getElementById('search3').value = '';
	document.getElementById('search4').value = '';
}
function searchUsers1 (id_wg,count,view_search) {
	if (document.getElementById('search1').value==''&&document.getElementById('search2').value==''&&document.getElementById('search3').value==''&&document.getElementById('search4').value==''){
		  document.getElementById('view2').innerHTML='Пополнете барем едно од полињата за пребарување!';
		  $('#ModalView2').modal('show');
	      return false;
	     }
    search1   = document.getElementById('search1').value;
    search2   = document.getElementById('search2').value;
    search3   = document.getElementById('search3').value;
    search4   = document.getElementById('search4').value;
    count   = document.getElementById('count').value;
    apl_sif   = document.getElementById('apl_sif').value;
    //alert();

	getJSP('_get_users_unassigned.jsp?apl_sif='+apl_sif+'&id='+id_wg+'&search1='+search1+'&search2='+search2+'&search3='+search3+'&search4='+search4+'&count='+count+'&view_search='+view_search, 'view',null, null, 1);

    }
function searchUsers_reset1 () {
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1').value = '';
	document.getElementById('search2').value = '';
	document.getElementById('search3').value = '';
	document.getElementById('search4').value = '';
}
//=============================================================================================================================== 
// =============================================================================================================================== 
function getUsersModul (id_wg, assig_unassig, count, apl_sif) {
	
	if(assig_unassig=='unassig'){
	    getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_unassigned',null, 'getUsersModul_1('+assig_unassig+')', 1);
	    }
	if(assig_unassig=='assig'){
		getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_assigned',null, 'getUsersModul_1('+assig_unassig+')', 1);
		}
}
function getUsersModul_1 (assig_unassig) {
	
	if(assig_unassig=='unassig'){
								if (document.getElementById('get_users_unassigned_sub')!=null){
								    document.getElementById('get_users_unassigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_users_unassigned_but')!=null){
									document.getElementById('get_users_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_users_unassigned')!=null){
									document.getElementById('get_users_unassigned').setAttribute("class", "box box-success");
									}
								if (document.getElementById('get_users_unassigned_but')!=null){
									document.getElementById('get_users_unassigned_but').setAttribute("data-widget", "collapse");
									}
                               	}
	
	if(assig_unassig=='assig'){
								if (document.getElementById('get_users_assigned_sub')!=null){
								    document.getElementById('get_users_assigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_users_assigned_but')!=null){
									document.getElementById('get_users_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_users_assigned')!=null){
									document.getElementById('get_users_assigned').setAttribute("class", "box box-success");
									}
								if (document.getElementById('get_users_assigned_but')!=null){
									document.getElementById('get_users_assigned_but').setAttribute("data-widget", "collapse");
									}
		                       }
}

function insUsersModul (id_wg, id_user, count, apl_sif) {
	//alert (count);
	//alert (sku_sif);
	  getJSP('_ins_users_modul.jsp?id='+id_wg+'&id_user='+id_user+'&apl_sif='+apl_sif, 'temp',null, 'insUsersModul_1('+id_wg+',\''+count+'\',\''+apl_sif+'\')' , 0);
	  //alert (count);
} 
		function insUsersModul_1 (id_wg, count, apl_sif) {
			// alert (id_wg);
			// alert (sku_sif);
			 getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_unassigned',null, 'UsersModul_2()', 1);
			 getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_assigned',null, 'UsersModul_2()', 1);
		}


function delUsersModul (id_wg, id_user, count, apl_sif) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_users_modul.jsp?id='+id_wg+'&id_user='+id_user+'&apl_sif='+apl_sif, 'temp',null, 'delUsersModul_1('+id_wg+',\''+count+'\',\''+apl_sif+'\')' , 0);
} 
		function delUsersModul_1 (id_wg, count, apl_sif) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_assigned',null, 'UsersModul_2()', 1);
			 getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count+'&apl_sif='+apl_sif, 'get_users_unassigned',null, 'UsersModul_2()', 1);
		}
		
function UsersModul_2 () {
						if (document.getElementById('get_users_unassigned_sub')!=null){
						    document.getElementById('get_users_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_users_unassigned_but')!=null){
							document.getElementById('get_users_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_users_unassigned')!=null){
							document.getElementById('get_users_unassigned').setAttribute("class", "box box-success");
							}
						if (document.getElementById('get_users_unassigned_but')!=null){
							document.getElementById('get_users_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_users_assigned_sub')!=null){
							document.getElementById('get_users_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_users_assigned_but')!=null){
							document.getElementById('get_users_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_users_assigned')!=null){
							document.getElementById('get_users_assigned').setAttribute("class", "box box-success");
							}
						if (document.getElementById('get_users_assigned_but')!=null){
							document.getElementById('get_users_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
function closeAllModals() {
  $('#ModalView, #ModalView2').modal('hide');
}


function viewWorgGroupsAssignedTips(id_wg, pregled, tip) {
//	alert (id_wg);
//	alert (tip);
//	alert (pregled);
	if(tip=='KO'){
	    getJSP('_get_cc_assigned.jsp?id='+id_wg+'&pregled='+pregled, 'view1',null, null, 0);
	    }
	if(tip=='ARHS'){
		getJSP('_get_arhs_assigned.jsp?id='+id_wg+'&pregled='+pregled, 'view1',null, null, 0);
		}
	if(tip=='HEAD'){
		getJSP('_get_head_assigned.jsp?id='+id_wg+'&pregled='+pregled+'&count=1', 'view1',null, null, 0);
		}
	if(tip=='USERS'){
		getJSP('_get_users_assigned.jsp?id='+id_wg+'&pregled='+pregled+'&count=1', 'view1',null, null, 0);
		}
} 
// =============================================================================================================================== 
function openModalSearch (count,users_head) {
	document.getElementById('count').value = count;
	document.getElementById('users_head').value = users_head;
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1u').value = '';
	document.getElementById('search2u').value = '';
	document.getElementById('search3u').value = '';
	document.getElementById('search4u').value = '';
}
function searchUsers (id_wg,count,view_search) {
	if (document.getElementById('search1u').value==''&&document.getElementById('search2u').value==''&&document.getElementById('search3u').value==''&&document.getElementById('search4u').value==''){
		  document.getElementById('view2').innerHTML='Пополнете барем едно од полињата за пребарување!';
		  $('#ModalView2').modal('show');
	      return false;
	     }
    search1   = document.getElementById('search1u').value;
    search2   = document.getElementById('search2u').value;
    search3   = document.getElementById('search3u').value;
    search4   = document.getElementById('search4u').value;
    count   = document.getElementById('count').value;
    users_head   = document.getElementById('users_head').value;
    //alert();
    if(users_head=='head'){
	getJSP('_get_head_unassigned.jsp?id='+id_wg+'&search1u='+search1+'&search2u='+search2+'&search3u='+search3+'&search4u='+search4+'&count='+count+'&view_search='+view_search, 'view',null, null, 1);
    }
    if(users_head=='users'){
    	getJSP('_get_users_unassigned.jsp?id='+id_wg+'&search1u='+search1+'&search2u='+search2+'&search3u='+search3+'&search4u='+search4+'&count='+count+'&view_search='+view_search, 'view',null, null, 1);
        }
    }
function searchUsers_reset () {
	document.getElementById('view').innerHTML = '';
	document.getElementById('search1u').value = '';
	document.getElementById('search2u').value = '';
	document.getElementById('search3u').value = '';
	document.getElementById('search4u').value = '';
}
//=============================================================================================================================== 
function getUsersWorkGroup (id_wg, assig_unassig, count) {
	
	if(assig_unassig=='unassig'){
	    getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count, 'get_users_unassigned',null, 'getUsersWorkGroup_1('+assig_unassig+')', 1);
	    }
	if(assig_unassig=='assig'){
		getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count, 'get_users_assigned',null, 'getUsersWorkGroup_1('+assig_unassig+')', 1);
		}
	
}

function getUsersWorkGroup_1 (assig_unassig) {
	
	if(assig_unassig=='unassig'){
								if (document.getElementById('get_users_unassigned_sub')!=null){
								    document.getElementById('get_users_unassigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_users_unassigned_but')!=null){
									document.getElementById('get_users_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_users_unassigned')!=null){
									document.getElementById('get_users_unassigned').setAttribute("class", "box box-default");
									}
								if (document.getElementById('get_users_unassigned_but')!=null){
									document.getElementById('get_users_unassigned_but').setAttribute("data-widget", "collapse");
									}
                               	}
	
	if(assig_unassig=='assig'){
								if (document.getElementById('get_users_assigned_sub')!=null){
								    document.getElementById('get_users_assigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_users_assigned_but')!=null){
									document.getElementById('get_users_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_users_assigned')!=null){
									document.getElementById('get_users_assigned').setAttribute("class", "box box-default");
									}
								if (document.getElementById('get_users_assigned_but')!=null){
									document.getElementById('get_users_assigned_but').setAttribute("data-widget", "collapse");
									}
		                       }
}

function insUsersWorkGroup (id_wg, id_user, count, group_name) {
//	alert (id_wg);
//	alert (id_user);
//	alert (count);
//	alert (group_name);
	
	
	if (group_name!=''){
		  //alert (group_name);
		  document.getElementById('view2').innerHTML='Корисникот е веќе распределен во други работни групи: <strong>'+group_name+'</strong>, дали сакате да го доделите и во оваа работна група?';
	      document.getElementById('view2_but').style.display = "block";
	      //document.getElementById('view2_but').setAttribute("onClick", 'insUsersWorkGroup (\''+id_wg+'\',\''+id_user+'\',\''+count+'\',\'\');closeAllModals()');
	      $('#ModalView2').modal('show');
	      $("#view2_but").attr('onClick', 'insUsersWorkGroup (\''+id_wg+'\',\''+id_user+'\',\''+count+'\',\'\');closeAllModals()');
	      return false;
	     }
	  getJSP('_ins_users_group.jsp?id='+id_wg+'&id_user='+id_user, 'temp',null, 'insUsersWorkGroup_1('+id_wg+',\''+count+'\')' , 0);
	  closeAllModals()
} 
		function insUsersWorkGroup_1 (id_wg, count) {
			// alert (id_wg);
			// alert (sku_sif);
			 getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count, 'get_users_unassigned',null, 'UsersWorkGroup_2()', 1);
			 getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count, 'get_users_assigned',null, 'UsersWorkGroup_2()', 1);
		}


function delUsersWorkGroup (id_wg, id_user, count) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_users_group.jsp?id='+id_wg+'&id_user='+id_user, 'temp',null, 'delUsersWorkGroup_1('+id_wg+',\''+count+'\')' , 0);
} 
		function delUsersWorkGroup_1 (id_wg, count) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_users_assigned.jsp?id='+id_wg+'&count='+count, 'get_users_assigned',null, 'UsersWorkGroup_2()', 1);
			 getJSP('_get_users_unassigned.jsp?id='+id_wg+'&count='+count, 'get_users_unassigned',null, 'UsersWorkGroup_2()', 1);
		}
		
function UsersWorkGroup_2 () {
						if (document.getElementById('get_users_unassigned_sub')!=null){
						    document.getElementById('get_users_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_users_unassigned_but')!=null){
							document.getElementById('get_users_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_users_unassigned')!=null){
							document.getElementById('get_users_unassigned').setAttribute("class", "box box-default");
							}
						if (document.getElementById('get_users_unassigned_but')!=null){
							document.getElementById('get_users_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_users_assigned_sub')!=null){
							document.getElementById('get_users_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_users_assigned_but')!=null){
							document.getElementById('get_users_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_users_assigned')!=null){
							document.getElementById('get_users_assigned').setAttribute("class", "box box-default");
							}
						if (document.getElementById('get_users_assigned_but')!=null){
							document.getElementById('get_users_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
// =============================================================================================================================== 
function getHeadWorkGroup (id_wg, assig_unassig, count) {
	
	if(assig_unassig=='unassig'){
	    getJSP('_get_head_unassigned.jsp?id='+id_wg+'&count='+count, 'get_head_unassigned',null, 'getHeadWorkGroup_1('+assig_unassig+')', 1);
	    }
	if(assig_unassig=='assig'){
		getJSP('_get_head_assigned.jsp?id='+id_wg+'&count='+count, 'get_head_assigned',null, 'getHeadWorkGroup_1('+assig_unassig+')', 1);
		}
}
function getHeadWorkGroup_1 (assig_unassig) {
	
	if(assig_unassig=='unassig'){
								if (document.getElementById('get_head_unassigned_sub')!=null){
								    document.getElementById('get_head_unassigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_head_unassigned_but')!=null){
									document.getElementById('get_head_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_head_unassigned')!=null){
									document.getElementById('get_head_unassigned').setAttribute("class", "box box-success");
									}
								if (document.getElementById('get_head_unassigned_but')!=null){
									document.getElementById('get_head_unassigned_but').setAttribute("data-widget", "collapse");
									}
                               	}
	
	if(assig_unassig=='assig'){
								if (document.getElementById('get_head_assigned_sub')!=null){
								    document.getElementById('get_head_assigned_sub').style.display = 'block';
								    }
								if (document.getElementById('get_head_assigned_but')!=null){
									document.getElementById('get_head_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
									}
								if (document.getElementById('get_head_assigned')!=null){
									document.getElementById('get_head_assigned').setAttribute("class", "box box-success");
									}
								if (document.getElementById('get_head_assigned_but')!=null){
									document.getElementById('get_head_assigned_but').setAttribute("data-widget", "collapse");
									}
		                       }
}

function insHeadWorkGroup (id_wg, id_user, count) {
	//alert (count);
	//alert (sku_sif);
	  getJSP('_ins_head_group.jsp?id='+id_wg+'&id_user='+id_user, 'temp',null, 'insHeadWorkGroup_1('+id_wg+',\''+count+'\')' , 0);
	  //alert (count);
} 
		function insHeadWorkGroup_1 (id_wg, count) {
			// alert (id_wg);
			// alert (sku_sif);
			 getJSP('_get_head_unassigned.jsp?id='+id_wg+'&count='+count, 'get_head_unassigned',null, 'HeadWorkGroup_2()', 1);
			 getJSP('_get_head_assigned.jsp?id='+id_wg+'&count='+count, 'get_head_assigned',null, 'HeadWorkGroup_2()', 1);
		}


function delHeadWorkGroup (id_wg, id_user, count) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_head_group.jsp?id='+id_wg+'&id_user='+id_user, 'temp',null, 'delHeadWorkGroup_1('+id_wg+',\''+count+'\')' , 0);
} 
		function delHeadWorkGroup_1 (id_wg, count) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_head_assigned.jsp?id='+id_wg+'&count='+count, 'get_head_assigned',null, 'HeadWorkGroup_2()', 1);
			 getJSP('_get_head_unassigned.jsp?id='+id_wg+'&count='+count, 'get_head_unassigned',null, 'HeadWorkGroup_2()', 1);
		}
		
function HeadWorkGroup_2 () {
						if (document.getElementById('get_head_unassigned_sub')!=null){
						    document.getElementById('get_head_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_head_unassigned_but')!=null){
							document.getElementById('get_head_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_head_unassigned')!=null){
							document.getElementById('get_head_unassigned').setAttribute("class", "box box-success");
							}
						if (document.getElementById('get_head_unassigned_but')!=null){
							document.getElementById('get_head_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_head_assigned_sub')!=null){
							document.getElementById('get_head_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_head_assigned_but')!=null){
							document.getElementById('get_head_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_head_assigned')!=null){
							document.getElementById('get_head_assigned').setAttribute("class", "box box-success");
							}
						if (document.getElementById('get_head_assigned_but')!=null){
							document.getElementById('get_head_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
// =============================================================================================================================== 

function insArhsWorkGroup (id_wg, arh_sign) {
	//alert (id);
	//alert (sku_sif);
	  getJSP('_ins_arhs_group.jsp?id='+id_wg+'&arh_sign='+arh_sign, 'temp',null, 'insArhsWorkGroup_1('+id_wg+')' , 0);
} 
		function insArhsWorkGroup_1 (id_wg) {
			// alert (id);
			// alert (sku_sif);
			 getJSP('_get_arhs_unassigned.jsp?id='+id_wg, 'get_arhs_unassigned',null, 'ArhsWorkGroup_2()', 1);
			 getJSP('_get_arhs_assigned.jsp?id='+id_wg, 'get_arhs_assigned',null, 'ArhsWorkGroup_2()', 1);
		}


function delArhsWorkGroup (id_wg, arh_sign) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_arhs_group.jsp?id='+id_wg+'&arh_sign='+arh_sign, 'temp',null, 'delArhsWorkGroup_1('+id_wg+')' , 0);
} 

		function delArhsWorkGroup_1 (id_wg) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_arhs_assigned.jsp?id='+id_wg, 'get_arhs_assigned',null, 'ArhsWorkGroup_2()', 1);
			 getJSP('_get_arhs_unassigned.jsp?id='+id_wg, 'get_arhs_unassigned',null, 'ArhsWorkGroup_2()', 1);
		}
		
function ArhsWorkGroup_2 () {
						if (document.getElementById('get_arhs_unassigned_sub')!=null){
						    document.getElementById('get_arhs_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_arhs_unassigned_but')!=null){
							document.getElementById('get_arhs_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_arhs_unassigned')!=null){
							document.getElementById('get_arhs_unassigned').setAttribute("class", "box box-danger");
							}
						if (document.getElementById('get_arhs_unassigned_but')!=null){
							document.getElementById('get_arhs_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_arhs_assigned_sub')!=null){
							document.getElementById('get_arhs_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_arhs_assigned_but')!=null){
							document.getElementById('get_arhs_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_arhs_assigned')!=null){
							document.getElementById('get_arhs_assigned').setAttribute("class", "box box-danger");
							}
						if (document.getElementById('get_arhs_assigned_but')!=null){
							document.getElementById('get_arhs_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
// =============================================================================================================================== 

function insCCWorkGroup (id_wg, cod_dp, cod_cc) {
	//alert (id);
	//alert (sku_sif);
	  getJSP('_ins_cc_group.jsp?id='+id_wg+'&cod_dp='+cod_dp+'&cod_cc='+cod_cc, 'temp',null, 'insCCWorkGroup_1('+id_wg+')' , 0);
} 
		function insCCWorkGroup_1 (id_wg) {
			// alert (id);
			// alert (sku_sif);
			 getJSP('_get_cc_unassigned.jsp?id='+id_wg, 'get_dp_unassigned',null, 'CCWorkGroup_2()', 1);
			 getJSP('_get_cc_assigned.jsp?id='+id_wg, 'get_dp_assigned',null, 'CCWorkGroup_2()', 1);
		}


function delCCWorkGroup (id_wg, cod_dp, cod_cc) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_cc_group.jsp?id='+id_wg+'&cod_dp='+cod_dp+'&cod_cc='+cod_cc, 'temp',null, 'delCCWorkGroup_1('+id_wg+')' , 0);
} 

		function delCCWorkGroup_1 (id_wg) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_cc_assigned.jsp?id='+id_wg, 'get_dp_assigned',null, 'CCWorkGroup_2()', 1);
			 getJSP('_get_cc_unassigned.jsp?id='+id_wg, 'get_dp_unassigned',null, 'CCWorkGroup_2()', 1);
		}
		
function CCWorkGroup_2 () {
						if (document.getElementById('get_dp_unassigned_sub')!=null){
						    document.getElementById('get_dp_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_dp_unassigned_but')!=null){
							document.getElementById('get_dp_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_dp_unassigned')!=null){
							document.getElementById('get_dp_unassigned').setAttribute("class", "box box-warning");
							}
						if (document.getElementById('get_dp_unassigned_but')!=null){
							document.getElementById('get_dp_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_dp_assigned_sub')!=null){
							document.getElementById('get_dp_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_dp_assigned_but')!=null){
							document.getElementById('get_dp_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_dp_assigned')!=null){
							document.getElementById('get_dp_assigned').setAttribute("class", "box box-warning");
							}
						if (document.getElementById('get_dp_assigned_but')!=null){
							document.getElementById('get_dp_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
function submitButtonWorkGroup() {
	//alert(document.getElementById('id').value);
	//alert(document.getElementById('NAME').value);
	getJSP('_is_wg_exist.jsp?id='+document.getElementById('id').value+'&wg='+document.getElementById('NAME').value, 'temp',null, 'submitButtonWorkGroup1()', 0);
}
function submitButtonWorkGroup1() {
	
	if (document.getElementById('NAME').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Назив“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('COD_DP').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Град“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('search4').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Одделение“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('is_wg_exist').value=='1'){
		  document.getElementById('view2').innerHTML='Називот на групата веќе постои!';
		  $('#ModalView2').modal('show');return false;
	     }
	
	if (document.getElementById('is_cod_dp_right')!=null){
		if (document.getElementById('is_cod_dp_right').value!=document.getElementById('COD_DP').value){
			  document.getElementById('view2').innerHTML='За да го смените градот на работната група, потребно е да се избришат сите доделени КО!';
			  $('#ModalView2').modal('show');return false;
		     }
	     }
	document.getElementById("form_wg").submit();
}

// =============================================================================================================================== 
function submitButtonGroup() {
	//alert(document.getElementById('id').value);
	//alert(document.getElementById('NAME').value);
	getJSP('_is_group_exist.jsp?id='+document.getElementById('id').value+'&group='+document.getElementById('NAZIV').value, 'temp',null, 'submitButtonGroup1()', 0);
}
function submitButtonGroup1() {
	//alert(document.getElementById('is_group_exist').value);
	if (document.getElementById('NAZIV').value==''){
		  document.getElementById('view2').innerHTML='Полето „Назив“ е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('is_group_exist').value=='1'){
		  document.getElementById('view2').innerHTML='Називот на групата веќе постои!';
		  $('#ModalView2').modal('show');return false;
	     }
	

	document.getElementById("form_group").submit();
}

// =============================================================================================================================== 
function submitButton() {
	getJSP('_is_user_exist.jsp?id='+document.getElementById('id').value+'&naziv='+document.getElementById('NAZIV').value, 'temp',null, 'submitButton1()', 0);
}

function submitButton1() {
	getJSP('_is_sn_exist.jsp?id='+document.getElementById('id').value+'&sn='+document.getElementById('CERTIFIKAT_ID').value, 'temp1',null, 'submitButton2()', 0);
}

function submitButton2() {
	//alert(document.getElementById('id').value)
	//alert(document.getElementById('is_user_exist').value)
	//return true;

	//return false;
	
	if (document.getElementById('is_user_exist').value=='1'){
	  document.getElementById('view2').innerHTML='Корисничкото име веќе постои!';
	  $('#ModalView2').modal('show');return false;
     }
	if (document.getElementById('NAZIV').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Kорисничко име“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('IME').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Име“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('PRIIMEK').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Презиме“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Тип на корисник“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('ODDELEK').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Одделение“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('CERTIFIKAT_ID').value==''){
		  document.getElementById('view2').innerHTML='Полето <strong>„Број на сертификат“</strong> е задолжително!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('is_sn_exist').value!='0'){
		  document.getElementById('view2').innerHTML='Бројот на сертификатот: '+document.getElementById('CERTIFIKAT_ID').value+', веќе е употребен кај корисникот: '+document.getElementById('is_sn_exist').value+'!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('ID_TYPE').value==''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, задолжително пополнете го полето <strong>“Тип на надворешен соработник„</strong>!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('USER_TYPE').value==''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, задолжително пополнете го полето <strong>“Тип на плаќач„</strong>!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('COMPANY').value==''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, задолжително пополнете го полето <strong>“Компанија„</strong>!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('ADDRESS').value==''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, задолжително пополнете го полето <strong>“Адреса„</strong>!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('TAX_NUMBER').value==''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, задолжително пополнете го полето <strong>“Даночен број„</strong>!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='1'&&document.getElementById('ID_TYPE').value!=''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Вработен во АКН“</strong>, полето <strong>“Тип на надворешен соработник„</strong> треба да е празно!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='1'&&document.getElementById('ID_UNIT').value!=''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Вработен во АКН“</strong>, полето <strong>“Единица„</strong> треба да е празно!';
		  $('#ModalView2').modal('show');return false;
	     }
	if (document.getElementById('INEX').value=='2'&&document.getElementById('ID_EMPPOS').value!=''){
		  document.getElementById('view2').innerHTML='Доколку корисникот е <strong>„Надворешен соработник“</strong>, полето <strong>“Работна позиција„</strong> треба да е празно!';
		  $('#ModalView2').modal('show');return false;
	     }
	document.getElementById("form_user").submit();
}


function submitButton_return1() {
	alert(document.getElementById('is_user_exist').value)
	return false;

	//return true;
}


//=============================================================================================================================== 

function insDPUsers (id, id_dp) {
	//alert (id);
	//alert (sku_sif);
	  getJSP('_ins_dp_users.jsp?id='+id+'&id_dp='+id_dp, 'temp',null, 'insDPUsers_1('+id+')' , 0);
} 
		function insDPUsers_1 (id) {
			// alert (id);
			// alert (sku_sif);
			 getJSP('_get_dp_unassigned.jsp?id='+id, 'get_dp_unassigned',null, 'DPUsers_2()', 1);
			 getJSP('_get_dp_assigned.jsp?id='+id, 'get_dp_assigned',null, 'DPUsers_2()', 1);
		}


function delDPUsers (id, id_dp) {
	//alert (id_wg);
	//alert (sku_sif);
	  getJSP('_del_dp_users.jsp?id='+id+'&id_dp='+id_dp, 'temp',null, 'delDPUsers_1('+id+')' , 0);
} 

		function delDPUsers_1 (id) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('_get_dp_unassigned.jsp?id='+id, 'get_dp_unassigned',null, 'DPUsers_2()', 1);
			 getJSP('_get_dp_assigned.jsp?id='+id, 'get_dp_assigned',null, 'DPUsers_2()', 1);
		}
		
function DPUsers_2 () {
						if (document.getElementById('get_dp_unassigned_sub')!=null){
						    document.getElementById('get_dp_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_dp_unassigned_but')!=null){
							document.getElementById('get_dp_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_dp_unassigned')!=null){
							document.getElementById('get_dp_unassigned').setAttribute("class", "box box-default");
							}
						if (document.getElementById('get_dp_unassigned_but')!=null){
							document.getElementById('get_dp_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_dp_assigned_sub')!=null){
							document.getElementById('get_dp_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_dp_assigned_but')!=null){
							document.getElementById('get_dp_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_dp_assigned')!=null){
							document.getElementById('get_dp_assigned').setAttribute("class", "box box-default");
							}
						if (document.getElementById('get_dp_assigned_but')!=null){
							document.getElementById('get_dp_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//===============================================================================================================================
//=============================================================================================================================== 
function insetModules_search_stat(mod_sif, naziv) {
	 document.getElementById('search8').value=mod_sif;
	 document.getElementById('search81').value=naziv;
} 
function viewModules_search_stat() {
	getJSP('_get_modules_app_search.jsp', 'view4',null, null, 0);
} 
function getModulesApp_search_stat(app_sif, mod_sif, div) {
	    getJSP('_get_modules_search.jsp?app_sif='+app_sif+'&mod_sif='+mod_sif, div, null, null, 0);
}
// =============================================================================================================================== 
// =============================================================================================================================== 
function insetModules_search(mod_sif, naziv) {
	 document.getElementById('search9').value=mod_sif;
	 document.getElementById('search91').value=naziv;
} 
function viewModules_search() {
	getJSP('_get_modules_app_search.jsp', 'view2',null, null, 0);
} 
function getModulesApp_search(app_sif, mod_sif, div) {
	    getJSP('_get_modules_search.jsp?app_sif='+app_sif+'&mod_sif='+mod_sif, div, null, null, 0);
}
// =============================================================================================================================== 
function viewAssignedWorkGroups(sif, pregled) {
	//alert (sku_sif);
	//alert (skupina_naziv);
	getJSP('_get_work_gruops_assigned.jsp?id='+sif+'&pregled='+pregled, 'view',a0(), null, 0);
} 
function viewAssignedGroups(sif, pregled) {
	//alert (sku_sif);
	//alert (skupina_naziv);
	getJSP('_get_gruops_assigned.jsp?id='+sif+'&pregled='+pregled, 'view',a0(), null, 0);
} 
function viewAssignedModules(sif, pregled) {
	//alert (sku_sif);
	//alert (skupina_naziv);
	getJSP('_get_modules_assigned_app.jsp?sif='+sif+'&pregled='+pregled, 'view',a1(), null, 0);
} 
function a0() {
	if (document.getElementById('view_dialog')!=null){
		document.getElementById('view_dialog').setAttribute("class", "modal-dialog");
		}
	}
function a1() {
	if (document.getElementById('view_dialog')!=null){
		document.getElementById('view_dialog').setAttribute("class", "modal-dialog modal-lg");
		}
	}
// =============================================================================================================================== 

function getModulesApp(sif, app_sif, mod_sif, div, prava, pregled) {
	//alert ('sif: '+sif);alert ('app_sif: '+app_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'none';};
	
	if (document.getElementById(div).lang == '0'){
	    getJSP('_get_modules_app.jsp?sif='+sif+'&app_sif='+app_sif+'&mod_sif='+mod_sif+'&prava='+prava+'&pregled='+pregled, div, v0 (div), 'v3(v2(v1(\''+div+'\')))', 0);
		return false;
	}
	
	if (document.getElementById(div).lang == '1'){
		v6(v5(v4(div)));
		return false;
	}
} 
// =============================================================================================================================== 
function getModulesApp1(app_sif, mod_sif, div, mv) {
	//alert ('app_sif: '+app_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);return false;
	if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'none';};
	
	if (document.getElementById(div).lang == '0'){
	    getJSP('_get_modules.jsp?app_sif='+app_sif+'&mod_sif='+mod_sif+'&mv='+mv, div, v0 (div), 'v3(v2(v1(\''+div+'\')))', 0);
		return false;
	}
	
	if (document.getElementById(div).lang == '1'){
		v6(v5(v4(div)));
		return false;
	}
} 
// =============================================================================================================================== 
function viewModulesGroupApp(sku_sif, skupina_naziv) {
	//alert (sku_sif);
	//alert (skupina_naziv);
	getJSP('../Users/_view_modules_group_app.jsp?sku_sif='+sku_sif+'&skupina_naziv='+skupina_naziv, 'view1',null, null, 0);
} 


function viewModulesGroup(app_sif, sku_sif, mod_sif, div) {
	// alert (app_sif);
	// alert (div);
	if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'none';};
	
	if (document.getElementById(div).lang == '0'){
	    getJSP('../Users/_view_modules_group.jsp?app_sif='+app_sif+'&sku_sif='+sku_sif+'&mod_sif='+mod_sif, div, v0 (div), 'v3(v2(v1(\''+div+'\')))', 0);
		return false;
	}
	
	if (document.getElementById(div).lang == '1'){
		v6(v5(v4(div)));
		return false;
	}
} 

function v0 (div) {
	// alert (div);
	if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'none';}
}	

//function v1 (div) {alert('1 '+div)}
//function v2 (div) {alert('2 '+div)}
//function v3 (div) {alert('3 '+div)}
function v1 (div) {if (document.getElementById('1'+div)!=null){document.getElementById('1'+div).innerHTML = '<i class="fa fa-minus"></i>';};return div;}
function v2 (div) {document.getElementById(div).lang = '1';return div;}
function v3 (div) {if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'auto';};return div;}


//function v4 (div) {alert('4 '+div);return div;}
//function v5 (div) {alert('5 '+div);return div;}
//function v6 (div) {alert('6 '+div);return div;}
function v4 (div) {if (document.getElementById('1'+div)!=null){document.getElementById('1'+div).innerHTML = '<i class="fa fa-plus"></i>';};return div;}
function v5 (div) {document.getElementById(div).lang = '0';return div;}
function v6(div) {if (document.getElementById('2'+div)!=null){document.getElementById('2'+div).style.pointerEvents = 'auto';};return div;}

//function temp (div, n) {
//	a=document.getElementById('saso').innerHTML;
//	document.getElementById('saso').innerHTML = a+','+n;}

// =============================================================================================================================== 


function insGroupUser (id, sku_sif, all) {
	//alert (id);
	//alert (sku_sif);
	  getJSP('../Users/_ins_group_user.jsp?id='+id+'&sku_sif='+sku_sif+'&all='+all, 'temp',null, 'insGroupUser_1('+id+', '+sku_sif+')' , 0);
} 
		function insGroupUser_1 (id, sku_sif) {
			// alert (id);
			// alert (sku_sif);
			 getJSP('../Users/_get_gruops_unassigned.jsp?id='+id, 'get_gruops_unassigned',null, 'GroupUser_2()', 1);
			 getJSP('../Users/_get_gruops_assigned.jsp?id='+id, 'get_gruops_assigned',null, 'GroupUser_2()', 1);
		}


function delGroupUser (id, sku_sif, all) {
	//alert (id);
	//alert (sku_sif);
	  getJSP('../Users/_del_group_user.jsp?id='+id+'&sku_sif='+sku_sif+'&all='+all, 'temp',null, 'delGroupUser_1('+id+', '+sku_sif+')' , 0);
} 

		function delGroupUser_1 (id, sku_sif, all) {
			//alert (id);
			//alert (sku_sif);
			 getJSP('../Users/_get_gruops_assigned.jsp?id='+id, 'get_gruops_assigned',null, 'GroupUser_2()', 1);
			 getJSP('../Users/_get_gruops_unassigned.jsp?id='+id, 'get_gruops_unassigned',null, 'GroupUser_2()', 1);
		}
		
function GroupUser_2 () {
						if (document.getElementById('get_gruops_unassigned_sub')!=null){
						    document.getElementById('get_gruops_unassigned_sub').style.display = 'block';
						    }
						if (document.getElementById('get_gruops_unassigned_but')!=null){
							document.getElementById('get_gruops_unassigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_gruops_unassigned')!=null){
							document.getElementById('get_gruops_unassigned').setAttribute("class", "box box-warning");
							}
						if (document.getElementById('get_gruops_unassigned_but')!=null){
							document.getElementById('get_gruops_unassigned_but').setAttribute("data-widget", "collapse");
							}
						if (document.getElementById('get_gruops_assigned_sub')!=null){
							document.getElementById('get_gruops_assigned_sub').style.display = 'block';
							}
						if (document.getElementById('get_gruops_assigned_but')!=null){
							document.getElementById('get_gruops_assigned_but').innerHTML = '<i class="fa fa-minus"></i>';
							}
						if (document.getElementById('get_gruops_assigned')!=null){
							document.getElementById('get_gruops_assigned').setAttribute("class", "box box-warning");
							}
						if (document.getElementById('get_gruops_assigned_but')!=null){
							document.getElementById('get_gruops_assigned_but').setAttribute("data-widget", "collapse");
							}
                        }
//=============================================================================================================================== 
function insModulesUser(sif, apl_sif, mod_sif, div, prava) {
	  //alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	  getJSP('../Users/_ins_modules_user.jsp?sif='+sif+'&apl_sif='+apl_sif+'&mod_sif='+mod_sif, 'temp',null, 'd1('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\''+prava+'\')' , 0);
} 

function delModulesUser(sif, apl_sif, mod_sif, div, prava) {
	  //alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	  getJSP('../Users/_del_modules_user.jsp?sif='+sif+'&apl_sif='+apl_sif+'&mod_sif='+mod_sif, 'temp',null, 'd1('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\''+prava+'\')' , 0);
} 
function d1 (sif, apl_sif, mod_sif, div, prava) {
	// alert (id);
	// alert (sku_sif);
	 getJSP('../Users/_get_modules_unassigned_app.jsp?sif='+sif, 'get_modules_unassigned_app',null,'d2('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\'0\')' , 0);
	 getJSP('../Users/_get_modules_assigned_app.jsp?sif='+sif, 'get_modules_assigned_app',null, 'd2('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\'1\')' , 0);
}

function d2 (sif, apl_sif, mod_sif, div, prava) {
	//alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	if (mod_sif!=""&&prava=="1"){
		//alert ('div: '+'get_modules_assigned_app'+apl_sif);alert ('prava: '+prava);//return false;
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!=null){document.getElementById('get_modules_assigned_app'+apl_sif).style.display = 'block';}
		if (document.getElementById('get_modules_assigned_app_but'+apl_sif)!=null){document.getElementById('get_modules_assigned_app_but'+apl_sif).innerHTML = '<i class="fa fa-minus"></i>';}
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!=null){document.getElementById('get_modules_assigned_app_sub'+apl_sif).setAttribute("class", "box box-success box-solid");}
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!= null){document.getElementById('get_modules_assigned_app'+apl_sif).lang = '1'}
		getJSP('../Users/_get_modules_app.jsp?sif='+sif+'&app_sif='+apl_sif+'&mod_sif=&prava='+prava, 'get_modules_assigned_app'+apl_sif,null,null , 0);
		
		
	}
	if (mod_sif!=""&&prava=="0"){
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app'+apl_sif).style.display = 'block';}
		if (document.getElementById('get_modules_unassigned_app_but'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app_but'+apl_sif).innerHTML = '<i class="fa fa-minus"></i>';}
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app_sub'+apl_sif).setAttribute("class", "box box-success box-solid");}
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!= null){document.getElementById('get_modules_unassigned_app'+apl_sif).lang = '1'}
		getJSP('../Users/_get_modules_app.jsp?sif='+sif+'&app_sif='+apl_sif+'&mod_sif=&prava='+prava, 'get_modules_unassigned_app'+apl_sif,null,null , 0);
		
	}
	
	if (document.getElementById('get_modules_unassigned_app_sub')!=null){
	    document.getElementById('get_modules_unassigned_app_sub').style.display = 'block';
	    }
	if (document.getElementById('get_modules_unassigned_app_but')!=null){
		document.getElementById('get_modules_unassigned_app_but').innerHTML = '<i class="fa fa-minus"></i>';
		}
	if (document.getElementById('get_modules_unassigned_app')!=null){
		document.getElementById('get_modules_unassigned_app').setAttribute("class", "box box-success");
		}
	if (document.getElementById('get_modules_unassigned_app_but')!=null){
		document.getElementById('get_modules_unassigned_app_but').setAttribute("data-widget", "collapse");
		}
	if (document.getElementById('get_modules_assigned_app_sub')!=null){
		document.getElementById('get_modules_assigned_app_sub').style.display = 'block';
		}
	if (document.getElementById('get_modules_assigned_app_but')!=null){
		document.getElementById('get_modules_assigned_app_but').innerHTML = '<i class="fa fa-minus"></i>';
		}
	if (document.getElementById('get_modules_assigned_app')!=null){
		document.getElementById('get_modules_assigned_app').setAttribute("class", "box box-success");
		}
	if (document.getElementById('get_modules_assigned_app_but')!=null){
		document.getElementById('get_modules_assigned_app_but').setAttribute("data-widget", "collapse");
		}
    }

//===============================================================================================================================
function insModulesGroup(sif, apl_sif, mod_sif, div, prava) {
	  //alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	  getJSP('../Groups/_ins_modules_group.jsp?sif='+sif+'&apl_sif='+apl_sif+'&mod_sif='+mod_sif, 'temp',null, 'm1('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\''+prava+'\')' , 0);
} 

function delModulesGroup(sif, apl_sif, mod_sif, div, prava) {
	  //alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	  getJSP('../Groups/_del_modules_group.jsp?sif='+sif+'&apl_sif='+apl_sif+'&mod_sif='+mod_sif, 'temp',null, 'm1('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\''+prava+'\')' , 0);
} 
function m1 (sif, apl_sif, mod_sif, div, prava) {
	// alert (id);
	// alert (sku_sif);
	 getJSP('../Groups/_get_modules_unassigned_app.jsp?sif='+sif, 'get_modules_unassigned_app',null,'m2('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\'0\')' , 0);
	 getJSP('../Groups/_get_modules_assigned_app.jsp?sif='+sif, 'get_modules_assigned_app',null, 'm2('+sif+',\''+apl_sif+'\',\''+mod_sif+'\',\''+div+'\',\'1\')' , 0);
}

function m2 (sif, apl_sif, mod_sif, div, prava) {
	//alert ('sif: '+sif);alert ('apl_sif: '+apl_sif);alert ('mod_sif: '+mod_sif);alert ('div: '+div);alert ('prava: '+prava);return false;
	if (mod_sif!=""&&prava=="1"){
		//alert ('div: '+'get_modules_assigned_app'+apl_sif);alert ('prava: '+prava);//return false;
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!=null){document.getElementById('get_modules_assigned_app'+apl_sif).style.display = 'block';}
		if (document.getElementById('get_modules_assigned_app_but'+apl_sif)!=null){document.getElementById('get_modules_assigned_app_but'+apl_sif).innerHTML = '<i class="fa fa-minus"></i>';}
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!=null){document.getElementById('get_modules_assigned_app_sub'+apl_sif).setAttribute("class", "box box-success box-solid");}
		if (document.getElementById('get_modules_assigned_app'+apl_sif)!= null){document.getElementById('get_modules_assigned_app'+apl_sif).lang = '1'}
		getJSP('../Groups/_get_modules_app.jsp?sif='+sif+'&app_sif='+apl_sif+'&mod_sif=&prava='+prava, 'get_modules_assigned_app'+apl_sif,null,null , 0);
		
		
	}
	if (mod_sif!=""&&prava=="0"){
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app'+apl_sif).style.display = 'block';}
		if (document.getElementById('get_modules_unassigned_app_but'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app_but'+apl_sif).innerHTML = '<i class="fa fa-minus"></i>';}
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!=null){document.getElementById('get_modules_unassigned_app_sub'+apl_sif).setAttribute("class", "box box-success box-solid");}
		if (document.getElementById('get_modules_unassigned_app'+apl_sif)!= null){document.getElementById('get_modules_unassigned_app'+apl_sif).lang = '1'}
		getJSP('../Groups/_get_modules_app.jsp?sif='+sif+'&app_sif='+apl_sif+'&mod_sif=&prava='+prava, 'get_modules_unassigned_app'+apl_sif,null,null , 0);
		
	}
	
	if (document.getElementById('get_modules_unassigned_app_sub')!=null){
	    document.getElementById('get_modules_unassigned_app_sub').style.display = 'block';
	    }
	if (document.getElementById('get_modules_unassigned_app_but')!=null){
		document.getElementById('get_modules_unassigned_app_but').innerHTML = '<i class="fa fa-minus"></i>';
		}
	if (document.getElementById('get_modules_unassigned_app')!=null){
		document.getElementById('get_modules_unassigned_app').setAttribute("class", "box box-success");
		}
	if (document.getElementById('get_modules_unassigned_app_but')!=null){
		document.getElementById('get_modules_unassigned_app_but').setAttribute("data-widget", "collapse");
		}
	if (document.getElementById('get_modules_assigned_app_sub')!=null){
		document.getElementById('get_modules_assigned_app_sub').style.display = 'block';
		}
	if (document.getElementById('get_modules_assigned_app_but')!=null){
		document.getElementById('get_modules_assigned_app_but').innerHTML = '<i class="fa fa-minus"></i>';
		}
	if (document.getElementById('get_modules_assigned_app')!=null){
		document.getElementById('get_modules_assigned_app').setAttribute("class", "box box-success");
		}
	if (document.getElementById('get_modules_assigned_app_but')!=null){
		document.getElementById('get_modules_assigned_app_but').setAttribute("data-widget", "collapse");
		}
  }

//=============================================================================================================================== 

C=new Array(
  'А','Б','В','Г','Д','Е','З','Ѕ','И','Ј','К','Л','Љ','М','Н','Њ','О',
  'П','Р','С','Т','У','Ф','Х','Ц','Џ',
  'а','б','в','г','д','е','з','ѕ','и','ј','к','л','љ','м','н','њ','о',
  'п','р','с','т','у','ф','х','ц','џ')

L=new Array(
  'A','B','V','G','D','E','Z','Y','I','J','K','L','Q','M','N','W','O',
  'P','R','S','T','U','F','H','C','X',
  'a','b','v','g','d','e','z','y','i','j','k','l','q','m','n','w','o',
  'p','r','s','t','u','f','h','c','x')


Cyr=new Array()
	
	for (q=0;q<59;q++) {Cyr[L[q]]=C[q]}

Cyr[unescape('%5C')]=('ж')
Cyr[unescape('%7C')]=('Ж') 
Cyr[unescape('%5D')]=('ѓ')
Cyr[unescape('%7D')]=('Ѓ')   
Cyr[unescape('%27')]=('ќ')
Cyr[unescape('%22')]=('Ќ')
Cyr[unescape('%3B')]=('ч')
Cyr[unescape('%3A')]=('Ч') 
Cyr[unescape('%5B')]=('ш')
Cyr[unescape('%7B')]=('Ш')
//Cyr[unescape('%62')]=unescape('%E1')


Lat=new Array()

    for (q=0;q<59;q++) {Lat[C[q]]=L[q]}

Lat[unescape('%5C')]=('ж')
Lat[unescape('%7C')]=('Ж') 
Lat[unescape('%5D')]=('ѓ')
Lat[unescape('%7D')]=('Ѓ')   
Lat[unescape('%27')]=('ќ')
Lat[unescape('%22')]=('Ќ')
Lat[unescape('%3B')]=('ч')
Lat[unescape('%3A')]=('Ч') 
Lat[unescape('%5B')]=('ш')
Lat[unescape('%7B')]=('Ш')





function toCyr(lat) {
	    // alert(lat.value.length)
		 cyr=''
		 for (q=0;q<lat.length;q++) {
										    ch=lat.charAt(q);
										    chL=ch.toLowerCase();
										    nxt=lat.charAt(q+1).toLowerCase();
										    if (Cyr[ch]) {cyr+=Cyr[ch];}else {cyr+=ch;}
		                                   }
	 	return cyr;
}

function toLat(cyr) {
    // alert(lat.value.length)
	 lat=''
	 for (q=0;q<cyr.length;q++) {
									    ch=cyr.charAt(q);
									    chL=ch.toLowerCase();
									    nxt=cyr.charAt(q+1).toLowerCase();
									    if (Lat[ch]) {lat+=Lat[ch];}else {lat+=ch;}
	                                   }
 	return lat;
}




    function getKeyCode(e)
    {

        if( !e ) {
            //if the browser did not pass the event information to the
            //function, we will have to obtain it from the event register
            if( window.event ) {
                //Internet Explorer
                e = window.event;
            } else {
                //total failure, we have no way of referencing the event
                return;
              }
        }
        
        if( typeof( e.keyCode ) == 'number'  ) {
            //DOM
            return e.keyCode;
        } else if( typeof( e.which ) == 'number' ) {
            //NS 4 compatible
            return e.keyCode;
        } else if( typeof( e.charCode ) == 'number'  ) {
            //also NS 6+, Mozilla 0.9+
            return e.keyCode;
        } else {
                //total failure, we have no way of obtaining the key code
                return 
         }
    }
    



    
    function toCyrillic(Event,Name)
    {

          var browserName=navigator.appName;  
		          if (browserName=="Microsoft Internet Explorer")
		          {
		                var range = document.selection.createRange();
		                var bookmark = range.getBookmark();
		                caret_pos = bookmark.charCodeAt(2) - 2;//var caret_pos = bookmark.charCodeAt(2) - 2;
		          }     
		          else
		          {      
		                caret_pos = Name.selectionEnd;  //kolku karakteri ima pred cursorot
		          }     

          if (getKeyCode(Event) != 9)
          {
        	   //alert(getKeyCode(Event))
                pocetno='';
                celosno=Name.value;
        
                for (q=0; q < caret_pos ; q++) 
		                {   
		                    pocetno+=celosno.charAt(q);
		                }
                //alert(pocetno)
                pocetno=toCyr(pocetno);
               // pocetno=pocetno.toUpperCase();
				    
                for (q=caret_pos ; q<=Name.value.length-1 ; q++) 
		                {   
		                    pocetno+=celosno.charAt(q);
		                }
                
                Name.value=pocetno;
                setCursorPosition(Name,caret_pos,caret_pos);
          }
    }









    function toCyrillicUpp(Event,Name)
    {
	

          var browserName=navigator.appName;  
          if (browserName=="Microsoft Internet Explorer")
          {
                var range = document.selection.createRange();
                var bookmark = range.getBookmark();
                caret_pos = bookmark.charCodeAt(2) - 2;//var caret_pos = bookmark.charCodeAt(2) - 2;
          }     
          else
          {      
                caret_pos = Name.selectionEnd;  //kolku karakteri ima pred cursorot
          }     

          if (getKeyCode(Event) != 9)
          {
                pocetno='';
                celosno=Name.value;
        
                for (q=0; q < caret_pos ; q++) 
                {   
                    pocetno+=celosno.charAt(q);
                }
                pocetno=toCyr(pocetno);
                pocetno=pocetno.toUpperCase();
				    
                for (q=caret_pos ; q<=Name.value.length-1 ; q++) 
                {   
                    pocetno+=celosno.charAt(q);
                }
                
                Name.value=pocetno;
                setCursorPosition(Name,caret_pos,caret_pos);
          }
    }
    
    

    function toLatinUpp(Event,Name)
    {


          var browserName=navigator.appName;  
          if (browserName=="Microsoft Internet Explorer")
          {
                var range = document.selection.createRange();
                var bookmark = range.getBookmark();
                caret_pos = bookmark.charCodeAt(2) - 2;//var caret_pos = bookmark.charCodeAt(2) - 2;
          }     
          else
          {      
                caret_pos = Name.selectionEnd;  //kolku karakteri ima pred cursorot
          }     

          if (getKeyCode(Event) != 9)
          {
                pocetno='';
                celosno=Name.value;
        
                for (q=0; q < caret_pos ; q++) 
                {   
                    pocetno+=celosno.charAt(q);
                }
                pocetno=toLat(pocetno);
                pocetno=pocetno.toUpperCase();
				//alert(pocetno)
                for (q=caret_pos ; q<=Name.value.length-1 ; q++) 
                {   
                    pocetno+=celosno.charAt(q);
                }
                
                Name.value=pocetno;
                setCursorPosition(Name,caret_pos,caret_pos);
          }
    }

    function setCursorPosition(oInput,oStart,oEnd) 
    {
        oInput.focus();
        if( oInput.setSelectionRange ) 
        {
            oInput.setSelectionRange(oStart,oEnd);
        } 
        else if( oInput.createTextRange ) 
        {
            var range = oInput.createTextRange();
            range.collapse(true);
            range.moveEnd('character',oEnd);
            range.moveStart('character',oStart);
            range.select();
        }
    }
    
    
function f(o){o.value=o.value.toUpperCase();}



function isNumberKey(evt)
{

 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode > 31 && (charCode < 48 || charCode > 57))
	return false;

 return true;
}


function isNumberKey_tocka(evt) // dozvoleni: samo brojki i .    nedozvoleni: site ostanati
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode > 31 && (charCode < 48 || charCode > 57)&&charCode!=46)
	return false;

 return true;
}

function isNumberKey_zapirka(evt)// dozvoleni: samo brojki i ,    nedozvoleni: site ostanati
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode > 31 && (charCode < 48 || charCode > 57)&&charCode!=44)
	return false;

 return true;
}


function isNumberKey_minus_kosa_crta(evt)// dozvoleni: samo brojki i -    nedozvoleni: site ostanati
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
       if (charCode > 31 && (charCode < 48 || charCode > 57) &&charCode!=45 &&charCode!=47)
	 return false;

 return true;
}

function isNumberKey_minus(evt)// dozvoleni: samo brojki i -    nedozvoleni: site ostanati
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode > 31 && (charCode < 48 || charCode > 57)&&charCode!=45)
	return false;

 return true;
}


function isNumberKey_bezZapirka(evt)// dozvoleni: site    nedozvoleni: ,
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode == 44)
	return false;

 return true;
}



function isNavodnik(evt)// dozvoleni: site    nedozvoleni:    ' " & 
{
	 var charCode = (evt.which) ? evt.which : evt.keyCode// vo razlicni browseri razlicno se povikuva (which,keyCode)
 if (charCode == 39 || charCode==34 || charCode==38|| charCode==13)
	return false;

 return true;
}



function BrojNaKarakteri(id,numb) 
{
	//alert(id);
	//alert(numb);
	//return false;
	var tekst = document.getElementById(id).value;
	if(tekst.length>numb) 
	{
		tekst = tekst.substr(0,numb);
		document.getElementById(id).value = tekst;
	}
}

function BrojNaKarakteriAlert(imepole,broj) 

{
  // alert(imepole);
	//alert(broj);
		//alert(div);
			var tekst = document.getElementById(imepole).value;
				//alert(tekst)
	// return false;
	
	if(tekst.length>broj) {

		tekst = tekst.substr(0,broj);
		document.getElementById(imepole).value = tekst;
		alert('Не е дозволено внесување на повеќе од '+broj+' карактери !');
		return false;
	}
	
}
function BrojNaKarakteriSoPrikaz(imepole,broj,poleprikaz) 

{
  // alert(imepole);
	//alert(broj);
		//alert(div);
			var tekst = document.getElementById(imepole).value;
				//alert(tekst)
	// return false;
	document.getElementById(poleprikaz).value=tekst.length
	if(tekst.length>broj) {

		tekst = tekst.substr(0,broj);
		document.getElementById(imepole).value = tekst;
		document.getElementById(poleprikaz).value=tekst.length
		alert('Не е дозволено внесување на повеќе од '+broj+' карактери !');
		return false;
	}
	
}

