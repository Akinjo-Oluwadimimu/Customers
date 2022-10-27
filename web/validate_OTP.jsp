<% if(session.getAttribute("useremail")==null){
    response.sendRedirect("login.jsp");}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
            .height-100{
                height:100vh
            }
            .card{
                width:400px;
                border:none;
                height:300px;
                box-shadow: 0px 5px 20px 0px #d2dae3;
                z-index:1;
                display:flex;
                justify-content:center;
                align-items:center
            }
            .card h6{
                color:green;
                font-size:20px
            }
            .inputs input{
                width:40px;
                height:40px
            }
            input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button{
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;margin: 0
            }
            .card-2{
                background-color:#fff;
                padding:10px;
                width:350px;
                height:100px;
                bottom:-50px;
                left:20px;
                position:absolute;
                border-radius:5px
            }
            .card-2 .content{
                margin-top:50px
            }
            .card-2 .content a{
                color:green
            }
            .form-control:focus{
                box-shadow:none;
                border:2px solid green
            }
            .validate{
                border-radius:20px;
                height:40px;
                background-color:green;
                border:1px solid green;
                width:140px
            }
            .inline {
        display: inline;
      }
      .link-button {
        background: none;
        border: none;
        color: green;
        text-decoration: none;
        cursor: pointer;
        font-size: 1em;
        font-family: serif;
      }
      .link-button:focus {
        outline: none;
      }
      .link-button:active {
        color:red;
      }
        </style>
    </head>
    <body class="py-4">
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
        <li><a href="${pageContext.request.contextPath}/events.jsp" class="nav-link px-2 link-dark">Events</a></li>
        <li><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link px-2 link-dark">Contact</a></li>
      </ul>

      <div class="col-md-3 text-end"> 
          
      </div>
    </header>
  </div>
<main class="bg-light">
<div class="container height-100 d-flex justify-content-center align-items-center"> 
    <div class="position-relative"> 
        <div class="card p-2 text-center"> 
            <h6>Please enter the one time password 
                <br> to verify your account</h6> 
            <div> <span>A code has been sent to</span> <br>
                <small>${email}</small> </div> 
                <form action="validateOtp" method="post">
                <input type="hidden" name="action" value="validateOtp">
            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                <input class="m-2 text-center form-control rounded" name="first" type="text" id="first" maxlength="1"required/> 
                <input class="m-2 text-center form-control rounded" name="second" type="text" id="second" maxlength="1" required/> 
                <input class="m-2 text-center form-control rounded" name="third" type="text" id="third" maxlength="1" required/> 
                <input class="m-2 text-center form-control rounded" name="fourth" type="text" id="fourth" maxlength="1" required/> 
                <input class="m-2 text-center form-control rounded"  name="fifth" type="text" id="fifth" maxlength="1" required/> 
                <input class="m-2 text-center form-control rounded"  name="sixth" type="text" id="sixth" maxlength="1" required/> 
            </div> 
                <div class="mt-4"> 
                    <button type="submit" class="btn btn-success px-4 validate">Validate</button> 
                </div>
                </form>
            
        </div> 
        <div class="card-2"> 
            <div class="content d-flex justify-content-center align-items-center"> 
                <span>Didn't get the code?</span> 
                <form method="post" action="validateEmail" class="inline">
                    <input type="hidden" name="action" value="validateEmail">
                    <input type="hidden" name="username" value="${username}">
                    <input type="hidden" name="email" value="${useremail}">
                    <button type="submit" name="submit_param" value="submit_value" class="link-button">
                      Resend
                    </button>
                </form>
            </div> 
        </div> 
    </div>
</div>
</main>
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
        <h1 class="modal-title fs-5" id="exampleModalLabel">Validation Failed</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <p>The password you have entered is wrong. Please try again.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function(event) {
  
  function OTPInput() {
const inputs = document.querySelectorAll('#otp > *[id]');
for (let i = 0; i < inputs.length; i++) { inputs[i].addEventListener('keydown', function(event) { if (event.key==="Backspace" ) { inputs[i].value='' ; if (i !==0) inputs[i - 1].focus(); } else { if (i===inputs.length - 1 && inputs[i].value !=='' ) { return true; } else if (event.keyCode> 47 && event.keyCode < 58) { inputs[i].value=event.key; if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } else if (event.keyCode> 64 && event.keyCode < 91) { inputs[i].value=String.fromCharCode(event.keyCode); if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } } }); } } OTPInput();

    
});
window.onload = function () {
var status = $('#status').val();
    if(status==="failed"){
        OpenBootstrapPopup();
    }
    };
    function OpenBootstrapPopup() {
        $("#exampleModalDefault").modal('show');
    }

        </script>
    </body>
</html>
