<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Greenwood University</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link href="assets/css/style.css" rel="stylesheet">

<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    </head>
    <body>
<input type="hidden" id="status" name="status" value="<%= request.getAttribute("sentstatus")%>">
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/logo.png" class="bi me-2" width="30" height="39">
        <span class="fs-4">Greenwood University</span>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/about.jsp" class="nav-link px-2 link-dark">About</a></li>
        <li><a href="${pageContext.request.contextPath}/events.jsp" class="nav-link px-2 link-dark">Events</a></li>
        <li><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-secondary">Contact</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <a href="${pageContext.request.contextPath}/login.jsp"><button type="button" class="btn btn-outline-success me-2">Login</button></a>
        <a href="${pageContext.request.contextPath}/faq.jsp"><button type="button" class="btn btn-success">Help</button></a>
      </div>
    </header>
  </div>
    <p style="text-align: center" class="display-5">Contact Us</p>
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2968.4167509904605!2d123.4024463512704!3d41.92689537911633!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5e2566e6a57e1b2b%3A0x9359d26534cfa6fe!2z5rKI6Ziz6Iiq56m66Iiq5aSp5aSn5a2m!5e0!3m2!1sen!2sus!4v1641353261677!5m2!1sen!2sus" width="300" frameborder="0" allowfullscreen></iframe>
      </div>

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p>37 Daoyi South Avenue, Shenyang, Liaoning, China 110136/p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>greenwooduniversity@126.com</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>8624-89734578</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="contact" method="post" role="form" class="php-email-form">
              <input type="hidden" name="action" value="contact">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->
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
  <div class="modal fade" id="exampleModalDefault" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Send <%= request.getAttribute("sentstatus")%></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div id="placeHolder" class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

          <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
          <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
          <script src="assets/vendor/aos/aos.js"></script>
          <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
          <script src="assets/js/main.js"></script>
          <script>
        window.onload = function () {
        const alertPlaceholder = document.getElementById('placeHolder')
        var status = $('#status').val();
        if(status==="success"){
            const wrapper = document.createElement('p')
            wrapper.innerHTML = [
              '<p>Your mail was sent successfully.</p>'
            ].join('')

            alertPlaceholder.append(wrapper)
            OpenBootstrapPopup();
        } else if(status==="failed"){
            const wrapper = document.createElement('p')
            wrapper.innerHTML = [
              '<p>Your mail was not successfully sent. Please try again.</p>'
            ].join('')

            alertPlaceholder.append(wrapper)
            OpenBootstrapPopup();
        }
        };
        function OpenBootstrapPopup() {
            $("#exampleModalDefault").modal('show');
        }
          
          </script>
    </body>
</html>
