var app = angular.module('LaRockola', []);

app.controller('ctrlCanciones', function ($scope, $http) {
    $scope.guardarCancion = function () {
        console.log('Entra a guardarCancion');
        let canciones = {
            proceso: 'guardarCancion',
            nombre: $scope.nombre,
            artista: $scope.artista,
            genero: $scope.genero,
            link: $scope.link
        };
        $http({
            method: 'POST',
            url: 'peticiones.jsp',
            params: canciones
        }).then(function (respuesta) {
            console.log(respuesta);
            if(respuesta.data.guardarCancion){
                alert('Guardado Exitoso');
                $scope.listaCanciones();
            }else{
                alert('Error al guardar');
            }
        });
    };
    
    $scope.listaCanciones = function(){
        $scope.mostrarListaMusica = true;
        $scope.mostrarListaEliminar = false;
        $scope.mostrarFormulario = true;
        let params = {
            proceso: 'listaCanciones'
        };
        $http({
            method: 'GET',
            url: 'peticiones.jsp',
            params: params
        }).then(function(respuesta){
            $scope.cancion = respuesta.data.Canciones;
            console.log("respuesta:::")
            console.log(respuesta);
        });
    };
    
    $scope.listaEliminarCanciones = function(){
        $scope.actualizar = false;
        $scope.mostrarListaEliminar = true;
        $scope.mostrarListaMusica = false;
        $scope.mostrarFormulario = true;
        let params = {
            proceso: 'listaCanciones'
        };
        $http({
            method: 'GET',
            url: 'peticiones.jsp',
            params: params
        }).then(function(respuesta){
            $scope.cancion = respuesta.data.Canciones;
            console.log($scope.cancion);
        });
    };
    
    $scope.eliminarCancion = function (){
        let params = {
            proceso: 'eliminarCancion',
            idCancion: $scope.idCanciones
        };
        $http({
            method: 'GET',
            url: 'peticiones.jsp',
            params: params
        }).then(function (respuesta) {
            if (respuesta.data.eliminarCancion) {
                alert('Canción eliminada');
                console.log(respuesta);
                $scope.listaCanciones();
            } else {
                alert('Error al eliminar canción');
            }
        });
    };
    
    $scope.actualizarCancion = function (){
        let params = {
            proceso: 'actualizarCancion',
            idCancion: $scope.idCanciones,
            nombre: $scope.nombre,
            artista: $scope.artista,
            genero: $scope.genero,
            link: $scope.link
        };
        $http({
            method: 'GET',
            url: 'peticiones.jsp',
            params: params
        }).then(function(respuesta){
            if(respuesta.data.actualizarCancion){
                alert('Actualización exitosa');
                $scope.listaCanciones();
            }else{
                alert('Error al actualizar')
            }
            console.log(respuesta);
        });
    };
    
    $scope.form = function(){
        $scope.mostrarFormulario = false;
    }
    
    $scope.mostrarLista = function(){
        $scope.mostrar = false;
        $scope.actualizar = false;
        $scope.ocultar = false;
        $scope.mostrarListaMusica = false;
        $scope.mostrarFormulario = false;
        $scope.mostrarListaEliminar = false;
    };
    
    
    $scope.mostrarEliminar = function(musica){
        console.log("mostrarEliminar:::")
        console.log(musica)
        
        $scope.mostrarFormulario = false;
        $scope.mostrarListaEliminar = false;
        $scope.mostrar = false;
        $scope.ocultar = true;
        $scope.actualizar = true;
        $scope.idCanciones = musica.idCancion;
        $scope.nombre = musica.nombre;
        $scope.artista = musica.artista;
        $scope.genero = musica.genero;
        $scope.link = musica.link;
    };
    
    $scope.mostrarListaActualizar = function(musica){
        
        console.log("mostrarListaActualizar:::")
        console.log(musica)
        
        $scope.mostrarFormulario = false;
        $scope.mostrarListaMusica = false;
        $scope.mostrar = true;
        $scope.actualizar = true;
        $scope.ocultar = false;
        $scope.idCanciones = musica.idCancion;
        $scope.nombre = musica.nombre;
        $scope.artista = musica.artista;
        $scope.genero = musica.genero;
        $scope.link = musica.link;
    };
});