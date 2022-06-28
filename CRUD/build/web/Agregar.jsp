<!--@page import="javaz.swing.TrayIcon.MessageType" -->
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
            <h1>Nuevo empleado</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                <label>DNI</label>
                <input type="text" name="txtDni" class="form-control">
                <label>CUIL</label>
                <input type="text" name="txtCuil" class="form-control">
                <label>NOMBRE</label>
                <input type="text" name="txtNom" class="form-control">
                <label>APELLIDO</label>
                <input type="text" name="txtApe" class="form-control">
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
                <a href="index.jsp" class="btn btn-info btn-lg">Regresar</a>
                
                
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
          String cuil;
          String dni;
          String nom;
          String ape;
          String dir;
          String tel;
          String email;
          String fecha;
          cuil = request.getParameter("txtCuil");
          dni = request.getParameter("txtDni");
          nom = request.getParameter("txtNom");
          ape = request.getParameter("txtApe");
          dir = request.getParameter("txtDir");
          tel = request.getParameter("txtTel");
          email = request.getParameter("txtEmail");
          fecha = request.getParameter("txtFecha");
          //int res =ps.executeUpdate();
          if(cuil != null && dni != null && nom != null && ape != null && dir != null && tel != null && email != null && fecha != null  ){
            //ps=con.prepareStatement("CALL SP_ALTAEMPLEADO('"+cuil+"','"+dni+"','"+nom+"','"+ape+"','"+dir+"','"+tel+"','"+email+"','"+fecha+"')");
            ps=con.prepareStatement("INSERT INTO empleado(CUIL,DNI_EMP,NOM_EMP,APE_EMP,DIR_EMP,TEL_EMP_EMAIL_EMP,FECHA_ALTA_EMP)VALUES('"+cuil+"','"+dni+"','"+nom+"','"+ape+"','"+dir+"','"+tel+"','"+email+"','"+fecha+"')");
            ps.executeUpdate();//Error
            response.sendRedirect("index.jsp");
          
    }
%>
