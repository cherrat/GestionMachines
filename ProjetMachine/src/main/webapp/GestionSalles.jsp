<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
if (request.getParameter("submit") != null) {
	String name = request.getParameter("code");
	String course = request.getParameter("type");

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");
	pst = con.prepareStatement("insert into salle(code,type)values(?,?)");
	pst.setString(1, name);
	pst.setString(2, course);

	pst.executeUpdate();
%>
<script>
	alert("Salle ajoutée !");
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
<!-- Custom CSS -->
   <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
				<h1>Gestion des Salles</h1>
				</br>
				<div class="row">
					<div class="col-sm-4">
						<form method="POST" action="#">

							<div alight="left">
								<label class="form-label">Code</label> <input type="text"
									class="form-control" placeholder="code" name="code" id="code"
									required>
							</div>

							<div alight="left">
								<label class="form-label">Type</label> <input type="text"
									class="form-control" placeholder="type" name="type" id="type"
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
											placeholder="Code" disabled></th>
										<th><input type="text" class="form-control"
											placeholder="Type" disabled></th>

										<th>Modifier</th>
										<th>Supprimer</th>
									</tr>

									<%
									Connection con;
									PreparedStatement pst;
									ResultSet rs;

									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection("jdbc:mysql://localhost/machine?serverTimezone=UTC", "root", "");

									String query = "select * from salle";
									Statement st = con.createStatement();

									rs = st.executeQuery(query);

									while (rs.next()) {
										String id = rs.getString("id");
									%>

									<tr>
										<td><%=rs.getString("code")%></td>
										<td><%=rs.getString("type")%></td>

										<td><a href="UpdateS.jsp?id=<%=id%>">Modifier</a></td>
										<td><a href="DeleteS.jsp?id=<%=id%>">Supprimer</a></td>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="slick/slick.min.js"></script>
<script src="isotope/isotope.pkgd.min.js"></script>
<script src="lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
	<script type="text/javascript">
	
	/*
	 Please consider that the JS part isn't production ready at all, I just code it to show the concept of merging filters and titles together !
	 */
	$(document)
			.ready(
					function() {
						$('.filterable .btn-filter')
								.click(
										function() {
											var $panel = $(this).parents(
													'.filterable'), $filters = $panel
													.find('.filters input'), $tbody = $panel
													.find('.table tbody');
											if ($filters.prop('disabled') == true) {
												$filters
														.prop('disabled', false);
												$filters.first().focus();
											} else {
												$filters.val('').prop(
														'disabled', true);
												$tbody.find('.no-result')
														.remove();
												$tbody.find('tr').show();
											}
										});

						$('.filterable .filters input')
								.keyup(
										function(e) {
											/* Ignore tab key */
											var code = e.keyCode || e.which;
											if (code == '9')
												return;
											/* Useful DOM data and selectors */
											var $input = $(this), inputContent = $input
													.val().toLowerCase(), $panel = $input
													.parents('.filterable'), column = $panel
													.find('.filters th')
													.index($input.parents('th')), $table = $panel
													.find('.table'), $rows = $table
													.find('tbody tr');
											/* Dirtiest filter function ever ;) */
											var $filteredRows = $rows
													.filter(function() {
														var value = $(this)
																.find('td').eq(
																		column)
																.text()
																.toLowerCase();
														return value
																.indexOf(inputContent) === -1;
													});
											/* Clean previous no-result if exist */
											$table.find('tbody .no-result')
													.remove();
											/* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
											$rows.show();
											$filteredRows.hide();
											/* Prepend no-result row if all rows are filtered */
											if ($filteredRows.length === $rows.length) {
												$table
														.find('tbody')
														.prepend(
																$('<tr class="no-result text-center"><td colspan="'
																		+ $table
																				.find('.filters th').length
																		+ '">No result found</td></tr>'));
											}
										});
					});
					
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