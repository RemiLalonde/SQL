package main;

public class User {

    String cip;
    String nom;
    String prenom;
    String couriel;

    public String getCip(){
        return cip;
    }
    public void setCip(String cip){
        this.cip = cip;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setCouriel(String couriel) {
        this.couriel = couriel;
    }

    public String getCouriel() {
        return couriel;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }
}
