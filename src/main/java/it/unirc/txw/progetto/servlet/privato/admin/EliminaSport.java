package it.unirc.txw.progetto.servlet.privato.admin;

import java.io.IOException;

import it.unirc.txw.progetto.beans.sport.Sport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EliminaSport
 */
@WebServlet("/EliminaSport")
public class EliminaSport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public EliminaSport() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		if (session.getAttribute("autenticato") == null) {
			response.sendRedirect("/RichiediLogin?errore=1");
			return;
		}

		String id = request.getParameter("id");

		int sportId = Integer.parseInt(id);

		Sport sport = new Sport();
		sport.setId(sportId);
		if (sportDAO.elimina(sport)) {
			response.sendRedirect("Index?successo");
			return;
		} else {
			response.sendRedirect("Index?errore");
		}
	}

}
