

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.UserDAO;


public class LevelUpdate extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		UserDAO udao = new UserDAO();
		int vip = Integer.parseInt(req.getParameter("vip"));
		int num = Integer.parseInt(req.getParameter("num"));
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		req.setCharacterEncoding("UTF-8");
		
		int rs = udao.update(vip, num);
		out.print(rs);

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doGet(req, res);
	}

}
