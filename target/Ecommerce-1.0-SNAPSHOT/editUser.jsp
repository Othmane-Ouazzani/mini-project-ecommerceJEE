<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ sessionScope.client == null}">
    <c:redirect url="/index"/>
</c:if>

<c:set var="uuserEdited" scope="session" value="${uuserEdited}"/>

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
            <c:if test="${uuserEdited!=null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <p class="mb-0">
                            ${uuserEdited}
                    </p>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                    </button>
                </div>
                <c:remove var="uuserEdited"/>
            </c:if>
            <div class="">
                <!-- Ecommerce Content Section Starts -->
                <section id="ecommerce-header" style="margin-bottom:3% ">

                </section>
                <!-- Ecommerce Content Section Starts -->
                <!-- background Overlay when sidebar is shown  starts-->

                    <!-- BEGIN: Content-->
                    <div class="app-content content mx-1">
                        <div class="content-overlay"></div>
                        <div class="header-navbar-shadow"></div>
                        <div class="content-wrapper">
                            <div class="content-header row">
                            </div>

                            <div class="card-body" style="margin-top: -15%">
                                <ul class="nav nav-tabs mb-3" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link d-flex align-items-center active" id="account-tab" data-toggle="tab" href="#account" aria-controls="account" role="tab" aria-selected="true">
                                            <i class="feather icon-user mr-25"></i><span class="d-none d-sm-block">Account</span>
                                        </a>

                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">

                                        <!-- users edit account form start -->
                                        <form action="index" method="POST">
                                            <input type="hidden" name="type" value="editProfile">
                                            <input type="hidden" name="uoldLogin"  value="${sessionScope.client.getLogin()}">
                                            <div class="row">
                                                <div class="col-12 col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>First Name</label>
                                                            <input type="text" class="form-control" name="ufname" placeholder="FirstName" value="${sessionScope.client.getPrenom()}" required="" data-validation-required-message="This First Name field is required">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Last Name</label>
                                                            <input type="text" class="form-control" placeholder="LastName" name="ulname" value="${sessionScope.client.getNom()}" required="" data-validation-required-message="This Last Name field is required">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>E-mail</label>
                                                            <input disabled="true"  type="email"  name="uemail" class="form-control" placeholder="Email" value="${sessionScope.client.getLogin()}" required="" data-validation-required-message="This email field is required">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6">

                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Phone number</label>
                                                            <input  type="text"  name="unum" class="form-control" placeholder="Phone number" value="${sessionScope.client.getTel()}" required="" data-validation-required-message="Phone number is required">
                                                            <div class="help-block"></div></div>

                                                    </div>
                                                    <div class="form-group">
                                                        <div class="controls">
                                                        <label>Password ( You must enter your old password to apply any changes! )</label>
                                                        <input  type="password"  name="upassword" class="form-control" placeholder="Phone number" value="${sessionScope.client.getPassword()}" required="" data-validation-required-message="Password is required">
                                                        <div class="help-block"></div></div>
                                                    </div>
                                                    <div class="form-group">
                                                       <div class="controls">
                                                        <label>Confirm Password</label>
                                                        <input  type="password"  name="ucpassword" class="form-control" placeholder="Phone number" value="${sessionScope.client.getPassword()}" required="" data-validation-required-message="Password confirmation is required">
                                                        <div class="help-block"></div></div>
                                                </div>

                                                    <button type="submit" class="btn btn-primary glow mb-1 mb-sm-0 mr-0 mr-sm-1 waves-effect waves-light">Save Changes</button>

                                            </div>
                                            </div>
                                        </form>
                                        <!-- users edit account form ends -->
                                    </div>
                                    <div class="tab-pane" id="information" aria-labelledby="information-tab" role="tabpanel">

                                    </div>
                                    <div class="tab-pane" id="social" aria-labelledby="social-tab" role="tabpanel">

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- END: Content-->










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
