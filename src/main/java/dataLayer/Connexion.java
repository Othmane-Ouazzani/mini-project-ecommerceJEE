package dataLayer;

import java.sql.*;

public class Connexion {
    public Connection cnx;
    public String pilote;
    public String url;

    public Connexion(){}
    public void Connect() throws SQLException
    {
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            url = new String("jdbc:mariadb://localhost:3306/ecommerce");
            cnx=DriverManager.getConnection(url,"root","");
//            System.out.println("Connected to database!");

        }catch(Exception ex){

            System.err.println("Error connecting to database"+ex);

        }

    }


    public void Deconnexion() throws SQLException
    {

        cnx.close();

    }


    public ResultSet Requete(String rq) throws SQLException
    {
        Statement st = this.cnx.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

        ResultSet rs = st.executeQuery(rq);
        return rs;

    }

    public void RequeteUD(String rq) throws SQLException{

        Statement st = this.cnx.createStatement();
        st.executeUpdate(rq);

    }


    public Connection getCnx() {
        return cnx;
    }

    public void setCnx(Connection cnx) {
        this.cnx = cnx;
    }

    public String getPilote() {
        return pilote;
    }

    public void setPilote(String pilote) {
        this.pilote = pilote;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
