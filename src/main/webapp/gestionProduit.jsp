<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:if test="${ (sessionScope.client == null) || (sessionScope.client.getLogin()!='admin@gmail.com')}">
    <c:redirect url="/index"/>
</c:if>

<c:set var="SuccessProduct" scope="session" value="${produitAdded}"/>
<c:set var="FailedProduct" scope="session" value="${PfailedAdding}"/>
<c:set var="DeletedProduct" scope="session" value="${DeletedProduct}"/>
<c:set var="EditedProduct" scope="session" value="${produitUpdated}"/>
<c:set var="ErrorUpdateProduct" scope="session" value="${PfailedEditing}"/>

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
                        <h2 class="content-header-title float-left mb-0">Product List</h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="">Products</a>
                                </li>

                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
                <div class="form-group breadcrum-right">
                    <div class="dropdown">
                        <button class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle waves-effect waves-light" type="button" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false"><i class="feather icon-settings"></i></button>
                        <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#">Chat</a><a class="dropdown-item" href="#">Email</a><a class="dropdown-item"
                                                                                                                                                               href="#">Calendar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-body">
            <!-- Data list view starts -->
            <section id="data-thumb-view" class="data-thumb-view-header">
                <div class="action-btns d-none">
                    <div class="btn-dropdown mr-1 mb-1">

                    </div>
                </div>
                <c:if test="${SuccessProduct!=null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <p class="mb-0">
                                ${SuccessProduct}
                        </p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                        </button>
                    </div>
                    <c:remove var="SuccessProduct"/>
                </c:if>

                <c:if test="${FailedProduct!=null}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <p class="mb-0">
                                ${FailedProduct}
                        </p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                        </button>
                    </div>
                    <c:remove var="FailedProduct"/>
                </c:if>

                <c:if test="${DeletedProduct!=null}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <p class="mb-0">
                                ${DeletedProduct}
                        </p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                        </button>
                    </div>
                    <c:remove var="DeletedProduct"/>
                </c:if>

                <c:if test="${EditedProduct!=null}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <p class="mb-0">
                                ${EditedProduct}
                        </p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                        </button>
                    </div>
                    <c:remove var="EditedProduct"/>
                </c:if>

                <c:if test="${ErrorUpdateProduct!=null}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <p class="mb-0">
                                ${ErrorUpdateProduct}
                        </p>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true"><i class="feather icon-x-circle"></i></span>
                        </button>
                    </div>
                    <c:remove var="ErrorUpdateProduct"/>
                </c:if>
                <!-- dataTable starts -->
                <div class="table-responsive">
                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

                        <div class="clear"></div>
                        <table class="table data-thumb-view dataTable no-footer" id="DataTables_Table_0" role="grid">
                            <thead>
                            <tr role="row">
                                <th hidden class="dt-checkboxes-cell dt-checkboxes-select-all sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
                                    style="width: 34.5938px;" data-col="0" aria-label=""><input type="checkbox"></th>
                                <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending"
                                    aria-label="Image: activate to sort column descending" style="width: 187.906px;">Image
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="NAME: activate to sort column ascending"
                                    style="width: 428.234px;">NAME
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="CATEGORY: activate to sort column ascending"
                                    style="width: 98.5938px;">CATEGORY
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="QUANTITY: activate to sort column ascending"
                                    style="width: 71.7969px;">QUANTITY
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="PRICE: activate to sort column ascending"
                                    style="width: 71.7969px;">PRICE
                                </th>
                                <th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="ACTION: activate to sort column ascending"
                                    style=" width: 52.5px;">ACTION
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listeProduit}" var="produit">

                            <tr role="row" class="odd">
                                <td hidden class="dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes"></td>
                                <td class="product-img sorting_1"><img src="${produit.image}" alt="Img placeholder"></td><span hidden id="pimage-${produit.id}">${produit.image}</span>
                                <td class="product-name">${produit.nom}<span hidden id="pnom-${produit.id}">${produit.nom}</span></td>
                                <td class="product-category">
                                    <c:choose>
                                        <c:when test="${produit.categorie == \"ordPort\"}">Ordinateur Portable</c:when>
                                        <c:when test="${produit.categorie == \"ordBureau\"}">Ordinateurs De Bureau</c:when>
                                        <c:when test="${produit.categorie == \"audioSon\"}">Audio & Son</c:when>
                                        <c:when test="${produit.categorie == \"consoles\"}">Consoles</c:when>
                                        <c:when test="${produit.categorie == \"accInfo\"}">Accessoires Informatique</c:when>
                                        <c:when test="${produit.categorie == \"tele\"}">Télephone</c:when>
                                    </c:choose>
                                    <span hidden id="pcat-${produit.id}">${produit.categorie}</span></td>
                                <td class="product-price">${produit.qte}<span hidden id="pqte-${produit.id}">${produit.qte}</span></td>
                                <td class="product-price">$${produit.prix}<span hidden id="pprice-${produit.id}">${produit.prix}</span></td>
                                <span hidden id="pdes-${produit.id}">${produit.description}</span>

                                <td class="product-action">
                                    <span class="cursor-pointer editProduitButton" id="${produit.id}" data-toggle="modal" data-target="#editModal"><i class="feather icon-edit"></i></span>
                                    <span class="cursor-pointer deleteProduitButton" id="${produit.id}" data-toggle="modal" data-target="#danger"><i class="feather icon-trash"></i></span>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- dataTable ends -->

                <!-- add new sidebar starts -->
                <div class="add-new-data-sidebar">
                    <div class="overlay-bg"></div>
                    <div class="add-new-data">
                        <form action="index" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="type" value="addProduit">
                        <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                            <div>
                                <h4 class="text-uppercase">Thumb View Data</h4>
                            </div>
                            <div class="hide-data-sidebar">
                                <i class="feather icon-x"></i>
                            </div>
                        </div>
                        <div class="data-items pb-3 ps">
                            <div class="data-fields px-2 mt-3">
                                <div class="row">
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-id">ID Produit</label>
                                        <input type="text" name="pid" class="form-control" id="data-id">
                                    </div>
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-name">Name</label>
                                        <input type="text" name="pnom" class="form-control" id="data-name">
                                    </div>
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-description">Description</label>
                                        <textarea type="text" name="pdescription" class="form-control" id="data-description"></textarea>
                                    </div>
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-qte">Quantité</label>
                                        <input type="number" name="pqte" class="form-control" id="data-qte">
                                    </div>
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-prix">Prix</label>
                                        <input type="text" name="pprix" class="form-control" id="data-prix">
                                    </div>
                                    <div class="col-sm-12 data-field-col">
                                        <label for="data-category"> Categorie </label>
                                        <select class="form-control" name="pcategorie" id="data-category">
                                            <option value="ordPort">Ordinateurs Protables</option>
                                            <option value="ordBureau">Ordinateurs De Bureau</option>
                                            <option value="audioSon">Audio & Son</option>
                                            <option value="consoles">Consoles</option>
                                            <option value="accInfo">Accessoires Informatique</option>
                                            <option value="tele">Télephone</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-12 data-field-col data-list-upload">

                                            <input type="file" name="pimage">

                                    </div>
                                </div>
                            </div>
                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
                            </div>
                        </div>
                        <div class="add-data-footer d-flex justify-content-around px-3 mt-2">
                            <div class="add-data-btn">
                                <button class="btn btn-primary waves-effect waves-light" type="submit" >Add Data</button>
                            </div>
                            <div class="cancel-data-btn">
                                <button type="reset" class="btn btn-outline-danger waves-effect waves-light">Cancel</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <%-- are you sure deleting --%>
                <div class="modal fade text-left" id="danger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel12" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-danger white">
                                <h5 class="modal-title" id="myModalLabel12">Danger</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h1>Are you sure? </h1><p>Supprimer le produit <span id="produitIdDelete"></span></p>
                            </div>
                            <div class="modal-footer">
                                <form action="index" method="post">
                                    <input type="hidden" value="deleteProduit" name="type">
                                    <input id="inputProduitId" type="hidden" name="produitId">
                                    <button type="submit" class="btn btn-danger">Accept</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- are you sure deleting --%>

                <%-- edit modal starts--%>

                <div class="modal fade text-left" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel160" style="display: none;" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary white">
                                <h5 class="modal-title" id="myModalLabel160">Primary Modal</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <form action="index" method="post" class="form form-horizontal" enctype="multipart/form-data">
                                <input hidden name="type" value="editProduit">
                                <input hidden name="oldpid" id="moldpid" >
                            <div class="modal-body">

                                    <div class="form-body">
                                        <div class="row">

                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>ID Produit</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input type="text" disabled="true" id="mpid" class="form-control" name="pid" placeholder="Product Name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Nom</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input type="text" id="mpnom" class="form-control" name="pnom" placeholder="Product Name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Description</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <textarea type="" id="mpdes" class="form-control" name="pdes" placeholder="Description"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Quantité</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input type="number" id="mpqte" class="form-control" name="pqte" placeholder="Quantity">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Prix</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input type="text" id="mpprix" class="form-control" name="pprix" placeholder="Price">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Categorie</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <select class="form-control" id="mpcat" name="pcat" >
                                                            <option value="ordPort">Ordinateurs Protables</option>
                                                            <option value="ordBureau">Ordinateurs De Bureau</option>
                                                            <option value="audioSon">Audio & Son</option>
                                                            <option value="consoles">Consoles</option>
                                                            <option value="accInfo">Accessoires Informatique</option>
                                                            <option value="tele">Télephone</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group row">
                                                    <div class="col-md-4">
                                                        <span>Image</span>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input type="file" id="mpimage" class="form-control" name="pimage" placeholder="Select Image">
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary waves-effect waves-light" >Edit</button>

                            </div>
                            </form>
                        </div>
                    </div>
                </div>

<%--                edit modal ends--%>


                <!-- add new sidebar ends -->
            </section>
            <!-- Data list view end -->

        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
      <%@include file="includes/footer.jsp" %>
    <!-- BEGIN: Footer-->


</body>

<script>
    $(".deleteProduitButton").on("click", function() {
        let id = $(this).attr("id");
        console.log(id)
        document.getElementById("produitIdDelete").innerHTML = id;
        document.getElementById("inputProduitId").setAttribute("value", id);
    })

    $(".editProduitButton").on("click", function() {
        let id = $(this).attr("id");
        let nom = $("#pnom-"+id).text();
        let categorie = $("#pcat-"+id).text();
        let prix = $("#pprice-"+id).text();
        let qte = $("#pqte-"+id).text();
        let des = $("#pdes-"+id).text();
        let image = $("#pimage-"+id).text();
        $("#moldpid").val(id);
        $("#mpnom").val(nom);
        $("#mpdes").val(des);
        $("#mpprix").val(prix);
        $("#mpqte").val(qte);
        $("#mpid").val(id);
        // $("#mpimage").val(image);
        console.log(categorie);
        $("#mpcat").val(categorie).change();
    })
</script>
<!-- END: Body-->

</html>