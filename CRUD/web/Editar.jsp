
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
          ps=con.prepareStatement("SELECT * FROM empleado WHERE ID_EMP="+id);
          rs=ps.executeQuery();
          while(rs.next()){
         %>
         <div class="container ">
             <h1>Modificar registro</h1>
             <hr><!-- comment -->
             <form action="" metod="post" class="form-control" style="width: 400px">
                <label>ID</label>
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("ID_EMP")%>">
                <label>CUIL</label>
                <input type="text" name="txtDni" class="form-control" value="<%= rs.getString("CUIL")%>">
                <label>DNI</label>
                <input type="text" name="txtCuil" class="form-control" value="<%= rs.getString("DNI_EMP")%>">
                <label>NOMBRE</label>
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("NOM_EMP")%>">
                <label>APELLIDO</label>
                <input type="text" name="txtApe" class="form-control" value="<%= rs.getString("APE_EMP")%>">
                <label>DIRECCION</label>
                <input type="text" name="txtDir" class="form-control" value="<%= rs.getString("DIR_EMP")%>">
                <label>TELEFONO</label>
                <input type="text" name="txtTel" class="form-control" value="<%= rs.getString("TEL_EMP")%>">
                <label>EMAIL</label>
                <input type="text" name="txtEmail" class="form-control" value="<%= rs.getString("EMAIL_EMP")%>">
                <label>FECHA DE ALTA</label>
                <input type="text" name="txtFecha" class="form-control" value="<%= rs.getString("FECHA_ALTA_EMP")%>">
                <br><!-- comment -->
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg">
                <a href="index.jsp" class="btn btn-info btn-lg">Regresar</a>
                 
             </form>
             <% }%>
         </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  </body>
</html>
<% 
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
            ps=con.prepareStatement("UPDATE empleado SET CUIL='"+cuil+"',DNI_EMP='"+dni+"',NOM_EMP='"+nom+"',APE_EMP='"+ape+"',DIR_EMP='"+dir+"',TEL_EMP='"+tel+"',EMAIL_EMP='"+email+"',FECHA_ALTA_EMP='"+fecha+"' WHERE ID_EMP='"+id);
            ps.executeUpdate();//Error
            response.sendRedirect("index.jsp");
          
    }
%>