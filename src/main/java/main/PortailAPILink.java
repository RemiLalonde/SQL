package main;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.IOException;
import java.sql.SQLException;

public class PortailAPILink {

    public void getEmails(String json) throws IOException, SQLException {
        for(JsonElement e : JsonParser.parseString(json).getAsJsonArray()){
            Notification notif = new Notification();
            notif.insert(e.getAsJsonObject().get("id").toString(), e.getAsJsonObject().get("receivedDateTime").toString(),
                    e.getAsJsonObject().get("subject").toString(), 2, e.getAsJsonObject().get("webLink").toString());
        }
    }
}
