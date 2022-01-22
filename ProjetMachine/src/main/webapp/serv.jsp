<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
			
		
			<%@include file="template/footer.jsp"%>

	<script>
	<% 

		Connection con;
		PreparedStatement pst;
ResultSet rs;
	
try{
	
	response.setContentType("text/html");
String cityname = request.getParameter("combo");

	Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/machinee?serverTimezone=UTC", "root", "");
		pst = con.prepareStatement("select id,code,type from salle where code=?");
pst.setString(1, cityname);
rs = pst.executeQuery();


		out.println("<table width=60% border= 1 >");
		out.println("<tr><td colspan=4 ");
		out.println("<center><h2>Result of Search Page</h2></center>");
		out.println("</td></tr>");
		out.println("<tr>");
		out.println("<th>id</th>");
		out.println("<th>code</th>");
		out.println("<th>type</th>");

		out.println("</tr>");

		while (rs.next()) {
			out.println("<tr>");
			out.println("<td>" + rs.getString("id") + "</td> ");
			out.println("<td>" + rs.getString("code") + "</td> ");
			out.println("<td>" + rs.getString("type") + "</td> ");

			out.println("</tr>");

		}
		out.println("</table>");

	

}
catch(Exception e)
 {
          e.printStackTrace(); // Or System.out.println(e);
 }
		
		
	
%>

</div>
</div>
</div>
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