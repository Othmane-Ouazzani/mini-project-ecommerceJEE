package businessLayer;
import dataLayer.DataClient;
import dataLayer.DataProduit;
import models.Produit;

import java.util.ArrayList;

public class ProduitManager implements  interfaceProduit{

    private final DataProduit dp=new DataProduit();

    @Override
    public Produit getProduitById(String id) {

        return dp.getProduitById(id);
    }

    @Override
    public ArrayList<Produit> getAllProduits() {
        return dp.getAllProduits();
    }

    @Override
    public ArrayList<Produit> getProduitsByCat(String categorie) {
        return dp.getProduitsByCat(categorie);
    }

    @Override
    public int isProduitExist(String id) {
        return dp.isProduitExist(id);
    }

    @Override
    public int insertProduit(Produit produit) {
        return dp.insertProduit(produit);
    }

    @Override
    public int deleteProduit(String id) {
        return dp.deleteProduit(id);
    }

    @Override
    public int updateProduit(Produit p, String oldId) {
        return dp.updateProduit(p,oldId);
    }

    @Override
    public int decreasQte(String id, int qte) {
        return dp.decreasQte(id, qte);
    }
}
