package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dao.VideoDAO;

@WebServlet({"/admin/layoutAdmin","/admin/editvideo","/admin/edituser","/admin/report","/admin/logoff","/report/favorite","/report/favoriteuser","/report/shared"})
public class AdminServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		UserDAO dao = new UserDAO();
		if(uri.contains("layoutAdmin")) {
			req.setAttribute("views", "/views/jspFile/home.jsp");
		} else if(uri.contains("editvideo")) {
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
		} else if(uri.contains("edituser")) {
			req.setAttribute("views", "/views/admin/quanlyUser.jsp");
		} else if(uri.contains("report")) {
			req.setAttribute("views", "/views/admin/baocao-thongke.jsp");
		} else if(uri.contains("favorite")) {
			req.getRequestDispatcher("/views/admin/favorites.jsp").forward(req, resp);
		} else if(uri.contains("favoriteuser")) {
			req.getRequestDispatcher("/views/admin/favoritesUsers.jsp").forward(req, resp);
		} else if(uri.contains("shared")) {
			req.getRequestDispatcher("/views/admin/sharedFriends.jsp").forward(req, resp);
		} else if(uri.contains("logoff")) {
			this.logoff(req, resp);
			req.setAttribute("view", "/views/jspFile/login.jsp");
			req.getRequestDispatcher("/views/jspFile/layout.jsp").forward(req, resp);
		} 
		req.setAttribute("user", dao.findAll());
		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
	}
	
	private void logoff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().removeAttribute("user");
	}
	
}
