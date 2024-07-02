package br.edu.ifsp.arq.tsi.arqweb1.ifitness.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.Activity;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activity.ActivityReader;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.user.UserNotFoundException;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.user.UserReader;

@WebServlet("/homeServlet")
public class HomeServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		User user = null;

		try {
			user = (User) req.getAttribute("user");
			if (user == null)
				throw new UserNotFoundException("User not found");
			
			List<Activity> activities = ActivityReader.readByUser(user);
			
			req.setAttribute("userActivities", activities);
			req.setAttribute("user", user);
			dispatcher = req.getRequestDispatcher("./home.jsp");
		} catch (UserNotFoundException e) {
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				try {
					for (Cookie cookie : cookies) {
						if (cookie.getName().equals("userId")) {
							user = (User) UserReader.findUserByEmail(cookie.getValue());
							List<Activity> activities = ActivityReader.readByUser(user);
							
							req.setAttribute("userActivities", activities);
							req.setAttribute("user", user);
							
							dispatcher = req.getRequestDispatcher("./home.jsp");
							break;
						}
					}
				} catch (UserNotFoundException e1) {
					req.setAttribute("result", "notFound");
					dispatcher = req.getRequestDispatcher("./login.jsp");
				}
			}
		}

		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
