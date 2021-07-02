package main;
import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.sql.*;
import java.util.ArrayList;


public class Notification {
    String date = null, description, lien, id;
    int expediteurId;
    private RSSReader rss = new RSSReader();
    public final String url = "jdbc:postgresql://zeus.gel.usherbrooke.ca:5432/s3iprojet02";
    public final String user = "s3iprojet02";
    public final String password = "s3iprojet";
    HttpServletRequest httpServletRequest;
    Principal principal = httpServletRequest.getUserPrincipal();

    public Notification(){
    }

    private final String INSERT_NOTIFICATION_SQL = "INSERT INTO notification VALUES(?, ?, ?, ?, ?)";
    private final String SELECT_20_NOTIFICATION = "SELECT * FROM notification WHERE cip = getCurrentCIP()";

    //fonction pour inserer une notification dans la BD
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
            st.setInt(4, expediteur);
            st.setString(5, lien);
            st.setString(6, getCurrentUserCip());

            System.out.println(st);
            st.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    /**
     * Fonction qui retourne le cip de l'utilisateur (à tester)
      * @return le cip de l'utilisateur
     */
    public String getCurrentUserCip(){
        Principal principal = httpServletRequest.getUserPrincipal();
        User userCip = new User();
        userCip.setCip(principal.getName());
        return userCip.getCip();
    }

    /**
     * Fonction pour get les 20 premières notifications
     * @return un array avec les 20 première notifications
     */
    public ArrayList<Notification> getNotification(){
        int i = 0;
        ArrayList<Notification> notificationArray = new ArrayList<>();
        try{
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM notification ORDER BY horodatage DESC");
            while (rs.next() && i < 20)
            {
                Notification notif = new Notification();
                notif.setDate(rs.getString(2));
                notif.setDescription(rs.getString(3));
                notif.setExpediteurId(rs.getInt(4));
                notif.setLien(rs.getString(5));

                notificationArray.add(notif);

                i++;
            }
            rs.close();
            st.close();


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return notificationArray;
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
    public void setExpediteurId(int expediteurId){ this.expediteurId = expediteurId;}
}