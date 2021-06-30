package main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.stream.Collectors;

public class PortailAPILink {

    public static void main(String[] args) throws IOException {
        getEmails();
    }

    public static String getEmails() throws IOException {
        URL apiURL = new URL("https://monportail.usherbrooke.ca/api/mail/messages");
        BufferedReader in = new BufferedReader(new InputStreamReader(apiURL.openStream()));
        for(String s : (String[])in.lines().toArray()){
            System.out.println(s);
        }
        return in.readLine();
    }
}
