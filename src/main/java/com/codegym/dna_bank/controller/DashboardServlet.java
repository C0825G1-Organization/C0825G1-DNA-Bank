package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.ComparisonResult;
import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.repository.DNASampleRepository;
import com.codegym.dna_bank.repository.UserRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Dashboard - Hiển thị kết quả matching DNA
 */
@WebServlet(name = "dashboardServlet", urlPatterns = "/dashboard")
public class DashboardServlet extends HttpServlet {

    private final UserRepository userRepo = new UserRepository();
    private final DNASampleRepository sampleRepo = new DNASampleRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Kiểm tra đăng nhập
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy thông tin user hiện tại
        User currentUser = (User) session.getAttribute("user");
        
        // Nếu không có user trong session, lấy lại từ database
        if (currentUser == null) {
            try {
                currentUser = userRepo.findById(userId);
                if (currentUser != null) {
                    session.setAttribute("user", currentUser);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        req.setAttribute("currentUser", currentUser);

        // Lấy kết quả matching từ session
        @SuppressWarnings("unchecked")
        List<ComparisonResult> relatives = (List<ComparisonResult>) session.getAttribute("relatives");

        if (relatives == null) {
            relatives = new ArrayList<>();
        }

        // Lấy thông tin chi tiết của người thân
        Map<Integer, User> relativeUsers = new HashMap<>();
        
        // Chỉ xử lý nếu có currentUser
        if (currentUser != null) {
            for (ComparisonResult result : relatives) {
                try {
                    // Lấy sample để lấy userId
                    com.codegym.dna_bank.entity.DNASample sample1 = sampleRepo.findById(result.getSample1Id());
                    com.codegym.dna_bank.entity.DNASample sample2 = sampleRepo.findById(result.getSample2Id());

                    // Kiểm tra null trước khi truy cập
                    if (sample1 == null || sample2 == null) {
                        System.out.println("Warning: DNA sample not found for comparison " + result.getComparisonId());
                        continue;
                    }

                    int otherUserId = (sample1.getUserId() == userId) ? sample2.getUserId() : sample1.getUserId();

                    // Lấy thông tin user
                    User relativeUser = userRepo.findById(otherUserId);
                    if (relativeUser != null) {
                        relativeUsers.put(result.getComparisonId(), relativeUser);
                    }
                } catch (SQLException e) {
                    System.out.println("Error loading relative user: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }

        req.setAttribute("relatives", relatives);
        req.setAttribute("relativeUsers", relativeUsers);
        req.setAttribute("matchCount", relatives.size());

        req.getRequestDispatcher("WEB-INF/dashboard.jsp").forward(req, resp);
    }
}