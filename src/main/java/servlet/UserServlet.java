package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.UserDAO;
import entity.Users;

@WebServlet({"/user/index","/user/create","/user/update","/user/delete","/user/edit/*"})
public class UserServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		UserDAO dao = new UserDAO();
		Users user = new Users();
		String uri = req.getRequestURI();
		if(uri.contains("edit")) {
			String id = uri.substring(uri.lastIndexOf("/")+1);
			user = dao.findById(id);
			req.setAttribute("views", "/views/admin/quanlyUser.jsp");
		}else if(uri.contains("create")) {
			this.create(req, resp);
			req.setAttribute("views", "/views/admin/quanlyUser.jsp");
		}else if(uri.contains("update")) {
			this.update(req, resp);
			req.setAttribute("views", "/views/admin/quanlyUser.jsp");
		}else if(uri.contains("delete")) {
			this.delete(req, resp);
			req.setAttribute("views", "/views/admin/quanlyUser.jsp");
		}
		
		req.setAttribute("form", user);
		req.setAttribute("user", dao.findAll());
		req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
		System.out.println(dao.findAll());
	}
	
	
	
	protected void create(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		Users user = new Users();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			dao.create(user);
			req.setAttribute("message", "Thêm mới thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Thêm mới thật bại!");
		}
	}
	
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		Users user = new Users();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			dao.update(user);
			req.setAttribute("message", "Cập nhật thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Cập nhật thật bại!");
		}
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		Users user = new Users();
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
