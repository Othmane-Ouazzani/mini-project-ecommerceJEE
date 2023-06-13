<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ sessionScope.client == null}">
  <c:redirect url="/index"/>
</c:if>
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

<%--test if the session not exist--%>
<c:if test="${sessionScope.client == null}">
  <c:redirect url="/index"></c:redirect>
</c:if>
<%--end test if the session not exist--%>


<!-- BEGIN: Header-->
<%@ include file="includes/header.jsp" %>
<!-- END: Header-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow expanded" data-scroll-to-active="true"
     style="touch-action: none; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
  <div class="navbar-header expanded">
    <ul class="nav navbar-nav flex-row">
      <li class="nav-item mr-auto"><a class="navbar-brand" href="index">
        <div class="brand-logo"></div>
        <h2 class="brand-text mb-0">SDSI Shop</h2>
      <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i
              class="icon-x d-block d-xl-none font-medium-4 primary toggle-icon feather icon-disc"></i><i
              class="toggle-icon icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary feather" data-ticon="icon-disc"></i></a></li>

      </a></li>
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
                <li class="breadcrumb-item"><a href="index.html">Home</a>
                </li>
                <li class="breadcrumb-item"><a href="#">eCommerce</a>
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
    <div class="content-detached content-right">
      <div>
        <!-- Ecommerce Content Section Starts -->
        <section class="app-ecommerce-details">
          <div class="card m-5">
            <div class="card-body">
              <div class="row mb-5 mt-2">
                <div class="col-12 col-md-5 d-flex align-items-center justify-content-center mb-2 mb-md-0">
                  <div class="d-flex align-items-center justify-content-center">
                    <img src="${produit.image}" class="img-fluid" alt="product image">
                  </div>
                </div>
                <div class="col-12 col-md-6">
                  <h5>${produit.nom}</h5>
                  <p class="text-muted">
                    <c:choose>
                      <c:when test="${produit.categorie == 'ordPort'}">Ordinateur Portable</c:when>
                      <c:when test="${produit.categorie == 'ordBureau'}">Ordinateur De Bureau</c:when>
                      <c:when test="${produit.categorie == 'consoles'}">Consoles</c:when>
                      <c:when test="${produit.categorie == 'tele'}">Telephone</c:when>
                      <c:when test="${produit.categorie == 'accInfo'}">Accessoire Informatique</c:when>
                      <c:when test="${produit.categorie == 'audioSon'}">Audio & Son</c:when>
                    </c:choose>
                  </p>
                  <div class="ecommerce-details-price d-flex flex-wrap">
                    <p class="text-primary font-medium-3 mr-1 mb-0">$43.99</p>
                  </div>
                  <hr>
                  <p>${produit.description}</p>
                  <p class="font-weight-bold mb-25"> <i class="feather icon-truck mr-50 font-medium-2"></i>Free Shipping
                  </p>
                  <p class="font-weight-bold"> <i class="feather icon-dollar-sign mr-50 font-medium-2"></i>EMI options available
                  </p>
                  <hr>
                  <hr>
                  <p>Available - <span class="text-success">${produit.qte} In stock</span></p>

                  <div class="d-flex flex-column flex-sm-row">
                    <a href="${pageContext.request.contextPath}/index?cCategory=${produit.categorie}&cProduit=${produit.id}" class="btn btn-primary mr-0 mr-sm-1 mb-1 mb-sm-0"><i class="feather icon-shopping-cart mr-25"></i>ADD TO CART</a>
                  </div>
                  <hr>
                </div>
              </div>
            </div>
            <div class="item-features py-5">

            </div>
              <%@ include file="includes/recent.jsp"%>
          </div>
        </section>

        <!-- Ecommerce Content Section Starts -->
        <!-- background Overlay when sidebar is shown  starts-->
<%--        <div class="shop-content-overlay"></div>--%>
        <!-- background Overlay when sidebar is shown  ends-->

        <!-- Ecommerce Products Starts -->
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