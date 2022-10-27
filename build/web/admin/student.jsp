<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Student List</title>

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/asset/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/asset/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/asset/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/assets/vendor/fullcalendar/fullcalendar.css" rel="stylesheet" media="screen">
<style>
            #example2{
                margin: 0 auto;
                background-color: #ffffff;
              }
        </style>
</head>

<body>
<input type="hidden" id="status" name="status" value="<%= request.getAttribute("status")%>">
  <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/logo.png" class="bi me-2" width="30" height="39">
        <span class="d-none text-dark d-lg-block fs-4">Greenwood University</span>
      </a>
      
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

      <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number">4</span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have 4 new notifications
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-exclamation-circle text-warning"></i>
              <div>
                <h4>Retake Application</h4>
                <p>Peter Davies, 195152010903 applied for course retake</p>
                <p>30 min. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-x-circle text-danger"></i>
              <div>
                <h4>Modified Profile</h4>
                <p>Akinjo Oluwadimimu Oluwadabira modified her personal information</p>
                <p>1 hr. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-check-circle text-success"></i>
              <div>
                <h4>Message Delivery</h4>
                <p>Your message had been delivered successfully</p>
                <p>2 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="notification-item">
              <i class="bi bi-info-circle text-primary"></i>
              <div>
                <h4>Pending Approvals</h4>
                <p>You have 5 pending approvals</p>
                <p>4 hrs. ago</p>
              </div>
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="#">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->

        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-chat-left-text"></i>
            <span class="badge bg-success badge-number">3</span>
          </a><!-- End Messages Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
            <li class="dropdown-header">
              You have 3 new messages
              <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${pageContext.request.contextPath}/asset/img/messages-1.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Maria Hudson</h4>
                  <p>I have applied for result rechecking. I want to confi...</p>
                  <p>4 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${pageContext.request.contextPath}/asset/img/messages-2.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>Anna Nelson</h4>
                  <p>My fee statement is yet to be updated, I settled my fees...</p>
                  <p>6 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="message-item">
              <a href="#">
                <img src="${pageContext.request.contextPath}/asset/img/messages-3.jpg" alt="" class="rounded-circle">
                <div>
                  <h4>David Muldon</h4>
                  <p>Hello...</p>
                  <p>8 hrs. ago</p>
                </div>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li class="dropdown-footer">
              <a href="#">Show all messages</a>
            </li>

          </ul><!-- End Messages Dropdown Items -->

        </li><!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">
              <a href="#" class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                  <i class="bi bi-person"></i>
              </a>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Kevin Anderson</h6>
              <span>Administrator</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/faq.jsp">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->
    </header>

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/admin.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link" data-bs-target="#students-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-people"></i><span>Students</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="students-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/admin/student_list.jsp">
              <i class="bi bi-circle"></i><span>Student List</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/student.jsp">
              <i class="bi bi-circle"></i><span>New Student</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/student.jsp">
              <i class="bi bi-circle"></i><span>Modify Information</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/student.jsp">
              <i class="bi bi-circle"></i><span>Delete Information</span>
            </a>
          </li>
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#lecturers-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Lecturers</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="lecturers-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/admin/lecturer_list.jsp">
              <i class="bi bi-circle"></i><span>Lecturer List</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/lecturer.jsp">
              <i class="bi bi-circle"></i><span>New Lecturer</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/lecturer.jsp">
              <i class="bi bi-circle"></i><span>Modify Information</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/lecturer.jsp">
              <i class="bi bi-circle"></i><span>Delete Information</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#applications-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Applications</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="applications-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/admin/course_retake.jsp">
              <i class="bi bi-circle"></i><span>Course Retake</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/retake_receipt.jsp">
              <i class="bi bi-circle"></i><span>Retake Receipt</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/result_rechecking.jsp">
              <i class="bi bi-circle"></i><span>Result Rechecking</span>
            </a>
          </li>
        </ul>
      </li><!-- End Tables Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#graduation-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart"></i><span>Graduation Progress</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="graduation-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/admin/graduation_progress.jsp">
              <i class="bi bi-circle"></i><span>Students Progress</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/admin/graduation_task.jsp">
              <i class="bi bi-circle"></i><span>Task Setting</span>
            </a>
          </li>
        </ul>
      </li><!-- End Charts Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="users-profile.html">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Student Information Management</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/admin.jsp">Home</a></li>
          <li class="breadcrumb-item">Students</li>
          <li class="breadcrumb-item active">Student Information Management</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

            

            <!-- Recent Sales -->
            <div class="col-12">
              <div class="card recent-sales overflow-auto">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Tools</h6>
                    </li>
                    <li><a href="#" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#addStudent">Add Student</a></li>
                            <li><form action="modify" method="post">
                                    <input type="hidden" name="action" value="modify">
                                    <a href="#" id="downloadPDF" class="dropdown-item">Modify Information</a></form></li>
                    <li><a href="#" id="tests" onclick="javascript:fnExcelReport();" class="dropdown-item">Delete Information</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Student  <span>| Information Management</span></h5>

                  <table class="table table-bordered datatable" id="example2">
                    <thead>
                        <tr>
                            <th></th>
                            <th>English Name</th>
                            <th>CN Name</th>
                            <th>Class ID</th>
                            <th>Student ID</th>
                            <th>Country</th>
                            <th>Passport ID</th>
                            <th>Gender</th>
                            <th>DOB</th>
                            <th>Phone</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${studentList}">
                        <tr>
                            <td><input type="checkbox" class="form-check-input checkbox" id="exampleCheck1" value="${student.sn}"></td>
                            <td>${student.engName}</td>
                            <td>${student.cnName}</td>
                            <td>${student.classid}</td>
                            <td>${student.id}</td>
                            <td>${student.nationality}</td>
                            <td>${student.passportNo}</td>
                            <td>${student.gender}</td>
                            <td>${student.dob}</td>
                            <td>${student.phone}</td>
                            <td>${student.email}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div><!-- End Recent Sales -->

      </div>
    </section>

  </main><!-- End #main -->
 <section>
      <div class="container">
  <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
    <div class="col mb-3">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/nobglogo.png" class="bi me-2" width="30" height="39">
      </a>
      <p class="text-muted">&copy; 2022</p>
    </div>

    <div class="col mb-3">

    </div>

    <div class="col mb-3">
      <h5>Suggested Links</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link p-0 text-muted">Home</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link p-0 text-muted">About</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link p-0 text-muted">FAQs</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/events.jsp" class="nav-link p-0 text-muted">Events</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link p-0 text-muted">Contact</a></li>
      </ul>
    </div>

    <div class="col mb-3">
      <h5>Useful Links</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/applications/official_documents.jsp" class="nav-link p-0 text-muted">Document Request</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/tools/recommendations.jsp" class="nav-link p-0 text-muted">Recommendations</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/student/progress_tracker.jsp" class="nav-link p-0 text-muted">Progress Tracker</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/tools/gp_calculator.jsp" class="nav-link p-0 text-muted">GPA Calculator</a></li>
        <li class="nav-item mb-2"><a href="${pageContext.request.contextPath}/tools/cv_generator.jsp" class="nav-link p-0 text-muted">CV Generator</a></li>
      </ul>
    </div>

    <div class="col mb-3">
      <h5>Follow Us</h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="http://facebook.com" class="nav-link p-0 text-muted">Facebook</a></li>
        <li class="nav-item mb-2"><a href="http://twitter.com" class="nav-link p-0 text-muted">Instagram</a></li>
        <li class="nav-item mb-2"><a href="http://instagram.com" class="nav-link p-0 text-muted">Linkedin</a></li>
        <li class="nav-item mb-2"><a href="http://linkedin.html" class="nav-link p-0 text-muted">Twitter</a></li>
        <li class="nav-item mb-2"><a href="http://qq.html" class="nav-link p-0 text-muted">QQ</a></li>
      </ul>
    </div>
  </footer>
</div>
  </section>       
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
    
<div class="modal fade" id="addStudent" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">New Student</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
          <form action="newStudent" method="post">
          <div class="modal-body">
          <input type="hidden" name="action" value="newStudent">
          <div class="mb-3">
            <label for="engName" class="form-label">English Name</label>
            <input type="text" name="engName" class="form-control" required>
          </div>
          <div class="mb-3">
            <label for="cnName" class="form-label">Chinese Name</label>
            <input type="text" name="cnName" class="form-control" required>
          </div>
          <div class="mb-3">
            <label for="major" class="form-label">Major</label>
            <select class="operator" id="major" name="major" required>
              <option value="" selected>select..</option>
              <option value="Computer Science and Technology">Computer Science and Technology</option>
              <option value="Aeronautical Enginneering (Aircraft Manufacturing)">Aeronautical Enginneering (Aircraft Manufacturing)</option>
              <option value="Mechanical Engineering (Mechatronics)">Mechanical Engineering (Mechatronics)</option>
              <option value="International Economics and Trade">International Economics and Trade)</option>
              <option value="Telecommunication Engineering">Telecommunication Engineering</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="id" class="form-label">Class ID</label>
            <input type="text" name="classid" class="form-control" required>
          </div> 
          <div class="mb-3">
            <label for="id" class="form-label">Student ID</label>
            <input type="text" name="id" class="form-control" required>
          </div>
          <div class="mb-3">
            <label for="dob" class="form-label">Date of Birth</label>
            <input type="date" name="dob" class="form-control" required>
        </div>
            <div class="mb-3">
            <label for="gender" class="form-label">Gender</label>
            <select class="operator" id="gender" name="gender" required>
              <option value="" selected>select..</option>
              <option value="F">Female</option>
              <option value="M">Male</option>
            </select>
            </div>
            <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="tel" name="phone" class="form-control" required>
            </div>
          <div class="mb-3">
            <label for="select_page" class="form-label">Country</label>
            <select id="select_page" required class="operator" name="country" required>
               <c:forEach items="${countryList}" var="country">
                <option value="${country.name}" <c:if test="${country.name == nationality}"> selected </c:if>>${country.name}</option>
               </c:forEach>
            </select>
            </div>
            <div class="mb-3">
            <label for="passportNo" class="form-label">Passport Number</label>
            <input type="text" name="passportNo" class="form-control" required>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Add</button>
        </div>
        </form>
      </div>
    </div>
  </div>
   <div class="modal fade" id="alert" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Success</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Information added successfully.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/asset/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/chart.js/chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/tinymce/tinymce.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css"/>

  <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
 <script>
window.onload = function () {
var status = $('#status').val();
    if(status==="success"){
        OpenBootstrapPopup();
    }
    };
    function OpenBootstrapPopup() {
        $("#alert").modal('show');
    }
     $(document).ready(function () {
      $('select').selectize({
          sortField: 'text'
      });
  }); 
     
 $('input[type=checkbox]').change(function(){
    if($(this).is(':checked')){
$('input[type=checkbox]').attr('disabled',true);
    $(this).attr('disabled',false);
}
else{
$('input[type=checkbox]').attr('disabled',false);
}
});

 </script>
</body>

</html>