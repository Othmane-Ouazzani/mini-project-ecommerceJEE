package businessLayer;

import dataLayer.DataClient;
import models.Client;

import java.util.ArrayList;

public class ClientManager implements  interfaceClient{


    private final DataClient dc=new DataClient();


    @Override
    public Client getClient(String c){
        return dc.getClient(c);
    }

    @Override
    public int addClient(Client c) {
        return dc.insertClient(c);
    }

    @Override
    public int isClientExist(String email) {
        return dc.isClientExist(email);
    }

    @Override
    public ArrayList<Client> getAllClients() {
        return dc.getAllClients();
    }

    @Override
    public int deleteClient(String email) {
        return dc.deleteClient(email);
    }

    @Override
    public int updateClient(Client c, String oldLogin) {
        dc.updateClient(c, oldLogin);
        return  0;
    }

    @Override
    public int editProfile(Client c) {
        dc.editProfile(c);
        return 0;
    }
}
