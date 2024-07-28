package fu.edu.library.BO;

import java.sql.SQLException;

import fu.edu.library.DAOs.UserDAO;
import fu.edu.library.Models.User;
import java.util.Date;
import javax.mail.MessagingException;

public class UserBO {

    UserDAO userDAO = new UserDAO();
 
    public User getAccount(String username, String password) throws ClassNotFoundException, SQLException {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        return userDAO.getUser(username, password);
    }

    public boolean registerAccount(User user) throws ClassNotFoundException, SQLException {
        if (userDAO.isUserExists(user.getUsername())) {
            return false;
        }
        return userDAO.addUser(user);
    }

    public boolean isEmailExists(String email) throws ClassNotFoundException, SQLException {
        return userDAO.isEmailExists(email);
    }
    
     public boolean saveOTP(String email, String otp, long expiryTime) throws ClassNotFoundException, SQLException {
        return userDAO.saveOTP(email, otp, expiryTime);
    }

    public String getOTP(String email) throws ClassNotFoundException, SQLException {
        return userDAO.getOTP(email);
    }

    public long getOTPExpiry(String email) throws ClassNotFoundException, SQLException {
        return userDAO.getOTPExpiry(email);
    }

    public boolean updatePassword(String email, String newPassword) throws ClassNotFoundException, SQLException {
        return userDAO.updatePassword(email, newPassword);
    }
}
