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
<title>IFitness - Cadastro</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="styles/global.css" rel="stylesheet">
<link href="styles/errors.css" rel="stylesheet">
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script defer src="scripts/user-register.js"></script>
</head>
<body>
	<header class="mb-4">
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<a class="navbar-brand" href="login.jsp"> <img class="me-2"
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

			<c:if test="${result == 'notRegistered'}">

				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					Email já cadastrado. Tente novamente com outro email.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

			</c:if>


			<form action="userRegister" method="post" id="formRegister">
				<div class="col-lg-4 offset-lg-4 col-sm-12">
					<h1 class="text-center">Cadastro</h1>

					<div class="mb-2">
						<label for="name">Nome completo*</label> <input type="text"
							name="name" id="name" class="form-control" minlength="3"
							maxlength="50" required="required"> <span
							id="errorAlert-0"></span>
					</div>

					<div class="mb-2">
						<label for="email">E-mail*</label> <input type="email"
							name="email" id="email" class="form-control" minlength="3"
							maxlength="50" required="required"> <span
							id="errorAlert-1"></span>
					</div>

					<div class="mb-2">
						<label for="password">Senha*</label> <input type="password"
							name="password" id="password" class="form-control" minlength="8"
							maxlength="30" required="required"> <span
							id="errorAlert-2"></span>
					</div>

					<div class="mb-2">
						<label for="passwordConfirm">Confirme a Senha*</label> <input
							type="password" name="passwordConfirm" id="passwordConfirm"
							class="form-control" minlength="8" maxlength="30"
							required="required"> <span id="errorAlert-3"></span>
					</div>
					
					<div class="mb-2">
                        <label for="profilePictureFile">Foto de perfil</label> <input
                            type="file" name="profilePictureFile" id="profilePictureFile"
                            class="form-control" accept="image/*"> 
                            <span id="errorAlert-4"></span>
                    </div>

					<div class="mb-2">
						<label for="dateOfBirth">Data de nascimento*</label> <input
							type="date" name="dateOfBirth" id="dateOfBirth"
							class="form-control" required="required" max="2012"> <span
							id="errorAlert-5"></span>
					</div>

					<div class="mb-4">
						<label for="gender">Gênero*</label> <select name="gender"
							class="form-select" aria-label="gender" id="gender"
							required="required">
							<option value="" selected>Selecione</option>
							<option value="MALE">Masculino</option>
							<option value="FEMALE">Feminino</option>
							<option value="OTHER">Outro</option>
							<option value="NOT_INFORMED">Prefiro não responder</option>
						</select> <span id="errorAlert-6"></span>
					</div>


					<div class="mb-2">
						<button type="submit" class="btn btn-success col-lg-12">Cadastrar</button>
					</div>


				</div>
			</form>
		</div>
	</main>

</body>
</html>