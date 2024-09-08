<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Añadir Competidor</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<header class="header">
  <div class="container">
    <h1>Añadir Nuevo Competidor</h1>
  </div>
</header>

<main class="container">
  <!-- Mostrar mensaje de error si existe -->
  <c:if test="${not empty errorMessage}">
    <div class="error-message">${errorMessage}</div>
  </c:if>

  <!-- Formulario para añadir competidor -->
  <form action="competitors" method="post">
    <input type="hidden" name="action" value="add">

    <div class="form-row">
      <div class="form-group">
        <label for="firstName">Nombre:</label>
        <input type="text" id="firstName" name="firstName" maxlength="40" required>
      </div>
      <div class="form-group">
        <label for="lastName">Apellido:</label>
        <input type="text" id="lastName" name="lastName" maxlength="40" required>
      </div>
    </div>

    <div class="form-row">
      <div class="form-group">
        <label for="birthDate">Fecha de Nacimiento:</label>
        <input type="date" id="birthDate" name="birthDate" required>
      </div>
      <div class="form-group">
        <label for="country">País:</label>
        <select id="country" name="country" required>
          <option value="">Seleccione un país</option>
          <option value="Colombia">Colombia</option>
          <option value="France">France</option>
          <option value="USA">USA</option>
          <option value="Canada">Canada</option>
          <option value="Brazil">Brazil</option>
          <option value="Argentina">Argentina</option>
          <option value="Mexico">Mexico</option>
          <option value="Netherlands">Netherlands</option>
          <option value="Australia">Australia</option>
          <option value="Spain">Spain</option>
          <option value="Italy">Italy</option>
          <option value="Germany">Germany</option>
          <option value="Japan">Japan</option>
          <option value="China">China</option>
          <option value="South Korea">South Korea</option>
          <option value="Russia">Russia</option>
          <option value="Great Britain">Great Britain</option>
          <option value="Switzerland">Switzerland</option>
          <option value="Belgium">Belgium</option>
          <option value="Denmark">Denmark</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label for="description">Descripción:</label>
      <textarea id="description" name="description" maxlength="200" required></textarea>
    </div>

    <button type="submit" class="btn">Añadir Competidor</button>
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