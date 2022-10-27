/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

public class DBUtil {
    
    Connection connection=null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public DBUtil()
    {
         try{
            connection= ConnectionPool.getInstance().getConnection();
         }catch(NamingException ex)
         {
             System.err.println(ex);
         }
    }
    
    public ResultSet QueryData(String query)
    {
        try {
            ps=connection.prepareStatement(query);
            rs= ps.executeQuery();
            return rs;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public int RowCount(String query)
    {
        try {
            ps=connection.prepareStatement(query);
            int rd= ps.executeUpdate();
            return rd;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        }
    }
    
    public void Close()
    {
        try {
            if(ps!=null)
                ps.close();
            if(rs!=null)
                rs.close();
            if(connection!=null)
            {
                connection.close();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
