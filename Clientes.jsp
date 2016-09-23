<HTML>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<BODY>
                 <%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
                <%
               try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/sistemadeinventarios","root","");
					Statement instruccion = conexion.createStatement();
					ResultSet tabla = instruccion.executeQuery("select* from clientes;");
					 %>
	<table border="2px"> 
			<tr>   
	           <td>Id</td>
	           <td>Nombres</td>
	           <td>Apellidos</td>
	           <td>Cédulas</td>
	           <td>Dirección</td>
	           <td>Ciudad</td>
	           <td>Departamento</td>
	           <td>Sexo</td>   
           </tr> 
	<%while (tabla.next())  {	%>		
           <tr>   
	           <td><%=tabla.getInt(1)%></td>
	           <td><%=tabla.getString(2)%></td>
	           <td><%=tabla.getString(3)%></td>
	           <td><%=tabla.getString(4)%></td>
	           <td><%=tabla.getString(5)%></td>
	           <td><%=tabla.getString(6)%></td>
	           <td><%=tabla.getString(7)%></td>
	           <td><%=tabla.getString(8)%></td>   
           </tr>      
	<%}%>
 	</table>
 <%	                 
               }
               catch(Exception e){
                   out.println("ERROR! "+e.getMessage());
               }      
                %>
    <form method="get" action="/index.jsp">
    <button type="submit"> Regresar </button>
</form>
</BODY>
</HTML>