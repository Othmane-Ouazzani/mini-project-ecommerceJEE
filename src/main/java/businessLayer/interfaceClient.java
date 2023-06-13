package businessLayer;

import models.Client;

import java.sql.SQLException;
import java.util.ArrayList;

public interface interfaceClient {

    public Client getClient(String c) throws SQLException;

    public int addClient(Client c);

    public int isClientExist(String email);

    public ArrayList<Client> getAllClients();

    public int deleteClient(String email);


    public int updateClient(Client c,String oldLogin);

    public int editProfile(Client c);

}

