package controller.Authentication;

import connect.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/reset-pass"})
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("resetEmail") == null) {
            request.setAttribute("error", "Phiên làm việc hết hạn. Vui lòng thực hiện lại từ đầu.");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
            return;
        }

        String email = session.getAttribute("resetEmail").toString();

        // Kiểm tra confirm password
        if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
            return;
        }

        boolean updated = false;

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE [User] SET PasswordHash = ? WHERE Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);

            //  Hash mật khẩu trước khi lưu
            String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
            ps.setString(1, hashed);
            ps.setString(2, email);

            int rows = ps.executeUpdate();
            updated = rows > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("error", "Lỗi hệ thống. Vui lòng thử lại.");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
            return;
        }

        if (updated) {
            // Xóa session email sau khi đổi thành công
            session.removeAttribute("resetEmail");
            response.sendRedirect(request.getContextPath() + "/account/login.jsp?msg=reset_success");
        } else {
            request.setAttribute("error", "Không thể cập nhật mật khẩu. Vui lòng thử lại.");
            request.getRequestDispatcher("/account/resetPassword.jsp").forward(request, response);
        }
    }
}
