<%@page import="javax.swing.JOptionPane" %>
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
        <div>
            <h1>Nuevo cliente</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                <label>CUIT</label>
                <input type="text" name="txtCuit" class="form-control">
                <label>RAZON SOCIAL</label>
                <input type="text" name="txtRazSoc" class="form-control">                
                <label>DIRECCION</label>
                <input type="text" name="txtDir" class="form-control">
                <label>TELEFONO</label>
                <input type="text" name="txtTel" class="form-control">
                <label>EMAIL</label>
                <input type="text" name="txtEmail" class="form-control">
                <label>FECHA DE ALTA</label>
                <input type="text" name="txtFecha" class="form-control">
                <br><!-- comment -->
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg">
                <a href="clientes.jsp" class="btn btn-info btn-lg">Regresar</a>
                
                
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
<%
          Connection con;
          String url="jdbc:mysql://localhost:3306/raviga?zeroDateTimeBehavior=CONVERT_TO_NULL";
          String Driver="com.mysql.jdbc.Driver";
          String user="root";
          String clave="12345";
          Class.forName(Driver);
          con=DriverManager.getConnection(url,user,clave);
          PreparedStatement ps;
          //ps=con.prepareStatement("call SP_ALTAEMPLEADO(?,?,?,?,?,?,?,?)");
          String cuit;
          String razsoc;          
          String dir;
          String tel;
          String email;
          String fecha;
          cuit = request.getParameter("txtCuit");
          razsoc = request.getParameter("txtRazSoc");          
          dir = request.getParameter("txtDir");
          tel = request.getParameter("txtTel");         
          dir = request.getParameter("txtDir");
          email = request.getParameter("txtEmail");
          fecha = request.getParameter("txtFecha");
          //int res =ps.executeUpdate();
          if(cuit != null && razsoc != null && dir != null && tel != null && email != null && fecha != null  ){
            //ps=con.prepareStatement("CALL SP_ALTAEMPLEADO('"+cuil+"','"+dni+"','"+nom+"','"+ape+"','"+dir+"','"+tel+"','"+email+"','"+fecha+"')");
            ps=con.prepareStatement("INSERT INTOcliente (CUIT,RAZ_SOC,DIR_CLI,TEL_CLI_EMAIL_CLI,FECHA_ALTA_CLI)VALUES('"+cuit+"','"+razsoc+"','"+dir+"','"+tel+"','"+email+"','"+fecha+"')");
            ps.executeUpdate();//Error
            response.sendRedirect("clientes.jsp");
          
    }
%>
