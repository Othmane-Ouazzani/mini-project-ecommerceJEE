<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ sessionScope.client == null}">
  <c:redirect url="/index"/>
</c:if>

<c:set var="SuccessOrder" scope="session" value="${OrderAdded}"/>

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
      <div class="">
        <!-- Ecommerce Content Section Starts -->
        <section id="ecommerce-header" style="margin-bottom:3% ">
          <div class="row">
            <div class="col-sm-12">
              <div class="ecommerce-header-items">
                <div class="result-toggler">
                  <button class="navbar-toggler shop-sidebar-toggler" type="button" data-toggle="collapse">
                    <span class="navbar-toggler-icon d-block d-lg-none"><i class="feather icon-menu"></i></span>
                  </button>


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



        <!-- Ecommerce Products Starts -->
        <c:if test="${SuccessOrder!=null}">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <p class="mb-0">
                ${SuccessOrder}
            </p>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
            </button>
          </div>
          <c:remove var="SuccessOrder"/>
        </c:if>

        <c:if test="${produitByCat.size()==0}">




          <!-- BEGIN: Content-->
          <div class="app-content content">
            <div class="content-overlay"></div>
            <div class="header-navbar-shadow"></div>
            <div class="content-wrapper">
              <div class="content-header row">
              </div>
              <div class="content-body">
                <!-- error 404 -->
                <section class="row flexbox-container">
                  <div class="col-xl-7 col-md-8 col-12 d-flex justify-content-center">
                    <div class="card auth-card bg-transparent shadow-none rounded-0 mb-0 w-100">
                      <div class="card-content">
                        <div class="card-body text-center">
                          <img src="app-assets/images/pages/404.png" class="img-fluid align-self-center" alt="branding logo">
                          <h1 class="font-large-2 my-1">No products found in this category</h1>
                          <p class="p-2">
                            The are no products in this category for the time being.Please consider coming back later and check again.

                          </p>
                          <a class="btn btn-primary btn-lg mt-2" href="index">Back to Home</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </section>
                <!-- error 404 end -->

              </div>
            </div>
          </div>
          <!-- END: Content-->







        </c:if>
        <section id="ecommerce-products" class="grid-view">
          <c:forEach var="produit" items="${produitByCat}">
            <div class="card ecommerce-card">
              <div class="card-content">
                <div class="item-img text-center">
                  <a href="index?page=detail&prod=${produit.id}">
                    <img class="img-fluid" src="${produit.image}" alt="img-placeholder"></a>
                </div>
                <div class="card-body">
                  <div class="item-wrapper">
                    <div class="item-rating">
                      <div class="badge badge-primary badge-md">
                        <span>4</span> <i class="feather icon-star"></i>
                      </div>
                    </div>
                    <div>
                      <h6 class="item-price">
                          ${produit.prix}$
                      </h6>
                    </div>
                  </div>
                  <div class="item-name">
                    <a href="index?page=detail&prod=${produit.id}"><c:out value="${produit.nom}"/></a>
                    <p class="text-success stock-status-in">${produit.qte} In Stock</p>
                  </div>
                  <div>
                    <p class="item-description">
                      <c:out value="${produit.description}"/>
                    </p>
                  </div>
                </div>
                <div class="item-options text-center">
                  <div class="item-wrapper">
                    <div class="item-rating">
                      <div class="badge badge-primary badge-md">
                        <span>4</span> <i class="feather icon-star"></i>
                      </div>
                    </div>
                    <div class="item-cost">
                      <h6 class="item-price">
                        $<c:out value="${produit.prix}"/>

                      </h6>
                    </div>
                  </div>
                  <div class="wishlist">
                    <a class="text-dark" href="index?page=detail&prod=${produit.id}"><span>Detail</span></a>
                  </div>
                  <div class="cart" >
                    <i class="feather icon-shopping-cart"></i><a disabled="True" href="${pageContext.request.contextPath}/index?cCategory=${produit.categorie}&cProduit=${produit.id}"> <span class="text-white">Add to cart</span></a>
                  </div>
                </div>
              </div>
            </div>

          </c:forEach>
        </section>
        <!-- Ecommerce Products Ends -->



      </div>
    </div>
    <div class="sidebar-detached sidebar-left">
      <div class="sidebar">
        <!-- Ecommerce Sidebar Starts -->
        <div class="sidebar-shop" id="ecommerce-sidebar-toggler">

          <div class="row">
            <div class="col-sm-12">
              <h6 class="filter-heading d-none d-lg-block"></h6>
            </div>
          </div>
          <span class="sidebar-close-icon d-block d-md-none">
                            <i class="feather icon-x"></i>
                        </span>


        </div>
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
