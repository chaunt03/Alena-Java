package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VideoDAO;
import entity.Videos;

@WebServlet("/details")
public class Details extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if(uri.contains("detail")) {
			this.details(req, resp);
			req.setAttribute("view", "/views/jspFile/details.jsp");
		}
		req.getRequestDispatcher("/views/jspFile/layout.jsp").forward(req, resp);
	}
	
	private void details(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		String id = req.getParameter("id");
		System.out.println(id);
		if(id != null && !id.isEmpty()) {
			Videos video = dao.findById(id);
			if(video != null) {
				req.setAttribute("details", video);
			} else {
				System.out.println("Error");
			}
		} else {
			System.out.println("NoID");
		}
		req.setAttribute("video", dao.findAll());
	}
	
//	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
//		VideoDAO dao = new VideoDAO();
//		Videos video = (Videos) dao.findAll();
//		System.out.println(video);
//		req.setAttribute("video", video);
//		req.getRequestDispatcher("/views/jspFile/details.jsp").forward(req, resp);
//	}
}
