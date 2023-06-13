
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ (sessionScope.client == null) || (sessionScope.client.getLogin()!='admin@gmail.com')}">
    <c:redirect url="/index" />
</c:if>
<c:set var="SuccessRegister" scope="session" value="${userAdded}"/>
<c:set var="FailedRegister" scope="session" value="${failedAdding}"/>
<c:set var="DeletedUser" scope="session" value="${userDeleted}"/>
<c:set var="EditeddUser" scope="session" value="${userEdited}"/>
<c:set var="ErrorUpdate" scope="session" value="${failedUpdating}"/>
<c:set var="noMDP" scope="session" value="${noMatchMDP}"/>


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
                        <h2 class="content-header-title float-left mb-0">Users List</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index">Home</a>
                                </li>
                                <li class="breadcrumb-item active">Users
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
        <div class="content-body">
            <div class="row">
                <div class="col-12">

                </div>
            </div>

            <!-- Column selectors with Export Options and print table -->
            <section id="column-selectors">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <p>
                                        <!-- Button trigger modal -->
                                        <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#inlineForm">
                                            + Add New User
                                        </button>

                                        <!-- Modal -->
                                    <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel33">Add User form</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="index" method="post">
                                                    <input type="hidden" name="type" value="addUser">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input type="text" placeholder="First Name" name="fname" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Last Name" name="lname" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="email" placeholder="Email" name="email" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Phone number" name="num" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="password" name="password" placeholder="Password" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="password" placeholder="Confirm password" name="cpassword" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary" >Add User</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    </p>
                                    <c:if test="${SuccessRegister!=null}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${SuccessRegister}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="SuccessRegister"/>
                                    </c:if>

                                    <c:if test="${FailedRegister!=null}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${FailedRegister}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="FailedRegister"/>
                                    </c:if>

                                    <c:if test="${DeletedUser!=null}">
                                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${DeletedUser}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="DeletedUser"/>
                                    </c:if>

                                    <c:if test="${EditeddUser!=null}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${EditeddUser}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="EditeddUser"/>
                                    </c:if>

                                    <c:if test="${ErrorUpdate!=null}">
                                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${ErrorUpdate}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="ErrorUpdate"/>
                                    </c:if>

                                    <c:if test="${noMDP!=null}">
                                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                            <p class="mb-0">
                                                    ${noMDP}
                                            </p>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                                            </button>
                                        </div>
                                        <c:remove var="noMDP"/>
                                    </c:if>


                                    <div class="table-responsive">
                                        <table class="table table-striped dataex-html5-selectors">
                                            <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th>Password</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listeClient}" var="client">
                                                <c:if test="${client.getLogin()!=\"admin@gmail.com\"}">
                                                <tr>
                                                    <td>${client.nom}</td><span hidden id="enom-${client.login.replace('@', '-').replace('.', '-')}">${client.nom}</span>
                                                    <td>${client.prenom}</td><span hidden id="eprenom-${client.login.replace('@', '-').replace('.', '-')}">${client.prenom}</span>
                                                    <td>${client.login}</td><span hidden id="elogin-${client.login.replace('@', '-').replace('.', '-')}">${client.login}</span>
                                                    <td>${client.tel}</td><span hidden id="etel-${client.login.replace('@', '-').replace('.', '-')}">${client.tel}</span>
                                                    <td>${client.password}</td><span hidden id="epassword-${client.login.replace('@', '-').replace('.', '-')}">${client.password}</span>
                                                    <td>
                                                        <span class="cursor-pointer editClientButton" id="${client.login}" data-toggle="modal" data-target="#editClientModal"><i class="feather icon-edit"></i></span>
                                                        <span class="cursor-pointer deleteUserButton" id="${client.login}" data-toggle="modal" data-target="#danger"><i class="feather icon-trash"></i></span>
                                                    </td>
                                                </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th>Password</th>
                                            </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Column selectors with Export Options and print table -->

        </div>
    </div>
</div>

<%--edit modal begin--%>
<div class="modal fade text-left" id="editClientModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modalEditClient">Add User form</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="index" method="post" class="form form-horizontal">
                <input type="hidden" name="type" value="editClient">
                <input type="hidden" name="oldLogin" id="oldLogin" value="">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" id="enom" placeholder="First Name" name="fname" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" id="eprenom" placeholder="Last Name" name="lname" class="form-control">
                    </div>
                    <div class="form-group">
                        <input  type="email" id="eemail" placeholder="Email" name="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="text" id="etel" placeholder="Phone number" name="num" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" id="epassword" name="password" placeholder="Password" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="password" id="ecpassword" placeholder="Confirm password" name="cpassword" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" >Edit User</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--edit modal end--%>

<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<%-- are you sure deleting --%>
<div class="modal fade text-left" id="danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel120" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header bg-danger white">
                <h5 class="modal-title" id="myModalLabel120">Danger</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h1>Are you sure? </h1><p>supprimer le client <span id="clientIdDelete"></span></p>
            </div>
            <div class="modal-footer">
                <form action="index" method="post">
                    <input type="hidden" value="deleteClient" name="type">
                    <input id="inputClientEmail" type="hidden" name="clientEmail">
                    <button type="submit" class="btn btn-danger">Accept</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- are you sure deleting --%>


<!-- BEGIN: Footer-->
<%@include file="includes/footer.jsp" %>

</body>
<!-- END: Body-->

<script>
    function removeSpecial(myStr) {
        return myStr.replace('@', '-').replace('.', '-');
    }

    $(".deleteUserButton").on("click", function() {
        let email = $(this).attr("id");
        document.getElementById("clientIdDelete").innerHTML = email;
        document.getElementById("inputClientEmail").setAttribute("value", email);
    })
    $(".editClientButton").on("click", function() {
        let email = $(this).attr("id");
        let nom = $("#enom-" + removeSpecial(email)).text();
        let prenom = $("#eprenom-" + removeSpecial(email)).text();
        let tel = $("#etel-" + removeSpecial(email)).text();
        let password = $("#epassword-" + removeSpecial(email)).text();

        $("#enom").val(nom);
        $("#eprenom").val(prenom);
        $("#eemail").val(email);
        $("#oldLogin").val(email);
        $("#etel").val(tel);
        $("#epassword").val(password);
        $("#ecpassword").val(password);
    })
</script>

</html>