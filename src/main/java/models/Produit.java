package models;

public class Produit {

    String id;
    String nom;
    String description;
    int qte;
    float prix;
    String categorie;
    String image;

    public Produit(String id, String nom, String description, int qte, float prix, String categorie,String image) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.qte = qte;
        this.prix = prix;
        this.image = image;
        this.categorie=categorie;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    public float getPrix() {
        return prix;
    }

    public void setPrix(float prix) {
        this.prix = prix;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    public  void setCategorie(String categorie){
        this.categorie=categorie;
    }
    public String getCategorie(){return this.categorie;}
}
