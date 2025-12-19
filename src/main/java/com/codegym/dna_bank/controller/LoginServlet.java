package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.Account;
import com.codegym.dna_bank.entity.ComparisonResult;
import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.service.AccountService;
import com.codegym.dna_bank.service.DNAComparisonService;
import com.codegym.dna_bank.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Servlet xử lý đăng nhập
 * Sau khi đăng nhập thành công → Tự động so sánh DNA
 */
@WebServlet(name = "loginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    private final AccountService accountService = new AccountService();
    private final UserService userService = new UserService();
    private final DNAComparisonService dnaComparisonService = new DNAComparisonService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Hiển thị trang login
        req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Validate input
        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ username và password");
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra đăng nhập
        Account account = accountService.login(username, password);

        if (account == null) {
            req.setAttribute("error", "Sai username hoặc password");
            req.setAttribute("username", username);
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
            return;
        }

        // Đăng nhập thành công
        HttpSession session = req.getSession();
        session.setAttribute("account", account);
        session.setAttribute("accountId", account.getAccountId());
        session.setAttribute("username", account.getUsername());
        session.setAttribute("role", account.getRole());

        // Lấy thông tin user
        User user = userService.findByAccountId(account.getAccountId());
        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("fullName", user.getFullName());

            // ===== AUTO-MATCHING DNA =====
            System.out.println("=== BẮT ĐẦU AUTO-MATCHING DNA ===");
            System.out.println("User: " + user.getFullName() + " (ID: " + user.getUserId() + ")");

            try {
                // Tự động so sánh DNA với tất cả user khác
                List<ComparisonResult> relatives = dnaComparisonService.findRelatives(user.getUserId());

                // Lưu kết quả vào session để hiển thị
                session.setAttribute("relatives", relatives);
                session.setAttribute("matchCount", relatives.size());

                if (relatives.size() > 0) {
                    System.out.println("✓ Tìm thấy " + relatives.size() + " người thân!");
                    req.setAttribute("success", "Đăng nhập thành công! Tìm thấy " + relatives.size() + " người có quan hệ huyết thống.");
                } else {
                    System.out.println("✗ Không tìm thấy người thân nào.");
                    req.setAttribute("info", "Đăng nhập thành công! Chưa tìm thấy người thân trong hệ thống.");
                }

            } catch (Exception e) {
                System.out.println("Lỗi khi auto-matching: " + e.getMessage());
                e.printStackTrace();
                req.setAttribute("warning", "Đăng nhập thành công nhưng không thể so sánh DNA: " + e.getMessage());
            }
        }

        // Redirect dựa trên role
        if ("ADMIN".equals(account.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/admin?action=dashboard");
        } else {
            resp.sendRedirect(req.getContextPath() + "/home");
        }
    }
}