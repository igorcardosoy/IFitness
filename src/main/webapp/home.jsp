<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="pt-BR" data-bs-theme="dark">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="https://cdn-icons-png.flaticon.com/512/2749/2749777.png"
	type="image/x-icon">
<title>IFitness - Página Principal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="styles/global.css" rel="stylesheet">
<link href="styles/home.css" rel="stylesheet">
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
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="./activity-register.jsp">Nova Atividade</a></li>
					</ul>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Pesquisar" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Pesquisar</button>
					</form>
					<c:choose>
						<c:when test="${user.profilePicture != null}">
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false" style="margin-left: 20px;"> <img
								class="rounded-circle" alt="Foto de perfil"
								src="${user.profilePicture}" width="32" height="32">
							</a>
							<ul class="dropdown-menu" style="right: 0; left: unset;">
								<li><a class="dropdown-item" href="#">Minha Conta</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Sair</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Opções </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Minha Conta</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#">Sair</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</nav>

	</header>

	<div class="container my-center">
		<div class="center col-lg-10 col-sm-12"
			style="margin-top: 50px; width: fit-content">
			<h1 class="text-center">Listagem de Atividades</h1>
			<c:choose>
				<c:when test="${fn:length(userActivities) == 0}">
					<p class="text-center">Nenhuma atividade cadastrada.</p>
				</c:when>
				<c:otherwise>
					<table
						class="table table-dark table-hover align-middle table-bordered text-center">
						<thead class="table-dark">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Tipo</th>
								<th scope="col">Data</th>
								<th scope="col">Distância</th>
								<th scope="col">Duração</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="activity" items="${userActivities}"
								varStatus="index">
								<tr>
									<td scope="row">${index.count}</td>
									<td><c:choose>
											<c:when test="${activity.type == 'WALKING'}">
												<img alt="Caminhada" src="images/icons/walking_icon.png">
											</c:when>
											<c:when test="${activity.type == 'RUNNING'}">
												<img alt="Corrida" src="images/icons/running_icon.png">
											</c:when>
											<c:when test="${activity.type == 'CYCLING'}">
												<img alt="Ciclismo" src="images/icons/cycling_icon.png">
											</c:when>
											<c:when test="${activity.type == 'SWIMMING'}">
												<img alt="Natação" src="images/icons/swimming_icon.png">
											</c:when>
										</c:choose></td>

									<td><fmt:parseDate value="${activity.date}"
											pattern="yyyy-MM-dd" var="parsedDate" type="date" /> <fmt:formatDate
											value="${parsedDate}" var="formattedDate" type="date"
											pattern="dd/MM/yyyy" /> ${formattedDate}</td>
									<td><fmt:formatNumber value="${activity.distance}"
											var="formattedDistance" type="number" maxFractionDigits="1" />
										${formattedDistance} km</td>
									<td><fmt:formatNumber value="${activity.duration}"
											var="formattedDuration" type="number" maxFractionDigits="1" />

										<c:if test="${activity.duration < 60}">
                                            ${formattedDuration} min
                                         </c:if> <c:if
											test="${activity.duration >= 60}">
											<fmt:formatNumber value="${activity.duration/60}"
												var="formattedHours" type="number" maxFractionDigits="0" />
                                            ${formattedHours}h
                                            <fmt:formatNumber
												value="${activity.duration%60}" var="formattedMinutes"
												type="number" maxFractionDigits="1" />
                                            ${formattedMinutes}min
                                           </c:if></td>
                                           
                                           <td>
									<a class="btn" data-bs-toggle="tooltip" data-bs-placement="top" 
										title="Editar"
										href="activityRegister?action=update&activity-id=${activity.id}">
										<img src="images/icons/pencil-square.svg" alt="Editar">
									</a>
									<a class="btn" data-bs-toggle="tooltip" data-bs-placement="top" 
										title="Remover"
										href="activityRegister?action=delete&activity-id=${activity.id}">
										<img src="images/icons/trash.svg" alt="Remover">
									</a>
								</td>
							</c:forEach>

						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>