<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="pt-BR" data-bs-theme="dark">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon"
			href="https://cdn-icons-png.flaticon.com/512/2749/2749777.png"
			type="image/x-icon">
		<title>IFitness - Login</title>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
			crossorigin="anonymous">
		<link href="styles/global.css" rel="stylesheet">
		<script defer
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
	</head>
	<body>
		<header class="mb-4">
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
				<div class="container-fluid">
	
	
					<a class="navbar-brand" href="#"> <img class="me-2"
						alt="Icone Fit"
						src="https://cdn-icons-png.flaticon.com/512/2749/2749777.png"
						width="32" height="32"> IFitness
					</a>
	
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
					</div>
				</div>
			</nav>
		</header>
		<main>
			<div class="container">
			
				<c:choose>
					<c:when test="${result == 'notFound'}">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							Usuário não encontrado! Verifique os dados e tente novamente.
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:when>
					<c:when test="${result == 'registered'}">
		
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							Cadrasto realizado com sucesso! Faça login para continuar.
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
		
					</c:when>
				</c:choose>
	
				<form action="login" method="post">
					<div class="col-lg-4 offset-lg-4 col-sm-12">
						<h1 class="text-center">Login</h1>
	
						<div class="input-group mb-3">
							<span class="input-group-text"> <svg
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-envelope-fill"
									viewBox="0 0 16 16">
	  								<path
										d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z" />
								</svg>
							</span> <input type="email" class="form-control" name="email"
								placeholder="E-mail" required>
						</div>
	
						<div class="input-group mb-3">
							<span class="input-group-text"> <svg
									xmlns="http://www.w3.org/2000/svg" width="32" height="32"
									fill="currentColor" class="bi bi-lock-fill" viewBox="0 0 16 16">
	  								<path
										d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2m3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2" />
								</svg>
							</span> <input type="password" class="form-control" name="password"
								placeholder="Senha" required>
						</div>
	
						<div class="mb-3">
							<button type="submit" class="btn btn-success col-lg-12">Entrar</button>
						</div>
	
						<div class="mb-3">
							<a href="user-register.jsp" type="submit"
								class="btn btn-secondary col-lg-12">Cadastrar</a>
						</div>
	
	
					</div>
				</form>
			</div>
		</main>
	</body>
</html>