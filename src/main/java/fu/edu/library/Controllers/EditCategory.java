package fu.edu.library.Controllers;

import fu.edu.library.BO.CategoryBO;
import fu.edu.library.Models.Category;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 *
 * @author 84823
 */
@WebServlet("/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryBO categoryBO = new CategoryBO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("User") == null) {
			String errorString = "Bạn cần đăng nhập trước";
			request.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		} else {
			String id = (String) request.getParameter("id");

			Category category = null;

			String errorString = null;

			try {
				category = categoryBO.findCategory(id);
			} catch (SQLException e) {
				e.printStackTrace();
				errorString = e.getMessage();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			if (errorString != null && category == null) {
				response.sendRedirect(request.getServletPath() + "/ManageCategory");
				return;
			}

			// Lưu thông tin vào request attribute trước khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("category", category);

			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/edit_category.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id = Integer.parseInt(request.getParameter("id"));
		String name = (String) request.getParameter("name_category");
		Category category = new Category(id, name);
		String errorString = null;
		int result = 0;
		try {
			result = categoryBO.updateCategory(category);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result == 0 && errorString == null) {
			errorString = "Chỉnh sửa thất bại";
		}
		if (result == 1)
			errorString = "Chỉnh sửa thành công";

		request.setAttribute("errorString", errorString);
		request.setAttribute("category", category);

		if (errorString != null) {
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/edit_category.jsp");
			dispatcher.forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath() + "/ManageCategory");
		}
	}

}
