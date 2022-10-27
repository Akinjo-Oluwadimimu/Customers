<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Password</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>       
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
        <li><a href="${pageContext.request.contextPath}/events.jsp" class="nav-link px-2 link-dark">Events</a></li>
        <li><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="${pageContext.request.contextPath}/contact.jsp" class="nav-link px-2 link-dark">Contact</a></li>
      </ul>

      <div class="col-md-3 text-end">
      </div>
    </header>
  </div>
  <p style="text-align: center" class="display-6">Welcome! Please kindly set up your password</p>
<article class="my-3" id="validation">
    <div id='containers' class="container">
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <form action="setPassword" method="post" class="row g-3">
          <input type="hidden" name="action" value="setPassword">
          <div class="col-md-12">
            <label for="password" class="form-label">Password</label>
            <input type="password" name="password" class="form-control is-invalid" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Must contain at least one number and one uppercase and lowercase letter, at least 8 characters and at most 15 characters" required>
          </div>
          <div class="col-md-12">
            <label for="confirmpassword" class="form-label">Confirm Password</label>
            <input type="password" name="confirmpassword" class="form-control is-invalid" oninvalid="passwordValidation(this);" oninput="passwordValidation(this);" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}" title="Password and confirmed password must match" id="confirmpassword" required>
            <div id="letter" class="invalid-feedback">
              Password must contain a lowercase letter
            </div>
            <div id="capital" class="invalid-feedback">
              Password must contain an uppercase letter
            </div>
            <div id="number" class="invalid-feedback">
              Password must contain a number
            </div>
            <div id="minlength" class="invalid-feedback">
              Password must be at least 8 characters long
            </div>
            <div id="maxlength" class="invalid-feedback">
              Password must be at most 15 characters long
            </div>
            <div id="pswmatch" class="invalid-feedback">
              Passwords must match
            </div>
          </div>
          <div class="col-12 d-flex justify-content-center">
            <button class="btn btn-success" type="submit">Submit</button>
          </div>
        </form>
        </div></div>

      </div>
    </article>
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
        <h1 class="modal-title fs-5" id="exampleModalLabel">Validation Successful</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <p>Please set up a new password for your account.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
        <script>
window.onload = function () {
var status = $('#status').val();
    if(status==="success"){
        OpenBootstrapPopup();
    }
    };
    function OpenBootstrapPopup() {
        $("#exampleModalDefault").modal('show');
    }
   
var password = document.getElementById("password");
var confirmpassword = document.getElementById("confirmpassword");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var minlength = document.getElementById("minlength");
var maxlength = document.getElementById("maxlength");
var x=0;

// When the user starts to type something inside the password field
password.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(password.value.match(lowerCaseLetters)) {
    letter.classList.remove("invalid-feedback");
    letter.classList.add("valid-feedback");
    x1=1;
  } else {
    letter.classList.remove("valid-feedback");
    letter.classList.add("invalid-feedback");
    x1=0;
}

  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(password.value.match(upperCaseLetters)) {
    capital.classList.remove("invalid-feedback");
    capital.classList.add("valid-feedback");
    x2=1;
  } else {
    capital.classList.remove("valid-feedback");
    capital.classList.add("invalid-feedback");
    x2=0;
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(password.value.match(numbers)) {
    number.classList.remove("invalid-feedback");
    number.classList.add("valid-feedback");
    x3=1;
  } else {
    number.classList.remove("valid-feedback");
    number.classList.add("invalid-feedback");
    x3=0;
  }

  // Validate minimum length
  if(password.value.length >= 8) {
    minlength.classList.remove("invalid-feedback");
    minlength.classList.add("valid-feedback");
    x4=1;
  } else {
    minlength.classList.remove("valid-feedback");
    minlength.classList.add("invalid-feedback");
    x4=0;
  }
  
  // Validate maximum length
  if(password.value.length <= 15 && password.value !== "") {
    maxlength.classList.remove("invalid-feedback");
    maxlength.classList.add("valid-feedback");
    x5=1;
  } else {
    maxlength.classList.remove("valid-feedback");
    maxlength.classList.add("invalid-feedback");
    x5=0;
  }
  if(x1===1&&x2===1&&x3===1&&x4===1&&x5===1){
      password.classList.remove("is-invalid");
      password.classList.add("is-valid");
  } else{
      password.classList.remove("is-valid");
      password.classList.add("is-invalid");
  } 
};
  

confirmpassword.onkeyup = function() {
  // Validate confirm password
  if(password.value === confirmpassword.value && password.value !== "") {
    pswmatch.classList.remove("invalid-feedback");
    pswmatch.classList.add("valid-feedback");
    confirmpassword.classList.remove("is-invalid");
    confirmpassword.classList.add("is-valid");
  } else {
    pswmatch.classList.remove("valid-feedback");
    pswmatch.classList.add("invalid-feedback");
    confirmpassword.classList.remove("is-valid");
    confirmpassword.classList.add("is-invalid");
  }
};

function passwordValidation(textbox)  {
	var x = document.getElementById("password").value;
	var y = document.getElementById("confirmpassword").value;
	if(x!==y || x===''){
		textbox.setCustomValidity
                      ('Password and confirmed password must match');
                      pswmatch.classList.remove("valid-feedback");
                      pswmatch.classList.add("invalid-feedback");
                      confirmpassword.classList.remove("is-valid");
                      confirmpassword.classList.add("is-invalid");
		return false;
		}
	textbox.setCustomValidity
                      ('');
        pswmatch.classList.remove("invalid-feedback");
        pswmatch.classList.add("valid-feedback");
        confirmpassword.classList.remove("is-invalid");
        confirmpassword.classList.add("is-valid");      
	return true;
	}
        
        
        </script>
    </body>
</html>
