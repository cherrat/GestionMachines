<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
if (request.getParameter("submit") != null) {
	String name = request.getParameter("reference");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date course = sdf.parse(request.getParameter("dateAchat"));
	String fee = request.getParameter("prix");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("insert into machinee(reference,dateAchat,prix)values(?,?,?)");
	pst.setString(1, name);
	pst.setDate(2, new Date(course.getTime()));
	pst.setString(3, fee);
	pst.executeUpdate();
%>
<script>
	alert("Machine ajoutéé !");
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
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

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
				<h1>Gestion des Machines</h1>
				</br>
				<div class="row">
					<div class="col-sm-4">
						<form method="POST" action="#">

							<div alight="left">
								<label class="form-label">Reference</label> <input type="text"
									class="form-control" placeholder="Ref" name="reference"
									id="reference" required>
							</div>

							<div alight="left">
								<label class="form-label">DateAchat</label> <input type="date"
									class="form-control" placeholder="Date" name="dateAchat"
									id="dateAchat" required>
							</div>

							<div alight="left">
								<label class="form-label">Prix</label> <input type="text"
									class="form-control" placeholder="Prix" name="prix" id="prix"
									required>
							</div>
							</br>

							<div alight="right">
								<input type="submit" id="submit" value="submit" name="submit"
									class="btn btn-info"> <input type="reset" id="reset"
									value="reset" name="reset" class="btn btn-warning">
							</div>

						</form>
					</div>

					<div class="col-sm-8">
						<div class="panel-body">
						<div class="pull-right">
								<button class="btn btn-default btn-xs btn-filter">
									<span class="fa fa-filter"></span> Filtre
								</button>
							</div>
							<table id="tbl-student"
								class="table table-responsive table-bordered" cellpadding="0"
								width="100%">
								<thead>
									<tr>
										<th><input type="text" class="form-control"
											placeholder="Reference" disabled></th>
										<th><input type="text" class="form-control"
											placeholder="DateAchat" disabled></th>
											<th><input type="text" class="form-control"
											placeholder="Prix" disabled></th>
										
										<th>Modifier</th>
										<th>Supprimer</th>
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
										<td><a href="UpdateM.jsp?id=<%=id%>">Modifier</a></td>
										<td><a href="DeleteM.jsp?id=<%=id%>">Supprimer</a></td>
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