<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LaRockola</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
        <script src = "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
    </head>
    <body>
        <div ng-app="LaRockola" ng-controller="ctrlCanciones">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="mostrarLista()">Crear</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listaCanciones()">Lista</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listaEliminarCanciones()">Eliminar</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container-fluid" ng-show="!mostrarFormulario">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center" ng-show="!actualizar"><h1>Crear</h1></div>
                    <div class="col-6" style="text-align: center" ng-show="mostrar"><h1>Actualizar Canción</h1></div>
                    <div class="col-6" style="text-align: center" ng-show="ocultar"><h1>Eliminar Canción</h1></div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label" ng-show="actualizar">Id Cancion</label>
                            <input type="text" class="form-control"  ng-show="actualizar" ng-model="idCanciones" ng-disabled="actualizar">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Nombre</label>
                            <input type="text" class="form-control"  placeholder="Escriba el título de la canción" ng-model="nombre">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Artista</label>
                            <input type="text" class="form-control"  placeholder="Escriba el artista" ng-model="artista">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Genero</label>
                            <input type="text" class="form-control"  placeholder="Escriba el género musical" ng-model="genero">
                        </div>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label">Link</label>
                            <input type="text" class="form-control"  placeholder="Adjunte el link del video" ng-model="link">
                        </div>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-md-auto mx-auto">
                        <button type="button" class="btn btn-outline-primary" ng-click="guardarCancion()" ng-show="!actualizar">Guardar</button>
                        <button type="button" class="btn btn-outline-secondary" ng-click="actualizarCancion()" ng-show="mostrar">Actualizar</button>
                        <button type="button" class="btn btn-outline-danger" ng-click="eliminarCancion()" ng-show="ocultar">Eliminar</button>
                    </div>
                </div>
            </div>
            <div class="container-fluid" ng-show="mostrarListaMusica">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"><h1>Lista Canciones</h1></div>
                </div>
                <table class="table table-striped">
                    <thead class="table-primary">
                        <tr>
                            <th scope="col">Id Canción</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Artista</th>
                            <th scope="col">Género</th>
                            <th scope="col">Link</th>
                            <th scope="col">Actualizar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="musica in cancion">
                            <td scope="row">{{musica.idCancion}}</td>
                            <td>{{musica.nombre}}</td>
                            <td>{{musica.artista}}</td>
                            <td>{{musica.genero}}</td>
                            <td>{{musica.link}}</td>
                            <td style="cursor: pointer" ng-click="mostrarListaActualizar(musica)">Actualizar</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="container-fluid" ng-show="mostrarListaEliminar">
                <div class="row d-flex justify-content-center">
                    <div class="col-6" style="text-align: center"></div>
                </div>
                <table class="table table-striped">
                    <thead class="table-warning">
                        <tr>
                            <th scope="col">Id Canción</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Artista</th>
                            <th scope="col">Género</th>
                            <th scope="col">Link</th>
                            <th scope="col">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="musica in cancion">
                            <td scope="row">{{musica.idCancion}}</td>
                            <td>{{musica.nombre}}</td>
                            <td>{{musica.artista}}</td>
                            <td>{{musica.genero}}</td>
                            <td>{{musica.link}}</td>
                            <td style="cursor: pointer" ng-click="mostrarEliminar(musica)">Eliminar</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<script src="ctrl.js"></script>
</html>