<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="status" name="status" value="<%= request.getAttribute("status")%>">
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/logo.png" class="bi me-2" width="30" height="39">
        <span class="fs-4">Greenwood University</span>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link px-2 link-dark">About</a></li>
        <li><a href="#" class="nav-link px-2 link-secondary">Events</a></li>
        <li><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link px-2 link-dark">Contact</a></li>
      </ul>

      <div class="col-md-3 text-end"> 
          
      </div>
    </header>
  </div>
  
   <section id="events" class="events">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-md-6 d-flex align-items-stretch">
            <div class="card">
              <div class="card-img">
                <img src="${pageContext.request.contextPath}/images/event-1.jpg" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="">Sports Meet</a></h5>
                <p class="fst-italic text-center">Sunday, September 26th at 7:00 pm</p>
                <p class="card-text">The annual sports meets would be held on the day aforementioned. Students from all the colleges in our school would be taking part in the several competitions that would be held.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 d-flex align-items-stretch">
            <div class="card">
              <div class="card-img">
                <img src="${pageContext.request.contextPath}/images/event-2.jpg" alt="...">
              </div>
              <div class="card-body">
                <h5 class="card-title"><a href="">Grand Chorus</a></h5>
                <p class="fst-italic text-center">Sunday, November 15th at 7:00 pm</p>
                <p class="card-text">Join other students in the partaking of the annual grand chorus which would be held at the University'</p>
              </div>
            </div>

          </div>
        </div>

      </div>
    </section>

<section class="bg-white">
      <div class="container">
  <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
    <div class="col mb-3">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/logo.png" class="bi me-2" width="30" height="39">
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
        <li class="nav-item mb-2"><a href="http://linkedin.com" class="nav-link p-0 text-muted">Twitter</a></li>
        <li class="nav-item mb-2"><a href="http://qq.com" class="nav-link p-0 text-muted">QQ</a></li>
      </ul>
    </div>
  </footer>
</div>
  </section>       
    </body>
</html>
