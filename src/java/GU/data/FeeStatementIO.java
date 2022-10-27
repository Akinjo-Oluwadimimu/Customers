/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package GU.data;

import GU.business.FeeStatement;
import static java.lang.Double.parseDouble;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FeeStatementIO {
    public static FeeStatement getFeeStatementDB(String studentID)
     {
        FeeStatement feeStatement = new FeeStatement();
        try{
            
            String query="select * FROM fee where ID='"+studentID+"'";
            
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            while(prots.next())
            {
                feeStatement.setId(studentID);
                feeStatement.setAccountBalance(parseDouble(prots.getString("account_balance")));
                feeStatement.setDebt(parseDouble(prots.getString("debt")));
                feeStatement.setDescription(prots.getString("description"));
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }
        return feeStatement;
     }
    public static ArrayList<FeeStatement> getDebtDB()
     {
        ArrayList<FeeStatement> feeStatement = new ArrayList();
        try{
            
            String query="select * FROM fee where description='Deficit'";
            DBUtil db=new DBUtil();
            ResultSet prots= db.QueryData(query);
            int sn=1;
            while(prots.next())
            {
                FeeStatement f = new FeeStatement();
                f.setSn(sn);
                f.setId(prots.getString("id"));
                f.setAccountBalance(parseDouble(prots.getString("account_balance")));
                f.setDebt(parseDouble(prots.getString("debt")));
                feeStatement.add(f);
                sn++;
            }
            db.Close();
        }
        catch(SQLException ex){
            System.err.println(ex);
            return null;
        }
        return feeStatement;
     }
}
