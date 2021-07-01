package main;
import java.sql.*;


public class Notification {
    String date = null, description, lien, id;
    private RSSReader rss = new RSSReader();
    public final String url = "jdbc:postgresql://zeus.gel.usherbrooke.ca:5432/s3iprojet02";
    public final String user = "s3iprojet02";
    public final String password = "s3iprojet";

    public Notification(){

    }

    private final String INSERT_NOTIFICATION_SQL = "INSERT INTO notification VALUES(?, ?, ?, ?, ?)";

    public void insert(String id, String date, String description, int expediteur, String lien) throws SQLException{
        System.out.println(INSERT_NOTIFICATION_SQL);
        date = this.date;
        description = this.description;
        lien = this.lien;

        try {
            Connection conn = DriverManager.getConnection(url, user, password);

            PreparedStatement st = conn.prepareStatement((INSERT_NOTIFICATION_SQL));
            st.setString(1,  id);
            st.setString(2, date);
            st.setString(3, description);
            st.setInt(4, 3);
            st.setString(5, lien);

            System.out.println(st);
            st.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public ResultSet select(String SQLcommand){
        try{
            Connection conn = DriverManager.getConnection(url,user,password);
            PreparedStatement st = conn.prepareStatement(SQLcommand);
            ResultSet result = st.executeQuery();
            return result;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    public void setDate(String date){
        this.date = date;
    }
    public String getDate(){
        return date;
    }

    public void setDescription(String description){
        this.description = description;
    }
    public String getDescription(){
        return description;
    }
    public void setLien(String lien){
        this.lien = lien;
    }
    public String getLien(){
        return lien;
    }
    public void setId(String id){
        this.id = id;
    }
    public String getId(){
        return id;
    }
}