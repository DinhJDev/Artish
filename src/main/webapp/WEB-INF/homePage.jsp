<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Welcome // Artish</title>
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
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
		<link href="/css/styles.css" rel="stylesheet">
</head>
<header>
	<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="/home">Artish.</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse " id="navbarText">
		      <ul class="navbar-nav me-auto ms-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link active" aria-current="page" href="#">Home</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Challenges</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Explore</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="#">Bookmarks</a>
		        </li>
		      </ul>
			</div>
			<div class="dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<c:out value="${currentUser.username}"/>
				<img class="icon" src=<c:out value="${currentUser.profile.profilePicture}"/>>
				</a>
				<ul class="dropdown-menu">
					<li>
					<form id="logoutForm" method="POST" action="/logout">
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					        <a href="javascript:{}" onclick="document.getElementById('logoutForm').submit();" class="dropdown-item">Logout</a>
					</form>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<body>
	<main>
	   	<div class="container">
	   		<div class="row">
		   		<div class="col"></div>
		   		<div class="col-6">
			   		<div class="card">
			   			<div class="card-body">
			   				<div class="row">
			   					<div class="col-1">
						   			<img class="icon" src=<c:out value="${currentUser.profile.profilePicture}"/>>
						   		</div>
						   		<div class="col">
							   		<form:form method="POST" action="/createPost" modelAttribute="post">
										<form:input path="content" class="form-control" placeholder="Create post..."/>
										<div class="mt-1 d-md-flex justify-content-md-end">
											<button class="btn btn-primary">Post</button>
										</div>
							   		</form:form>
							   	</div>
					   		</div>
				   		</div>
			   		</div>
			   		<c:forEach items="${recentPosts}" var="post">
			   			<div class="card mt-3">
			   				<div class="card-body">
				   				<div class="row">
				   					<div class="col-1">
							   			<img class="icon" src=<c:out value="${post.poster.profilePicture}"/>>
							   		</div>
							   		<div class="col"><strong><c:out value="${post.poster.displayName}"/></strong> @<c:out value="${post.poster.login.username}"/> - <fmt:formatDate pattern="MMM, dd" value="${post.createdAt}"/></div>
						   		</div>
						   		<img class="postMedia mt-3" src="https://pbs.twimg.com/media/E6RVm4kX0AMvEDd?format=jpg&name=900x900">
			   					<p class="mt-3"><c:out value = "${post.content}"/></p>
			   				</div>
			   			</div>
			   		</c:forEach>
		   		</div>
		   		<div class="col"></div>
		   	</div>
	   	</div>
   	</main>
</body>
</html>