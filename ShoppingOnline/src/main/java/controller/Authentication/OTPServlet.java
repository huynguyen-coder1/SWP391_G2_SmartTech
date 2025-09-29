package controller.Authentication;

import connect.DBConnection;
import java.io.IOException;
import dao.AccountDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OTPServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userOTP = request.getParameter("otp");
        String sessionOTP = (String) request.getSession().getAttribute("otp");
        String email = (String) request.getSession().getAttribute("email");
        String otpMode = (String) request.getSession().getAttribute("otpMode"); // "activate" hoặc "reset"

        if (sessionOTP != null && sessionOTP.equals(userOTP)) {
            try (Connection conn = DBConnection.getConnection()) {
                AccountDAO userDAO = new AccountDAO(conn);

                if ("activate".equals(otpMode)) {
                    User pendingUser = (User) request.getSession().getAttribute("pendingUser");
                    if (pendingUser != null) {
                        pendingUser.setActive(true);
                        userDAO.addUser(pendingUser); // lưu vào DB

                        User user = userDAO.getUserByEmail(email);
                        request.getSession().setAttribute("currentUser", user);

                        clearOtpSession(request);
                        request.getSession().removeAttribute("pendingUser");
                        response.sendRedirect(request.getContextPath() + "/home.jsp");
                    } else {
                        // Không có user chờ xác nhận
                        request.setAttribute("error", "Không tìm thấy người dùng cần xác thực. Vui lòng đăng ký lại.");
                        request.getRequestDispatcher("account/register.jsp").forward(request, response);
                    }
                } else if ("reset".equals(otpMode)) {
                    // Lưu email vào session resetEmail
                    HttpSession session = request.getSession();
                    session.setAttribute("resetEmail", email);

                    // Chỉ xóa otp và otpMode, giữ email để ResetPasswordServlet dùng
                    session.removeAttribute("otp");
                    session.removeAttribute("otpMode");

                    response.sendRedirect(request.getContextPath() + "/account/resetPassword.jsp");
                } else {
                    // Trường hợp mục đích OTP không xác định
                    clearOtpSession(request);
                    response.sendRedirect(request.getContextPath() + "/home.jsp");
                }

            } catch (SQLException ex) {
                Logger.getLogger(OTPServlet.class.getName()).log(Level.SEVERE, null, ex);
                request.setAttribute("error", "Lỗi hệ thống. Vui lòng thử lại sau.");
                request.getRequestDispatcher("account/confirmOTP.jsp").forward(request, response);
            }

        } else {
            // OTP không đúng
            request.setAttribute("error", "Mã OTP không chính xác. Vui lòng kiểm tra lại.");
            request.getRequestDispatcher("account/confirmOTP.jsp").forward(request, response);
        }
    }

    private void clearOtpSession(HttpServletRequest request) {
        request.getSession().removeAttribute("otp");
        request.getSession().removeAttribute("email");
        request.getSession().removeAttribute("otpMode");
    }
}
