package Logica;
import Persistencia.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Valerie
 */
public class Cancion {
    private int idCancion;
    private String nombre;
    private String genero;
    private String artista;
    private String link;

    public Cancion() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdCancion() {
        return idCancion;
    }

    public void setIdCancion(int idCancion) {
        this.idCancion = idCancion;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getArtista() {
        return artista;
    }

    public void setArtista(String artista) {
        this.artista = artista;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    public boolean guardarCancion(){
        Conexion conectar = new Conexion();
        String sentencia = "INSERT INTO cancion(nombre, artista, genero, link)"
                + "VALUES ( '"+ this.nombre + "','" + this.artista + "','" +  this.genero + "','" + this.link + "'); ";
        if(conectar.setAutoCommit(false)){
            if(conectar.insertar(sentencia)){
                conectar.commit();
                conectar.closeConnection();
                return true;
            }else{
                conectar.rollback();
                conectar.closeConnection();
                return false;
            }
        }else {
            conectar.closeConnection();
            return false;
        }
    }
    
    public boolean eliminarCancion(int idCancion){
        Conexion conectar = new Conexion();
        String sentencia = "DELETE FROM cancion WHERE idCancion = '"+ idCancion +"'";
        if(conectar.setAutoCommit(false)){
            if(conectar.borrar(sentencia)){
                conectar.commit();
                conectar.closeConnection();
                return true;
            }else {
                conectar.rollback();
                conectar.closeConnection();
                return false;
            }
        }else {
            conectar.closeConnection();
            return false;
        }
    }
    
    public boolean actualizarCancion(){
       Conexion conectar = new Conexion();
        String sentencia = "UPDATE cancion SET nombre='" + this.nombre + "',genero='" + this.genero + "',artista='" + this.artista
                + "',link='" + this.link + "' WHERE idCancion="+ idCancion +";";
        if(conectar.setAutoCommit(false)){
            if(conectar.actualizar(sentencia)){
                conectar.commit();
                conectar.closeConnection();
                return true;
            }else {
                conectar.rollback();
                conectar.closeConnection();
                return false;
            }
        }else {
            conectar.closeConnection();
            return false;
        } 
    }
    
    public List<Cancion> listarCanciones() throws SQLException{
        Conexion conectar = new Conexion();
        String sentencia = "SELECT * FROM cancion ORDER BY idCancion ASC";
        List<Cancion> listaCanciones = new ArrayList<>();
        ResultSet rs = conectar.consultar(sentencia);
        while(rs.next()){
            Cancion c = new Cancion();
            c.setIdCancion(rs.getInt("idCancion"));
            c.setNombre(rs.getString("nombre"));
            c.setArtista(rs.getString("artista"));
            c.setGenero(rs.getString("genero"));
            c.setLink(rs.getString("link"));
            listaCanciones.add(c);
        }
        conectar.closeConnection();
        return listaCanciones;
    }
    
    public Cancion obtenerCancion(int idCancion) throws SQLException{
        Conexion conectar = new Conexion();
        String sentencia = "SELECT * FROM cancion WHERE idCancion='" + idCancion +"'";
        ResultSet rs = conectar.consultar(sentencia);
        if(rs.next()){
            Cancion c = new Cancion();
            c.setIdCancion(rs.getInt("idCancion"));
            c.setNombre(rs.getString("nombre"));
            c.setGenero(rs.getString("genero"));
            c.setArtista(rs.getString("artista"));
            c.setLink(rs.getString("link"));
            conectar.closeConnection();
            return c;
        }else{
            conectar.closeConnection();
            return null;
        }
    }
}