package models;

public class Client {

    private String login;
    private String nom;
    private String prenom;
    private  String password;
    private String tel;


    public Client(String login,String password,String nom, String prenom,String tel) {
        this.login = login;
        this.nom = nom;
        this.prenom = prenom;
        this.password = password;
        this.tel = tel;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
