package main;

import java.io.*;
import java.net.*;
import java.sql.SQLException;


public class RSSReader {
    public static void main(String[] args) {
        RSSReader rss = new RSSReader();

        rss.readRSS_SiteDeSession();
    }
    public void readRSS_SiteDeSession() {
        try {
            Notification notif = new Notification();
            String date = null;
            String description = null;
            String url = null;
            String id = null;
            URL rssUrl = new URL("https://www.gel.usherbrooke.ca/nouvelles/s3ie21.xml");
            BufferedReader in = new BufferedReader(new InputStreamReader(rssUrl.openStream()));
            String line;
            while ((line = in.readLine()) != null) {
                if ((line.contains("<title>"))) {
                    int firstPos = line.indexOf("<title>");
                    String temp = line.substring(firstPos);

                    temp = temp.replace("</title>", "");
                    temp = temp.replace("<title>", "");
                    String[] parts = temp.split(",");
                    date = parts[0];
                    description = parts[1];
                    System.out.println("date: " + date);
                    System.out.println("description: " + description);
                    notif.setDate(date);
                    notif.setDescription(description);

                }
                if ((line.contains("<link>"))) {
                    int firstPos = line.indexOf("<link>");
                    String temp2 = line.substring(firstPos);

                    temp2 = temp2.replace("<link>", "");
                    temp2 = temp2.replace("</link>", "");

                    url = temp2;
                    System.out.println("url: " + url);
                    notif.setLien(url);

                }
                if (line.contains("<guid isPermaLink=\"false\">")) {
                    int firstPos = line.indexOf("<guid isPermaLink=\"false\">");
                    String temp3 = line.substring(firstPos);

                    temp3 = temp3.replace("<guid isPermaLink=\"false\">", "");
                    temp3 = temp3.replace("</guid>", "");

                    id = temp3;
                    System.out.println("id: " + id);
                    notif.setId(id);

                }

                if(date != null && description != null && url != null && id != null){
                    notif.insert(notif.getId(), notif.getDate(), notif.getDescription(), 3, notif.getLien());
                    date = null;
                    description = null;
                    url = null;
                    id = null;
                }
            }

            in.close();

        } catch (MalformedURLException err) {
            System.out.println("Mauvais URL");
        } catch (IOException err) {
            System.out.println("Something went wrong reading the contents");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}

