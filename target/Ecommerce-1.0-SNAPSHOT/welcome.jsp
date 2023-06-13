<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Produit" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--test if the session not exist--%>
<c:if test="${ sessionScope.client != null}">
    <c:redirect url="/index?page=home"/>
</c:if>
<%--end test if the session not exist--%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<%@include file="includes/head.jsp" %>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern content-detached-left-sidebar ecommerce-application navbar-floating footer-static  " data-open="click"
      data-menu="vertical-menu-modern" data-col="content-detached-left-sidebar">

<!-- BEGIN: Header-->
<%--<%@ include file="includes/header.jsp" %>--%>
<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-container content">
            <div class="navbar-collapse" id="navbar-mobile">
                <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                    <ul class="nav navbar-nav">
                        <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                    </ul>
                    <ul class="nav navbar-nav bookmark-icons mx-2">
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="index?page=login" data-toggle="tooltip" data-placement="top" title="Sign-in"><i class="fa fa-sign-in"></i> Login</a></li>
                    </ul>

                    <ul class="nav navbar-nav bookmark-icons mx-2">
                        <li class="nav-item d-none d-lg-block"><a class="nav-link" href="index?page=register" data-toggle="tooltip" data-placement="top" title="Sign-up"><i class="fa fa-pencil"></i> Register</a></li>
                    </ul>

                </div>
                <ul class="nav navbar-nav float-right">
                    <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<!-- END: Header-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow expanded" data-scroll-to-active="true"
     style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
    <div class="navbar-header expanded">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto"><a class="navbar-brand" href="index">
                <div class="brand-logo"></div>
                <h2 class="brand-text mb-0">SDSI Shop</h2></a>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
                    class="icon-x d-block d-xl-none font-medium-4 primary toggle-icon feather icon-disc"></i><i
                    class="toggle-icon icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary feather" data-ticon="icon-disc"></i></a></li>

            </a></li>
        </ul>
    </div>
    <!--    <a href="index.html"><i class="feather icon-home"></i><span class="item" data-i18n="Dashboard">Dashboard</span><span class="badge badge badge-warning badge-pill float-right mr-2">2</span></a>-->


<%--    <%@ include file="client-menu.jsp" %>--%>

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
                        <h2 class="content-header-title float-left mb-0">Welcome To SDSI Shop</h2>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                <div class="form-group breadcrum-right">

                </div>
            </div>
        </div>
        <div class="content-detached content-right">
            <div class="m-5">
                <!-- Ecommerce Content Section Starts -->
                <section id="ecommerce-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ecommerce-header-items">
                                <div class="result-toggler">
                                    <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                                        <span class="navbar-toggler-icon d-block d-lg-none"><i class="feather icon-menu"></i></span>
                                    </button>
                                    <div class="search-results">

                                    </div>
                                </div>
                                <div class="view-options">

                                    <div class="view-btn-option">
                                        <button class="btn btn-white view-btn grid-view-btn active">
                                            <i class="feather icon-grid"></i>
                                        </button>
                                        <button class="btn btn-white list-view-btn view-btn">
                                            <i class="feather icon-list"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Ecommerce Content Section Starts -->
                <!-- background Overlay when sidebar is shown  starts-->

                <!-- background Overlay when sidebar is shown  ends-->

                <!-- Ecommerce Search Bar Starts -->

                <!-- Ecommerce Search Bar Ends -->

                <!-- Ecommerce Products Starts -->
                <section id="ecommerce-products" class="grid-view">
                    <%
                        ArrayList<Produit> listeProduit = (ArrayList<Produit>) request.getAttribute("listeProduit");
                        for (int i=0; i<6; i++) {
                            if (listeProduit.size() <= i)
                                continue;
                            out.println("<div class=\"card ecommerce-card\">\n" +
                                    "              <div class=\"card-content\">\n" +
                                    "                <div class=\"item-img text-center\">\n" +
                                    "                  <a href=\"index?page=login\">\n" +
                                    "                    <img class=\"img-fluid\" src=\""+listeProduit.get(i).getImage()+"\" alt=\"img-placeholder\"></a>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"card-body\">\n" +
                                    "                  <div class=\"item-wrapper\">\n" +
                                    "                    <div class=\"item-rating\">\n" +
                                    "                      <div class=\"badge badge-primary badge-md\">\n" +
                                    "                        <i class=\"feather icon-star\"></i>\n" +
                                    "                      </div>\n" +
                                    "                    </div>\n" +
                                    "                    <div>\n" +
                                    "                      <h6 class=\"item-price\">\n" +
                                    "                          "+listeProduit.get(i).getPrix()+"$\n" +
                                    "                      </h6>\n" +
                                    "                    </div>\n" +
                                    "                  </div>\n" +
                                    "                  <div class=\"item-name\">\n" +
                                    "                    <a href=\"index?page=login\">"+listeProduit.get(i).getNom()+"</a>\n" +
                                    "                  </div>\n" +
                                    "                  <div>\n" +
                                    "                    <p class=\"item-description\">\n" +
                                    "                      "+listeProduit.get(i).getDescription()+"\n" +
                                    "                    </p>\n" +
                                    "                  </div>\n" +
                                    "                </div>\n" +
                                    "                <div class=\"item-options text-center\">\n" +
                                    "                  <div class=\"item-wrapper\">\n" +
                                    "                    <div class=\"item-rating\">\n" +
                                    "                      <div class=\"badge badge-primary badge-md\">\n" +
                                    "                        <i class=\"feather icon-star\"></i>\n" +
                                    "                      </div>\n" +
                                    "                    </div>\n" +
                                    "                    <div class=\"item-cost\">\n" +
                                    "                      <h6 class=\"item-price\">\n" +
                                    "                        "+listeProduit.get(i).getPrix()+"$\n" +
                                    "\n" +
                                    "                      </h6>\n" +
                                    "                    </div>\n" +
                                    "                  </div>\n" +
                                    "                  <div class=\"wishlist\">\n" +
                                    "                    <a class=\"text-dark\" href=\"index?page=login\"><span>Detail</span></a>\n" +
                                    "                  </div>\n" +
                                    "                  <div class=\"cart\">\n" +
                                    "                    <i class=\"feather icon-shopping-cart\"></i><a  href=\"index?page=login\"> <span class=\"text-white\">Add to cart</span></a>\n" +
                                    "                  </div>\n" +
                                    "                </div>\n" +
                                    "              </div>\n" +
                                    "            </div>");
                        }
                    %>
                </section>
                <!-- Ecommerce Products Ends -->
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

</html>
