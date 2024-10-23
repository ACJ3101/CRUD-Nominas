<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>Consultar Salario</title>
    <style>
    /* Consultar Salario CSS */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    color: #2C3E50;
    font-size: 2em;
    margin-bottom: 20px;
}

/* Error Message Style */
.error {
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

input[type="text"] {
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
    h2 {
        font-size: 1.5em;
    }

    form {
        width: 100%;
    }
}
    
    </style>
     
</head>
<body>
    <h2>Consultar Salario de un Empleado</h2>
     <br>
    <a href="javascript:history. back()">Volver</a>

    <form action="${pageContext.request.contextPath}/salario" method="post">
        <label for="dni">DNI del Empleado:</label>
        <input type="text" id="dni" name="dni" required>
        <input type="submit" value="Buscar Salario">
    </form>

    <br>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:if test="${not empty dni}">
        <p>El salario del empleado con DNI <strong>${dni}</strong> es: <strong>${salario}</strong></p>
    </c:if>
    
    
    <form action="../index.jsp" method="get">
        <input type="submit" value="Volver al Menú Principal">
    </form>
</body>
</html>
