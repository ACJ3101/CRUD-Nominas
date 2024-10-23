<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Empleado" %>

<html>
<head>
    <title>Modificar Empleado</title>
     <style>
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

        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="submit"] {
            padding: 10px 15px;
            background-color: #2980B9;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1A6A91;
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            form {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <h1>Modificar Empleado</h1>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <c:if test="${not empty empleado}">
        <form action="modificar" method="post"> 
            <input type="hidden" name="dni" value="${empleado.dni}" />
            <label>Nombre:</label>
            <input type="text" name="nombre" value="${empleado.nombre}" required /><br />
            <label>Sexo:</label>
            <select name="sexo" required>
                <option value="M" <c:if test="${empleado.sexo == 'M'}">selected</c:if>>Masculino</option>
                <option value="F" <c:if test="${empleado.sexo == 'F'}">selected</c:if>>Femenino</option>
            </select><br />
            <label>Categoría:</label>
            <select name="categoria" required>
                <option value="1" <c:if test="${empleado.categoria == '1'}">selected</c:if>>1</option>
                <option value="2" <c:if test="${empleado.categoria == '2'}">selected</c:if>>2</option>
                <option value="3" <c:if test="${empleado.categoria == '3'}">selected</c:if>>3</option>
                <option value="4" <c:if test="${empleado.categoria == '4'}">selected</c:if>>4</option>
                <option value="5" <c:if test="${empleado.categoria == '5'}">selected</c:if>>5</option>
                <option value="6" <c:if test="${empleado.categoria == '6'}">selected</c:if>>6</option>
                <option value="7" <c:if test="${empleado.categoria == '7'}">selected</c:if>>7</option>
                <option value="8" <c:if test="${empleado.categoria == '8'}">selected</c:if>>8</option>
                <option value="9" <c:if test="${empleado.categoria == '9'}">selected</c:if>>9</option>
                <option value="10" <c:if test="${empleado.categoria == '10'}">selected</c:if>>10</option>
            </select><br />
            <label>Años Trabajados:</label>
            <input type="number" name="anos_trabajados" value="${empleado.anosTrabajados}" required /><br />
            <input type="submit" value="Modificar" />
        </form>
    </c:if>

      <br>
    <a href="index.jsp">Volver al Menu</a>
    <a href="javascript:history. back()">Volver</a>
</body>
</html>
