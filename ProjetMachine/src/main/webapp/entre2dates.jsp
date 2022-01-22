<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>

  
<!DOCTYPE html>
<html dir="ltr" lang="en"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
    <div class="preloader" style="display: none;">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
    	<%@include file="template/header.jsp"%>
    	<%@include file="template/menu.jsp"%>
       <div class="page-wrapper" style="display: block;">
       <div class="container-fluid">
                    
      

  
<!DOCTYPE html>
<html dir="ltr" lang="en"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Adminmart Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
    <div class="preloader" style="display: none;">
        <div class="lds-ripple">
           
        </div>
    </div>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
    	
     
                    
       <div class="form-group nk-datapk-ctm form-elet-mg" id="data_3">
									<h6 class="mt-4">Debut</h6>
									<div class="input-group date nk-int-st">

										<span class="input-group-addon"></span> <input type="text"
											id="dateDebut" class="form-control" value="03/19/2018">
									</div>
								</div>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">

								<div class="form-group nk-datapk-ctm form-elet-mg" id="data_3">
									<h6 class="mt-4">Fin</h6>
									<div class="input-group date nk-int-st">

										<span class="input-group-addon"></span> <input type="text"
											id="dateFin" class="form-control" value="03/19/2018">
											
									</div>
								</div>
 <form method="POST" action="entre2dates.jsp">
						<td><input type="submit" id="submit" value="Recherche"
							name="Recherche" class="btn btn-info"></td>
									</form>
									<br><br>
									<table id="tbl-student"
								class="table table-responsive table-bordered" cellpadding="0"
								width="100%">
								<thead>
									<tr>
										<th><input width="70%" type="text" class="form-control"
											placeholder="Reference" disabled></th>
										<th><input type="text" class="form-control"
											placeholder="DateAchat" disabled></th>
											<th><input type="text" class="form-control"
											placeholder="Prix" disabled></th>
										
										
									</tr>

									<%
									Connection con;
									PreparedStatement pst;
									ResultSet rs;

									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");

									String query = "select * from machinee";
									Statement st = con.createStatement();

									rs = st.executeQuery(query);

									while (rs.next()) {
										String id = rs.getString("id");
									%>

									<tr>
										<td><%=rs.getString("reference")%></td>
										<td><%=rs.getString("dateAchat")%></td>
										<td><%=rs.getString("prix")%></td>
									
									</tr>


									<%
									}
									%>
								
							</table>
            </div>  
      
        </div>
         </div>
 
    </body>

            
            </div>
           
        </div>
    </div>
    <script>
    <% 
    Date date1 = Date.valueOf(request.getParameter("date1"));
    Date date2 = Date.valueOf(request.getParameter("date2"));

               
                  Class.forName("com.mysql.cj.jdbc.Driver");
              	con = DriverManager.getConnection("jdbc:mysql://localhost/jdbc?serverTimezone=UTC", "root", "");
                  
                  
                    pst = con.prepareStatement("select * from machine where dateAchat between ? and  ?");
                    pst.setDate(1,  Date.valueOf(request.getParameter("date1")));
                    pst.setDate(2,  Date.valueOf(request.getParameter("date2")));
                   
                    
                     rs = pst.executeQuery();
                      
                          while(rs.next())
                          {
                              String id = rs.getString("id");
                     %>

               <tr style="color: white;">
                   <td><%=rs.getString("reference") %></td>
                   <td><%=rs.getString("dateAchat") %></td>
                   <td><%=rs.getString("prix") %></td>
                 
               </tr>
              
              
                  <%
                  
                   }
                 %>
    </script>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="assets/extra-libs/c3/d3.min.js"></script>
    <script src="assets/extra-libs/c3/c3.min.js"></script>
    <script src="assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="dist/js/pages/dashboards/dashboard1.min.js"></script>
<div class="jvectormap-tip"></div></body></html>
 
            </div>  
        </div>
        </div>
        </div>
         </div>
 
    </body>

            
            </div>
            <%@include file="template/footer.jsp"%>
        </div>
    </div>
    <script>
    	//functions
    </script>
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="dist/js/app-style-switcher.js"></script>
    <script src="dist/js/feather.min.js"></script>
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="assets/extra-libs/c3/d3.min.js"></script>
    <script src="assets/extra-libs/c3/c3.min.js"></script>
    <script src="assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="dist/js/pages/dashboards/dashboard1.min.js"></script>
<div class="jvectormap-tip"></div></body></html>