package GU.data;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {
    private static ConnectionPool pool = null;
    private static DataSource dataSource = null;
    
    private ConnectionPool() throws NamingException{
        
            InitialContext ic = new InitialContext();
            dataSource= (DataSource)ic.lookup("java:/comp/env/jdbc/heroku_6128d8fa3e5152e");
    }
    
    public static synchronized ConnectionPool getInstance() throws NamingException{
        if(pool==null){
            pool=new ConnectionPool();
        }
        return pool;
    }
    
    public Connection getConnection()
    {
        try {
            return dataSource.getConnection();
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }
    
    public void freeConnection(Connection c)
    {
        try {
            c.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
