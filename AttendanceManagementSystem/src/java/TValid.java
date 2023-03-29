import java.sql.*;
public class TValid {
    public static boolean check(String uname ,String pass)
    {
        boolean result =false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
            PreparedStatement ps = con.prepareStatement("select * from teacher where tid=? and tpass=?");
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs =ps.executeQuery();
            result = rs.next();
        }
        catch(Exception e) 
        {
            System.out.println(e);
        }
        return result;
    }
    
    public static boolean check1(String uname )
    {
        boolean result =false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
            PreparedStatement ps = con.prepareStatement("select * from teacher where tid=?");
            ps.setString(1, uname);
            ResultSet rs =ps.executeQuery();
            result = rs.next();
        }
        catch(Exception e) 
        {
            System.out.println(e);
        }
        return result;
    }
    public static void changePass(String uname,String pass)
    {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ASP","root","201Fa@4413");
            PreparedStatement ps = con.prepareStatement("Update teacher set tpass=? where tid=?");
            ps.setString(1, pass);
            ps.setString(2, uname);
            ps.executeUpdate();
        }
        catch(Exception e) 
        {
            System.out.println(e);
        }
        
    }
    
}
