<% if(session.getAttribute("username")==null){
    response.sendRedirect("../login.jsp");}
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<fmt:formatDate var="month" value="${now}" pattern="MM" />
<fmt:formatDate var="day" value="${now}" pattern="dd" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Retake Application</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/brands.min.css" integrity="sha512-+oRH6u1nDGSm3hH8poU85YFIVTdSnS2f+texdPGrURaJh8hzmhMiZrQth6l56P4ZQmxeZzd2DqVEMqQoJ8J89A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
@import url("https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap")
;:root{--header-height: 3rem;
    --nav-width: 68px;
    --first-color: black;
    --first-color-light: rgba(0, 0, 0, .65);
    --white-color: #F7F6FB;
    --body-font: 'Nunito', sans-serif;
    --normal-font-size: 1rem;
    --z-fixed: 100
}
*,::before,::after{
    box-sizing: border-box
}
body{
    position: relative;
    margin: var(--header-height) 0 0 0;
    padding: 0 1rem;
    transition: .5s
}
a{
    text-decoration: none
}
.header{
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 1rem;
    background-color: var(--white-color);
    z-index: var(--z-fixed);
    transition: .5s
}
.header_toggle{
    color: var(--first-color);
    font-size: 1.5rem;
    cursor: pointer
}
.header_img{
    width: 35px;
    height: 35px;
    display: flex;
    justify-content: center;
    border-radius: 50%;
    overflow: hidden
}
.header_img img{
    width: 40px
}
.l-navbar{
    position: fixed;
    top: 0;
    left: -30%;
    width: var(--nav-width);
    height: 100vh;
    background-color: var(--first-color);
    padding: .5rem 1rem 0 0;
    transition: .5s;z-index: var(--z-fixed)
}
.navigation{
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: scroll;
}
.nav_logo, .nav_link{
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: 1rem;
    padding: .5rem 0 .5rem 1.5rem
}
.nav_logo{
    margin-bottom: 2rem
}
.nav_logo-icon{
    font-size: 1.25rem;
    color: var(--white-color)
}
.nav_logo-name{
    color: black;
    font-weight: 700
}
.nav_link{
    position: relative;
    color: var(--first-color-light);
    margin-bottom: 0rem;
    transition: .3s
}
.nav_link a{
    color: var(--first-color-light);
}
.nav_link:hover{
    color: rgba(0, 0, 0, .85);
}
.nav_icon{
    font-size: 1.25rem
}
.shownav{
    left: 0
}
.body-pd{
    padding-left: calc(var(--nav-width) + 1rem)
}
.active{
    color: black;
}
.active::before{
    content: '';
    position: absolute;
    left: 0;
    width: 2px;
    height: 32px;
    background-color: var(--white-color)
}
.height-100{
    height:100vh
}
.header #short {
    display: none;
}
#short.check {
    display: block;
}
#full.check {
    display: none;
    }
a.try:hover,
  a.try:focus {
  color: rgba(0, 0, 0, .85);
  background-color: transparent;
}
@media screen and (min-width: 768px){
    body{
        margin: calc(var(--header-height) + 1rem) 0 0 0;
        padding-left: calc(var(--nav-width) + 2rem)
    }
    .header{
        padding: 0 2rem 0 calc(var(--nav-width) + 2rem)
    }
    .header_img{
        width: 40px;
        height: 40px
    }
    .header_img img{
        width: 45px
    }
    .l-navbar{
        left: 0;
        padding: 1rem 1rem 0 0
    }
    .shownav{
        width: calc(var(--nav-width) + 156px)
    }
    .body-pd{
        padding-left: calc(var(--nav-width) + 188px)
    }
}
.nav_name .btn {
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
}

.nav_name .btn:hover,
.nav_name .btn:focus {
  color: rgba(0, 0, 0, .85);
  background-color: rgba(121, 82, 179, .1);
}

.nav_name .btn:focus {
  box-shadow: 0 0 0 1px rgba(121, 82, 179, .7);
}

.nav_name .btn::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform .35s ease;

  /* rtl:raw:
  transform: rotate(180deg) translateX(-2px);
  */
  transform-origin: .5em 50%;
}

.nav_name .btn[aria-expanded="true"]::before {
  transform: rotate(90deg)/* rtl:ignore */;
}
.navigation::-webkit-scrollbar {
    width: 0;  /* Remove scrollbar space */
    background: transparent;  /* Optional: just make scrollbar invisible */
}
.stamp-container {
width: 741px;
position: relative;
overflow: visible;
margin-left: auto; 
margin-right: auto;
}

.stamp {
height: 100px;
width: 200px;
position: absolute;
top: 75px;
right: 130px;
z-index: 1;
}

#retakess{
  padding: 20px;
  width: 80%;
  margin: 0 auto;
  background-color: #ffffff;
}
#retakess table, th, td {
  border: 1px solid black;
}
.center{
        margin-left: auto; 
        margin-right: auto;
    }
        </style>
    </head>
<body id="body-pd" class="bg-white">
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>

  <symbol id="calendar-event" viewBox="0 0 16 16">
    <path d="M11 6.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1z"/>
    <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"/>
  </symbol>

  <symbol id="alarm" viewBox="0 0 16 16">
    <path d="M8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
    <path d="M6.5 0a.5.5 0 0 0 0 1H7v1.07a7.001 7.001 0 0 0-3.273 12.474l-.602.602a.5.5 0 0 0 .707.708l.746-.746A6.97 6.97 0 0 0 8 16a6.97 6.97 0 0 0 3.422-.892l.746.746a.5.5 0 0 0 .707-.708l-.601-.602A7.001 7.001 0 0 0 9 2.07V1h.5a.5.5 0 0 0 0-1h-3zm1.038 3.018a6.093 6.093 0 0 1 .924 0 6 6 0 1 1-.924 0zM0 3.5c0 .753.333 1.429.86 1.887A8.035 8.035 0 0 1 4.387 1.86 2.5 2.5 0 0 0 0 3.5zM13.5 1c-.753 0-1.429.333-1.887.86a8.035 8.035 0 0 1 3.527 3.527A2.5 2.5 0 0 0 13.5 1z"/>
  </symbol>

  <symbol id="list-check" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
  </symbol>
</svg>
    <div class="container">
    <header id="header" class="header bg-white d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <span id="full" class="fs-4">Greenwood University</span>
        <span id="short" class="fs-4">GU</span>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="${pageContext.request.contextPath}/student/student.jsp" class="nav-link px-2 link-dark">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/faq.jsp" class="nav-link px-2 link-dark">FAQs</a></li>
        <li class="dropdown">
                  <a class="link-dark nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Transcript
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/academicTranscript">English Styled</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/academicTranscript">Chinese Styled</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/academicTranscript">Western Styled</a></li>
                  </ul>
        </li>
        <li class="nav-item dropdown">
                  <a class="link-secondary nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Applications
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/course_remarking.jsp">Course Remarking</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/retake_application.jsp">Course Retake</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/study_suspension.jsp">Study Suspension</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/official_documents.jsp#stampedTranscript">Stamped Transcript</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/official_documents.jsp#graduationEligibilityLetter">Graduation Eligibility</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/applications/official_documents.jsp#englishProficiencyCertificate">English Proficiency</a></li>
                  </ul>
        </li>
        <li class="dropdown">
                  <a class="link-dark nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Tools
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tools/gp_calculator.jsp">GP Calculator</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tools/cv_generator.jsp">CV Generator</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tools/recommendations.jsp">Recommendations</a></li>
                  </ul>
        </li>
      </ul>
      <div class="col-md-3 text-end">
      </div>
    </header>
</div>
    <div class="l-navbar bg-light" id="nav-bar">
        <nav class="navigation">
            <div> 
                <a href="${pageContext.request.contextPath}/index.jsp" class="nav_logo"> 
                    <img src="${pageContext.request.contextPath}/images/nobglogo.png" class="bi me-2 nav_logo-icon" width="30" height="39">
                </a>
                <div class="nav_list">
                    
                    <div style="margin-left: 10px" class="progress mb-3">
          <div class="progress-bar" role="progressbar" style="width: ${progress}%" aria-label="Example with label" aria-valuenow="${progress}" aria-valuemin="0" aria-valuemax="100">${progress}%</div>
        </div>
       
            
            
                    <nav class="small" id="toc">
    <ul class="list-unstyled">
        <li class="my-2">
            <div class="nav_link active">
        <a href="${pageContext.request.contextPath}/student/progress_tracker.jsp#decision">
            <i class='bx bx-door-open nav_icon'></i></a>
            <span class="nav_name"><button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed padding-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#contents-collapse" aria-controls="contents-collapse">Welcome</button>
            </span>
            </div>
        <ul class="list-unstyled ps-3 collapse" id="contents-collapse">
    <div class="list-group w-auto">
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${1 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Registration</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${2 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Fee Statement</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${3 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Result Outline</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${4 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
</div>
          </ul></li></ul></nav>
        
<nav class="small" id="toc">
    <ul class="list-unstyled">
        <li class="my-2">
            <div class="nav_link active">
        <a href="${pageContext.request.contextPath}/student/progress_tracker.jsp#personal-information">
            <i class='bx bx-folder nav_icon'></i></a>   
            <span class="nav_name"><button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#forms-collapse" aria-controls="forms-collapse">Project</button>
            </span>
            </div>
        <ul class="list-unstyled ps-3 collapse" id="forms-collapse">
    <div class="list-group w-auto">
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${5 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Profile Check</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${6 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Resit Application</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${7 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Grad Project</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${8 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Documents</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
        
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${9 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Survey</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${10 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
</div>
          </ul></li></ul></nav>
        
        
        
<nav class="small" id="toc">
    <ul class="list-unstyled">
        <li class="my-2">
         <div class="nav_link active">
        <a href="${pageContext.request.contextPath}/student/progress_tracker.jsp#thesis1">   
            <i class='bx bx-book-content nav_icon'></i></a>
            <span class="nav_name"><button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#components-collapse" aria-controls="components-collapse">Thesis</button>
            </span>
        </div>
        <ul class="list-unstyled ps-3 collapse" id="components-collapse">
    <div class="list-group w-auto">
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${11 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Thesis Training 1</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${12 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Thesis Training 2</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${13 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Final Project</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${14 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
</div>
          </ul></li></ul></nav>
        
        
<nav class="small" id="toc">
    <ul class="list-unstyled">
        <li class="my-2">
        <div class="nav_link active">
        <a href="${pageContext.request.contextPath}/student/progress_tracker.jsp#clearance">    
            <i class='bx bx-certification nav_icon'></i></a>
            <span class="nav_name"><button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#certificate-collapse" aria-controls="certificate-collapse">Certificate</button>
            </span>
        </div>
        <ul class="list-unstyled ps-3 collapse" id="certificate-collapse">
    <div class="list-group w-auto">
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${15 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Clearance</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${16 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Authorization</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${17 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Collection</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
            
  <c:forEach var="progress" items="${progressList}">
        <c:if test="${18 == progress.taskId}">
            <label class="list-group-item d-flex gap-3">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
    <span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span>
  </label></c:if></c:forEach>
</div>
          </ul></li></ul></nav>
                     
                </div>
          
            </div> <a href="#" class="nav_link d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"> <i class='bx bx-user nav_icon'></i> </a>
            <ul class="dropdown-menu col-12 text-small">
            <li><a class="dropdown-item" href="#">New project...</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModalCenteredScrollable" href="#">Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Sign out</a></li>
          </ul>
        </nav>
           </div>
    <!--Container Main start-->
<div class="bd-cheatsheet container-fluid bg-white">
    <article class="pt-3 pt-xl-5 pb-2 pb-xl-3">
        <p style="text-align: center" class="display-5">Retake Application</p>
        <div id="failedcourses">
             <p class="lead">Hello, ${student.engName}, <c:choose> <c:when test="${0 == failedCourses}">Congratulations! you do not have any failed courses and therefore
                         you cannot submit an application for a retake.
                </c:when> <c:otherwise> You have a total of ${failedCourses} failed course(s) which you need to retake before qualifying
                    for graduation. Please ensure to place an application in good time. The table below shows the courses that you have failed.</p>
             <p class="lead">Note that in accordance with the requirement of GU, you can apply for a maximum of 5 courses in a semester.</p>
            </c:otherwise> </c:choose></div>
          <p class="lead">
              Course retake applications are being conducted online. Please ensure to follow the University's rules and guidelines in selecting the course(s) that you would want to retake.
              <strong>You should select a maximum of 5 courses.</strong>
          </p>
          <c:choose> <c:when test="${0 != failedCourses}">
          <div id='retakeCheck'></div>
          <form name="form1" id="form1" method="post" action="submitApplication">
              <input type="hidden" name="action" value="submitApplication">
            <table class="table table-sm table-bordered">
              <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Course Code</th>
                <th scope="col">Course Name</th>
                <th scope="col">Grade</th>
                <th scope="col">Unit</th>
                <th scope="col">Amount</th>
                <th scope="col">&nbsp;</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="failedcourses" items="${failedCoursesList}">
              <tr>
                <th scope="row">${failedcourses.sn}</th>
                <td>${failedcourses.courseId}</td>
                <td>${failedcourses.courseTitle}</td>
                <td>${failedcourses.grade}</td>
                <td>${failedcourses.unit}</td>
                <td>${failedcourses.amount}</td>
                <td>
                   <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="ckb" value="${failedcourses.sn}" onclick='chkcontrol(${failedcourses.sn})'>
                </td>
              </tr>
              </c:forEach>
             </tbody>
            </table>
          <div class="col-12 d-flex justify-content-center">
              <button type="submit" id="subbtn" class="btn btn-success" disabled/>Submit</button>
          </div>
        </form>
              </c:when> <c:otherwise>
                  <div class="alert alert-primary" role="alert">
                    You do not have any failed courses. You cannot take a retake application!
                  </div>
              </c:otherwise></c:choose>
          <c:choose> <c:when test="${0 != failedCourses}">
          <p style="text-align: center" class="display-5">Application Status</p>
          <c:choose> <c:when test="${0 == retakeApplications}">
          <p class="lead">You do not have any pending applications. Please select the checkboxes of the courses you would like to retake in the table above.</p>
              </c:when>
              <c:otherwise>
                  <p class="lead">You have submitted an application to retake the ${retakeApplications} courses displayed in the following table.</p>
                  <table class="table table-sm table-bordered">
              <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Course Code</th>
                <th scope="col">Course Name</th>
                <th scope="col">Grade</th>
                <th scope="col">Unit</th>
                <th scope="col">Amount</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="retakeapplications" items="${retakeApplicationList}">
              <tr>
                <th scope="row">${retakeapplications.sn}</th>
                <td>${retakeapplications.courseId}</td>
                <c:forEach var="failedcourses" items="${failedCoursesList}">
                <c:if test="${retakeapplications.courseId == failedcourses.courseId}">
                <td>${failedcourses.courseTitle}</td>
                <td>${failedcourses.grade}</td>
                <td>${failedcourses.unit}</td>
                <td>${failedcourses.amount}</td>
                </c:if></c:forEach>
              </tr>
              </c:forEach>
             </tbody>
            </table>
            </c:otherwise></c:choose>
            <p style="text-align: center" class="display-5">Generate your Retake Invoice</p>
            <c:choose><c:when test="${retakeApplications==0}">
          <p class="lead">You do not have any pending applications and cannot generate a invoice without prior application. Please select the checkboxes of the courses you would like to retake in the table above.</p>
                </c:when><c:otherwise>
            <p class="lead">
                Please click on the button below to generate an invoice based on the courses that you have selected to retake. Ensure to download the
                invoice in <strong>PDF</strong> format. This invoice should be used to pay at the financial office.
            </p>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreen">
                    Generate Retake Invoice
                </button>
            </div>
            </c:otherwise></c:choose>
            <p style="text-align: center" class="display-5" id="receipt">Upload your Retake Payment Receipt</p>
            <c:choose><c:when test="${retakeApplications==0}">
          <p class="lead">You do not have any pending applications and cannot upload a receipt without prior application.</p>
                </c:when><c:otherwise>
          <p class="lead">
              Please upload your retake payment receipt here, once your request is approved, you can move to the next step. Note that you can upload <strong>one</strong> image only.
          </p>
         <div class="mb-3">
            <form action="uploadRetakeReceipt" method="post" id="file" enctype="multipart/form-data">
            <input type="hidden" name="action" value="uploadRetakeReceipt">        
            <label class="form-label" for="customFile">Receipt</label>
            <input type="file" name="file" class="form-control" style="margin-bottom: 10px" id="customFile" accept="image/jpg, image/jpeg, image/png">
            <div class="d-flex justify-content-center">
            <input type="submit" class="btn btn-success" id="submit" value="Upload">
            </div>
            </form>
          </div>
            </c:otherwise></c:choose>
             </c:when></c:choose> 
 </article>
</div>
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
        <li class="nav-item mb-2"><a href="http://linkedin.html" class="nav-link p-0 text-muted">Twitter</a></li>
        <li class="nav-item mb-2"><a href="http://qq.html" class="nav-link p-0 text-muted">QQ</a></li>
      </ul>
    </div>
  </footer>
</div>
  </section>       
<div class="modal" id="exampleModalDefault" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Successful</h1>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <P>Your retake receipt has been uploaded successfully. Please wait patiently for approval.</P>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalFullscreen" tabindex="-1" aria-labelledby="exampleModalFullscreenLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-4" id="exampleModalFullscreenLabel">Retake Invoice</h1>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <button type="button" id="download" class="btn btn-secondary fs-4">PDF</button>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="retakess"  class="stamp-container">
        <h1 style="text-align: center">GREENWOOD UNIVERSITY</h1>
            <table class="center table-bordered" width="741">
                <tbody>
                    <tr>
                        <th style="text-align: center" colspan="4">RETAKE COURSE PAYMENT INVOICE</th>
                    </tr>
                    <tr>    
                        <td width="150">ENGLISH NAME</td>
                        <td width="250">${student.engName}</td>
                        <td colspan="2" width="310">COLLEGE STAMP</td>
                        <img src="${pageContext.request.contextPath}/images/stamp.png" class="stamp">
                    </tr>
                    <tr>    
                        <td>CHINESE NAME</td>
                        <td>${student.cnName}</td>
                        <td colspan="2">DATE:  ${year} (Y) ${month} (M) ${day} (D)</td>
                    </tr>
                    <tr>    
                        <td>STUDENT NO.</td>
                        <td>${student.id}</td>
                        <td width="150">STUDENT SIGN</td>
                        <td width="160">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
                        <br>
            <table class="center table-bordered" width="741">
                <tbody>
                    <tr style="background-color:#EEE">
                        <th width="45">#</th>
                        <th width="260">RETAKE COURSE NAME</th>
                        <th width="45">UNITS</th>
                        <th width="150">EXAM COMMENT</th>
                        <th width="210">AMOUNT / COURSE (RMB)</th>
                    </tr>
                    
                    <c:forEach var="retakeapplications" items="${retakeApplicationList}">
                    <tr>
                      <th scope="row">${retakeapplications.sn}</th>
                      <c:forEach var="failedcourses" items="${failedCoursesList}">
                      <c:if test="${retakeapplications.courseId == failedcourses.courseId}">
                      <td>${failedcourses.courseTitle}</td>
                      <td>${failedcourses.unit}</td>
                      <td></td>
                      <td>${failedcourses.amount}</td>
                      </c:if></c:forEach>
                    </tr>
                    </c:forEach>
                    
                    <tr>
                        <td style="border-left: hidden; border-bottom: hidden" colspan="3">&nbsp;</td>
                        <th>TOTAL(RMB)</th>
                        <td>${total}</td>
                    </tr>
                </tbody>
            </table>
                    <div class="center" style="display: block; width: 741px;">
                        <p><em>Note:</em></p>
                    <p style="text-align: justify"><em>Retake course payments are not refundable. Retake courses registered for a particular semester
                        cannot be postponed to future semesters. It is the responsibility of the Retake student to 
                        ensure the accuracy of their retake course information. It is the responsibility of the Retake 
                        student to ensure that they join  the right Retake Course groups/ attend the right Retake lectures.</em></p>
                    </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
                    
                    
  <div class="modal fade" id="infoUpdate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Success</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <p>Your information has been modified successfully.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
 <div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalCenteredScrollableTitle">Personal Information</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Please carefully go through the information below to confirm that your personal information is rightly saved in the system. Your name should 
        appear as you would want it to on your graduation certificate. </p>
        <p>If your personal information is displayed correctly, please click on the correct button. Otherwise, click on the modify button to modify your personal information.
            wrong details and click on update when done.</p>
        <br>    
        <div class="col-md-12">
            <label for="engName" class="form-label">English Name</label>
            <input type="text" name="engName" class="form-control" value="${student.engName}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="cnName" class="form-label">Chinese Name</label>
            <input type="text" name="cnName" class="form-control" value="${student.cnName}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="id" class="form-label">Student ID</label>
            <input type="text" name="id" class="form-control" value="${student.id}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="dob" class="form-label">Date of Birth</label>
            <input type="date" name="dob" class="form-control" value="${student.dob}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="gender" class="form-label">Gender</label>
            <input type="text" name="gender" class="form-control" value="${student.gender}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="email" class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="${student.email}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="phone" class="form-label">Phone</label>
            <input type="tel" name="phone" class="form-control" value="${student.phone}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="nationality" class="form-label">Country of Birth</label>
            <input type="text" name="nationality" class="form-control" value="${student.nationality}" disabled>
        </div>
        
        <div class="col-md-12">
            <label for="passportNo" class="form-label">Passport Number</label>
            <input type="text" name="passportNo" class="form-control" value="${student.passportNo}" disabled>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="${pageContext.request.contextPath}/student/profile.jsp"><button type="button" class="btn btn-primary">Modify</button></a>
      </div>
    </div>
  </div>
</div>              
    <!--Container Main end-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha256-c3RzsUWg+y2XljunEQS0LqWdQ04X1D3j22fd/8JCAKw=" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
window.onload = function () {
var status = $('#status').val();
    if(status==="success"){
        OpenBootstrapPopup();
    }
    };
    function OpenBootstrapPopup() {
        $("#infoUpdate").modal('show');
    }
document.addEventListener("DOMContentLoaded", function(event) {
   
const showNavbar = (toggleId, navId, bodyId, headerId) =>{
const toggle = document.getElementById(toggleId),
nav = document.getElementById(navId),
bodypd = document.getElementById(bodyId),
headerpd = document.getElementById(headerId)
const full = document.getElementById('full')
const short = document.getElementById('short')

// Validate that all variables exist
if(toggle && nav && bodypd && headerpd){
toggle.addEventListener('click', ()=>{
full.classList.toggle('check')
short.classList.toggle('check')    
// show navbar
nav.classList.toggle('shownav')
// change icon
toggle.classList.toggle('bx-x')
// add padding to body
bodypd.classList.toggle('body-pd')
// add padding to header
headerpd.classList.toggle('body-pd')

})
}
}

showNavbar('header-toggle','nav-bar','body-pd','header')

/*===== LINK ACTIVE =====*/
const linkColor = document.querySelectorAll('.nav_link')

function colorLink(){
if(linkColor){
linkColor.forEach(l=> l.classList.remove('active'))
this.classList.add('active')
}
}
linkColor.forEach(l=> l.addEventListener('click', colorLink))

 // Your code to run since DOM is loaded and ready
});
var status = $('#receiptUpload').val();
    if(status==="success"){
        OpenBootstrapPopup();
    };

    function OpenBootstrapPopup() {
        $("#exampleModalDefault").modal('show');
    }
    
const retakeCheck = document.getElementById('retakeCheck')
const retakealert = () => {
  const wrapper = document.createElement('div')
  wrapper.innerHTML = [
    `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Please Note!</strong> You can only submit a retake application for a maximum of 5 courses.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>`
  ].join('')
  retakeCheck.append(wrapper)
}

function chkcontrol(j){
          total = 0;
          for(i=0;i<document.form1.ckb.length;i++){
              if(document.form1.ckb[i].checked){
                  total++;
              }
          }
          if(total<1){
              document.getElementById('subbtn').disabled=true;
          } else if(total>(5-${retakeApplications})){
              retakealert();
              document.form1.ckb[j-1].checked = false;
          } else{
              document.getElementById('subbtn').disabled=false;
          }
      }
let doc = new jsPDF('portrait', 'pt', 'a4');
    let btn = document.getElementById('download');
    let conteudo = document.getElementById('retakess');
    btn.addEventListener('click', function() {
      doc.addHTML(conteudo, 0, 10, function() {
        var blob = doc.output("blob");
        window.open(URL.createObjectURL(blob));
      });
    })      
        </script>
    </body>
</html>
