<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Clasificación Olímpica de BMX</title>
    <!-- Incluir archivo de estilos personalizado -->
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<!-- Encabezado con estilos personalizados -->
<header class="header">
    <div class="container">
        <!-- Título con fuente personalizada (modificada en styles.css) -->
        <h1>Clasificación Olímpica de BMX</h1>
    </div>
</header>

<main class="container">
    <!-- Formulario de búsqueda -->
    <form action="competitors" method="get" class="search-form">
        <input type="hidden" name="action" value="search">
        <div class="form-row">
            <div class="form-group">
                <label for="searchName">Nombre:</label>
                <input type="text" id="searchName" name="searchName" maxlength="40">
            </div>
            <div class="form-group">
                <label for="searchCountry">País:</label>
                <input type="text" id="searchCountry" name="searchCountry" maxlength="40">
            </div>
            <div class="form-group">
                <label for="searchScore">Puntaje Total Mayor a:</label>
                <input type="number" id="searchScore" name="searchScore">
            </div>
        </div>
        <button type="submit" class="btn">Buscar</button>
    </form>

    <!-- Botones de acciones -->
    <div class="action-buttons">
        <a href="addCompetitor.jsp" class="btn btn-add">Añadir Competidor</a>
        <a href="competitors?action=generateRandom" class="btn btn-generate">Generar Competidor Aleatorio</a>
        <a href="competitors?action=simulateRace" class="btn btn-simulate">Simular Carrera</a>
    </div>

    <!-- Tabla de competidores -->
    <div class="competitors-table">
        <table>
            <thead>
            <tr>
                <th><a href="competitors?sortField=firstName&sortDirection=asc">Nombre ▲</a> | <a href="competitors?sortField=firstName&sortDirection=desc">▼</a></th>
                <th><a href="competitors?sortField=lastName&sortDirection=asc">Apellido ▲</a> | <a href="competitors?sortField=lastName&sortDirection=desc">▼</a></th>
                <th>Fecha de Nacimiento</th>
                <th><a href="competitors?sortField=country&sortDirection=asc">País ▲</a> | <a href="competitors?sortField=country&sortDirection=desc">▼</a></th>
                <th>Código País</th>
                <th>Puntaje R1</th>
                <th>Puntaje R2</th>
                <th>Puntaje R3</th>
                <th><a href="competitors?sortField=totalScore&sortDirection=asc">Puntaje Total ▲</a> | <a href="competitors?sortField=totalScore&sortDirection=desc">▼</a></th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="competidor" items="${competitors}" varStatus="status">
                <tr class="${status.index == 0 ? 'gold-medal' : status.index == 1 ? 'silver-medal' : status.index == 2 ? 'bronze-medal' : ''}">
                    <td>
                        <a href="competitors?action=viewDetails&index=${status.index}">${competidor.firstName}</a>
                    </td>
                    <td>${competidor.lastName}</td>
                    <td>${competidor.birthDate}</td>
                    <td>${competidor.country}</td>
                    <td>${competidor.countryCode}</td>
                    <td>${competidor.roundScores[0]}</td>
                    <td>${competidor.roundScores[1]}</td>
                    <td>${competidor.roundScores[2]}</td>
                    <td>${competidor.totalScore}</td>
                    <td>
                        <a href="editCompetitor.jsp?index=${status.index}" class="btn btn-sm">Editar</a>
                        <a href="competitors?action=delete&index=${status.index}" class="btn btn-sm btn-delete">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Botones para exportar la tabla -->
    <form action="competitors" method="get" class="export-form">
        <button type="submit" name="action" value="exportExcel" class="btn btn-export">Exportar a Excel</button>
        <button type="submit" name="action" value="exportJSON" class="btn btn-export">Exportar a JSON</button>
    </form>
</main>

<footer class="footer">
    <div class="container">
        <p>Fecha: <%= new java.util.Date() %></p>
        <p>Nombre Completo: Santiago Cardona López</p>
    </div>
</footer>
</body>
</html>
