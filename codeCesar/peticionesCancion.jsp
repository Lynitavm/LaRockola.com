<%@page import="com.google.gson.Gson"%>
<%@page import="Logica.Cancion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String respuesta = "{";
    String proceso = request.getParameter("proceso");
    Cancion c = new Cancion();
    switch(proceso){
        case "guardarCancion":
            System.out.println("Guardar Cancion");
            c.setNombre(request.getParameter("nombre"));
            c.setArtista(request.getParameter("artista"));
            c.setGenero(request.getParameter("genero"));
            c.setLink(request.getParameter("link"));
            if(c.guardarCancion()){
                respuesta += "\"" + proceso + "\":true";
            }else{
                respuesta += "\"" + proceso + "\":false";
            }
            break;
        case "actualizarCancion":
            System.out.println("Actualizar Cancion");
            c.setIdCancion(Integer.parseInt(request.getParameter("idCancion")));
            c.setNombre(request.getParameter("nombre"));
            c.setArtista(request.getParameter("artista"));
            c.setGenero(request.getParameter("genero"));
            c.setLink(request.getParameter("link"));
            if(c.actualizarCancion()){
                respuesta += "\"" + proceso + "\":true";
            }else{
                respuesta += "\"" + proceso + "\":false";
            }
            break;
        case "eliminarCancion":
            System.out.println("Eliminar Cancion");
            int idCancion = Integer.parseInt(request.getParameter("idCancion"));
            if(c.eliminarCancion(idCancion)){
                respuesta += "\"" + proceso + "\":true";
            }else{
                respuesta += "\"" + proceso + "\":false";
            }
            break;
        case "listaCanciones":
            System.out.println("Lista Canciones"); 
            List<Cancion> listaCanciones = c.listarCanciones();
            if(listaCanciones.isEmpty()){
                respuesta += "\"" + proceso + "\": false,\"Cancion\":[]";
            }else{
                respuesta += "\"" + proceso + "\": true,\"Cancion\":" + new Gson().toJson(listaCanciones);
            }
            break;
        default:
            respuesta += "\"ok\": false,";
            respuesta += "\"error\": \"INVALID\",";
            respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado"
                    + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>