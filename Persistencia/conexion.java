package Persistencia;
import java.sql.*;

/**
 *
 * @author Valerie
 */
public class Conexion {
    
    private String DB_driver = "";
    private String url = "";
    private String db = "";
    private String host = "";
    private String username = "";
    private String password = "";
    private ResultSet resultset = null;
    public Connection conexion = null;
    private Statement stmt = null;

    public Conexion() {
        DB_driver = "com.mysql.jdbc.Driver";
        host = "localhost:3306";
        db = "larockola";
        url = "jdbc:mysql://" + host + "/" + db;
        username = "root";
        password = "V5j29s1e29s14";
        
        try{
            Class.forName(DB_driver);
        }catch(ClassNotFoundException ex){
            System.out.println("Error asignación driver");
        }
        
        try{
            conexion = DriverManager.getConnection(url, username, password);
            System.out.println("Conexión exitosa");
        }catch(SQLException ex){
            System.out.println("Error en crear conexión");
        }
    }
    
    public Connection getConnection(){
        return conexion;
    }
    
    public void closeConnection(){
        if(conexion != null){
            try{
                conexion.close();
            }catch(SQLException ex){
                System.out.println("Error al cerrar conexión");
            }
        }
    }
    
    public ResultSet consultar(String sentencia){
        try{
            stmt = conexion.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = stmt.executeQuery(sentencia);
        }catch(SQLException ex){
                System.out.println("Error al consultar a la base de datos");
        }
        return resultset;
    }
    
    public boolean insertar(String sentencia){
        try{
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al insertar BD");            
            return false;
        }
    }
    
    public boolean borrar(String sentencia){
        try{
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al borrar BD");            
            return false;
        }
    }
    
    public boolean actualizar(String sentencia){
        try{
            stmt = conexion.createStatement();
            stmt.execute(sentencia);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al actualizar BD");            
            return false;
        }
    }
    
    public boolean setAutoCommit(boolean commit){
        try{
            conexion.setAutoCommit(commit);
            return true;
        }catch(SQLException ex){
            System.out.println("Error al setAutoCommit BD");            
            return false;
        }
    }
    
    public boolean commit(){
        try{
            conexion.commit();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al hacer commit BD");            
            return false;
        }
    }
    
    public boolean rollback(){
        try{
            conexion.rollback();
            return true;
        }catch(SQLException ex){
            System.out.println("Error al hacer Rollback BD");            
            return false;
        }
    }
}