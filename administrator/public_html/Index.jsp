<%
 //response.sendRedirect("Login/ModuleLogin.jsp");
%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%System.out.println("");System.out.println("Index.jsp:");%>

<%@ page import="Procedures.*"%>
<%@ page import ="java.security.cert.*"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.*"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import ="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


    <link rel="stylesheet" href="LTE/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="LTE/font-awesome/4.4.0/css/font-awesome.min.css">


<script src="js/main.js"></script>
<script src="js/ajaxCaller.js"></script>

<title>:: AKN ADMINISTRATOR ::</title>
</head>
<body>

  <%

     String CONTENT_TYPE = "text/html; charset=UTF-8";
     String ifcert = ReadDBProperties.getProperty("cert");
     String ERROR_MESSAGE = "";
     
     System.out.println("");
     System.out.println("ifcert: "+ifcert);
     
     response.setContentType(CONTENT_TYPE);
     session = request.getSession();

     if ("ne".equals(ifcert))
     {
	 	    Procs.getTempUserSession("14", session);//WFLITE
	 	    
	        if ((String)session.getAttribute("TEMPERROR") != null)
		        {
			     	   ERROR_MESSAGE = (String)session.getAttribute("TEMPERROR");
			     	   %>
						<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						          <div class="modal-header">
						        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
						        <h5 class="text-center">апликација за управување со кориснички права</h5>
						      </div>
						      <div class="modal-body" style="text-align:center">
						          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
						      </div>
						      <div class="modal-footer">
						        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
						      </div>
						    </div>
						  </div>
						</div>
			     	 <%  
			     	 return;
		        }	
	 	    
	        if ((String)session.getAttribute("TEMPERROR") == null)
	            {
	        	  response.sendRedirect("Login/ModuleLogin.jsp");return;
	        	} 
     }	
     
     else 
     
     {
		 
			try
              {
			           
			     X509Certificate[] certs = (X509Certificate[])request.getAttribute("javax.servlet.request.X509Certificate");
			     System.out.println("certs: "+certs);
						
						if (certs != null && certs.length > 0)
						{
						                
										for (int i=0;i<certs.length;i++)
										{          
											X509Certificate cert = certs[i];
											
						                    System.out.println("");
											System.out.println("cert["+i+"]_type:"+cert.getType());
											System.out.println("cert["+i+"]_serial:"+cert.getSerialNumber());
						                    System.out.println("cert["+i+"]_signature:"+cert.getSignature());
						                    System.out.println("cert["+i+"]_subjectDN:"+cert.getSubjectDN());
						                    System.out.println("cert["+i+"]_getIssuerDN:"+cert.getIssuerDN());
						                    System.out.println("cert["+i+"]_getSigAlgName:"+cert.getSigAlgName());
						                    System.out.println("cert["+i+"]_getBasicConstraints:"+cert.getBasicConstraints());
						                    System.out.println("cert["+i+"]_getNotBefore:"+cert.getNotBefore());
						                    System.out.println("cert["+i+"]_getNotAfter:"+cert.getNotAfter());//Wed Nov 27 00:59:59 CET 2013
						                    System.out.println("cert["+i+"]_getPublicKey:"+cert.getPublicKey());
						                    System.out.println("cert["+i+"]_getVersion:"+cert.getVersion());
						                    System.out.println("cert["+i+"]_getSignature:"+cert.getSignature());
						                    System.out.println("");
						    
		
						                   //Proverka dali e istecen sertifikatot------------------------------------------------------------------------------------------------------------
						                   
						                   Date date1 = new Date();
						                   Date date2 = cert.getNotAfter();
						                   
						                   System.out.println("date1(now):"+date1);
						                   System.out.println("date2(not afrer):"+date2);
						                   System.out.println("date1.compareTo(date2):"+date1.compareTo(date2));
						                   System.out.println("date2.compareTo(date1):"+date2.compareTo(date1));
						                   
						                   DateFormat.getDateTimeInstance().format(date2);
						        
						                   System.out.println("DateFormat.getDateTimeInstance().format(date2): " + DateFormat.getDateTimeInstance().format(date2));
						
						                   if (cert.getNotAfter().compareTo(date1)<0)
						                   {
							                   ERROR_MESSAGE = "СЕРТИФИКАТОТ НЕ Е ПОВЕЌЕ ВАЛИДЕН";
							                   %>
														<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
														  <div class="modal-dialog">
														    <div class="modal-content">
														          <div class="modal-header">
														        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
														        <h5 class="text-center">апликација за управување со кориснички права</h5>
														      </div>
														      <div class="modal-body" style="text-align:center">
														          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
														      </div>
														      <div class="modal-footer">
														        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
														      </div>
														    </div>
														  </div>
														</div>
							                   <%
							                   return;
						                   }
						                  
						                   
						                   
						                    //Proverka na pristap do CRL listi------------------------------------------------------------------------------------------------------------
						                    if(cert.getIssuerDN().getName().startsWith("CN=Makedonski Telekom CA")||cert.getIssuerDN().getName().startsWith("CN=KIBS Qualified Certificate Services CA")||cert.getIssuerDN().getName().startsWith("CN=KibsTrust Qualified Certificate Services"))
						                    {
							
						
						                    URL crlUrl = null;
						                 
						                    if(cert.getIssuerDN().getName().startsWith("CN=Makedonski Telekom CA")) crlUrl = new URL("http://www.ca.telekom.mk/CRL/MakedonskiTelekomCA.crl");
						                    if(cert.getIssuerDN().getName().startsWith("CN=KIBS Qualified Certificate Services CA")) crlUrl = new URL("http://ca.kibs.com.mk/crl/VerbaQ.crl");
											if(cert.getIssuerDN().getName().startsWith("CN=KibsTrust Qualified Certificate Services")) crlUrl = new URL("http://crl.kibstrust.mk/VerbaQ.crl");
											
						                    URLConnection crlConn = crlUrl.openConnection();
						                    crlConn.setDoInput(true);
						                    crlConn.setDoOutput(true);
						                    crlConn.setUseCaches(false);
						                    crlConn.setRequestProperty("Connection", "Keep-Alive");
						               
						                    InputStream instr = null;
						                    
						                    try {
						                            instr = crlConn.getInputStream();
						                        } 
						                    catch (Exception e) 
						                        {
						                            e.printStackTrace();
						                            instr.close();
						                           
						                            ERROR_MESSAGE = "НЕМА ПРИСТАП ДО CRL ЛИСТАТА";
						                            %>
													<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													          <div class="modal-header">
													        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
													        <h5 class="text-center">апликација за управување со кориснички права</h5>
													      </div>
													      <div class="modal-body" style="text-align:center">
													          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
													      </div>
													      <div class="modal-footer">
													        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
													      </div>
													    </div>
													  </div>
													</div>
						                            
						                            <%
						                            return;
						                        }
						                    
						                    
						                    
						                    //Proverka dali e odjaven sertifikatot------------------------------------------------------------------------------------------------------------
						                      
						                    CertificateFactory certificatefactory = CertificateFactory.getInstance("X.509");
						                    X509CRL x509crl = (X509CRL) certificatefactory.generateCRL(instr);
						                    boolean revoked = x509crl.isRevoked(cert);
						                    
						                    if(revoked == true)
							                    {
							                    	instr.close();
							                    	ERROR_MESSAGE = "СЕРТИФИКАТОТ Е ОДЈАВЕН";
								                    %>
														<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
														  <div class="modal-dialog">
														    <div class="modal-content">
														          <div class="modal-header">
														        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
														        <h5 class="text-center">апликација за управување со кориснички права</h5>
														      </div>
														      <div class="modal-body" style="text-align:center">
														          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
														      </div>
														      <div class="modal-footer">
														        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
														      </div>
														    </div>
														  </div>
														</div>
								                    <%
								                    return;
							                    }
						                    
						                    instr.close();
						                    
						
						                   //------------------------------------------------------------------------------------------------------------
						                   }
						                   
						                   session.setAttribute("CERTIFICATE", cert.getSerialNumber().toString());
						                   System.out.println("Session(CERTIFICATE): "+cert.getSerialNumber().toString());   
						                  
						                                        
										}
										
							              
							       	   Procs.getTempUserSession((String)session.getAttribute("CERTIFICATE"), session);//WFLITE
							           if ((String)session.getAttribute("TEMPERROR") != null){
							        	   ERROR_MESSAGE = (String)session.getAttribute("TEMPERROR");%>
							        	   
													<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
													  <div class="modal-dialog">
													    <div class="modal-content">
													          <div class="modal-header">
													        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
													        <h5 class="text-center">апликација за управување со кориснички права</h5>
													      </div>
													      <div class="modal-body" style="text-align:center">
													          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
													      </div>
													      <div class="modal-footer">
													        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
													      </div>
													    </div>
													  </div>
													</div>
							           
							        <%   return;
							           }	   
							           if ((String)session.getAttribute("TEMPERROR") == null){response.sendRedirect("Login/ModuleLogin.jsp");return;} 
								
				}
				else
						
			    {   
					//------------------------------------------------------------------------------------------------------------
					ERROR_MESSAGE = "ГРЕШКА ПРИ ВЧИТУВАЊЕ НА СЕРИСКИОТ БРОЈ ОД ЕЛЕКТРОНСКИОТ КЛУЧ!";
				    %>
											<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											          <div class="modal-header">
											        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
											        <h5 class="text-center">апликација за управување со кориснички права</h5>
											      </div>
											      <div class="modal-body" style="text-align:center">
											          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
											      </div>
											      <div class="modal-footer">
											        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
											      </div>
											    </div>
											  </div>
											</div>
				    <%
					 return;
					//------------------------------------------------------------------------------------------------------------
				  }
						
										
             }//----try
								 
								 
		    catch (Exception e) 
						        
			 {			
		    	System.out.println("catch on: getTempUserSession");
		      // ERROR_MESSAGE = "ГРЕШКА ПРИ ВЧИТУВАЊЕ НА СЕРИСКИОТ БРОЈ ОД ЕЛЕКТРОНСКИОТ КЛУЧ";
				ERROR_MESSAGE = "catch Exception: "+e.getLocalizedMessage();
				StringWriter errors = new StringWriter();
				e.printStackTrace(new PrintWriter(errors));
				String greska = errors.toString();
				%>
<!-- 
<B>HttpSession Information:</B>
<UL>
<LI>Error on catch:   <b><%= greska %></b></LI>
</UL>
 -->
				<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				          <div class="modal-header">
				        <h3 class="text-center">АДМИНИСТРАТОР</h3> 
				        <h5 class="text-center">апликација за управување со кориснички права</h5>
				      </div>
				      <div class="modal-body" style="text-align:center">
				          <h2> <%=ERROR_MESSAGE%><%session.setAttribute("TEMPERROR", null);%></h2>
				      </div>
				      <div class="modal-footer">
				        <h6>АКН Администратор ™ в. 1.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> 
				      </div>
				    </div>
				  </div>
				</div>
				<%
				return;
		     }//----catch


  }
     
  %>







</body>
  
</html>

  

