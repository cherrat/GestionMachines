<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="service.MachineService"%>
<%@page import="beans.Machine"%>
<%@page import="service.MachineService"%>


<%@page import="java.sql.*"%>




	<form action="#" method="GET" >
	     <br /> <br /> 
		
		<fieldset >
			<legend style="color: white;">Selectionner les dates </legend>
			<table border="0">

				<tr style="color: white;">
					<td>Date Debut :</td>
					<td><input class="form-control"  required="" type="date" name="date1"
						 /></td>
					<td>*</td>
				</tr>
					<tr style="color: white;">
					<td>Date Fin :</td>
					<td><input  class="form-control" required="" type="date" name="date2"
						 /></td>
					<td>*</td>
				</tr>
				
				<tr>
					<td></td>
					<td><input type="submit" id="submit" value="submit" name="submit" class="btn btn-info"></td>

				</tr>

			</table>

		</fieldset>
		<br /> <br /> 
	</form>
	<br /> <br /> <br />
	<fieldset>
		<legend style="color: white;">Liste des machines </legend>
		<div class="table-responsive ps">
		<table  class="table tablesorter " >
			<thead>
				<tr >
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
			
			</tbody>
		</table>
</div>
	</fieldset>