<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Artish. For artists created by artists // Artish</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
	</script>
	<link href="http://localhost:8080/css/styles.css" rel="stylesheet">
</head>
<body>
<div class="welcomeMain">
	<img src="http://localhost:8080/images/hero.jpg" alt="curated-art" class="main-image">
	<section class="info-wrapper bg-dark text-white">
		<div class="info">
			<h1>Artish.</h1>
			<!--<img src="" alt="logo" class="logo">-->
			<h1>For artists created by artists</h1>
			<h2>Join Artish today.</h2>
			<button class="btn btn-primary" type="button" id="signUpButton" data-bs-toggle="modal" data-bs-target="#signUpModal">Sign up</button>
			<button class="btn btn-secondary" onclick="location.href='/login'" type="button">Log in</button>
		</div>
	</section>
</div>
<div class="modal" id="signUpModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1>Artish.</h1>
					<!--<img src="" alt="logo" class="logo">-->
				</div>
				<div class="modal-body">
					<h3>Create your account</h3>
					<p><form:errors path="user.*"/></p>
					<form:form class="form" action="/registration" method="POST" modelAttribute="login">
					<div class="row mb-3">
						<form:label path="profile.displayName" class="form-label">Display Name:</form:label>
						<form:input path="profile.displayName" class="form-control"/>
					</div>
					<div class="row mb-3">
						<form:label path="username" class="form-label">Username:</form:label>
						<form:input path="username" class="form-control"/>
					</div>
					<div class="row mb-3">
						<form:label path="password" class="form-label">Password:</form:label>
						<form:password path="password" class="form-control"/>
					</div>
					<div class="row mb-3">
						<form:label path="passwordConfirmation" class="form-label">Password Confirmation:</form:label>
						<form:password path="passwordConfirmation" class="form-control"/>
					</div>
					<button class="btn btn-primary">Sign Up</button>
					</form:form>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
<footer class="bg-dark text-white">
		<ul class="nav justify-content-center">
			<li class="nav-item">
				<a class="nav-link" href="#">About</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Help Center</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Terms of Service</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">Privacy Policy</a>
			</li>
			<li class="nav-item">
				<p class="nav-link">© 2021 Artish</p>
			</li>
		</ul>
</footer>
</html>