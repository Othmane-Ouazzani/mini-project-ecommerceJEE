<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="models.Client" %>
<%@ page import="models.Produit" %>
<%@ page import="java.util.ArrayList" %>
<div class="card-body">
    <div class="mt-4 mb-2 text-center">
        <h2>Recently visited</h2>
    </div>
    <div class="swiper-responsive-breakpoints swiper-container px-4 py-2">
        <div class="swiper-wrapper">
            <%
                Cookie[] cookies = request.getCookies();
                for(Cookie c: cookies) {
                    if(c.getName().equals("recent")  && !c.getValue().equals("")) {
                        String[] cookieValue = c.getValue().split("-");
                        for(String s: cookieValue) {
                            String[] prodEtClient = s.split("/");
                            if(prodEtClient[1].equals(((Client) session.getAttribute("client")).getLogin())){
                                Produit produit = null;
                                for (Produit p: (ArrayList<Produit>) request.getAttribute("listeProduit")) {
                                    if(prodEtClient[0].equals(p.getId()))
                                        produit = p;
                                }
                                out.println("<div class=\"swiper-slide rounded swiper-shadow\">\n" +
                                "                <div class=\"item-heading\">\n" +
                                "                    <p class=\"text-truncate mb-0\">\n" +
                                "                        "+ produit.getNom()+"\n" +
                                "                    </p>\n" +
                                "                </div>\n" +
                                "                <a href=\"index?page=detail&prod="+produit.getId()+"\" class=\"img-container w-50 mx-auto my-2 py-75\">\n" +
                                "                    <img src=\""+produit.getImage()+"\" class=\"img-fluid\" alt=\"image\">\n" +
                                "                </a>\n" +
                                "                <div class=\"item-meta\">\n" +
                                "                    <p class=\"text-primary mb-0\">$"+produit.getPrix()+"</p>\n" +
                                "                </div>\n" +
                                "             </div>");
                            }
                        }
                    }
                }
            %>
        </div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</div>