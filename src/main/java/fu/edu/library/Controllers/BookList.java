/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.edu.library.Controllers;

import fu.edu.library.DAOs.BookDAO;
import fu.edu.library.Models.Book;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 *
 * @author 84823
 */
@WebServlet("/BookList")
public class BookList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage = request.getParameter("index");
        String id = request.getParameter("id");
        int index = 1;
        if (indexPage != null && !indexPage.isEmpty()) {
            try {
                index = Integer.parseInt(indexPage);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        BookDAO bookDao = new BookDAO();
        List<Book> listBook;
        String titlePage = null;
        String viewPath = null;

        if (id == null || id.isEmpty()) {
            try {
                int count = bookDao.totalPage();
                int endPage = count; // Total number of pages

                List<Book> list = bookDao.getBooks(index);

                request.setAttribute("endP", endPage);
                request.setAttribute("currentP", index);
                request.setAttribute("bookList", list);
                titlePage = "List Book";
                viewPath = "/manage_book.jsp";
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        request.getSession().setAttribute("titlePage", titlePage);
        RequestDispatcher rd = request.getServletContext().getRequestDispatcher(viewPath);
        rd.forward(request, response);
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        BookDAO cm = new BookDAO();
        List<Book> list = cm.getBooks(0); // Sử dụng index = 1 cho trang đầu tiên
        for (Book o : list) {
            System.out.println(o.toString());
        }
        System.out.println("anhba");
    }
}
