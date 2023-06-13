<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Produit" %>
<%@ page import="models.Commande" %>
<%@ page import="models.Achat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ (sessionScope.client == null) || (sessionScope.client.getLogin()!='admin@gmail.com')}">
    <c:redirect url="/index"/>
</c:if>

<c:set var="DeliverSuccess" scope="session" value="${Delivered}"/>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

<!-- BEGIN: Head-->
<%@include file="includes/head.jsp" %>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-left-sidebar ecommerce-application navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="content-detached-left-sidebar">

<!-- BEGIN: Header-->
<%@ include file="includes/header.jsp" %>
<!-- END: Header-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow expanded" data-scroll-to-active="true" style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
    <div class="navbar-header expanded">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="index">
                <div class="brand-logo"></div>
                <h2 class="brand-text mb-0">SDSI Shop</h2>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="icon-x d-block d-xl-none font-medium-4 primary toggle-icon feather icon-disc"></i><i class="toggle-icon icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary feather" data-ticon="icon-disc"></i></a></li>

            </a></li>
        </ul>
    </div>
    <!--    <a href="index.html"><i class="feather icon-home"></i><span class="item" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">2</span></a>-->
    <div class="shadow-bottom"></div>

    <%@ include file="main-menu.jsp" %>

</div>
<!-- BEGIN: Main Menu-->
<!-- END: Main Menu-->

<!-- BEGIN: Content-->
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0">Purchases List</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Purchases
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                <div class="form-group breadcrum-right">
                    <div class="dropdown">
                        <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-settings"></i></button>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item" href="#">Calendar</a></div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${DeliverSuccess!=null}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <p class="mb-0">
                        ${DeliverSuccess}
                </p>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                </button>
            </div>
            <c:remove var="DeliverSuccess"/>
        </c:if>
        <div class="content-body">

            <!-- Column selectors with Export Options and print table -->
            <section id="data-list-view" class="data-list-view-header">
                <!-- DataTable starts -->
                <div class="table-responsive">
                    <table class="table data-list-view">
                        <thead>
                        <tr>
                            <th hidden></th>
                            <th>Client</th>
                            <th>Date de commande</th>
                            <th>Ville</th>
                            <th>Code Postal</th>
                            <th>Produits</th>
                            <th>Livrer</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Commande> listeCommande = (ArrayList<Commande>) request.getAttribute("listeCommande");
                            for (int i=0; i<listeCommande.size(); i++) {
                                out.println("<tr>\n" +
                                            "<td hidden></td>\n" +
                                            "<td class=\"product-name\">"+listeCommande.get(i).getClient()+"</td>\n" +
                                            "<td class=\"product-category\">"+listeCommande.get(i).getDate()+"</td>\n" +
                                            "<td class=\"product-category\">"+listeCommande.get(i).getVille()+"</td>\n" +
                                            "<td class=\"product-category\">"+listeCommande.get(i).getCodePostal()+"</td>\n" +
                                            "<td>" +
                                                "<div class=\"collapse-icon accordion-icon-rotate\">\n" +
                                                    "<div class=\"accordion\" id=\"accordionExample\" data-toggle-hover=\"true\">\n" +
                                                        "<div class=\"collapse-margin\">\n" +
                                                            "<div class=\"card-header\" style=\"width: auto;\" id=\"heading"+listeCommande.get(i).getNum()+"\" data-toggle=\"collapse\" role=\"button\" data-target=\"#collapse"+listeCommande.get(i).getNum()+"\" aria-expanded=\"false\" aria-controls=\"collapse"+listeCommande.get(i).getNum()+"\">\n" +
                                                                "<span class=\"lead collapse-title collapsed\"> Liste des produits </span>\n" +
                                                            "</div>" +
                                                        "<div id=\"collapse"+listeCommande.get(i).getNum()+"\" class=\"collapse\" aria-labelledby=\"heading"+listeCommande.get(i).getNum()+"\" data-parent=\"#accordionExample\">\n" +
                                                            "<div class=\"card-body\">\n" +
                                                                "<ul>");
                                ArrayList<Achat> listeAchat = (ArrayList<Achat>) request.getAttribute("listeAchat");
                                ArrayList<Produit> listeProduit = (ArrayList<Produit>) request.getAttribute("listeProduit");
                                        for(int j=0; j<listeAchat.size(); j++) {
                                            if(listeAchat.get(j).getCommande() == listeCommande.get(i).getNum()) {
                                                for(int k=0; k<listeProduit.size(); k++) {
                                                    if(listeProduit.get(k).getId().equals(listeAchat.get(j).getProduit())) {
                                                        out.println("<li>\n" +
                                                                        "<img src=\""+listeProduit.get(k).getImage()+"\" width=\"50px\" height=\"50px\"> <span>-"+listeProduit.get(k).getNom()+"(x"+listeAchat.get(j).getQte()+")</span>\n" +
                                                                    "</li>");
                                                    }
                                                }
                                            }
                                        }
                                                    out.println("</ul>\n" +
                                                            "</div>\n" +
                                                        "</div>\n" +
                                                    "</div>\n" +
                                                "</div>\n" +
                                            "</div>\n" +
                                        "</td>\n" +
                                        "<td><span class=\"livrerCommandeBtn\" id=\""+listeCommande.get(i).getNum()+"\" data-toggle=\"modal\" data-target=\"#livrerCom\"><i class=\"feather icon-check-circle\"></i></span></td>" +
                                    "</tr>");
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <!-- DataTable ends -->
            </section>
            <!-- Column selectors with Export Options and print table -->
        </div>
    </div>
</div>

<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>


<%-- are you sure livree --%>
<div class="modal fade text-left" id="livrerCom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel120" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary white">
                <h5 class="modal-title" id="myModalLabel120">Deliver</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h1>Are you sure? </h1><p>Do you want to deliver the order number : <span id="commandeIdLivrer"></span></p>
            </div>
            <div class="modal-footer">
                <form action="index" method="post">
                    <input type="hidden" value="livrerCommande" name="type">
                    <input id="inputCommandeId" type="hidden" name="commandeId">
                    <button type="submit" class="btn btn-primary">Accept</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- are you sure livree --%>


<!-- BEGIN: Footer-->
<%@include file="includes/footer.jsp" %>


</body>
<!-- END: Body-->

<script>
    $(".livrerCommandeBtn").on("click", function() {
        let commandeId = $(this).attr("id");
        document.getElementById("commandeIdLivrer").innerHTML = commandeId;
        document.getElementById("inputCommandeId").setAttribute("value", commandeId);
    })
</script>

</html>