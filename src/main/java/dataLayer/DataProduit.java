package dataLayer;

import models.Client;
import models.Produit;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import static java.lang.Float.parseFloat;
import static java.lang.Integer.parseInt;

public class DataProduit implements businessLayer.interfaceProduit {

    Connexion connexion=new Connexion();
    @Override
    public Produit getProduitById(String id)  {

        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT*  FROM  produit  WHERE  id ='"+id+"';");
            connexion.Deconnexion();
            if(rs.next()){
                return new Produit(rs.getString("id"),rs.getString("nom"),rs.getString("description"),parseInt(rs.getString("qte")),parseFloat(rs.getString("prix")),rs.getString("categorie"),rs.getString("image"));}

        } catch (SQLException e){e.printStackTrace();}

        return null;
    }

    @Override
    public ArrayList<Produit> getAllProduits(){

        ArrayList<Produit> listProduits=new ArrayList<Produit>();
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT *  FROM  produit ;");
            connexion.Deconnexion();
            while(rs.next()){
                listProduits.add(new Produit(rs.getString(1),rs.getString(2),rs.getString(3),parseInt(rs.getString(4)),parseFloat(rs.getString(5)),rs.getString(6),rs.getString(7)));
            }
        }catch (SQLException e){e.printStackTrace();}

        return listProduits;

    }

    @Override
    public ArrayList<Produit> getProduitsByCat(String categorie){

        ArrayList<Produit> listProduits=new ArrayList<Produit>();
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT*  FROM  produit  WHERE  categorie ='"+categorie+"' AND qte != 0;");
            connexion.Deconnexion();
            while(rs.next()){
                listProduits.add(new Produit(rs.getString("id"),rs.getString("nom"),rs.getString("description"),parseInt(rs.getString("qte")),parseFloat(rs.getString("prix")),rs.getString("categorie"),rs.getString("image")));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return listProduits;

    }

    @Override
    public  int insertProduit(Produit produit)  {
        int isAdded = 0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isAdded=st.executeUpdate("INSERT INTO produit VALUES('" + produit.getId() + "','" + produit.getNom() + "','" + produit.getDescription() +  "','" + produit.getQte() +"','" + produit.getPrix() +"','" + produit.getCategorie()  +"','" + produit.getImage() + "')");
        }catch(SQLException e){e.printStackTrace();}
        return isAdded;
    }

    @Override
    public int deleteProduit(String id){
        int isDeleted=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isDeleted=st.executeUpdate("DELETE FROM produit WHERE id ='"+id+"';");

        }catch(SQLException e){e.printStackTrace();}

        return isDeleted;
    }

    @Override
    public int updateProduit(Produit p, String oldId){

        int isUpdated=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            if(p.getImage().equals("images/")) {
                isUpdated=st.executeUpdate("UPDATE produit set nom = '"+p.getNom()+"',description = '"+p.getDescription()+"',qte = '"+p.getQte()+"',prix = '"+p.getPrix()+"',categorie = '"+p.getCategorie()+"'  WHERE id ='"+oldId+"';");
            }else {
                isUpdated=st.executeUpdate("UPDATE produit set nom = '"+p.getNom()+"',description = '"+p.getDescription()+"',qte = '"+p.getQte()+"',prix = '"+p.getPrix()+"',categorie = '"+p.getCategorie()+"',image = '"+p.getImage()+"'  WHERE id ='"+oldId+"';");
            }
        }catch(SQLException e){e.printStackTrace();}

        return  isUpdated;
    }


    public int isProduitExist(String id) {

        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT*  FROM  produit  WHERE  id ='"+id+"';");
            connexion.Deconnexion();
            if(rs.next()) return 1;
        }
        catch (SQLException e){e.printStackTrace();}

        return 0;
    }

    public int decreasQte(String id, int qte) {
        int isUpdated=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isUpdated=st.executeUpdate("UPDATE produit set qte = '"+qte+"'  WHERE id ='"+id+"';");
        }catch(SQLException e){e.printStackTrace();}
        return  isUpdated;
    }

}
