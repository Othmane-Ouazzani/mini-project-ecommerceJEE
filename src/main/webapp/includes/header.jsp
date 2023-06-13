<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu floating-nav navbar-light navbar-shadow bg-primary">
  <div class="navbar-wrapper">
    <div class="navbar-container content">
      <div class="navbar-collapse" id="navbar-mobile">
        <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
          <ul class="nav navbar-nav">
            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
          </ul>
          <ul class="nav navbar-nav bookmark-icons">

          </ul>

        </div>
        <ul class="nav navbar-nav float-right">

          <li class="nav-item d-none d-lg-block"><a class="nav-link nav-link-expand"><i class="ficon feather icon-maximize"></i></a></li>
          <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
            <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600"><c:out value="${client.nom} ${client.prenom}"/></span><span class="user-status">Available</span></div><span><img class="round" src="app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
          </a>
            <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/index?page=editUser"><i class="feather icon-settings"></i> Edit Profile</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/index?page=logout"><i class="feather icon-power"></i> Logout</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<ul class="main-search-list-defaultlist-other-list d-none">
  <li class="auto-suggestion d-flex align-items-center justify-content-between cursor-pointer"><a class="d-flex align-items-center justify-content-between w-100 py-50">
    <div class="d-flex justify-content-start"><span class="mr-75 feather icon-alert-circle"></span><span>No results found.</span></div>
  </a></li>
</ul>
