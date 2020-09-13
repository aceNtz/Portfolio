<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>${userInfo.name } | Portfolio</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    
     <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <!-- Notifications -->
	  <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">${unreadCounter }</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="message-list?pageId=0" class="dropdown-item dropdown-footer">Show Notifications</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a class="dropdown-item">
           <!-- Message Start -->
            <div class="media align-items-center">
            <c:if test="${userInfo.image == null || userInfo.image == ''}">
              <img src="https://via.placeholder.com/40x25" alt="" class="img-fluid">
            </c:if>
            <c:if test="${userInfo.image != null && userInfo.image != ''}">
              <img src="${userInfo.image }" alt="User Avatar" class="img-size-50 mr-3 img-circle">
            </c:if>
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  <b>${userInfo.name }</b>
                </h3>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <div class="dropdown-divider"></div>
          <a href="${pageContext.request.contextPath }/login.html" class="dropdown-item">
            <form:form action="${pageContext.request.contextPath }/logout">
             <input type="submit" value="Sign out">
            </form:form>
         </a>
        </div>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="user-info" class="brand-link">
      <img src="" alt="" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">${userInfo.name }</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <!--  sec:authorize access="hasRole('admin')"-->
	          <li class="nav-item has-treeview">
	            <a href="user-info" class="nav-link">
	              <p>
	                User Info
	              </p>
	            </a>
	          </li>
          <!--  /sec:authorize -->
          <!--  sec:authorize access="hasRole('admin')"-->
	          <li class="nav-item has-treeview">
	            <a href="" class="nav-link">
	              <p>
	                Messages
	                <i class="right fas fa-angle-left"></i>
	              </p>
	            </a>
	            <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="message-list?pageId=${ -1}" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>All Messages</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="message-list?pageId=${ 0}" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Not Seen Messages</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="message-list?pageId=${ 1}" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Seen Messages</p>
	                </a>
	              </li>
	            </ul>
	          </li>
          <!--  /sec:authorize -->
          <!-- sec:authorize access="hasRole('admin')" -->
	          <li class="nav-item has-treeview">
	            <a href="#" class="nav-link">
	              <p>
	                Projects
	                <i class="right fas fa-angle-left"></i>
	              </p>
	            </a>
	            <ul class="nav nav-treeview">
	              <li class="nav-item">
	                <a href="project-list" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Project List</p>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a href="project-add" class="nav-link">
	                  <i class="far fa-circle nav-icon"></i>
	                  <p>Add Project</p>
	                </a>
	              </li>
	            </ul>
	          </li>
          <!--  /sec:authorize-->
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Add Project</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a>Projects</a></li>
              <li class="breadcrumb-item active">Add Project</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Add Project</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form:form action="project-save" modelAttribute="project" role="form">
              <form:hidden path="id"/>
              <form:hidden path="visible"/>
              <form:hidden path="dateAdded"/>
                <div class="card-body">
                  <div class="form-group">
                    <label>Name</label>
                    <form:input path="name" type="text" class="form-control" placeholder="Enter Project Name"/>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <form:input path="description" type="text" class="form-control" placeholder="Add Description"/>
                  </div>
                  <div class="form-group">
                    <label>Link Project</label>
                     <form:input path="link" type="text" class="form-control" placeholder="Link Project"/>
                  </div>
                  <div class="form-group">
                    <label>Image</label>
                     <form:input path="image" type="text" class="form-control" placeholder="Add Image"/>
                  </div>
                  <div class="custom-control custom-checkbox">
                    <form:checkbox class="custom-control-input" id="customCheckbox2" path="important"/>
                    <label for="customCheckbox2" class="custom-control-label">Important?</label>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Save</button>
                </div>
              </form:form>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- Default to the left -->
    <strong>Copyright &copy; 2020 <a href="#">Pavle Janjic</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
</body>
</html>
