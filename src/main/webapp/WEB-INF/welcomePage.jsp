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
	<div class="image-wrapper text-white">
		<h1>Platform for artists created by artists</h1>
			<div class="welcome-subtitles">
				<h3>Find inspiration.</h3>
				<h3>See what artists have to share.</h3>
				<h3>Share your artwork.</h3>
			</div>

	</div>
	<img src="http://localhost:8080/images/hero.jpg" alt="curated-art" class="main-image">
	<section class="info-wrapper bg-dark text-white">
		<div class="info">
			<h1>Artish.</h1>
			<!--<img src="" alt="logo" class="logo">-->
			<h2>Join Artish today.</h2>
					<p><form:errors path="user.*"/></p>
					<form:form class="form" action="/registration" method="POST" modelAttribute="login">
					<div class="row mb-3">
						<div class="col">
							<form:input path="profile.displayName" placeholder="Display Name" class="form-control form-control-lg"/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<div class="input-group">
								<span class="input-group-text" id="inputGroupPrepend">@</span>
								<form:input path="username" placeholder="Username" class="form-control form-control-lg"/>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<form:password path="password" placeholder="Password" class="form-control form-control-lg"/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<form:password path="passwordConfirmation" placeholder="Confirm Password" class="form-control form-control-lg"/>
						</div>
					</div>
					<button class="btn btn-primary welcome-buttons">Register</button>
					</form:form>
			<p class="mt-3">Already have an account?</p>
			<button class="btn btn-secondary welcome-buttons" onclick="location.href='/login'" type="button">Log in</button>
		</div>
	</section>
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