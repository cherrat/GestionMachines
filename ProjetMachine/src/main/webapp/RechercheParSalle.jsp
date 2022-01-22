<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="service.SalleService"%>
<%@page import="java.sql.Date"%>
<%@page import="beans.Machine"%>
<%@page import="java.sql.*"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>
  <%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>



<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<title>Adminmart Template - The Ultimate Multipurpose admin
	template</title>
<!-- Custom CSS -->
<link href="assets/extra-libs/c3/c3.min.css" rel="stylesheet">
<link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
<link href="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css"
	rel="stylesheet">
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
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<%@include file="template/header.jsp"%>
		<%@include file="template/menu.jsp"%>
		<div class="page-wrapper" style="display: block;">
			<div class="container-fluid">

				<div class="content">
					
						</tr>
						<fieldset>
							<legend>Liste des machines</legend>

							<table border="0">


								<tr>
							
											<%
											
										
											
											
										       
									            Connection con;
									            PreparedStatement pst;
									            ResultSet rs;
									         try
									{
									            Class.forName("com.mysql.cj.jdbc.Driver");
									            con=DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC","root","");
									            pst = con.prepareStatement("select distinct code from salle");
									    rs=pst.executeQuery();
									            
									            if(rs.next())
									   {
									      out.println("<tr>");
									              out.println("<td>Choisir code</td>");
									      out.println("<td>");
									      out.println("<select name='combo'>");
									  do{
									            String cityname = rs.getString("code");
									    out.println("<option value='"+ cityname   +"'>" +  cityname +  "</option>");
									          }
									            while(rs.next());
									   out.println("</select>");
									           rs.close();
									   out.println("</td></tr>");
									       
									           }
									           else
									            {
									           out.println("<tr>");
									   out.println("<td colspan=2 align=right>");
									   out.println("Sorry table is Empty");
									           out.println("</td>");
									            }
									 
									   out.println("</form>");
									  }
									        catch(Exception e)
									        {
									                 e.printStackTrace(); // Or System.out.println(e);
									        }
									         
									                              
									        %>
											<option></option>
										
											
											
									</select></td>
									

								</tr>
								<tr>
							</table>


						</fieldset>
					</form>
					<table>
						<thead>
							<tr>
								
								<th>Reference </th>
								<th>DateAchat </th>
								<th>Code </th>
								
						<form method="POST" action="RechercheParSalle.jsp">
						<td><input type="submit" id="submit" value="submit"
							name="submit" class="btn btn-info"></td>
										<%
									

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

							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
		

				</div>

			</div>

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
	<script
		src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script src="dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script src="assets/extra-libs/c3/d3.min.js"></script>
	<script src="assets/extra-libs/c3/c3.min.js"></script>
	<script src="assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script src="dist/js/pages/dashboards/dashboard1.min.js"></script>
	<div class="jvectormap-tip"></div>
</body>
</html>