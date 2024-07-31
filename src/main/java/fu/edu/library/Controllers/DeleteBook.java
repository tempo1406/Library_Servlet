package fu.edu.library.Controllers;

import fu.edu.library.BO.BookBO;
import fu.edu.library.DAOs.BookDAO;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BookBO bookBO = new BookBO();
    private BookDAO bookDao = new BookDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBook() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        boolean result = false;

        try {
            if (id == null) {
                result = bookBO.deleteAllBook();
            } else {
                result = bookBO.deleteBook(id);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("errorString", result ? "Đã xóa thành công" : "Lỗi khi xóa sách");
        response.sendRedirect(request.getContextPath() + "/ManageBook");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
