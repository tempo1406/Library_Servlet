package fu.edu.library.Controllers;

import fu.edu.library.BO.BookBO;
import fu.edu.library.DAOs.BookDAO;
import fu.edu.library.Models.Book;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManageBook
 */
@WebServlet("/ManageBook")
public class ManageBook extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private BookBO bookBO = new BookBO();
    private BookDAO bookDAO = new BookDAO();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageBook() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check for user session
        if (request.getSession().getAttribute("User") == null) {
            String errorString = "Bạn cần đăng nhập trước";
            request.setAttribute("errorString", errorString);
            RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Handle deletion if action is deleteBook
        String action = request.getParameter("action");
        if ("deleteBook".equals(action)) {
            String bookId = request.getParameter("id");
            try {
                boolean result = bookBO.deleteBook(bookId);
                request.setAttribute("errorString", result ? "Đã xóa thành công" : "Lỗi khi xóa sách");
            } catch (ClassNotFoundException | SQLException e) {
                Logger.getLogger(ManageBook.class.getName()).log(Level.SEVERE, null, e);
                request.setAttribute("errorString", e.getMessage());
            }
        }

        // Handle pagination parameters
        String indexPage = request.getParameter("index");
        int index = 1;
        if (indexPage != null && !indexPage.isEmpty()) {
            try {
                index = Integer.parseInt(indexPage);
                if (index < 1) {
                    index = 1;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        String titlePage = "Manage Book";
        String viewPath = "/manage_book.jsp";

        try {
            int count = bookDAO.totalPage();
            int endPage = count; // Total number of pages

            List<Book> list = bookDAO.getBooks(index);

            request.setAttribute("endP", endPage);
            request.setAttribute("currentP", index);
            request.setAttribute("bookList", list);
            request.setAttribute("numberBooks", list.size());
            request.getSession().setAttribute("titlePage", titlePage);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ManageBook.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorString", ex.getMessage());
        }

        request.getSession().setAttribute("Check", "ManageBook");
        RequestDispatcher rd = request.getServletContext().getRequestDispatcher(viewPath);
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
