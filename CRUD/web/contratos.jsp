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
            ps=con.prepareStatement("select * from contrato");
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
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="clientes.jsp" >Clientes</a>
                        </li>
                        <li class="nav-item ">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="index.jsp" >Empleados</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light active" href="contratos.jsp" >Contratos</a>
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
        <div class="container">
            <h1>Contratos</h1>
            <hr>
            <div class="container">
                <form class="row g-3">
                    <div class="col-auto">
                        <a  class="btn btn-success" href="Agregar.jsp">Nuevo Contrato</a> 
                       
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
                    ps=con.prepareStatement("SELECT * FROM contrato where TIPO_CONT LIKE"+"'%"+nombuscar+"%'");
                    rs=ps.executeQuery();
                    }else{
                        System.err.print("Error");
                    }

                    

                %>

            </div>
                <hr>
            <table class="table table-bordered">
                 
                 <tr>
                     <th class="text-center">ID CONTRATO</th>
                     <th class="text-center">ID CLIETE</th>
                     <th class="text-center">TIPO DE CONTRATO</th>
                     <th class="text-center">FECHA DE ALTA</th>
                     <th class="text-center">VALOR</th>
                     <th class="text-center">ACCIONES</th>
                 </tr>
                 <% 
                    while(rs.next()){
                                       
                     %>
                     <tr>
                         <td class="text-center"><%= rs.getInt("ID_CONT")%></td>
                         <td class="text-center"><%= rs.getInt("ID_CLI")%></td>
                         <td class="text-center"><%= rs.getString("TIPO_CONT")%></td>
                         <td class="text-center"><%= rs.getString("FECHA_ALTA_CONT")%></td>
                         <td class="text-center"><%= rs.getInt("VALOR_CONT")%></td>
                         
                         <td class="text-center">
                             <a href="EditCont.jsp?id=<%= rs.getInt("ID_CONT")%>" class="btn btn-warning">Editar</a>
                             <a href="DelCont.jsp?id=<%= rs.getInt("ID_CONT")%>" class="btn btn-danger">Eliminar</a>
                         </td>
                     </tr>
                     <% } %>
             </table>
         </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
