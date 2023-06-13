package models;

public class Commande {

    int num;
    String client;
    String date;
    int livree;
    String ville;
    String codePostal;
    String adresse;

    public Commande(int num, String client, String date, int livree, String ville, String codePostal, String adresse) {
        this.num = num;
        this.client = client;
        this.date = date;
        this.livree = livree;
        this.codePostal = codePostal;
        this.ville = ville;
        this.adresse = adresse;
    }

    public int getNum() {
        return num;
    }

    public String getVille() {
        return ville;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getLivree() { return livree; }

    public void setLivree(int livree) { this.livree = livree; }
}
