<!DOCTYPE html>
<HTML>
<head><title>Compras</title> 
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

<%@ page language="java" import="java.sql.*,javax.naming.*,javax.sql.*" %>
<%try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/sistemadeinventarios","root","");
	Statement instruccion = conexion.createStatement();
	ResultSet tabla = instruccion.executeQuery("SELECT c.id,c.fecha,i.Nombre_del_producto,c.cantidad_de_producto_comprado, i.precio,o.nombre,c.cantidad_de_producto_comprado * i.precio as Total FROM compras c,clientes o,inventario i,sexo s WHERE (c.Cliente_que_compro =o.id) and(c.producto=i.id)and (o.sexo=s.id);");
%>

<table border="2px"> 
	<tr>   
	    <td>Numero</td>
	    <td>Fecha</td>
	    <td>Articulo</td>
	    <td>Cantidad de producto</td>
	    <td>Valor por articulo</td>
 	    <td>Cliente que compro</td>
	    <td>Total compra</td> 
    </tr> 
<% while (tabla.next())  {	%>		
    <tr>   
        <td><%=tabla.getInt(1)%></td>
        <td><%=tabla.getString(2)%></td>
        <td><%=tabla.getString(3)%></td>
        <td><%=tabla.getString(4)%></td>
        <td><%=tabla.getString(5)%></td>
        <td><%=tabla.getString(6)%></td>
        <td><%=tabla.getString(7)%></td>  
    </tr>      
	<%}%>
</table>

<%  }
    catch(Exception e){
    	out.println("ERROR! "+e.getMessage());
   					   }%>




    <body>
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>

</BODY>
</HTML>