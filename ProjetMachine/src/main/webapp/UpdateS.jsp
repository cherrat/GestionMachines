<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
if (request.getParameter("submit") != null) {
	String id = request.getParameter("id");
	String name = request.getParameter("code");
	String course = request.getParameter("type");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("update salle set code = ?,type =? where id = ?");
	pst.setString(1, name);
	pst.setString(2, course);
	pst.setString(3, id);
	pst.executeUpdate();
%>

<script>
	alert("Salle modifiée");
</script>
<%
}
%>
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
	  <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
				<h1>Modification de salle</h1>


				<div class="row">
					<div class="col-sm-4">
						<form method="POST" action="#">

							<%
							Connection con;
							PreparedStatement pst;
							ResultSet rs;

							Class.forName("com.mysql.cj.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");

							String id = request.getParameter("id");

							pst = con.prepareStatement("select * from salle where id = ?");
							pst.setString(1, id);
							rs = pst.executeQuery();

							while (rs.next()) {
							%>
						

							<div alight="left">
								<label class="form-label">Code</label> <input type="text"
									class="form-control" placeholder="Code" name="code"
									value="<%=rs.getString("code")%>" id="code" required>
							</div>

							<div alight="left">
								<label class="form-label">Type</label> <input type="text"
									class="form-control" placeholder="type" name="type" id="type"
									value="<%=rs.getString("type")%>" required>
							</div>

							<%
							}
							%>



							</br>

							<div alight="right">
								<input type="submit" id="submit" value="submit" name="submit"
									class="btn btn-info"> <input type="reset" id="reset"
									value="reset" name="reset" class="btn btn-warning">
							</div>

							<div align="right">

								<p>
									<a href="GestionSalles.jsp">Click Back</a>
								</p>


							</div>

						</form>
					</div>
				</div>
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