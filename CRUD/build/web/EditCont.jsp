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
          int id = Integer.parseInt(request.getParameter("id"));//error
          ps=con.prepareStatement("SELECT * FROM contrato WHERE ID_CONT="+id);
          rs=ps.executeQuery();
          while(rs.next()){
         %>
         <div class="container ">
             <h1>Modificar contrato</h1>
             <hr><!-- comment -->
             <form action="" metod="post" class="form-control" style="width: 400px">
                <label>ID_CONT</label>
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("ID_CONT")%>">
                <label>ID_CLI</label>
                <input type="text" name="txtIdCli" class="form-control" value="<%= rs.getInt("ID_CLI")%>">
                <label>TIPO DE CONTRATO</label>
                <input type="text" name="txtTipo" class="form-control" value="<%= rs.getString("TIPO_CONT")%>">
                <label>FECHA DE ALTA</label>
                <input type="text" name="txtFecha" class="form-control" value="<%= rs.getString("FECHA_ALTA_CONT")%>">
                <label>VALOR</label>
                <input type="text" name="txtValor" class="form-control" value="<%= rs.getString("VALOR_CONT")%>">                
                <br><!-- comment -->
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg">
                <a href="contrato.jsp" class="btn btn-info btn-lg">Regresar</a>
                 
             </form>
             <% }%>
         </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
<% 
          int idcli;
          String tipo;
          String fecha;
          int valor;                    
          idcli = Integer.parseInt(request.getParameter("txtIdCli"));
          tipo = request.getParameter("txtTipo");
          fecha = request.getParameter("txtFecha");
          valor = Integer.parseInt(request.getParameter("txtValor"));        
          if(idcli != 0 && tipo != null && fecha != null && valor != 0 ){//error
            //ps=con.prepareStatement("CALL SP_ALTAEMPLEADO('"+cuil+"','"+dni+"','"+nom+"','"+ape+"','"+dir+"','"+tel+"','"+email+"','"+fecha+"')");
            ps=con.prepareStatement("UPDATE contrato SET ID_CLI='"+idcli+"',TIPO_CONT='"+tipo+"',FECHA_ALTA_CONT='"+fecha+"',VALOR_CONT='"+valor+"' WHERE ID_CONT='"+id);
            ps.executeUpdate();//Error
            response.sendRedirect("contratos.jsp");
          
    }
%>