<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="models.Produit" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Client" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>




<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<%@include file="includes/head.jsp" %>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-left-sidebar ecommerce-application navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="content-detached-left-sidebar" onload="refresh()">

<%--test if the session not exist--%>
<c:if test="${sessionScope.client == null}">
    <c:redirect url="/index"></c:redirect>
</c:if>
<%--end test if the session not exist--%>

<c:set var="Removed" scope="session" value="${RemovedFromCart}"/>
<!-- BEGIN: Header-->
<%@ include file="includes/header.jsp" %>
<!-- END: Header-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow expanded" data-scroll-to-active="true"
     style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
    <div class="navbar-header expanded">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto">
                <a class="navbar-brand" href="index">
                    <div class="brand-logo"></div>
                    <h2 class="brand-text mb-0">SDSI Shop</h2>
                </a>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
                    class="icon-x d-block d-xl-none font-medium-4 primary toggle-icon feather icon-disc"></i><i
                    class="toggle-icon icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary feather" data-ticon="icon-disc"></i></a></li>
            </a>
            </li>
        </ul>
    </div>
    <!--    <a href="index.html"><i class="feather icon-home"></i><span class="item" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">2</span></a>-->
    <div class="shadow-bottom"></div>

    <%@ include file="client-menu.jsp" %>

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
                        <h2 class="content-header-title float-left mb-0">Shop</h2>

                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index?page=home">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Shop
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                <div class="form-group breadcrum-right">

                </div>
            </div>
        </div>
        <div class="content-detached content-center">
            ${Removed}
            <c:if test="${Removed!=null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <p class="mb-0">
                            ${Removed}
                    </p>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                    </button>
                </div>
                <c:remove var="Removed"/>
            </c:if>
            <div class="content-body">
                <form action="index" method="POST" class="icons-tab-steps checkout-tab-steps wizard-circle">
                    <!-- Checkout Place order starts -->
                    <h6><i class="step-icon step feather icon-shopping-cart"></i>Cart</h6>
                    <fieldset class="checkout-step-1 px-0">
                        <section id="place-order" class="list-view product-checkout">
                            <div class="checkout-items">
                                <%
                                    Cookie[] cookies = request.getCookies();
                                    int i = 0;
                                    for (Cookie c : cookies) {
                                        if (c.getName().equals("panier") && !c.getValue().equals("")) {
                                            String[] cookieValue = c.getValue().split("-");
                                            i = 0;
                                            for (String s : cookieValue) {
                                                String[] prodEtClient = s.split("/");
                                                if (prodEtClient[1].equals(((Client) session.getAttribute("client")).getLogin())) {
                                                    Produit produit = null;
                                                    for (Produit p : (ArrayList<Produit>) request.getAttribute("listeProduit")) {
                                                        if (prodEtClient[0].equals(p.getId()))
                                                            produit = p;
                                                    }
                                                    out.println("<div class=\"card ecommerce-card\">\n" +
                                                            "                                    <div class=\"card-content\">\n" +
                                                            "                                        <div class=\"item-img text-center\">\n" +
                                                            "                                            <a href=\"app-ecommerce-details.html\">\n" +
                                                            "                                                <img src=\"" + produit.getImage() + "  \" width=\"130\" height=\"130\" alt=\"img-placeholder\">\n" +
                                                            "                                            </a>\n" +
                                                            "                                        </div>\n" +
                                                            "                                        <div class=\"card-body\">\n" +
                                                            "                                            <div class=\"item-name\">\n" +
                                                            "                                                " + produit.getNom() +
                                                            "                                                <span></span>\n" +
                                                            "                                                <p class=\"item-company\">By <span class=\"company-name\">SDSI-Shop</span></p>\n" +
                                                            "                                                <p class=\"stock-status-in\">"+produit.getQte()+" In Stock</p>\n" +
                                                            "                                            </div>\n" +
                                                            "                                            <div class=\"item-quantity\">\n" +
                                                            "                                                <p class=\"quantity-title\">Quantity</p>\n" +
                                                            "                                                <div class=\"input-group quantity-counter-wrapper\">\n" +
                                                            "                                                    <input onchange=\"refresh()\" id=\"qteProd"+i+"\" name=\"qteInp"+i+"\" type=\"text\" class=\"quantity-counter\" value=\"1\" max=\""+produit.getQte()+"\">\n" +
                                                            "                                                </div><input hidden name=\"idInp"+i+"\" value=\""+produit.getId()+"\" />\n" +
                                                            "                                            </div><input hidden name=\"maxQte"+i+"\" value=\""+produit.getQte()+"\" />\n" +
                                                            "                                            <p class=\"delivery-date\">If you exceed "+produit.getQte()+" unit, you will have the maximum.</p>\n" +
                                                            "                                            <p class=\"offers\">17% off 4 offers Available</p>\n" +
                                                            "                                        </div>\n" +
                                                            "                                        <div class=\"item-options text-center\">\n" +
                                                            "                                            <div class=\"item-wrapper\">\n" +
                                                            "                                                <div class=\"item-cost\">\n" +
                                                            "                                                    <h6 id=prixProd" + i + " class=\"item-price\">\n" +
                                                            "                                                        $" + produit.getPrix() + "\n" +
                                                            "                                                    </h6>\n" +
                                                            "                                                    <p class=\"shipping\">\n" +
                                                            "                                                        <i class=\"feather icon-shopping-cart\"></i> Free Shipping\n" +
                                                            "                                                    </p>\n" +
                                                            "                                                </div>\n" +
                                                            "                                            </div>\n" +
                                                            "                                            <div class=\"wishlist remove-wishlist\">\n" +
                                                            "                                                <a href=\"" + request.getContextPath() + "/index?action=deleteFromPanier&deleteP=" + produit.getId() + "\"><i class=\"feather icon-x align-middle\"></i> Remove</a>\n" +
                                                            "                                            </div>\n" +
                                                            "                                        </div>\n" +
                                                            "                                    </div>\n" +
                                                            "                                </div>");
                                                    i++;
                                                }
                                            }
                                            out.println("<input hidden name=\"nbrDesProduit\" value=\""+i+"\">");
                                            out.println("<span hidden id=\"nbrDesProduit\">"+i+"</span>");
                                        }
                                    }
                                %>

                            </div>


                            <div class="checkout-options">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div class="detail">
                                                <div class="detail-title">
                                                    Nombre des elements
                                                </div>
                                                <div class="detail-amt">
                                                    <%
                                                        out.println("" + nbrElement);
                                                    %>
                                                </div>
                                            </div>
                                            <div class="detail">
                                                <div class="detail-title">
                                                    Delivery Charges
                                                </div>
                                                <div class="detail-amt discount-amt">
                                                    Free
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="detail">
                                                <div class="detail-title detail-total">Total</div>
                                                <div id="prixTotal" class="detail-amt total-amt"></div>
                                            </div>
                                            <a href="#" class="btn btn-primary btn-block place-order">PLACE ORDER</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </fieldset>
                    <!-- Checkout Place order Ends -->

                    <!-- Checkout Customer Address Starts -->
                    <h6><i class="step-icon step feather icon-home"></i>Address</h6>
                    <fieldset class="checkout-step-2 px-0">
                        <section id="checkout-address" class="list-view product-checkout">
                            <div class="card">
                                <div class="card-header flex-column align-items-start">
                                    <h4 class="card-title">Add New Address</h4>
                                    <p class="text-muted mt-25">Be sure to check "Deliver to this address" when you have finished</p>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-city">Town/City:</label>
                                                    <input type="text" id="checkout-city" class="form-control required" name="city">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-adresse">Address:</label>
                                                    <input type="text" id="checkout-adresse" class="form-control required" name="address">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-apt-number">Postal Code:</label>
                                                    <input type="number" id="checkout-apt-number" class="form-control required" name="codePostal">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="customer-card">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">John Doe</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body actions">
                                            <p class="mb-0">9447 Glen Eagles Drive</p>
                                            <p>Lewis Center, OH 43035</p>
                                            <p>UTC-5: Eastern Standard Time (EST) </p>
                                            <p>202-555-0140</p>
                                            <hr>
                                            <div class="btn btn-primary btn-block delivery-address">DELIVER TO THIS ADDRESS</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header flex-column align-items-start">
                                    <h4 class="card-title">Card Informations</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-cardHolder">Cardholder Name:</label>
                                                    <input type="text" id="checkout-cardHolder" class="form-control required" name="cardHolder">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-expDate">Expiry Date:</label>
                                                    <input type="date" id="checkout-expDate" class="form-control required" name="expireDate">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label for="checkout-cardNum">Card number:</label>
                                                    <input type="text" id="checkout-cardNum" class="form-control required" name="cardNumber">
                                                </div>
                                            </div>
                                            <div class="col-sm-6 offset-md-6">
                                                <input hidden value="submitAchat" name="type">
                                                <button type="submit" class="btn btn-primary delivery-address float-right">
                                                    SAVE AND DELIVER HERE
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </fieldset>
                    <!-- Checkout Customer Address Ends -->
                </form>

            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <%@include file="includes/footer.jsp" %>

</body>
<!-- END: Body-->

<script>
    function refresh() {
        let nbrElements = parseInt(document.getElementById("nbrDesProduit").innerText);
        let somme = 0;
        for(let j=0; j<nbrElements; j++) {
            somme += parseFloat(document.getElementById("qteProd"+j).value) * parseFloat(document.getElementById("prixProd"+j).innerHTML.replace("$", ""));
        }
        document.getElementById("prixTotal").innerHTML = somme+" $";
    }


</script>

</html>