/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.concurrent.ThreadLocalRandom;
import javax.swing.JOptionPane;

/**
 *
 * @author mario
 */
public class Modelo {
    
    public String connectionUrl;
    static Connection contacto = null;
    
    //especificaciones de la base de datos
    public Modelo(){
        this.connectionUrl = "jdbc:sqlserver://172.17.0.2:1433;databaseName=BaseTaxis";
    }
    
    public static Connection getConexion(){
        String url = "jdbc:sqlserver://172.17.0.2:1433;databaseName=BaseTaxis";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");    
        }catch (ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, "No se pudo establece la conexion... revisar Driver" + e.getMessage(),
            "Error de Conexion",JOptionPane.ERROR_MESSAGE);
        }
        try{
            contacto = DriverManager.getConnection(url,"sa", "<c0ntrasena>");
        }catch (SQLException e){
             JOptionPane.showMessageDialog(null, "Error" + e.getMessage(),
            "Error de Conexion",JOptionPane.ERROR_MESSAGE);
        }
        return contacto;
    }
    
    public void EstradaPersona(String a, String b, String c)throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaPersona(?,?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.setString(3, c);
        entrada.execute();
    }
    
    public void EntradaName(String a, String b, String c) throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaName(?,?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.setString(3, c);
        entrada.execute();    
    }
    
    public void EntradaCliente(String a, String b, String c, String d, String e) throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaCliente(?,?,?,?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.setString(3, c);
        entrada.setString(4, d);
        entrada.setString(5, e);
        entrada.execute();
    }
    
    public void EntradaAsociado(String a, String b, String c) throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaAsociado(?,?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.setString(3, c);
        entrada.execute();
    }
    
    public void EntradaDueno(String a) throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaDueno(?)}");
        entrada.setString(1, a);
        entrada.execute();
    }
    
    public void EntradaViaje(String a, String b, String c, String d, String e, String f, String g,String h) throws SQLException{
        CallableStatement entrada = this.getConexion().prepareCall("{call EntradaViaje(?,?,?,?,?,?,?,?)}");
        entrada.setString(1, a);
        entrada.setString(2, b);
        entrada.setString(3, c);
        entrada.setString(4, d);
        entrada.setString(5, e);
        entrada.setString(6, f);
        entrada.setString(7, g);
        entrada.setString(8, g);
        entrada.execute();
    }
    
    public String getTiempo(){
        Date now = new Date();
        long timeRangeMs = 1000 * 60 * 60 * 3;
        long random = ThreadLocalRandom.current().nextLong(timeRangeMs);
        Date randDate = new Date(now.getTime() - random);
        SimpleDateFormat sdfDate = new SimpleDateFormat("mm:ss");//dd/MM/yyyy
        String strDate = sdfDate.format(randDate);
        return strDate;
    }
    
    //metodo que hace una consulta
    public static ResultSet Consulta(String consulta){
    Connection con = getConexion();
    Statement declara;
    try{
        declara=con.createStatement();
        ResultSet respuesta = declara.executeQuery(consulta);
        return respuesta;
    }catch (SQLException e){
        JOptionPane.showMessageDialog(null, "Error" + e.getMessage(),
        "Error de Conexion",JOptionPane.ERROR_MESSAGE);
    }
    return null;
    }
    

    

    
}
