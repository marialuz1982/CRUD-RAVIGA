<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Raviga</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        <%
            Connection con;
            String url="jdbc:mysql://localhost:3306/raviga?zeroDateTimeBehavior=CONVERT_TO_NULL";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="12345";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
            ResultSet rs;
            ps=con.prepareStatement("select * from cliente");
            rs=ps.executeQuery();
        %>
        <nav class="navbar navbar-expand-lg bg-info" >
            <div class="container-fluid ">
                <a  style="margin-left: 10px; border: none" class="btn btn-outline-light " href="home.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light active" href="clientes.jsp" >Clientes</a>
                        </li>
                        <li class="nav-item ">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light " href="index.jsp" >Empleados</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="contratos.jsp" >Contratos</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="facturacion.jsp" >Facturacion</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="reportes.jsp" >Reportes</a>
                        </li>

                    </ul>

                </div>

            </div>
        </nav>
        <h1>Clientes</h1>
            <hr>
            <div class="container">
                <form class="row g-3">
                    <div class="col-auto">
                        <a  class="btn btn-success" href="AgregarCli.jsp">Nuevo Cliente</a> 
                       
                    </div>
                    <div class="col-auto">
                        
                        <input type="text" class="form-control" name="txtbuscar">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-info mb-3">Buscar</button>
                    </div>
                </form>
                <%  
                    String nombuscar = request.getParameter("txtbuscar");
                    if(nombuscar != null){
                    ps=con.prepareStatement("SELECT * FROM cliente where RAZ_SOC LIKE"+"'%"+nombuscar+"%'");
                    rs=ps.executeQuery();
                    }else{
                        System.err.print("Error");
                    }

                    

                %>

            </div>
            <br>
            <table class="table table-bordered">

                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">CUIT</th>
                    <th class="text-center">RAZON SOCIAL</th>
                    <th class="text-center">DIRECCION</th>                    
                    <th class="text-center">TELEFONO</th>
                    <th class="text-center">EMAIL</th>
                    <th class="text-center">FECHA DE ALTA</th>
                    <th class="text-center">ACCIONES</th>

                </tr>
                <% 
                   while(rs.next()){
                                       
                %>
                <tr>
                    <td class="text-center"><%= rs.getInt("ID_CLI")%></td>
                    <td class="text-center"><%= rs.getString("CUIT")%></td>
                    <td class="text-center"><%= rs.getString("RAZ_SOC")%></td>                    
                    <td class="text-center"><%= rs.getString("DIR_CLI")%></td>
                    <td class="text-center"><%= rs.getString("TEL_CLI")%></td>
                    <td class="text-center"><%= rs.getString("EMAIL_CLI")%></td>
                    <td class="text-center"><%= rs.getString("FECHA_ALTA_CLI")%></td>
                    <td class="text-center">
                        <a href="EditCli.jsp?id=<%= rs.getInt("ID_CLI")%>" class="btn btn-warning">Editar</a>
                        <a href="DelCli.jsp?id=<%= rs.getInt("ID_CLI")%>" class="btn btn-danger">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
