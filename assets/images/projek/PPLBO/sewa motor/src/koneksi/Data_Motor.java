/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package koneksi;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class Data_Motor {
   Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    
    private String sql;
    public String id_motor;
    public String nama_motor;
    public String merek_motor;
    public String no_plat;
    public String harga_rental;
    public String status;
   
    
    public void simpan()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "INSERT INTO data_motor(id_motor,nama_motor,merek_motor,no_plat,harga_rental,status)VALUE(?,?,?,?,?,?)";
        pst = conn.prepareStatement(sql);
        pst.setString(1,id_motor);
        pst.setString(2,nama_motor);
        pst.setString(3,merek_motor);
        pst.setString(4,no_plat);      
        pst.setString(5,harga_rental);
        pst.setString(6,status);
        pst.execute();
        pst.close();
    }
    
    public void edit()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "UPDATE data_motor set nama_motor=?, merek_motor=?, no_plat=?, harga_rental=?, status=? where id_motor=?";
        pst = conn.prepareStatement(sql);
        pst.setString(1,nama_motor);
        pst.setString(2,merek_motor);
        pst.setString(3,no_plat);
        pst.setString(4,harga_rental);
        pst.setString(5,status);
        pst.setString(6,id_motor);
        pst.execute();
        pst.close();
    }
    
    public void hapus() throws SQLException{
        conn=koneksi.getKoneksi();
        String sql="DELETE from data_motor where id_motor=?";
        try{
            pst=conn.prepareStatement(sql);
            pst.setString(1, id_motor);
            pst.execute();
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, e);
        }
    }
    
    public ResultSet UpdatedatamobilT()throws SQLException{
        conn = koneksi.getKoneksi();
        sql = "select id_motor,nama_motor,merek_motor,no_plat,harga_rental,status from data_motor";
        pst = conn.prepareStatement(sql);
        rs = pst.executeQuery();
        return rs;
    } 
}
