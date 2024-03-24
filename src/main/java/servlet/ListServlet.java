package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import antlr.CharQueue;
import dao.FavoriteDAO;
import dao.UserDAO;
import dao.VideoDAO;
import entity.Favorites;
import entity.Users;
import entity.Videos;

@WebServlet({ "/layout", "/home/favorite", "/home/login", "/home/forgotpassword", "/home/registration",
		"/home/changepassword", "/home/editprofile", "/home/logoff", "/like", "/home/unlike" })
public class ListServlet extends HttpServlet {
	private HttpSession session;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String uri = req.getRequestURI();
		VideoDAO dao = new VideoDAO();
		session = req.getSession();
		session.setAttribute("video", dao.findAll());
		if (uri.contains("layout")) {
			req.setAttribute("view", "/views/jspFile/home.jsp");
		} else if (uri.contains("favorite")) {
			this.favorite(req, resp);
			req.setAttribute("view", "/views/jspFile/favorite.jsp");
		} else if (uri.contains("login")) {
			req.setAttribute("view", "/views/jspFile/login.jsp");
		} else if (uri.contains("forgotpassword")) {
			req.setAttribute("view", "/views/jspFile/ForgotPassword.jsp");
		} else if (uri.contains("registration")) {
			req.setAttribute("view", "/views/jspFile/registration.jsp");
		} else if (uri.contains("changepassword")) {
			req.setAttribute("view", "/views/jspFile/ChangePassword.jsp");
		} else if (uri.contains("editprofile")) {
			req.setAttribute("view", "/views/jspFile/EditProfile.jsp");
		} else if (uri.contains("logoff")) {
			this.logoff(req, resp);
			req.setAttribute("view", "/views/jspFile/login.jsp");
		} else if (uri.contains("unlike")) {
			this.doUnlike(req, resp);
			req.setAttribute("view", "/views/jspFile/favorite.jsp");
		} else if (uri.contains("like")) {
			this.doLike(req, resp);
			req.setAttribute("view", "/views/jspFile/home.jsp");
		}

		req.getRequestDispatcher("/views/jspFile/layout.jsp").forward(req, resp);
	}

	private void favorite(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("user") != null) {
			FavoriteDAO dao = new FavoriteDAO();
			Users user = (Users) req.getSession().getAttribute("user");
			System.out.println(user);
			session.setAttribute("fav_like", dao.findId(user.getId()));
		} else {
			req.getRequestDispatcher("/views/jspFile/login.jsp").forward(req, resp);
		}
	}

	private void logoff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute("user");
	}

	private void doUnlike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("videoId");
		System.out.println(id);
		Users user = (Users) req.getSession().getAttribute("user");
		VideoDAO dao = new VideoDAO();
		Videos video = dao.findById(id);
		if (user != null) {
			FavoriteDAO daoFav = new FavoriteDAO();
			Favorites fav = daoFav.findUserLikeVideo(video.getId(), user.getId());
			if (fav != null) {
				daoFav.remove(fav.getId().toString());
				session.setAttribute("fav_like", daoFav.findId(user.getId()));
			}
		}
	}

	private void doLike(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("user") != null) {
			String id = req.getParameter("id");
			Users user = (Users) req.getSession().getAttribute("user");
			LocalDate local = LocalDate.now();
			if (user != null) {
				VideoDAO dao = new VideoDAO();
				Videos video = dao.findById(id);
				System.out.println(video);
				FavoriteDAO daoFav = new FavoriteDAO();
				Favorites fav = new Favorites(user, video, java.sql.Date.valueOf(local));
				daoFav.create(fav);
			}
		} else {
			req.getRequestDispatcher("/views/jspFile/login.jsp").forward(req, resp);
		}
	}
}
