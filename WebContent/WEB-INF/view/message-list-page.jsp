<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/jquery-ui/jquery-ui.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/jquery-ui/jquery-ui.theme.min.css">
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
            <h1>Messages</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item">Messages</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Messages</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered">
                  <thead>                  
                    <tr>
                      <th class="text-center">Status</th>
                      <th class="text-center">Name</th>
                      <th class="text-center">Subject</th>
                      <th class="text-center">Email</th>
                      <th class="text-center">Message</th>
                      <th class="text-center">Date and time</th>
                      <th class="text-center">Actions</th>
                    </tr>
                  </thead>
                  <c:forEach items="${messageList }" var="message">
	                  <tbody id="sort-list">
	                    <tr>
						  <td>
	                        ${message.seen == true ? 'Seen' : 'Not Seen' }
	                      </td>
	                      <td>
	                        ${message.name }
	                      </td>
	                      <td>
	                        ${message.subject }
	                      </td>
	                      <td>
	                      	${message.email }
	                      </td>
	                      <td style="max-width: 300px;">
	                        ${message.message }
	                      </td>
	                      <td class="text-center" style="width: 12%;">
	                      	${message.date }
	                      </td>
	                      <td class="text-center">
	                        <div class="btn-group"> 
	                          <a href="message-seen-update?id=${message.id }" class="btn btn-secondary">
                            	<i class="${message.seen == false ? 'far fa-eye-slash' : 'far fa-eye'}"></i>
                              </a>
	                          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete-modal-${message.id }">
	                            <i class="fas fa-trash"></i>
	                          </button>
	                        </div>
	                      </td>
	                    </tr>
	                    <div class="modal fade" id="delete-modal-${message.id }">
					      <div class="modal-dialog">
					        <div class="modal-content">
					          <div class="modal-header">
					            <h4 class="modal-title">Delete message?</h4>
					            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					              <span aria-hidden="true">&times;</span>
					            </button>
					          </div>
					          <div class="modal-body">
					            <p>Are you sure you want to delete selected message?</p>
					            <strong></strong>
					          </div>
					          <div class="modal-footer justify-content-between">
					            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					            <a href="message-delete?id=${message.id }" class="btn btn-danger">Delete</a>
					          </div>
					        </div>
					        <!-- /.modal-content -->
					      </div>
					      <!-- /.modal-dialog -->
					    </div>
	                  </tbody>
                  </c:forEach>
                </table>
              </div>
              <!-- /.card-body -->
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
<script src="${pageContext.request.contextPath }/plugins/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>


</body>
</html>