<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Crear Nuevo Empleado</title>
 <style>
 /* Crear Nuevo Empleado CSS */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h1 {
    color: #2C3E50;
    font-size: 2.5em;
    margin-bottom: 20px;
}

/* Error Message Style */
div.error-message {
    color: red;
    margin-bottom: 20px;
}

/* Form Styles */
form {
    width: 80%;
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

label {
    display: block;
    margin: 10px 0 5px;
}

input[type="text"],
input[type="number"],
select {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 15px;
}

input[type="submit"] {
    padding: 10px 15px;
    background-color: #2980B9;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
    width: 100%;
}

input[type="submit"]:hover {
    background-color: #1A6A91;
    transform: translateY(-2px);
}

/* Back Link Style */
a {
    color: #2980B9;
    text-decoration: none;
    margin-bottom: 20px;
}

a:hover {
    text-decoration: underline;
}

/* Responsive Design */
@media (max-width: 600px) {
    h1 {
        font-size: 1.8em;
    }

    form {
        width: 100%;
    }
}
 
 </style>
</head>
<body>
	<h1>Crear Nuevo Empleado</h1>

	<c:if test="${not empty error}">
		<div style="color: red;">${error}</div>
	</c:if>

 <br>
    <a href="javascript:history. back()">Volver</a>
	<form action="${pageContext.request.contextPath}/crearEmpleado"
		method="post">
		<label>DNI:</label> <input type="text" name="dni" required /><br />

		<label>Nombre:</label> <input type="text" name="nombre" required /><br />

		<label>Sexo:</label> <select name="sexo" required>
			<option value="M">Masculino</option>
			<option value="F">Femenino</option>
		</select><br /> <label>Categoría:</label> <select name="categoria" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>

		</select><br /> <label>Años Trabajados:</label> <input type="number"
			name="anos_trabajados" required /><br /> <input type="submit"
			value="Crear Empleado" />
	</form>

	<br>
	<form action="../index.jsp" method="get">
		<input type="submit" value="Volver al Menú Principal">
	</form>
</body>
</html>
