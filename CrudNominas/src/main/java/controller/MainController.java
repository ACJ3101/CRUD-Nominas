package controller;

import dao.EmpleadoDAO;
import dao.NominaDAO;
import model.Empleado;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/empleadoController")
public class MainController extends HttpServlet {
	private EmpleadoDAO empleadoDAO;
	private NominaDAO nominaDAO;

	@Override
	public void init() throws ServletException {
		empleadoDAO = new EmpleadoDAO();
		nominaDAO = new NominaDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String opcion = request.getParameter("opcion");
		switch (opcion) {
		case "crear":
			request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
			break;
		case "listar":
			List<Empleado> empleados = empleadoDAO.listarEmpleados();
			request.setAttribute("empleados", empleados);
			request.getRequestDispatcher("views/empleados.jsp").forward(request, response);
			break;
		case "modificar":
			String dni = request.getParameter("dni");
			Empleado empleado = empleadoDAO.obtenerEmpleadoPorDNI(dni);
			if (empleado != null) {
				request.setAttribute("empleado", empleado);
				request.getRequestDispatcher("views/modificar.jsp").forward(request, response);
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "Empleado no encontrado");
			}
			break;
		case "filtrar":
			handleFilterRequest(request, response);
			break;
		case "salario":
			response.sendRedirect("views/consultarSalario.jsp");
			break;
		default:
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
			break;
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String opcion = request.getParameter("opcion");
		switch (opcion) {
		case "crear":
			handleCreateEmployee(request, response);
			break;
		case "eliminar":
			handleDeleteEmployee(request, response);
			break;
		case "modificar":
			handleUpdateEmployee(request, response);
			break;
		case "salario":
			handleSalaryRequest(request, response);
			break;
		default:
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
			break;
		}
	}

	private void handleCreateEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String sexo = request.getParameter("sexo");
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		int anosTrabajados = Integer.parseInt(request.getParameter("anos_trabajados"));

		Empleado empExistente = empleadoDAO.obtenerEmpleadoPorDNI(dni);
		if (empExistente != null) {
			request.setAttribute("error", "El DNI ya está registrado");
			request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
			return;
		}

		if (anosTrabajados < 0 || categoria < 1 || categoria > 10) {
			request.setAttribute("error", "Valores inválidos en el formulario");
			request.getRequestDispatcher("views/crearEmpleado.jsp").forward(request, response);
			return;
		}

		Empleado nuevoEmpleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
		empleadoDAO.agregarEmpleado(nuevoEmpleado);
		response.sendRedirect("empleadoController?action=listar");
	}

	private void handleDeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dni = request.getParameter("dni");
		empleadoDAO.eliminarEmpleado(dni);
		response.sendRedirect("empleadoController?action=listar");
	}

	private void handleUpdateEmployee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String sexo = request.getParameter("sexo");
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		int anosTrabajados = Integer.parseInt(request.getParameter("anos_trabajados"));

		Empleado empleado = new Empleado(dni, nombre, sexo, categoria, anosTrabajados);
		empleadoDAO.actualizarEmpleado(empleado);

		double nuevoSalario = nominaDAO.calcularNuevoSalario(empleado);
		nominaDAO.actualizarSalario(dni, nuevoSalario);
		response.sendRedirect("empleadoController?action=listar");
	}

	private void handleFilterRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sexo = request.getParameter("sexo");
		String nombre = request.getParameter("nombre");
		Integer categoria = request.getParameter("categoria") != null
				? Integer.parseInt(request.getParameter("categoria"))
				: null;
		Integer anos = request.getParameter("anyos") != null ? Integer.parseInt(request.getParameter("anyos")) : null;

		List<Empleado> empleadosFiltrados = empleadoDAO.filtrarEmpleados(sexo, nombre, categoria, anos);
		request.setAttribute("empleados", empleadosFiltrados);
		request.getRequestDispatcher("views/filtrar.jsp").forward(request, response);
	}

	private void handleSalaryRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String dni = request.getParameter("dni");
		double salario = nominaDAO.obtenerSalarioPorDni(dni);

		if (salario > 0) {
			request.setAttribute("dni", dni);
			request.setAttribute("salario", salario);
			request.getRequestDispatcher("views/consultarSalario.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "No se encontró el salario para el DNI: " + dni);
			request.getRequestDispatcher("views/consultarSalario.jsp").forward(request, response);
		}
	}
}
