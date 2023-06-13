package Servlets;

import businessLayer.ClientManager;
import businessLayer.CommandeAchatManager;
import businessLayer.ProduitManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

import static java.lang.Float.parseFloat;
import static java.lang.Integer.max;
import static java.lang.Integer.parseInt;

import org.mindrot.jbcrypt.BCrypt;


@WebServlet(name = "Servlet", urlPatterns = {"/index"})
@MultipartConfig
public class MainServlet extends HttpServlet {
    ClientManager cm=new ClientManager();
    ProduitManager pm=new ProduitManager();
    CommandeAchatManager cam=new CommandeAchatManager();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Produit> listeProduit = pm.getAllProduits();
        ArrayList<Client> listeClient = cm.getAllClients();
        ArrayList<Commande> listeCommande = cam.getCommandesNonLivree();
        ArrayList<Achat> listeAchat = cam.getAchats();

        request.setAttribute("listeProduit",listeProduit);
        request.setAttribute("listeClient",listeClient);
        request.setAttribute("listeCommande",listeCommande);
        request.setAttribute("listeAchat",listeAchat);

        Set<String> params = request.getParameterMap().keySet();
        if(params.size() == 0) {
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
        }else {
            String whichPage = "";

            try {
                whichPage = request.getParameter("page");
            } catch (Exception e) {

                whichPage = "";
            }
            if (whichPage != null)
                switch (whichPage) {
                    case "logout":{
                        request.getSession().invalidate();
                        request.getRequestDispatcher("login.jsp").forward(request,response);
                        break;
                    }
                    case "dashboard":{
                        request.getRequestDispatcher("dashboard.jsp").forward(request,response);
                        break;
                    }
                    case "register": {
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                        break;
                    }case "home": {
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                        break;
                    }
                    case "gestClient":{
                        request.getRequestDispatcher("gestionUser.jsp").forward(request, response);
                        break;
                    }
                    case "gestProduit":{
                        request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
                        break;
                    }
                    case "gestAchat":{
                        request.getRequestDispatcher("gestionAchat.jsp").forward(request, response);
                        break;
                    }
                    case "editUser":{
                        request.getRequestDispatcher("editUser.jsp").forward(request, response);
                        break;
                    }
                    case "login": {
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                    }
                    case "panier": {
                        request.getRequestDispatcher("panier.jsp").forward(request,response);
                        break;
                    }
                    case "shop": {
                        goToShopByCat(request, response);
                        break;
                    }
                    case "detail": {
                        getDetailProduct(request, response);
                        break;
                    }
                }
            else {
                String cCategory = "";
                String cProduit="";

                String deleteFromPanier = "";

                try {
                    cCategory = request.getParameter("cCategory");
                    cProduit=request.getParameter("cProduit");
                } catch (Exception e) {
                    cCategory = "";
                    cProduit="";
                }

                try {
                    deleteFromPanier = request.getParameter("action");
                } catch (Exception e) {
                    deleteFromPanier = "";
                }

                if (cCategory != null && cProduit != null) {

                    addToCart(request,response);

                    if (cCategory.equals("ordPort")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=ordPort");
                    if (cCategory.equals("ordBureau")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=ordBureau");
                    if (cCategory.equals("audioSon")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=audioSon");
                    if (cCategory.equals("consoles")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=consoles");
                    if (cCategory.equals("tele")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=tele");
                    if (cCategory.equals("accInfo")) response.sendRedirect(request.getContextPath() + "/index?page=shop&category=accInfo");

                }
                else if(deleteFromPanier!=null) {
                    deleteFromCart(request, response);
                }else {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        }

    }

    private void getDetailProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        String prodId = request.getParameter("prod");
        Client client = (Client) request.getSession().getAttribute("client");
        String clientId = client.getLogin();
        int isExistRecentCookie = 0;
        for (Cookie c: cookies) {
            if(c.getName().equals("recent") && !c.getValue().equals("")) {
                isExistRecentCookie = 1;
                String valueCookie = c.getValue();
                int isValueExists = 0;
                String[] cookiesValue = c.getValue().split("-");
                System.out.println(cookiesValue.length);
                if(cookiesValue.length == 6) {
                    valueCookie = valueCookie.replace(cookiesValue[0]+"-", "");
                }
                for (String s: cookiesValue) {
                    if(s.equals(prodId+"/"+clientId)) {
                        isValueExists = 1;
                    }
                }
                if(isValueExists == 0) {
                    valueCookie = valueCookie + "-"+prodId+"/"+clientId;
                    Cookie cookie = new Cookie("recent", valueCookie);
                    cookie.setMaxAge(604800);
                    response.addCookie(cookie);
                }
            }
        }
        if(isExistRecentCookie == 0) {
            Cookie cookie = new Cookie("recent", prodId+"/"+clientId);
            cookie.setMaxAge(604800);
            response.addCookie(cookie);
        }

        Produit produit = pm.getProduitById(prodId);
        ArrayList<Produit> listeProduit = pm.getAllProduits();
        request.setAttribute("produit", produit);
        request.setAttribute("listeProduit", listeProduit);
        request.getRequestDispatcher("detailProduct.jsp").forward(request, response);
    }

    public void deleteFromCart(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String idProduit = request.getParameter("deleteP");
        removeFromCookie(request, response, idProduit);
        request.setAttribute("RemovedFromCart","Prduct removed from cart");
        response.sendRedirect(request.getContextPath() + "/index?page=panier");
    }

    private void goToShopByCat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categorie = request.getParameter("category");
        ArrayList<Produit> produitByCat =  pm.getProduitsByCat(categorie);
        request.setAttribute("produitByCat", produitByCat);
//        ArrayList<Produit> listeProduit = pm.getAllProduits();
//        request.setAttribute("listeProduit", listeProduit);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String contentType = request.getContentType();
        String type = "";
        if (contentType != null && contentType.equals("multipart/form-data")) {
            Part p = request.getPart("type");
            type = p.getName();
        }else{
            type = request.getParameter("type");
            System.out.println(type);
        }
        type = request.getParameter("type");


        switch (type){
            case "editProfile":ueditClient(request, response);break;
            case "submitAchat":submitAchat(request, response);break;
            case "register":register(request,response);break;
            case "login":login(request,response);break;
            case "addUser":addUser(request, response);break;
            case "deleteClient":deleteClient(request,response);break;
            case "editClient":editClient(request, response);break;
            case "deleteProduit":deleteProduit(request,response);break;
            case "addProduit":addProduit(request, response);break;
            case "editProduit":editProduit(request, response);break;
            case "livrerCommande":livrerCommande(request, response);break;
            default:break;
        }
    }

    private void submitAchat(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int nbrProduits = Integer.parseInt(request.getParameter("nbrDesProduit"));
        //Commande informations
        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String codePostal = request.getParameter("codePostal");
        //Bank information
        String cardHolder = request.getParameter("cardHolder");
        String expireDate = request.getParameter("expireDate");
        String cardNumber = request.getParameter("cardNumber");
        String client = ((Client) request.getSession().getAttribute("client")).getLogin();
        Commande commande = new Commande(0, client, LocalDate.now().toString(), 0, city, codePostal, address);
        Card card = new Card(cardHolder, expireDate, cardNumber, client);
        ArrayList<Achat> listeAchat = new ArrayList<>();
        String prodsId = "";
        for (int j=0; j<nbrProduits; j++) {
            int qteProd = Integer.parseInt(request.getParameter("qteInp"+j));
            String idProd = request.getParameter("idInp"+j);
            int maxQte = Integer.parseInt(request.getParameter("maxQte"+j));
            listeAchat.add(new Achat(idProd, 0, qteProd));
            if(qteProd >= maxQte)
                qteProd = maxQte;
            prodsId = prodsId + "-" + idProd + "/" + client;
            pm.decreasQte(idProd, qteProd);
        }
        request.setAttribute("Order added successfully","OrderAdded");
        cam.AddCommande(commande, listeAchat, card);
        removeMultipleFromCookie(request, response, prodsId);
        response.sendRedirect(request.getContextPath() + "/index?page=home");
    }

    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String nom = request.getParameter("lname");
        String prenom = request.getParameter("fname");
        String num = request.getParameter("num");
        if (cm.isClientExist(email)==0) {
            if (password.equals(cpassword) && cm.getClient(email) == null) {

                Client client = new Client(email,BCrypt.hashpw(password,BCrypt.gensalt()), nom, prenom, num);
                cm.addClient(client);
                request.setAttribute("successRegister","Successful registration");
                ArrayList<Client> listeClient = cm.getAllClients();
                request.setAttribute("listeClient",listeClient);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if(!password.equals(cpassword)){
                request.setAttribute("registerNoMDP","Password and confirmation password must match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }else{
            request.setAttribute("failedRegister","Email already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Client client = cm.getClient(email);
        if(client != null && BCrypt.checkpw(password,client.getPassword())) {

            ArrayList<Produit> listeProduit = pm.getAllProduits();
            request.setAttribute("listeProduit",listeProduit);

            HttpSession userSession = request.getSession();
            userSession.setAttribute("client", client);
            if(client.getLogin().equals("admin@gmail.com")) {
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
            else{
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
        }else {
            request.setAttribute("ClientNotExist", "Email or password incorrect!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String nom = request.getParameter("lname");
        String prenom = request.getParameter("fname");
        String num = request.getParameter("num");
        if (cm.isClientExist(email)==0) {
            if (password.equals(cpassword) && cm.getClient(email) == null) {
                Client client = new Client(email, BCrypt.hashpw(password,BCrypt.gensalt()), nom, prenom, num);
                cm.addClient(client);
                ArrayList<Client> listeClient = cm.getAllClients();
                request.setAttribute("listeClient",listeClient);
                request.setAttribute("userAdded","User added successfuly");
                request.getRequestDispatcher("gestionUser.jsp").forward(request, response);
            }
            else {
                ArrayList<Client> listeClient = cm.getAllClients();
                request.setAttribute("listeClient",listeClient);
                request.setAttribute("noMatchMDP","Password and confirmation password must match");
                request.getRequestDispatcher("gestionUser.jsp").forward(request, response);
            }
        }else{
            ArrayList<Client> listeClient = cm.getAllClients();
            request.setAttribute("listeClient",listeClient);
            request.setAttribute("failedAdding","Email already exists!");
            request.getRequestDispatcher("gestionUser.jsp").forward(request, response);
        }
    }

    private void deleteClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        cm.deleteClient(request.getParameter("clientEmail"));
        ArrayList<Client> listeClient = cm.getAllClients();
        request.setAttribute("listeClient",listeClient);
        request.setAttribute("userDeleted","User deleted successfully");
        request.getRequestDispatcher("gestionUser.jsp").forward(request, response);

    }

    private void deleteProduit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        pm.deleteProduit(request.getParameter("produitId"));
        ArrayList<Produit> listeProduit = pm.getAllProduits();
        request.setAttribute("listeProduit",listeProduit);
        request.setAttribute("DeletedProduct","Product deleted successfully");
        request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
    }

    private void addProduit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("pid");
        String nom = request.getParameter("pnom");
        String description = request.getParameter("pdescription");
        String qte = request.getParameter("pqte");
        String prix = request.getParameter("pprix");
        String categorie = request.getParameter("pcategorie");
        String image = "images/"+processRequest(request, response);
//        String image="images/"+request.getParameter("pimage");
        if (pm.isProduitExist(id)==0) {
            Produit produit = new Produit(id, nom, description,parseInt(qte),parseFloat(prix) ,categorie,image);
            pm.insertProduit(produit);
            request.setAttribute("produitAdded","Product added successfully");
            ArrayList<Produit> listeProduit = pm.getAllProduits();
            request.setAttribute("listeProduit",listeProduit);
            try {
                Thread.sleep(2000);
            }catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
        }else{
            request.setAttribute("PfailedAdding","ID already exists!");
            request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
        }

    }
    private void editProduit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldId = request.getParameter("oldpid");
        String id = request.getParameter("pid");
        String nom = request.getParameter("pnom");
        String description = request.getParameter("pdes");
        String qte = request.getParameter("pqte");
        String prix = request.getParameter("pprix");
        String categorie = request.getParameter("pcat");
        String image = "images/"+processRequest(request, response);
//        String image="images/"+request.getParameter("pimage");
        if (pm.isProduitExist(id)==0 || oldId.equals(id)){
            System.out.println("doesnt exist");
            System.out.println(oldId+prix + "  " + qte+id);
            Produit produit = new Produit(id, nom, description,parseInt(qte),parseFloat(prix),categorie,image);
            System.err.println(pm.updateProduit(produit,oldId));
            request.setAttribute("produitUpdated","Product edited successfully");
            ArrayList<Produit> listeProduit = pm.getAllProduits();
            request.setAttribute("listeProduit",listeProduit);
            try {
                Thread.sleep(2000);
            }catch (Exception e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
        }else{
            request.setAttribute("PfailedEditing","ID already exists!");
            request.getRequestDispatcher("gestionProduit.jsp").forward(request, response);
        }
    }

    private void editClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Client currentClient= (Client) request.getSession().getAttribute("client");
        String currentEmail=currentClient.getLogin();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String nom = request.getParameter("lname");
        String prenom = request.getParameter("fname");
        String num = request.getParameter("num");
        String oldLogin = request.getParameter("oldLogin");

        if (cm.isClientExist(email)==0 || email.equals(oldLogin)) {
            if (password.equals(cpassword)) {
                Client client = new Client(email,BCrypt.hashpw(password,BCrypt.gensalt()), nom, prenom, num);
                cm.updateClient(client, oldLogin);
                request.setAttribute("userEdited","User updated successfully");
                ArrayList<Client> listeClient = cm.getAllClients();
                request.setAttribute("listeClient",listeClient);
                request.getRequestDispatcher("gestionUser.jsp").forward(request, response);


            }
        }else{
            request.setAttribute("failedUpdating","Email already exists!");
            request.getRequestDispatcher("gestionUser.jsp").forward(request, response);


        }
    }

    public void livrerCommande(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commandeId = Integer.parseInt(request.getParameter("commandeId"));
        cam.livrerCommande(commandeId);
        ArrayList<Produit> listeProduit = pm.getAllProduits();
        ArrayList<Commande> listeCommande = cam.getCommandesNonLivree();
        ArrayList<Achat> listeAchat = cam.getAchats();

        request.setAttribute("listeProduit",listeProduit);
        request.setAttribute("listeCommande",listeCommande);
        request.setAttribute("listeAchat",listeAchat);
        request.setAttribute("Delivered","Order delivered successfully");

        request.getRequestDispatcher("gestionAchat.jsp").forward(request, response);
    }

    public void addToCart(HttpServletRequest request,HttpServletResponse response){

        Cookie[] cookies = request.getCookies();
        String prodId = request.getParameter("cProduit");
        Client client = (Client) request.getSession().getAttribute("client");
        String clientId = client.getLogin();
        int isExistRecentCookie = 0;
        for (Cookie c: cookies) {
            if(c.getName().equals("panier") && !c.getValue().equals("")) {
                isExistRecentCookie = 1;
                String valueCookie = c.getValue();
                int isValueExists = 0;
                String[] cookiesValue = c.getValue().split("-");
                for (String s: cookiesValue) {
                    if(s.equals(prodId+"/"+clientId)) {
                        isValueExists = 1;
                    }
                }
                if(isValueExists == 0) {
                    valueCookie = valueCookie + "-"+prodId+"/"+clientId;
                    valueCookie.replace("--","-");
                    Cookie cookie = new Cookie("panier", valueCookie);
                    cookie.setMaxAge(604800);
                    response.addCookie(cookie);
                }
            }
        }
        if(isExistRecentCookie == 0) {
            Cookie cookie = new Cookie("panier", (prodId+"/"+clientId).replace("--","-"));
            cookie.setMaxAge(604800);
            response.addCookie(cookie);
        }

    }

    public void removeFromCookie(HttpServletRequest request, HttpServletResponse response, String idProduit) {
        Cookie[] cookies = request.getCookies();
        for(Cookie c:cookies){
            if(c.getName().equals("panier")) {
                String[] cookiesValue = c.getValue().split("-");
                String value = idProduit+"/"+((Client) request.getSession().getAttribute("client")).getLogin();
                String newCookie="";
                for (String s : cookiesValue) {
                    if(s.equals(value))
                        continue;
                    if(s.equals(cookiesValue[cookiesValue.length-1])){
                        newCookie=newCookie+s;
                        continue;
                    }
                    newCookie=newCookie+(s+"-");
                }
                if(newCookie.endsWith("-")) {
                    newCookie.substring(0, newCookie.length() - 1);
                }
                newCookie.replace("--","-");

                if(newCookie.endsWith("-")) {
                    newCookie.substring(0, newCookie.length() - 1);
                    System.err.println("Cookie fixed with substring");
                }
                System.out.println("Cookie fixed 1"+newCookie);
                Cookie cookie = new Cookie("panier", newCookie);
                cookie.setMaxAge(604800);
                response.addCookie(cookie);
            }
        }

    }

    public void removeMultipleFromCookie(HttpServletRequest request, HttpServletResponse response, String prodsId) {
        Cookie[] cookies = request.getCookies();
        String newCookie="";
        for(Cookie c:cookies){
            if(c.getName().equals("panier")) {
                String[] cookiesValue = c.getValue().split("-");
                for (String s : cookiesValue) {
                    if(prodsId.contains(s))
                        continue;
                    newCookie = newCookie + (s+"-");
                }
            }
        }
        if(newCookie.endsWith("-")) {
            newCookie.substring(0, newCookie.length() - 1);
        }
        newCookie.replace("--","-");
        if(newCookie.endsWith("-")) {
            newCookie.substring(0, newCookie.length() - 1);
        }
        System.out.println("Cookie fixed 2"+newCookie);
        Cookie cookie = new Cookie("panier", newCookie);
        cookie.setMaxAge(604800);
        response.addCookie(cookie);
    }

    protected String processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //fetch form data
        Part part = request.getPart("pimage");
        String fileName = part.getSubmittedFileName();
        String path ="C:\\Users\\Len\\Desktop\\ecommerce\\src\\main\\webapp\\images\\"+fileName;
        InputStream is = part.getInputStream();
        boolean test = uploadFile(is, path);
        if (test) {
            return fileName;
        } else {
            return "";
        }
    }
    public boolean uploadFile(InputStream is, String path){
        boolean test = false;
        try{
            byte[] byt = new byte[is.available()];
            is.read(byt);

            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return test;
    }



    private void ueditClient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Client currentClient= (Client) request.getSession().getAttribute("client");
        String currentEmail=currentClient.getLogin();
        String email = request.getParameter("uemail");
        String password = request.getParameter("upassword");
        String cpassword = request.getParameter("ucpassword");
        String nom = request.getParameter("ulname");
        String prenom = request.getParameter("ufname");
        String num = request.getParameter("unum");
        String oldLogin = request.getParameter("uoldLogin");
        if (cm.isClientExist(email)==0 || email.equals(oldLogin)) {
            if (password.equals(cpassword)) {
                Client client = new Client(oldLogin,BCrypt.hashpw(password,BCrypt.gensalt()), nom, prenom, num);
                System.out.println("in if"+password);
                cm.editProfile(client);
                request.setAttribute("uuserEdited","User updated successfully");
                request.getSession().setAttribute("client", client);
                request.getRequestDispatcher("editUser.jsp").forward(request, response);
            }
        }else{
                request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }




}
