<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>

</style>
<head>
    <title>Aplicación de Nóminas</title>
    <style> 
    /* Aplicación de Nóminas CSS */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 40px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h1 {
    color: #2C3E50;
    font-size: 2.5em;
    margin-bottom: 40px;
    text-align: center;
}

/* Navigation Links */
a {
    display: block;
    width: 60%;
    padding: 15px 20px;
    margin-bottom: 20px;
    background-color: #2980B9;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.3s ease;
}

a:hover {
    background-color: #1A6A91;
    transform: translateY(-2px);
}

/* Responsive Design */
@media (max-width: 600px) {
    h1 {
        font-size: 1.8em;
    }

    a {
        width: 90%;
    }
}
    
    </style>
    
</head>
<body>
    <h1>Bienvenido a la Aplicación de Nóminas</h1>
    
    
       <a href="empleados">Mostrar todos los empleados</a>
        <a href="salario">Mostrar salario de un empleado</a>
        <a href="filtrar">Filtrar</a>
   
</body>
</html>
