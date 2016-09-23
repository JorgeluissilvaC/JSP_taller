<!DOCTYPE html>
<HTML>
<head>
	   <title>Clientes</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<BODY>
			<nav>
			      <div  class="nav-wrapper">
			        <a href="index.jsp" class="brand-logo">Sistema de inventarios</a>
			        <ul id="nav-mobile" class="right hide-on-med-and-down">
			          <li><a href="Clientes.jsp">Clientes</a></li>
			          <li><a href="Compras.jsp">Compras</a></li>
			          <li><a href="collapsible.html">Ventas</a></li>
			        </ul>
			      </div>
			    </nav>
			  </body>
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

</BODY>
    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</HTML>