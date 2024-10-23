<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html lang="es">

<head>

    <title>Filtrar Empleados</title>
<style>
/* Filtrar Empleados CSS */
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

/* Navigation Links */
a {
    color: #2980B9;
    text-decoration: none;
    margin-bottom: 20px;
    display: inline-block;
}

a:hover {
    text-decoration: underline;
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

div {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="number"],
select {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button[type="submit"],
button[type="reset"] {
    padding: 10px 15px;
    background-color: #2980B9;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.3s ease;
    margin-right: 10px;
}

button[type="submit"]:hover,
button[type="reset"]:hover {
    background-color: #1A6A91;
    transform: translateY(-2px);
}

button a {
    color: white;
    text-decoration: none;
}

button a:hover {
    text-decoration: underline;
}

/* Table Styles */
table {
    width: 80%;
    border-collapse: collapse;
    margin-bottom: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background-color: #2980B9;
    color: white;
}

tr:nth-child(even) {
    background-color: #ecf0f1;
}

tr:hover {
    background-color: #d1e8ff; /* Color de fondo al pasar el ratón */
}

/* Responsive Design */
@media (max-width: 600px) {
    h2 {
        font-size: 1.5em;
    }

    form, table {
        width: 100%;
    }
}

</style>

</head>

<body>

    <h2>Filtrar Empleados</h2>

    <a href="index.jsp">Volver al inicio</a>
     <br>
    <a href="javascript:history. back()">Volver</a>


    <!-- Formulario de Filtrado -->

    <form action="filtrar" method="get">

       



        <div>

            <label for="sexo">Sexo:</label>

            <select id="sexo" name="sexo">

                <option value="">--Selecciona--</option>

                <option value="M" ${param.sexo == 'M' ? 'selected' : ''}>Masculino</option>

                <option value="F" ${param.sexo == 'F' ? 'selected' : ''}>Femenino</option>

            </select>

        </div>



        <div>

            <label for="nombre">Nombre:</label>

            <input type="text" id="nombre" name="nombre" value="${param.nombre}">

        </div>



        <div>

            <label for="categoria">Categoría:</label>

            <input type="number" id="categoria" name="categoria" value="${param.categoria}">

        </div>



        <div>

            <label for="anyos">Años:</label>

            <input type="number" id="anyos" name="anyos" value="${param.anyos}">

        </div>



        <button type="submit">Aplicar Filtros</button>
        <button type ="reset" >Reset</button>
        <button type="submit"><a href="filtrar" >Eliminar Filtros</a></button>

    </form>




    <!-- Mostrar Lista de Empleados Filtrados -->

    <h3>Resultados del Filtrado:</h3>

    <table border="1">

        <thead>

            <tr>

                <th>Dni</th>

                <th>Nombre</th>

                <th>Sexo</th>

                <th>Categoría</th>

                <th>Años</th>

            </tr>

        </thead>

        <tbody>

            <c:forEach var="empleado" items="${empleados}">

                <tr>

                    
                    <td>${empleado.dni}</td>

                    <td>${empleado.nombre}</td>

                    <td>${empleado.sexo}</td>

                    <td>${empleado.categoria}</td>

                    <td>${empleado.anosTrabajados}</td>

                </tr>

            </c:forEach>

        </tbody>

    </table>



  


</body>

</html>