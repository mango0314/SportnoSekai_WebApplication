package it.unirc.txw.progetto.servlet;

import java.io.IOException;

import it.unirc.txw.progetto.beans.account.Account;
import it.unirc.txw.progetto.beans.account.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final AccountDAO accountDAO = new AccountDAO();

	/**
	 * Default constructor.
	 */
	public Login() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		// reucpero username e password
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// prendo il ruolo e la squadra relativa a quest'ultimo se c'è
		int ruolo = accountDAO.getRuolo(username, password);
		// basta che il ruolo restituito sia -1, ovvero quello di default del DAO, per
		// sapere che non esiste quel coppia username e password
		if (ruolo == -1) {
			response.sendRedirect("RichiediLogin?errore = credenziali_errate");
			return;
		}
		int squadraid = accountDAO.getSq(username, password);

		// creo un account e lo riempio con le informazioni

		Account account = new Account();
		account.setUsername(username);
		account.setPassword(password);
		account.setRuolo(ruolo);
		account.setId_Sq(squadraid);

		Cookie cookie = new Cookie("username", username);
		cookie.setHttpOnly(true);
		cookie.setPath("/");

		HttpSession session = request.getSession();
		session.setAttribute("autenticato", true);
		session.setAttribute("squadra_id", squadraid);
		session.setAttribute("ruolo", ruolo);
		response.addCookie(cookie);
		response.sendRedirect("/privato/");

	}
}
