package businessLayer;

import models.Achat;
import models.Card;
import models.Commande;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public interface interfaceCommandeAchat {

    public int AddCommande(Commande c, ArrayList<Achat> listeAchat, Card card);

    public ArrayList<Commande> getCommandesNonLivree();

    public ArrayList<Achat> getAchats();

    public int livrerCommande(int commandeId);

//    public ArrayList<Commande> getCommandesByClient(String client);

}
