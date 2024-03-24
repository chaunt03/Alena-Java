package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.VideoDAO;
import entity.Videos;

@WebServlet({"/video/index","/video/create","/video/update","/video/delete","/video/edit/*"})
public class VideoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		VideoDAO dao = new VideoDAO();
		Videos video = new Videos();
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			String id = uri.substring(uri.lastIndexOf("/")+1);
			video = dao.findById(id);
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
		}else if(uri.contains("create")) {
			this.create(req, resp);
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
		}else if(uri.contains("update")) {
			this.update(req, resp);
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
		}else if(uri.contains("delete")) {
			this.delete(req, resp);
			req.setAttribute("views", "/views/admin/quanlyvideo.jsp");
		}
		
		req.setAttribute("form", video);
		req.setAttribute("video", dao.findAll());
		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
	}
	
	
	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		Videos video = new Videos();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			dao.create(video);
			req.setAttribute("message", "Thêm mới thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Thêm mới thật bại!");
		}
	}
	
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		Videos video = new Videos();
		try {
			BeanUtils.populate(video, req.getParameterMap());
			dao.update(video);
			req.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Cập nhật thật bại!");
		}
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		VideoDAO dao = new VideoDAO();
		Videos video = new Videos();
		try {
			String id = req.getParameter("id");
			dao.remove(id);
			req.setAttribute("message", "Xóa thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Xóa thất bại!");
		}
	}
}
