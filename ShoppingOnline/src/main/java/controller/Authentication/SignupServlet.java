package controller.Authentication;

import connect.DBConnection;
import dao.AccountDAO;
import model.User;
import service.EmailService;
import service.OTPGenerator;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("account/register.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            AccountDAO userDAO = new AccountDAO(conn);

            if (userDAO.getUserByEmail(email) != null) {
                request.setAttribute("error", "Email đã tồn tại!");
                request.getRequestDispatcher("account/register.jsp").forward(request, response);
                return;
            }

            // Tạo đối tượng User nhưng KHÔNG thêm vào DB vội
            User newUser = new User();
            newUser.setEmail(email);
            newUser.setPasswordHash(BCrypt.hashpw(password, BCrypt.gensalt())); // mã hóa mật khẩu
            newUser.setFullName(fullName);
            newUser.setPhone(phone);
            newUser.setActive(false);
            newUser.setCreatedAt(new Timestamp(System.currentTimeMillis()));
            newUser.setGoogleID(null);
            newUser.setAvatarUrl(null);

            // Gửi OTP
            String otp = OTPGenerator.generateOTP();
            EmailService emailService = new EmailService();
            String subject = "Activate account OTP";
            emailService.sendOTPEmail(email, otp, subject);

            // Lưu dữ liệu vào session để xác thực sau
            request.getSession().setAttribute("otp", otp);
            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("otpMode", "activate");
            request.getSession().setAttribute("pendingUser", newUser); // 💡 GIẢI PHÁP CHÍNH

            response.sendRedirect("account/confirmOTP.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi cơ sở dữ liệu!");
            request.getRequestDispatcher("account/register.jsp").forward(request, response);
        }
    }
}
