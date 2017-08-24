import java.sql.*;

import static org.junit.Assert.*; 
import org.junit.*;

public class AzureConnectDemo {

   // JDBC driver name and database URL
   // static final String JDBC_DRIVER = "jtds.jdbc.Driver";  
   static final String DB_URL = "jdbc:sqlserver://janiarvas.database.windows.net:1433;database=Pelikanta;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30";
   //  Database credentials
   static final String USER = "jarvas77@hotmail.com";
   static final String PASS = "*****";
   
   public static void main(String[] args) {
   Connection conn = null; 
   Statement stmt = null;
   try{
      //STEP 2: Register JDBC driver
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
      conn = DriverManager.getConnection(DB_URL,USER,PASS);

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      String sql;
      sql = "SELECT AsiakkaanNimi FROM dbo.Asiakkaat order by AsiakkaanNimi asc";
      ResultSet rs = stmt.executeQuery(sql);

      //STEP 5: Extract data from result set
      while(rs.next()){
		System.out.println(rs.getString("AsiakkaanNimi"));
      }
      //STEP 6: Clean-up environment
      rs.close();
      stmt.close();
      conn.close();
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            stmt.close();
      }catch(SQLException se2){
      }// nothing we can do
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//end main
//end FirstExample

   @Test public void test(){ throw new RuntimeException("feilas saatana"); } 
}
