<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>




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





				<div class="preloader" style="display: none;">
					<div class="lds-ripple">






						<form action="#" method="GET">
							<br /> <br />

							<fieldset>
								<legend style="color: red;">Selectionner les dates </legend>
								<table border="0">

									<tr style="color: white;">
										<td>Date Debut :</td>
										<td><input class="form-control" required="" type="date"
											name="date1" /></td>
										<td>*</td>
									</tr>
									<tr style="color: white;">
										<td>Date Fin :</td>
										<td><input class="form-control" required="" type="date"
											name="date2" /></td>
										<td>*</td>
									</tr>

									<tr>
										<td></td>
										<td><input type="submit" id="submit" value="submit"
											name="submit" class="btn btn-info"></td>

									</tr>

								</table>

							</fieldset>
							<br /> <br />
						</form>
						<br /> <br /> <br />
						<fieldset>
							<legend style="color: white;">Liste des machines </legend>
							<div class="table-responsive ps">
								<table class="table tablesorter ">
									<thead>
										<tr>
											<th>Reference</th>
											<th>Date Achat</th>
											<th>Prix</th>

										</tr>
									</thead>
									<tbody>
										<%
										Date date1 = Date.valueOf(request.getParameter("date1"));
										Date date2 = Date.valueOf(request.getParameter("date2"));

										Connection con;
										PreparedStatement pst;
										ResultSet rs;
										Class.forName("com.mysql.cj.jdbc.Driver");
										con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");

										pst = con.prepareStatement("select * from machinee where dateAchat between ? and  ?");
										pst.setDate(1, Date.valueOf(request.getParameter("date1")));
										pst.setDate(2, Date.valueOf(request.getParameter("date2")));

										rs = pst.executeQuery();

										while (rs.next()) {
											String id = rs.getString("id");
										%>

										<tr style="color: red;">
											<td><%=rs.getString("reference")%></td>
											<td><%=rs.getString("dateAchat")%></td>
											<td><%=rs.getString("prix")%></td>

										</tr>


										<%
										}
										%>

									</tbody>
								</table>
							</div>
						</fieldset>
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
						<script
							src="assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
						<script
							src="assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
						<script src="dist/js/pages/dashboards/dashboard1.min.js"></script>
						<div class="jvectormap-tip"></div>
</body>
</html>

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