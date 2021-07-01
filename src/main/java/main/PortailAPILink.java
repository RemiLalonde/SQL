package main;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.IOException;
import java.sql.SQLException;

public class PortailAPILink {

    public String expediteur = "Horarius";
    public String date = "2020-11-08";
    public String description = "wtf flo";
    public String titre = "trop de monde chez nous";

    public void getEmails(String json) throws IOException, SQLException {
        for(JsonElement e : JsonParser.parseString(json).getAsJsonArray()){
            Notification notif = new Notification();
            notif.insert(e.getAsJsonObject().get("id").toString(), e.getAsJsonObject().get("receivedDateTime").toString(),
                    e.getAsJsonObject().get("subject").toString(), 2, e.getAsJsonObject().get("webLink").toString());
        }
    }

    public String getExpediteur(){
        return this.expediteur;
    }

    public String getDate(){
        return this.date;
    }

    public String getDescription(){
        return this.description;
    }

    public String getTitre(){
        return this.titre;
    }
}
