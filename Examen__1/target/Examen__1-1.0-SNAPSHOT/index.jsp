<%@ page import="com.example.examen__1.model.Competidor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clasificación Olímpica de BMX</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css"> <!-- Tu archivo CSS personalizado -->
</head>
<body>
<!-- Encabezado -->
<header class="bg-primary text-white text-center py-3">
    <h1>Clasificación Olímpica de BMX</h1>
</header>

<div class="container mt-4">
    <!-- Formulario para añadir nuevos competidores -->
    <form id="addCompetitorForm" class="mb-4">
        <div class="form-row">
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
            </div>
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" required>
            </div>
            <div class="form-group col-md-4">
                <input type="text" class="form-control" id="pais" name="pais" placeholder="País" required>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Agregar Competidor</button>
    </form>

    <!-- Tabla de clasificación -->
    <table class="table table-responsive table-striped">
        <thead class="thead-dark">
        <tr>
            <th onclick="sortTable(0)">Nombre</th>
            <th onclick="sortTable(1)">Código País</th>
            <th onclick="sortTable(2)">R1</th>
            <th onclick="sortTable(3)">R2</th>
            <th onclick="sortTable(4)">R3</th>
            <th onclick="sortTable(5)">Puntuación Acumulada</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody id="competitorTable">
        <%
            List<Competidor> competidores = (List<Competidor>) request.getAttribute("competidores");
            for (Competidor c : competidores) {
        %>
        <tr>
            <td><a href="#" onclick="showDetails('<%=c.getNombre()%>', '<%=c.getApellido()%>', '<%=c.getPais()%>', '<%=c.getDescripcion()%>')"><%= c.getNombre().toLowerCase() %></a></td>
            <td><%= c.getCodigo() %></td>
            <td><%= c.getRonda1() %></td>
            <td><%= c.getRonda2() %></td>
            <td><%= c.getRonda3() %></td>
            <td><%= c.getPuntuacionAcumulada() %></td>
            <td>
                <button class="btn btn-danger" onclick="deleteCompetitor(<%= c.getPuesto() %>)">Eliminar</button>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Pie de página -->
<footer class="bg-secondary text-white text-center py-3">
    <p>&copy; <%= java.time.LocalDate.now() %> - Tu Nombre Completo</p>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="script.js"></script> <!-- Tu archivo JavaScript personalizado -->
</body>
</html>
