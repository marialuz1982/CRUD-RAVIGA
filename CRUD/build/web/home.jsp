<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Raviga</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-info " >
            <div class="container-fluid ">
                <a  style="margin-left: 10px; border: none" class="btn btn-outline-light active" href="home.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="clientes.jsp" >Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a style="margin-left: 10px; border: none" class="btn btn-outline-light" href="index.jsp" >Empleados</a>
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
        <div class="container">
            <div class="row row-cols-1 row-cols-md-3 g-4 mt-4">
            <div class="col ">
                <div class="card">
                    <a href="clientes.jsp"><img src="img/clientes.png" class="card-img-top" alt="..." ></a>
                    <div class="card-body">
                        <h5 class="card-title">Clientes</h5>
                        
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <a href="index.jsp"><img src="img/empleado.png" class="card-img-top" alt="..." ></a>
                    <div class="card-body">
                        <h5 class="card-title">Empleados</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <a href="#"><img src="img/contrato.png" class="card-img-top" alt="..." ></a>
                    <div class="card-body">
                        <h5 class="card-title">Contratos</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <a href="#"><img src="img/facturacion.png" class="card-img-top" alt="..." ></a>
                    <div class="card-body">
                        <h5 class="card-title">Facturacion</h5>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <a href="#"><img src="img/informe.png" class="card-img-top" alt="..." ></a>
                    <div class="card-body">
                        <h5 class="card-title">Reportes</h5>
                    </div>
                </div>
            </div>
        </div>
        </div>
           


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
