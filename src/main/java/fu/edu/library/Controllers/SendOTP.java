package fu.edu.library.Controllers;


import fu.edu.library.BO.EmailBO;
import fu.edu.library.BO.UserBO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author 84823
 */
@WebServlet("/SendOTP")
public class SendOTP extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("forgot_password.jsp");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserBO userBO = new UserBO();
        try {
            if (userBO.isEmailExists(email)) {
                String otp = generateOTP();
                long expiryTime = System.currentTimeMillis() + 15 * 60 * 1000; 
                userBO.saveOTP(email, otp, expiryTime);

                boolean emailSent = EmailBO.sendEmail(email, "Email xác nhận", "Mã OTP của bạn là: " + otp);
                if (emailSent) {
                    response.sendRedirect("verify_otp.jsp?email=" + email);
                } else {
                    request.setAttribute("error", "Không thể gửi email. Vui lòng thử lại.");
                    request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Email không tồn tại.");
                request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi. Vui lòng thử lại.");
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        }
    }

    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
}




    


