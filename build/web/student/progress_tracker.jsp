<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<fmt:formatDate var="month" value="${now}" pattern="MM" />
<fmt:formatDate var="day" value="${now}" pattern="dd" />
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graduation Progress Tracker</title>
        <style>
            .center{ 
                margin-left: auto; 
                margin-right: auto; 
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
        </style>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
          <script type="text/javascript" src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js' />"></script>

               <link href="${pageContext.request.contextPath}/assets/dist/css/cheatsheet.css" rel="stylesheet">
               <link href="${pageContext.request.contextPath}/assets/dist/css/bootstrap.min.css" rel="stylesheet">
               <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.5.1/dist/confetti.browser.min.js"></script>
               <script src="${pageContext.request.contextPath}/assets/dist/js/bootstrap.bundle.min.js"></script>
               <script src="${pageContext.request.contextPath}/assets/dist/js/cheatsheet.js"></script>
    </head>
    <body class="bg-light">
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
        <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
        <input type="hidden" id="receiptUpload" value="<%= request.getAttribute("receiptUpload") %>">
<header class="p-3 mb-3 border-bottom fixed-top bg-white d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="${pageContext.request.contextPath}/index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <img src="${pageContext.request.contextPath}/images/logo.png" class="bi me-2" width="30" height="39">
          <span class="fs-4">Greenwood University</span>
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
                    <li><a class="dropdown-item" href="#stampedTranscript">Stamped Transcript</a></li>
                    <li><a class="dropdown-item" href="#graduationEligibilityLetter">Graduation Eligibility</a></li>
                    <li><a class="dropdown-item" href="#englishProficiencyCertificate">English Proficiency</a></li>
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

<aside class="bd-aside sticky-xl-top text-muted align-self-start mb-3 mb-xl-5 px-2">
  <h2 class="h6 pt-4 pb-3 mb-4 border-bottom">Graduation Progress Tracker</h2>
  <div class="progress mb-3">
          <div class="progress-bar" role="progressbar" style="width: ${progress}%" aria-label="Example with label" aria-valuenow="${progress}" aria-valuemin="0" aria-valuemax="100">${progress}%</div>
  </div>
  <nav class="small" id="toc">
    <ul class="list-unstyled">
      
      <li class="my-2">
          <button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed padding-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#contents-collapse" aria-controls="contents-collapse">Welcome</button>
        <ul class="list-unstyled ps-3 collapse" id="contents-collapse">
    <div class="list-group w-auto">
        <c:forEach var="progress" items="${progressList}">
        <c:if test="${1 == progress.taskId}">
        <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#decision"><span class="pt-1 form-checked-content">
      <strong>Registration</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span></a></label></li></c:if></c:forEach>
    
    <c:forEach var="progress" items="${progressList}">
    <c:if test="${2 == progress.taskId}">
    <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#fee"><span class="pt-1 form-checked-content">
      <strong>Fee Statement</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${3 == progress.taskId}">
       <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#result"><span class="pt-1 form-checked-content">
      <strong>Result Outline</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${4 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#progress1"><span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    </div>
          </ul>
      </li>
      
      
      
      <li class="my-2">
        <button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#forms-collapse" aria-controls="forms-collapse">Project</button>
        <ul class="list-unstyled ps-3 collapse" id="forms-collapse">
    <div class="list-group w-auto">
        <c:forEach var="progress" items="${progressList}">
        <c:if test="${5 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#personal-information"><span class="pt-1 form-checked-content">
      <strong>Profile Check</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
    </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${6 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#retake"><span class="pt-1 form-checked-content">
      <strong>Resit Application</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${7 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#project"><span class="pt-1 form-checked-content">
      <strong>Grad Project</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${8 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#documents"><span class="pt-1 form-checked-content">
      <strong>Documents</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${9 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#survey"><span class="pt-1 form-checked-content">
      <strong>Survey</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${10 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#progress2"><span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    </div>
          </ul></li>
          
<li class="my-2">
        <button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#components-collapse" aria-controls="components-collapse">Thesis</button>
        <ul class="list-unstyled ps-3 collapse" id="components-collapse">
    <div class="list-group w-auto">
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${11 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#thesis1"><span class="pt-1 form-checked-content">
      <strong>Thesis Training 1</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${12 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#thesis2"><span class="pt-1 form-checked-content">
      <strong>Thesis Training 2</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${13 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#report"><span class="pt-1 form-checked-content">
      <strong>Final Report</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${14 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#progress3"><span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    </div>
          </ul></li>
          
     <li class="my-2">
        <button style="margin-bottom: 5px" class="btn d-inline-flex align-items-center collapsed border-0" data-bs-toggle="collapse" aria-expanded="false" data-bs-target="#certificate-collapse" aria-controls="certificate-collapse">Certificate</button>
        <ul class="list-unstyled ps-3 collapse" id="certificate-collapse">
    <div class="list-group w-auto">
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${15 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#clearance"><span class="pt-1 form-checked-content">
      <strong>Clearance</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${16 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#authorization"><span class="pt-1 form-checked-content">
      <strong>Authorization</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${17 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#collection"><span class="pt-1 form-checked-content">
      <strong>Collection</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    <c:forEach var="progress" items="${progressList}">
        <c:if test="${18 == progress.taskId}">
            <li>
        <label class="list-group-item d-flex">
            <input class="form-check-input flex-shrink-0" type="checkbox" value="" <c:if test="${true == progress.status}"> checked </c:if> style="font-size: 1.375em;" disabled>
      <a class="d-inline-flex align-items-center rounded text-decoration-none" href="#progress4"><span class="pt-1 form-checked-content">
      <strong>Progress</strong>
      <small class="d-block text-muted">
        <svg class="bi me-1" width="1em" height="1em"><use xlink:href="#calendar-event"/></svg>
        ${progress.start}–${progress.due}
      </small>
          </span></a></label></li></c:if></c:forEach>
    </div>
          </ul></li>
          
    </ul>
  </nav>
</aside>
<div class="bd-cheatsheet container-fluid bg-body">
  <section id="content">
    <h2 class="sticky-xl-top fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">Welcome</h2>

    <article class="my-3" id="decision">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Study Decision</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Congratulations on making it to your final semester</p>
        
        <blockquote class="blockquote">
          <p>There is nothing more beautiful than finding your course as you believe you bob aimlessly in the current. 
              Wouldn’t you know that your path was there all along, waiting for you to knock, waiting for you to become. 
              This path does not belong to your parents, your teachers, your leaders, or your lovers. Your path is your 
              character defining itself more and more everyday like a photograph coming into focus.</p>
          <footer class="blockquote-footer">Famous quote by <cite title="Source Title">Jodie Foster</cite></footer>
        </blockquote>
        </div></div>

        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Would you love to proceed with or suspend your study?</p>
        
        <div style="margin-bottom: 5px" class="accordion" id="accordionExample">
          <div class="accordion-item">
            <h4 class="accordion-header" id="headingOne">
              <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Study Decision
              </button>
            </h4>
            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                  <strong>Please make a decision below.</strong> This decision helps to keep track of your study activities and keeps you in sync with the administration body. It is an important decision to make as this will determine what your further steps will be. Below are the breakdown of the steps to take depending on whichever choice you make. Greenwood University wants the best for you and hope you can make the best decision for yourself. Always remember that the <code> sky </code>is your limit. Good luck.
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h4 class="accordion-header" id="headingTwo">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                Proceed
              </button>
            </h4>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                <strong>If you decide to proceed,</strong> GU is glad to have you on this journey for yet another semester. It is much more exciting as it is your final semester. You should take note of the following: The further steps are to guide you and ensure you are updated on the steps to go through towards the successful attainment of your degree. Please do ensure to pay close attention to deadlines, requirements, and other necessary points. We wish you all the best. 
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h4 class="accordion-header" id="headingThree">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                Suspend
              </button>
            </h4>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
              <div class="accordion-body">
                <strong>If you decide to suspend your study this semester,</strong> You should ensure to follow the prompts after you make your choice. You would be required to send a letter to the school's email stating your reason for this choice with necessary supporting documents. Take note that once you choose this option, you would not have the opportunity to take part in the further steps. GU wishes you all the best.
                </div>
            </div>
          </div>
        </div>
        <c:forEach var="progress" items="${progressList}">
        <c:if test="${1 == progress.taskId}">
        <div class="d-flex justify-content-center">
            <button style="margin-right: 5px" id="suspend" type="button" data-bs-toggle="modal" data-bs-target="#suspendStudy" class="btn btn-danger btn-lg" <c:if test="${true == progress.status}"> disabled </c:if>>Suspend</button>
            <button id="proceed" type="button" data-bs-toggle="modal" data-bs-target="#continueStudy" class="btn btn-success btn-lg" <c:if test="${true == progress.status}"> disabled </c:if>>Proceed</button>
        </div>
        </c:if></c:forEach>
        </div></div>
      </div>
    </article>

    <article style="clear: both" class="my-3" id="fee">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Fee Statement</h3>
      </div>
      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Generate your fee statement</p>
        <p class="lead">
          Please click on the button below to generate your fee statement. If you have unsettled debts, please ensure to 
          settle them on time as some tools and features are not available for use to students with unsettled debts. 
        </p>
        <c:forEach var="progress" items="${progressList}">
        <c:if test="${1 == progress.taskId}">
        <div class="d-flex justify-content-center">    
          <button type="submit" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdropLive" <c:if test="${false == progress.status}"> disabled </c:if>>
            Generate Fee Statement
          </button>
        </div>
        </c:if></c:forEach>
        </div></div>
      </div>
    </article>
    
    <article class="my-3" id="result">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Result Overview</h3>
      </div>
      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Let's have a look at your academic history</p>
        <p class="lead">
          Your results are displayed in the four tables below. They are classified based on each of four academic years - Freshman, Sophomore, Junior and Senior.
          <strong>Highlighted rows contain failed course.</strong>
        </p>
        <p class="display-6">Freshman</p>
        <table class="table table-hover">
          <thead>
          <tr>
            <th scope="col">Code</th>
            <th scope="col">Course</th>
            <th scope="col">Grade</th>
            <th scope="col">Unit</th>
            <th scope="col">GP</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="freshman" items="${result}">
          <tr class="<c:choose> <c:when test="${0 == freshman.gp}">table-danger 
                </c:when> <c:otherwise> </c:otherwise> </c:choose>">
            <c:if test="${'Freshman' == freshman.session}">
            <td>${freshman.courseCode}</td>
            <td>${freshman.courseTitle}</td>
            <td>${freshman.grade}</td>
            <td>${freshman.unit}</td>
            <td>${freshman.gp}</td>
            </c:if>
          </tr>
          </c:forEach>
          </tbody>
        </table>
        
        <p class="display-6">Sophomore</p>
        <table class="table table-hover">
          <thead>
          <tr>
            <th scope="col">Code</th>
            <th scope="col">Course</th>
            <th scope="col">Grade</th>
            <th scope="col">Unit</th>
            <th scope="col">GP</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="sophomore" items="${result}">
          <tr class="<c:choose> <c:when test="${0 == sophomore.gp}">table-danger 
                </c:when> <c:otherwise> </c:otherwise> </c:choose>">
            <c:if test="${'Sophomore' == sophomore.session}">
            <td>${sophomore.courseCode}</td>
            <td>${sophomore.courseTitle}</td>
            <td>${sophomore.grade}</td>
            <td>${sophomore.unit}</td>
            <td>${sophomore.gp}</td>
            </c:if>
          </tr>
          </c:forEach>
          </tbody>
        </table>
        
        <p class="display-6">Junior</p>
        <table class="table table-hover">
          <thead>
          <tr>
            <th scope="col">Code</th>
            <th scope="col">Course</th>
            <th scope="col">Grade</th>
            <th scope="col">Unit</th>
            <th scope="col">GP</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="junior" items="${result}">
          <tr class="<c:choose> <c:when test="${0 == junior.gp}">table-danger 
                </c:when> <c:otherwise> </c:otherwise> </c:choose>">
            <c:if test="${'Junior' == junior.session}">
            <td>${junior.courseCode}</td>
            <td>${junior.courseTitle}</td>
            <td>${junior.grade}</td>
            <td>${junior.unit}</td>
            <td>${junior.gp}</td>
            </c:if>
          </tr>
          </c:forEach>
          </tbody>
        </table>
        
        <p class="display-6">Senior</p>
        <table class="table table-hover">
          <thead>
          <tr>
            <th scope="col">Code</th>
            <th scope="col">Course</th>
            <th scope="col">Grade</th>
            <th scope="col">Unit</th>
            <th scope="col">GP</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="senior" items="${result}">
          <tr class="<c:choose> <c:when test="${0 == senior.gp}">table-danger 
                </c:when> <c:otherwise> </c:otherwise> </c:choose>">
            <c:if test="${'Senior' == senior.session}">
            <td>${senior.courseCode}</td>
            <td>${senior.courseTitle}</td>
            <td>${senior.grade}</td>
            <td>${senior.unit}</td>
            <td>${senior.gp}</td>
            </c:if>
          </tr>
          </c:forEach>
          </tbody>
        </table>
        <p class="lead">As displayed above, you have <c:choose> <c:when test="${0 == failedCourses}">no</c:when> <c:otherwise> a total of ${failedCourses}</c:otherwise> </c:choose> 
              failed course(s). Please click the following button if you have successfully gone through your academic history.</p>
        <form action="resultOverview" method="post">
            <input type="hidden" name="action" value="resultOverview">
            
            <div class="d-flex justify-content-center">
            <c:forEach var="progress" items="${progressList}">
                <c:if test="${3 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Done</button>
                </c:if>
                <c:if test="${3 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${2 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Done</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Done</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </c:forEach>
                                
                
            </div>
        </form>
        </div></div>
          
      </div>
    </article>
    <article class="my-3" id="progress1">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Progress</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Milestone</p>
        <c:forEach var="progress" items="${progressList}">
                <c:if test="${4 == progress.taskId}">
                    <c:choose><c:when test="${progress.status==false}">
                <p class="lead">
                  ${student.engName}, you are yet to complete the first milestone towards the attainment of your degree.
                    Please do pay careful attention to the due dates of the tasks above and ensure to complete them in good time. GU wishes you a good luck.
                </p>       
                        </c:when><c:otherwise>
                <p class="lead">
                  Congratulations ${student.engName}!, you have completed the first milestone towards the attainment of your degree.
                    We are so proud of you and wish you all the best in the next chapter. You may now proceed to the next stage.
                </p>                        </c:otherwise></c:choose>
                </c:if></c:forEach>
        <div id="firstprogressbar" class="progress mb-3" hidden>
          <div class="progress-bar" role="progressbar" style="width: 25%" aria-label="Example with label" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
        </div>
        </div></div>
      </div>
    </article>
  </section>

  <section style="clear: both" id="forms">
    <h2 class="sticky-xl-top fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">Project</h2>

    <article class="my-3" id="personal-information">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Profile Check</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Confirm your Personal Information</p> 
        <p class="lead">In order to ensure that your information is stored in the system correctly, please carefully go through the following information.
        This process is very important as your graduation certificate and other necessary documents rely on this information.</p>
        <p class="lead">If your personal information is displayed correctly, please click on the correct button. Otherwise, click on the modify button to modify your personal information.
            wrong details and click on update when done.</p>
        <p class="lead">Please take note that this information is always accessible for modification at your profile once you click on your profile photo.</p>
          
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
        <c:forEach var="progress" items="${progressList}">
        <c:if test="${4 == progress.taskId}">
        <div style="margin-top: 5px" class="d-flex justify-content-center">
            <a href="${pageContext.request.contextPath}/student/profile.jsp"><button type="button" style="margin-right: 5px" class="btn btn-danger btn-lg" <c:if test="${false == progress.status}"> disabled </c:if>>Modify</button></a>
            <form action="profileCheck" method="post">
            <input type="hidden" name="action" value="profileCheck">
            <button type="submit" class="btn btn-success btn-lg" <c:if test="${false == progress.status}"> disabled </c:if>>Correct</button>
            </form>
        </div>
        </c:if></c:forEach>
        </div></div>
      </div>
    </article>
                         
    <article class="my-3" id="retake">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Retake Application</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Course Retake Application</p>
        <p class="lead">
            We went over the breakdown of your academic history here at Greenwood University in the previous stage. Now, let us place our focus on failed courses.
        </p>   
        <div id="failedcourses">
            <div class="alert alert-<c:choose><c:when test="${0 == failedCourses}">primary</c:when><c:otherwise>danger</c:otherwise></c:choose>" role="alert">
             <h4 class="alert-heading">Status</h4>
             <p>Hello, ${student.engName}, <c:choose> <c:when test="${0 == failedCourses}">Congratulations! you do not have any failed courses and therefore
                         you have successfully completed this stage.
                </c:when> <c:otherwise> You have a total of ${failedCourses} failed course(s) which you need to retake before qualifying
            for graduation. 
                <hr>
             <p class="mb-0">Note that in accordance with the requirement of GU, you can apply for a maximum of 5 courses in a semester.</p>
            </c:otherwise> </c:choose></div>
        </div>
         
          <c:choose> <c:when test="${0 != failedCourses}">
           <p class="lead">
              Course retake applications are being conducted online. The following table displays the information of the courses you failed.  Please ensure to follow the University's rules and guidelines in selecting the course(s) that you would want to retake.
              Click <a href="${pageContext.request.contextPath}/applications/retake_application.jsp">here</a> to apply for your retake(s).
          </p>
          <div id='retakeCheck'></div>
            <table class="table table-sm table-bordered">
              <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Course Name</th>
                <th scope="col">Grade</th>
                <th scope="col">Unit</th>
                <th scope="col">Amount</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="failedcourses" items="${failedCoursesList}">
              <tr>
                <th scope="row">${failedcourses.sn}</th>
                <td>${failedcourses.courseTitle}</td>
                <td>${failedcourses.grade}</td>
                <td>${failedcourses.unit}</td>
                <td>${failedcourses.amount}</td>
              </tr>
              </c:forEach>
             </tbody>
            </table>
          <h3 style="text-align: center">Retake Application Status</h3>
          <c:choose><c:when test="${retakeApplications==0}">
                  <p class="lead">You are yet to submit an application for your retake(s). Please ensure to do so on time.</p>
              </c:when><c:otherwise>
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
            <h3 style="text-align: center">Generate your Retake Invoice</h3>
            <c:choose><c:when test="${retakeApplications==0}">
                  <p class="lead">You are yet to submit an application for your retake(s) and cannot generate an invoice. Please ensure to do so on time.</p>
              </c:when><c:otherwise>
            <p class="lead">
                Please click on the button below to generate an invoice based on the courses that you have selected to retake. Ensure to download the
                invoice in <strong>PDF</strong> format. This invoice should be used to pay at the financial office.
            </p>
            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreen">
                    Generate Retake Invoice
                </button>
            </div>
              </c:otherwise></c:choose>
            <h3 style="text-align: center; margin-top: 10px">Retake Receipt Submission Status</h3>
            <c:choose><c:when test="${retakeApplications==0}">
                  <p class="lead">You are yet to submit an application for your retake(s) and cannot generate an invoice. Please ensure to do so on time.</p>
              </c:when><c:otherwise>
            <p class="lead">
                <c:choose><c:when test="${retakeReceiptStatus==false}">
                        You have not uploaded your retake payment receipt. Please do ensure to do so in good time. Click <a href="${pageContext.request.contextPath}/applications/retake_application.jsp#receipt">here</a> to upload your receipt
                    </c:when><c:otherwise>
                        You have uploaded your retake payment receipt. Please wait patiently for approval.
                    </c:otherwise></c:choose>
            </p>
              </c:otherwise></c:choose>
              </c:when></c:choose>
        </div></div>
      </div>
    </article>
                         
    <article class="my-3" id="project">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
          <h3>Graduation Project</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <div class="mb-3">
        <p class="display-5">Submit your graduation project information</p>
          <p class="lead">
              Please complete the following form and submit it when done. The form collects information about your graduation project.
          </p>
          <form action="graduationProject" method="post" class="row g-3">
              <input type="hidden" name="action" value="graduationProject">
          <div class="col-md-6">
            <label for="validationServer03" class="form-label">Project Title</label>
            <input type="text" class="form-control" name="projectTitle" id="validationServer03" placeholder="Enter your project title" value="${graduationProject.projectTitle}" required>
          </div>
          <div class="col-md-3">
            <label for="validationServer04" class="form-label">Supervisor</label>
            <select class="form-select" name="supervisor" id="validationServer04" required>
              <option selected value="">Choose...</option>
              <c:forEach items="${supervisor}" var="supervisor">
                  <option value="${supervisor.name}"<c:if test="${graduationProject.supervisor==supervisor.name}">selected</c:if>>${supervisor.name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="col-md-3">
            <label for="validationServer05" class="form-label">Submission Date</label>
            <input type="date" class="form-control" name="submissionDate" id="validationServer05" value="${graduationProject.submissionDate}" required>
          </div>
              <c:forEach var="progress" items="${progressList}">
              <c:if test="${6 == progress.taskId}">
              <div style="margin-top: 10px" class="d-flex justify-content-center">
                <button type="submit" <c:if test="${false == progress.status}">disabled</c:if> class="btn btn-success btn-lg">
                    Submit
                </button>
          </div>
          </c:if></c:forEach>
          </form>
        </div>
        </div></div>
      </div>
    </article>
                         
    <article class="my-3" id="documents">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Documents</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
           <p class="display-5">Request for Official Documents</p>
          <p class="lead">
              You can request for official documents within the designated period. Any applications after the deadline would be revoked.
              Please keep that in mind. The following list shows the official documents you can request for. 
          </p>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/applications/official_documents.jsp#stampedTranscript">Stamped Academic Transcript</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/applications/official_documents.jsp#graduationEligibilityLetter">Graduation Eligibility Letter</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/applications/official_documents.jsp#englishProficiencyCertificate">English Proficiency Certificate</a></li>
            </ul>
            <form action="officialDocument" method="post">
                <input type="hidden" name="action" value="officialDocument">
             <div class="d-flex justify-content-center">
            <c:forEach var="progress" items="${progressList}">
                <div class="d-flex justify-content-center">
                <c:if test="${8 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Noted</button>
                </c:if>
                <c:if test="${8 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${7 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Noted</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Noted</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </div></c:forEach>   
            </form>
        </div></div>
      </div>
    </article>
            
    <article class="my-3" id="survey">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Survey</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
           <p class="display-5">Please Complete this Survey</p>
          <p class="lead">
              Please fill in the following form and submit it before the designated due date. 
          </p>
         <form action="projectSurvey" method="post">
             <input type="hidden" name="action" value="projectSurvey">
          <div class="mb-3">
            <label for="projectProgress" class="form-label">Have you began working on your project?</label>
            <select class="form-select" id="projectProgress" name="projectProgress">
              <option value="" selected>Choose...</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="supervisorContact" class="form-label">Has your supervisor been in contact?</label>
            <select class="form-select" id="supervisorContact" name="supervisorContact">
              <option value="" selected>Choose...</option>
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
          </div>
          <div class="col-md-12 input-group  mb-3">
            <span class="input-group-text">Comment</span>
            <textarea id="reason" class="form-control" aria-label="With textarea" maxlength="1000" required name="comment"></textarea>
          </div>
          <c:forEach var="progress" items="${progressList}">
                <div class="d-flex justify-content-center">
              <c:if test="${9 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                </c:if>
                <c:if test="${9 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${8 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </div></c:forEach>   
        </form>
        </div></div>
      </div>
    </article>
            
    <article class="my-3" id="progress2">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Progress</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Milestone</p>
        <c:forEach var="progress" items="${progressList}">
                <c:if test="${10 == progress.taskId}">
                    <c:choose><c:when test="${progress.status==false}">
                <p class="lead">
                  ${student.engName}, you are yet to complete the second milestone towards the attainment of your degree.
                    Please do pay careful attention to the due dates of the tasks above and ensure to complete them in good time. GU wishes you a good luck.
                </p>       
                        </c:when><c:otherwise>
                <p class="lead">
                  Congratulations ${student.engName}!, you have completed the second milestone towards the attainment of your degree.
                    We are so proud of you and wish you all the best in the next chapter. You may now proceed to the next stage.
                </p>                        </c:otherwise></c:choose>
                </c:if></c:forEach>
        <div id="secondprogressbar" class="progress mb-3" hidden>
          <div class="progress-bar" role="progressbar" style="width: 50%" aria-label="Example with label" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
        </div>
        </div></div>
      </div>
    </article>
  </section>    
            
            
    <section style="clear: both" id="thesis">
    <h2 class="sticky-xl-top fw-bold pt-3 pt-xl-5 pb-2 pb-xl-3">Thesis</h2>

    <article class="my-3" id="thesis1">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Thesis Training 1</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Submit the first check of your graduation thesis</p> 
        <p class="lead">You have been taking the thesis writing and formatting lecture for two weeks and have been 
            asked to submit the first chapter of your thesis for checking. Please upload your file below. You are 
            expected to upload word documents only. Make sure that you upload the right document as only the firstly uploaded document is accepted.</p>
        <div class="mb-3">
            <form action="thesisTraining1" method="post" id="file" enctype="multipart/form-data">
            <input type="hidden" name="action" value="thesisTraining1">        
            <label class="form-label" for="customFile">Thesis Training 1</label>
            <input type="file" name="file" class="form-control" style="margin-bottom: 10px" id="customFile" accept=".doc, .docx">
            <c:forEach var="progress" items="${progressList}">
                <div class="d-flex justify-content-center">
                <c:if test="${11 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                </c:if>
                <c:if test="${11 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${10 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </div></c:forEach>   
            </form>
          </div> 
        </div></div>
      </div>
    </article>
                         
    <article class="my-3" id="thesis2">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Thesis Training 2</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Submit the second check of your graduation thesis</p> 
        <p class="lead">You have been taking the thesis writing and formatting lecture for four weeks and have been 
            asked to submit your thesis for checking. Please upload your file below. You are 
            expected to upload word documents only. Make sure that you upload the right document as only the firstly uploaded document is accepted.</p>
        <div class="mb-3">
            <form action="thesisTraining2" method="post" id="file" enctype="multipart/form-data">
            <input type="hidden" name="action" value="thesisTraining2">        
            <label class="form-label" for="customFile">Thesis Training 2</label>
            <input type="file" name="file" class="form-control" style="margin-bottom: 10px" id="customFile" accept=".doc, .docx">
            <c:forEach var="progress" items="${progressList}">
                <div class="d-flex justify-content-center">
                <c:if test="${12 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                </c:if>
                <c:if test="${12 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${11 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </div></c:forEach>   
            </form>
          </div> 
        </div></div>
      </div>
    </article>
    
    <article class="my-3" id="report">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Final Report</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
                <p class="display-5">Submit the final version of your thesis and final project</p>
            <p class="lead">If you have multiple files please compress them into a .zip or .rar file.
            Make sure that you upload the right file as only the firstly uploaded document is accepted.</p>
        <div class="mb-3">
            <form action="finalReport" method="post" id="file" enctype="multipart/form-data">
            <input type="hidden" name="action" value="finalReport">        
            <label class="form-label" for="customFile">Final Report</label>
            <input type="file" name="file" class="form-control" style="margin-bottom: 10px" id="customFile" accept=".doc, .docx, .zip, .rar, .7zip">
            <c:forEach var="progress" items="${progressList}">
                <div class="d-flex justify-content-center">
                <c:if test="${13 == progress.taskId&&progress.status==true}">
                    <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                </c:if>
                <c:if test="${13 == progress.taskId&&progress.status==false}">
                    <c:forEach var="progress" items="${progressList}">
                        <c:if test="${12 == progress.taskId}">
                            <c:choose><c:when test="${progress.status==false}">
                                <button type="submit" class="btn btn-success btn-lg" disabled>Submit</button>
                            </c:when>
                            <c:when test="${progress.status==true}">
                                <button type="submit" class="btn btn-success btn-lg">Submit</button>
                            </c:when></c:choose></c:if></c:forEach></c:if>
                </div></c:forEach>   
            </form>
          </div> 
        </div></div>
      </div>
    </article>

            
    <article class="my-3" id="progress3">
      <div class="bd-heading sticky-xl-top align-self-start mt-5 mb-3 mt-xl-0 mb-xl-2">
        <h3>Progress</h3>
      </div>

      <div>
        <div class="bd-example-snippet bd-code-snippet"><div class="bd-example">
        <p class="display-5">Milestone</p>
        <c:forEach var="progress" items="${progressList}">
                <c:if test="${14 == progress.taskId}">
                    <c:choose><c:when test="${progress.status==false}">
                <p class="lead">
                  ${student.engName}, you are yet to complete the second milestone towards the attainment of your degree.
                    Please do pay careful attention to the due dates of the tasks above and ensure to complete them in good time. GU wishes you a good luck.
                </p>       
                        </c:when><c:otherwise>
                <p class="lead">
                  Congratulations ${student.engName}!, you have completed the second milestone towards the attainment of your degree.
                    We are so proud of you and wish you all the best in the next chapter. You may now proceed to the next stage.
                </p>                        </c:otherwise></c:choose>
                </c:if></c:forEach>
        <div id="thirdprogressbar" class="progress mb-3" hidden>
          <div class="progress-bar" role="progressbar" style="width: 75%" aria-label="Example with label" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">75%</div>
        </div>
        </div></div>
      </div>
    </article>
  </section> 
</div>
   
<div class="modal fade" id="suspendStudy" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLiveLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLiveLabel">Confirmation</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>${student.engName}, are you sure that you want to suspend your study this semester? </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <a href="${pageContext.request.contextPath}/applications/study_suspension.jsp"><button type="button" class="btn btn-primary">Yes</button></a>
      </div>
    </div>
  </div>
</div>
      
<div class="modal fade" id="continueStudy" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLiveLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLiveLabel">Confirmation</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>${student.engName}, are you sure that you want to proceed with your study this semester? </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
        <form action="studyContinuation" method="post">
            <input type="hidden" name="action" value="studyContinuation">
            <button type="submit" class="btn btn-primary">Yes</button>
        </form>
      </div>
    </div>
  </div>
</div>                         
                         
<div class="modal fade" id="exampleModalDefault" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Successful</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <P>Your retake receipt has been uploaded successfully. Please wait patiently for approval.</P>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="staticBackdropLive" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLiveLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLiveLabel">Fee Statement</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p> <c:choose> <c:when test="${feeStatement.debt != 0}">${student.engName}, you have an unsettled debt of ${feeStatement.debt} RMB. Please ensure
                    to pay your fees on time.
    </c:when> <c:otherwise>${student.engName}, your fees have been cleared and you do not have any pending debts.</c:otherwise> </c:choose></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="feeStatement" method="post">
            <input type="hidden" name="action" value="feeStatement">
            <button type="submit" class="btn btn-primary">Understood</button>
        </form>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalCenteredScrollable" tabindex="-1" aria-labelledby="exampleModalCenteredScrollableTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalCenteredScrollableTitle">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>This is some placeholder content to show the scrolling behavior for modals. We use repeated line breaks to demonstrate how content can exceed minimum inner height, thereby showing inner scrolling. When content becomes longer than the predefined max-height of modal, content will be cropped and scrollable within the modal.</p>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <p>This content should appear at the bottom after you scroll.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
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


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js" integrity="sha384-NaWTHo/8YCBYJ59830LTz/P4aQZK1sS0SneOgAvhsIl3zBu8r9RevNg5lHCHAuQ/" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha256-c3RzsUWg+y2XljunEQS0LqWdQ04X1D3j22fd/8JCAKw=" crossorigin="anonymous"></script>

      <script>
window.onload = function () {
const firstprogressbar = document.getElementById('firstprogressbar');
var loc = window.location.href;
var statusvalue = document.getElementById('status').value
    if(statusvalue==="invoiceDone"){
        window.location.href= loc+"#retakeInvoice";
    } else if(statusvalue==="feeDone"){
        window.location.href= loc+"#result";
        } else if(statusvalue==="resultDone"){
        window.location.href= loc+"#progress1";
        firstprogressbar.hidden=false;
        // do this for 30 seconds
        var duration = 1 * 1000;
        var end = Date.now() + duration;

        (function frame() {
          // launch a few confetti from the left edge
          confetti({
            particleCount: 7,
            spread: 55,
          });

          // keep going until we are out of time
          if (Date.now() < end) {
            requestAnimationFrame(frame);
          }
        }());
        } else if(statusvalue==="surveyDone"){
        window.location.href= loc+"#progress2";
        secondprogressbar.hidden=false;
        // do this for 30 seconds
        var duration = 1 * 1000;
        var end = Date.now() + duration;

        (function frame() {
          // launch a few confetti from the left edge
          confetti({
            particleCount: 7,
            spread: 55,
          });

          // keep going until we are out of time
          if (Date.now() < end) {
            requestAnimationFrame(frame);
          }
        }());
        } else if(statusvalue==="profileDone"){
        window.location.href= loc+"#retake";
        } else if(statusvalue==="gradProjectDone"){
        window.location.href= loc+"#documents";
        } else if(statusvalue==="documentDone"){
        window.location.href= loc+"#survey";
        } else if(statusvalue==="thesis1Done"){
        window.location.href= loc+"#thesis2";
        } else if(statusvalue==="thesis2Done"){
        window.location.href= loc+"#report";
        } else if(statusvalue==="finalProject"){
        window.location.href= loc+"#progress3";
        thirdprogressbar.hidden=false;
        // do this for 30 seconds
        var duration = 1 * 1000;
        var end = Date.now() + duration;

        (function frame() {
          // launch a few confetti from the left edge
          confetti({
            particleCount: 7,
            spread: 55,
          });

          // keep going until we are out of time
          if (Date.now() < end) {
            requestAnimationFrame(frame);
          }
        }());
        } 
    }
    var status = $('#receiptUpload').val();
    if(status==="success"){
        OpenBootstrapPopup();
    };

    function OpenBootstrapPopup() {
        $("#exampleModalDefault").modal('show');
    }

const firstProgress = document.getElementById('firstprogress')
const retakeCheck = document.getElementById('retakeCheck')

const notcompletedalert = () => {
  const wrapper = document.createElement('div')
  wrapper.innerHTML = [
    `<div class="alert alert-success alert-dismissible fade show" role="alert">
     Please ensure that you complete the steps above efore the designated deadline.
     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
     </div>`
  ].join('')
  firstProgress.append(wrapper)
}
const completedalert = () => {
  const wrapper = document.createElement('div')
  wrapper.innerHTML = [
    `<div class="alert alert-success alert-dismissible fade show" role="alert">
     <h4 class="alert-heading">Congratulations!</h4>
     <p>You have successfully complted the first milestone. You can now proceed to the next stage.</p>
     <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
     </div>`
  ].join('')
  firstProgress.append(wrapper)
}
const retakealert = () => {
  const wrapper = document.createElement('div')
  wrapper.innerHTML = [
    `<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Please Note!</strong> You should select a maximum of 5 courses.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>`
  ].join('')
  retakeCheck.append(wrapper)
}
const suspend = document.getElementById('suspend')
const proceed = document.getElementById('proceed')
const completed = document.getElementById('completed')
const notcompleted = document.getElementById('notcompleted')

if (proceed) {
  proceed.addEventListener('click', () => {
    proceedalert();
    suspend.disabled=true;
  })
}
if (completed) {
  completed.addEventListener('click', () => {
    completedalert();
    notcompleted.disabled=true;
    firstprogressbar.hidden=false;
  })
}
if (notcompleted) {
  notcompleted.addEventListener('click', () => {
    notcompletedalert();
    completed.disabled=true;
  })
}

function chkcontrol(j){
          total = 0;
          for(i=0;i<document.form1.ckb.length;i++){
              if(document.form1.ckb[i].checked){
                  total++;
              }
          }
          if(total<0){
              document.getElementById('subbtn').disabled=true;
          } else if(total>5){
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