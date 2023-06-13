package dataLayer;

import models.Client;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DataClient {


     Connexion connexion=new Connexion();
     //Try singleton connexion class

    public Client getClient(String email)  {

        try{
        connexion.Connect();
        Statement st=connexion.getCnx().createStatement();
        ResultSet rs=st.executeQuery("SELECT*  FROM  client  WHERE  login ='"+email+"';");
        connexion.Deconnexion();
        if(rs.next()){
            return new Client(rs.getString("login"),rs.getString("password"),rs.getString("nom"),rs.getString("prenom"),rs.getString("tel"));}

        } catch (SQLException e){e.printStackTrace();}

        return null;
    }

    public  int insertClient(Client client)  {
        int isAdded = 0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isAdded=st.executeUpdate("INSERT INTO client VALUES('" + client.getLogin() + "','" + client.getNom() + "','" + client.getPrenom() + "','" + client.getPassword() + "','" + client.getTel() + "')");
        }catch(SQLException e){e.printStackTrace();}
        return isAdded;
    }

    public int isClientExist(String email) {

        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT*  FROM  client  WHERE  login ='"+email+"';");
            connexion.Deconnexion();
            if(rs.next()) return 1;
        }
        catch (SQLException e){e.printStackTrace();}

        return 0;
    }


    public ArrayList<Client> getAllClients(){

        ArrayList<Client> listClient=new ArrayList<Client>();
        try{
            connexion.Connect();
            Statement st=connexion.getCnx().createStatement();
            ResultSet rs=st.executeQuery("SELECT *  FROM  client ;");
            connexion.Deconnexion();
            while(rs.next()){
                listClient.add(new Client(rs.getString("login"),rs.getString("password"),rs.getString("nom"),rs.getString("prenom"),rs.getString("tel")));
        } }catch (SQLException e){e.printStackTrace();}

        return listClient;

    }

    public int deleteClient(String email){
        int isDeleted=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isDeleted=st.executeUpdate("DELETE FROM client WHERE login ='"+email+"'");

        }catch(SQLException e){e.printStackTrace();}

        return isDeleted;
    }

    public int updateClient(Client c ,String oldLogin){

        int isUpdated=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isUpdated=st.executeUpdate("UPDATE client SET login = '"+c.getLogin()+"',nom = '"+c.getNom()+"',prenom = '"+c.getPrenom()+"',password = '"+c.getPassword()+"',tel = '"+c.getTel()+"' WHERE login ='"+oldLogin+"';");

        }catch(SQLException e){e.printStackTrace();}

        return  isUpdated;
    }

    public int editProfile(Client c){
        int isUpdated=0;
        try {
            connexion.Connect();
            Statement st = connexion.getCnx().createStatement();
            isUpdated=st.executeUpdate("UPDATE client SET nom = '"+c.getNom()+"',prenom = '"+c.getPrenom()+"',password = '"+c.getPassword()+"',tel = '"+c.getTel()+"' WHERE login ='"+c.getLogin()+"';");
        }catch(SQLException e){e.printStackTrace();}
        return  isUpdated;
    }





}
