package br.edu.ifsp.arq.tsi.arqweb1.ifitness.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.Encryptor;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.user.UserLogin;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.user.UserNotFoundException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final int COOKIE_MAX_AGE = 7 * (60 * 60 * 24);


	public LoginServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		RequestDispatcher dispatcher = null;

		try {
			User user = UserLogin.login(email, password);

			Cookie cookie = new Cookie("userId", Encryptor.encrypt(String.valueOf(user.getEmail())));
			cookie.setMaxAge(COOKIE_MAX_AGE);

			req.setAttribute("user", user);
			resp.addCookie(cookie);

			dispatcher = req.getRequestDispatcher("/homeServlet");
		} catch (UserNotFoundException e) {
			req.setAttribute("result", "notFound");
			dispatcher = req.getRequestDispatcher("./login.jsp");
		}

		dispatcher.forward(req, resp);
	}

}
