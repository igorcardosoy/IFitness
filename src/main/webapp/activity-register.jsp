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
<title>IFitness - Cadastro de Atividade</title>
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
				<a class="navbar-brand" href="homeServlet"> <img class="me-2"
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
					Você precisa estar logado para cadastrar uma atividade.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

			</c:if>

			<c:if test="${result == 'registered'}">

				<div class="alert alert-success alert-dismissible fade show"
					role="alert">
					Atividade foi cadastrada com sucesso.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>

			</c:if>


			<form action="activityRegister" method="post" id="formActivityRegister">
				<div class="col-lg-4 offset-lg-4 col-sm-12">
					<h1 class="text-center">Nova Atividade</h1>

					<div class="mb-2">
						<label for="activityType">Tipo da atividade*</label> <select
							name="activityType" class="form-select" aria-label="activityType"
							id="activityType" required="required">
							<option value="" selected>Selecione</option>
							<option value="WALKING">Caminhada</option>
							<option value="CYCLING">Ciclismo</option>
							<option value="RUNNING">Corrida</option>
							<option value="SWIMMING">Natação</option>
						</select>
					</div>

					<div class="mb-2">
						<label for="dateOfActivity">Data*</label> <input type="date"
							name="dateOfActivity" id="dateOfActivity" class="form-control"
							required="required">
					</div>

					<div class="mb-2">
						<label for="activityDistance">Distância (Km)*</label> <input
							type="number" name="activityDistance" id="activityDistance"
							class="form-control" step="0.1" min="0.1" required="required">
					</div>
					
					<div class="mb-4">
						<label for="activityDuration">Duração (Min)*</label> <input
							type="number" name="activityDuration" id="activityDuration"
							class="form-control" step="1" min="1" required="required">
					</div>

					<div class="mb-2">
						<button type="submit" class="btn btn-success col-lg-12">Cadastrar</button>
					</div>
					

				</div>
			</form>
			
			<c:if test="${result == 'registered'}">

				<button type="button" class="btn btn-primary col-lg-4 offset-lg-4"
                    onclick="window.location.href='homeServlet'">Voltar</button>

			</c:if>
		</div>
	</main>

</body>
</html>