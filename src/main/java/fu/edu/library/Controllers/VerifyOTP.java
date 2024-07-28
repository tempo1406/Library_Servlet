package fu.edu.library.Controllers;

import fu.edu.library.BO.UserBO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");

        UserBO userBO = new UserBO();
        try {
            String savedOTP = userBO.getOTP(email);
            long expiryTime = userBO.getOTPExpiry(email);

            if (savedOTP != null && savedOTP.equals(otp) && System.currentTimeMillis() < expiryTime) {
                boolean success = userBO.updatePassword(email, newPassword);
                if (success) {
                    response.sendRedirect("login.jsp?message=success!");
                } else {
                    request.setAttribute("error", "Lỗi khi đổi mật khẩu.");
                    request.getRequestDispatcher("verify_otp.jsp?email=" + email).forward(request, response);
                }
            } else {
                request.setAttribute("error", "OTP không hợp lệ hoặc đã hết hạn.");
                request.getRequestDispatcher("verify_otp.jsp?email=" + email).forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
            request.getRequestDispatcher("verify_otp.jsp?email=" + email).forward(request, response);
        }
    }
}



