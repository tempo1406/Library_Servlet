package fu.edu.library.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fu.edu.library.BO.UserBO;
import fu.edu.library.Models.User;

@WebServlet("/Signup")
public class Signup extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserBO userBO = new UserBO();

    public Signup() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String errorString = null;
        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }
        request.getSession().removeAttribute("Check");
        request.setAttribute("errorString", errorString);
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/signup.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String rePassword = request.getParameter("re_password");
    String errorString = null;

    // Kiểm tra thông tin đầu vào
    if (username == null || password == null || rePassword == null || email == null || email.trim().isEmpty()) {
        errorString = "Thông tin đăng ký không đầy đủ hoặc email không hợp lệ.";
    } else if (!password.equals(rePassword)) {
        errorString = "Mật khẩu và xác nhận mật khẩu không khớp.";
    } else {
        try {
            if (userBO.isEmailExists(email)) {
                errorString = "Email đã tồn tại. Vui lòng chọn email khác.";
            } else {
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);

                // Đăng ký tài khoản
                if (userBO.registerAccount(user)) {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                    return;
                } else {
                    errorString = "Đăng ký thất bại. Tài khoản có thể đã tồn tại.";
                }
            }
        } catch (ClassNotFoundException e) {
            errorString = "Lỗi lớp cơ sở dữ liệu không được tìm thấy.";
            e.printStackTrace();
        } catch (SQLException e) {
            errorString = "Lỗi SQL: " + e.getMessage();
            e.printStackTrace();
        }
    }

    request.setAttribute("errorString", errorString);
    RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/signup.jsp");
    dispatcher.forward(request, response);
}

}
