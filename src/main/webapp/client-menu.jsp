<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="models.Client" %>
<div class="main-menu-content ps ps--active-y">
  <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
    <li class="nav-item"><a href="${pageContext.request.contextPath}/index?page=home"><i class="feather icon-home"></i><span class="item" data-i18n="Dashboard">Home</span><span
            class="badge badge badge-warning badge-pill float-right mr-2"></span></a>
    </li>
    <li class="nav-item"><a href="${pageContext.request.contextPath}/index?page=panier"><i class="feather icon-shopping-cart"></i><span class="item" data-i18n="Dashboard">Panier</span><span
            class="badge badge badge-warning badge-pill float-right mr-2">
      <%
        Cookie[] co = request.getCookies();
        int nbrElement = 0;
        for(Cookie c: co) {
          if(c.getName().equals("panier") && !c.getValue().equals("")) {
            String[] cookieValue = c.getValue().split("-");
            for(String s: cookieValue) {
              String[] prodEtClient = s.split("/");
              if(prodEtClient[1].equals(((Client) session.getAttribute("client")).getLogin())) {
                nbrElement++;
              }
            }
          }
        }
        out.println(""+nbrElement);
      %>
    </span></a>
    </li>
    <li class="nav-item has-sub sidebar-group-active"><a href="#"><i class="feather icon-tag"></i><span class="menu-title" data-i18n="Ecommerce">Categories</span></a>
      <ul class="menu-content" style="">
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=ordPort"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Ordinateurs Protables</span></a>
        </li>
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=ordBureau"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Ordinateurs  Bureau</span></a>
        </li>
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=audioSon"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Audio & Son</span></a>
        </li>
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=consoles"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Consoles</span></a>
        </li>
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=accInfo"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Accesoires Informatique</span></a>
        </li>
        <li class=""><a href="${pageContext.request.contextPath}/index?page=shop&category=tele"><i class="feather icon-circle"></i><span class="menu-item" data-i18n="Shop">Telephones</span></a>
        </li>


      </ul>
    </li>
    <li class="nav-item"><a href="${pageContext.request.contextPath}/index?page=editUser"><i class="feather icon-user"></i><span class="item" data-i18n="Dashboard">Edit profile</span><span
            class="badge badge badge-warning badge-pill float-right mr-2"></span></a>
    </li>
  </ul>
  <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
    <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
  </div>
  <div class="ps__rail-y" style="top: 0px; height: 218px; right: 0px;">
    <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 17px;"></div>
  </div>
</div>