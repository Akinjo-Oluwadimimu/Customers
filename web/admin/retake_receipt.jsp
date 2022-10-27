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
      <h1>Retake Receipt</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/admin.jsp">Home</a></li>
          <li class="breadcrumb-item">Applications</li>
          <li class="breadcrumb-item active">Retake Receipt</li>
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
                    <li><a href="#" class="dropdown-item">Print</a></li>
                    <li><a href="#" id="downloadPDF" class="dropdown-item">Save as PDF</a></li>
                    <li><a href="#" id="tests" onclick="javascript:fnExcelReport();" class="dropdown-item">Export to Excel</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Applications  <span>| Retake Receipt</span></h5>

                  <table class="table table-bordered datatable" id="example2">
                    <thead>
                        <tr>    
                        <th>SN</th>
                        <th>Class Number</th>
                        <th>Student Number</th>
                        <th>Ch Name</th>
                        <th>English Name</th>
                        <th>Receipt</th>
                        <th>Submission Date</th>
                        <th>Approved</th>
                    </tr>
                    <c:forEach var="receipt" items="${retakeReceiptInformationList}">
                    <tr>     
                        <td>${receipt.sn}</td>
                        <td>${receipt.classid}</td>
                        <td>${receipt.id}</td>
                        <td>${receipt.cnname}</td>
                        <td>${receipt.engname}</td>
                        <td><a href="D:\GreenwoodUniversity\RetakeReceipt\<c:out value='${receipt.classid}'/>\<c:out value='${receipt.receipt}'/>">${receipt.cnname}</a></td>
                        <td>${receipt.submissionDate}</td>
                        <td><input type="checkbox" disabled <c:if test="${receipt.approved == true}">checked</c:if>></td>
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

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/asset/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/chart.js/chart.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/quill/quill.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/asset/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery-1.9.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/vendor/jquery-ui-1.10.3.js"></script>
  
  <script src="${pageContext.request.contextPath}/asset/js/main.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha256-c3RzsUWg+y2XljunEQS0LqWdQ04X1D3j22fd/8JCAKw=" crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
      $('select').selectize({
          sortField: 'text'
      });
  });
  
function fnExcelReport() {
            var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
            tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';
    
            tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
    
            tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
            tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
    
            tab_text = tab_text + "<table>";
            tab_text = tab_text + $('#example2').html();
            tab_text = tab_text + '</table></body></html>';
    
            var data_type = 'data:application/vnd.ms-excel';
    
            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");
    
            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
                if (window.navigator.msSaveBlob) {
                    var blob = new Blob([tab_text], {
                        type: "application/csv;charset=utf-8;"
                    });
                    navigator.msSaveBlob(blob, 'Test file.xls');
                }
            } else {
                $('#tests').attr('href', data_type + ', ' + encodeURIComponent(tab_text));
                $('#tests').attr('download', 'Test file.xls');
            }
        }
        
let doc = new jsPDF('portrait', 'pt', 'a4');
let stbtn = document.getElementById('downloadPDF');

let conteudo1 = document.getElementById('example2');
stbtn.addEventListener('click', function() {
  doc.addHTML(conteudo1, 0, 10, function() {
    var blob = doc.output("blob");
    window.open(URL.createObjectURL(blob));
  });
});    

window.onload = function () {
var status = $('#status').val();
    if(status==="success"){
        OpenBootstrapPopup();
    }
    };
    function OpenBootstrapPopup() {
        $("#alert").modal('show');
    }
              </script>
</body>

</html>