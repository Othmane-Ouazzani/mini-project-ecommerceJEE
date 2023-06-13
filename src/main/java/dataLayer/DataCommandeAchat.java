package dataLayer;

import models.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DataCommandeAchat {
    Connexion connexion=new Connexion();
    public ArrayList<Commande> getCommandesNonLivree() {
        ArrayList<Commande> listeCommandeNonLivre = new ArrayList<>();
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT *  FROM  commande WHERE livree = 0");
            connexion.Deconnexion();
            while(rs.next()) {
                listeCommandeNonLivre.add(new Commande(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), Integer.parseInt(rs.getString(4)), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException e){e.printStackTrace();}
        return listeCommandeNonLivre;
    }

    public int AddCommande(Commande c, ArrayList<Achat> listeAchat, Card card) {
        int isAdded = 0;
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            String query = "INSERT INTO commande(client, date, adresse, codePostal, ville) VALUES('"+c.getClient()+"', '"+c.getDate()+"', '"+c.getAdresse()+"', '"+c.getCodePostal()+"', '"+c.getVille()+"')";
            isAdded = st.executeUpdate(query);
            ResultSet lastInsertedId = st.executeQuery("SELECT LAST_INSERT_ID()");
            st.executeUpdate("INSERT INTO card VALUES('"+card.getCardHolder()+"', '"+card.getExpireDate()+"', '"+card.getCardNumber()+"', '"+card.getClient()+"')");
            lastInsertedId.next();
            for (int i = 0; i<listeAchat.size(); i++) {
                String queryAchat = "INSERT INTO achat VALUES ('"+listeAchat.get(i).getProduit()+"', "+lastInsertedId.getString(1)+", "+listeAchat.get(i).getQte()+")";
                st.executeUpdate(queryAchat);
            }
            connexion.Deconnexion();
        } catch (SQLException e){e.printStackTrace();}
        return isAdded;
    }

    public ArrayList<Achat> getAchats() {
        ArrayList<Achat> listeAchat=new ArrayList<Achat>();
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT *  FROM  achat ;");
            connexion.Deconnexion();
            while(rs.next()){
                listeAchat.add(new Achat(rs.getString(1), Integer.parseInt(rs.getString(2)), Integer.parseInt(rs.getString(3))));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return listeAchat;
    }

//    public ArrayList<Commande> getCommandeByClient(String client) {
//        ArrayList<Commande> commandes=new ArrayList<Commande>();
//        try{
//            connexion.Connect();
//            Statement st=connexion.getCnx().createStatement();
//            ResultSet rs=st.executeQuery("SELECT *  FROM  commande WHERE client =  '"+client+"';");
//            connexion.Deconnexion();
//            while(rs.next()){
//                commandes.add(new Commande(Integer.parseInt(rs.getString(1)), rs.getString(2), rs.getString(3), Integer.parseInt(rs.getString(4)), rs.getString(5), rs.getString(6), rs.getString(7)));
//            }
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//
//        return commandes;
//    }

    public int livrerCommande(int commandeId) {
        int isUpdated=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isUpdated=st.executeUpdate("UPDATE commande SET livree = 1 WHERE num = "+commandeId);
        }catch(SQLException e){e.printStackTrace();}

        return  isUpdated;
    }


    public Card getCardInfos() {
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT *  FROM  card ;");
            connexion.Deconnexion();
            while(rs.next()){
                Card c = new Card(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return c;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

}
