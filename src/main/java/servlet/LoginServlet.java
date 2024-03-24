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

@WebServlet({"/form/login","/form/logoff","/form/forgotpassword","/form/changepassword","/form/registration","/form/editprofile"})
public class LoginServlet extends HttpServlet{
	HttpSession session;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = req.getRequestURI();
		if(uri.contains("login")) {
			req.setAttribute("view", "/views/jspFile/home.jsp");
			this.login(req, resp);
		} else if(uri.contains("registration")) {
			this.registration(req, resp);
			req.setAttribute("view", "/views/jspFile/registration.jsp");
		} else if(uri.contains("changepassword")) {
//			this.changepassword(req, resp);
			req.setAttribute("view", "/views/jspFile/ChangePassword.jsp");
		} else if(uri.contains("editprofile")) {
			this.editprofile(req, resp);
			req.setAttribute("view", "/views/jspFile/EditProfile.jsp");
		} 
		
		req.getRequestDispatcher("/views/jspFile/layout.jsp").forward(req, resp);
	}
	
	private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getMethod();
		if (method.equalsIgnoreCase("post")) {
			String id = req.getParameter("username");
			String pw = req.getParameter("password");
			try {
			UserDAO dao = new UserDAO();
			Users user = dao.findById(id);
			if(!user.getPassword().equals(pw)) {
			req.setAttribute("message", "Sai mật khẩu!");
			}
			else if(user.getAdmin().booleanValue()){
			req.setAttribute("message", "Đăng nhập thành công!");
			req.getSession().setAttribute("user", user);
			req.getRequestDispatcher("/views/admin/layoutAdmin.jsp").forward(req, resp);
			} else {
				req.setAttribute("message", "Đăng nhập thành công!");
				req.getSession().setAttribute("user", user);
				req.getRequestDispatcher("/views/jspFile/layout.jsp").forward(req, resp);
			}
			} catch (Exception e) {
			req.setAttribute("message", "Sai tên đăng nhập!");
			}
		}
	}
	
	private void registration(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		Users user = new Users();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			dao.create(user);
			req.setAttribute("message", "Tạo tài khoản thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Tạo tài khoản thất bại");
		}
	}
	
//	private void changepassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String id = req.getParameter("id");
//		String pass = req.getParameter("password");
//		String newpass = req.getParameter("newpass");
//		String confirm = req.getParameter("confirm");
//		UserDAO dao = new UserDAO();
//		Users user = new Users();
//		
//	}
	
	private void editprofile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		UserDAO dao = new UserDAO();
		Users user = new Users();
		try {
			BeanUtils.populate(user, req.getParameterMap());
			dao.update(user);
			req.setAttribute("message", "Cập nhật tài khoản thành công!");
		} catch (Exception e) {
			// TODO: handle exception
			req.setAttribute("message", "Cập nhật tài khoản thất bại");
		}
	}
}
