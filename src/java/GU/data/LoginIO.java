package GU.data;

import GU.business.Country;
import GU.business.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginIO {
    public User checkLogin(String username, User login) throws SQLException, 
			ClassNotFoundException {
                User user = null;
                try{   
		String sql = "select * from user where username = '"+login.getUsername()+"' and password = '"+login.getPassword()+"'";
		DBUtil db=new DBUtil();
		ResultSet result =  db.QueryData(sql);
		if (result.next()) {
			user = new User();
			user.setUsername(username);
                        user.setUsertype(result.getString("usertype"));
                        user.setChangepassword(result.getInt("changePassword"));
		}db.Close();

		
	}catch(SQLException ex)
        {
            System.err.println(ex);
            return null;
        }
        return user;
}
    
    public ArrayList<Country> getCountryDB() throws SQLException, 
			ClassNotFoundException {
                ArrayList<Country> country = new ArrayList<Country>();
                try{   
		String sql = "select name from COUNTRY_ISO";
		DBUtil db=new DBUtil();
		ResultSet result =  db.QueryData(sql);
		while (result.next()) {
			Country  c = new Country();
			c.setName(result.getString("name"));
                        country.add(c);
		}db.Close();

		
	}catch(SQLException ex)
        {
            System.err.println(ex);
            return null;
        }
        return country;
    }
    
    public void modifyPasswordDB(String studentID, String password){
        String query="update user set password = '" + password + "', changePassword = 0 where username = '" + studentID + "'";
        DBUtil db=new DBUtil();
        int rowsUpdated= db.RowCount(query);
        db.Close();
        if (rowsUpdated!=0){
            System.out.println("update sucessful");
        }
        else System.out.println("update unsucessful");
    }
}
    
