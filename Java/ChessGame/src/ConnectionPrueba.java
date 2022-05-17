
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Hegoi
 */
public class ConnectionPrueba {

    public static void main(String[] args) {
        String DB_URL = "jdbc:sqlserver://localhost\\HGARATE;databaseName=game;encrypt=false;";
        String USER = "sa";
        String PASS = "root";
        String var = "garate";
        String var2 = "sddff";
        String var3 = "uwu";
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                Statement stmt = conn.createStatement();) {
            //String sql = "INSERT INTO game (time, player1, player2, winner)VALUES (" + 6000 + ",'" + var + "','" + var2 + "','" + var3 + "');";
            //insertar la sentencia bien
            //stmt.execute(sql);
            System.out.println("Connected");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionPrueba.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
