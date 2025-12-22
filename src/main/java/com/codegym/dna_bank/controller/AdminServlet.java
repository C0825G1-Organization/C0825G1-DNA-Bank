package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.Account;
import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.repository.AccountRepository;
import com.codegym.dna_bank.repository.UserRepository;
import com.codegym.dna_bank.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "adminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();
    private final UserRepository userRepo = new UserRepository();
    private final AccountRepository accountRepo = new AccountRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "dashboard";

        try {
            switch (action) {
                case "dashboard":
                    showDashboard(req, resp);
                    break;
                case "users":
                    listUsers(req, resp);
                    break;
                case "addUser":
                    showAddUserForm(req, resp);
                    break;
                case "accounts":
                    listAccounts(req, resp);
                    break;
                case "editUser":
                    showEditUserForm(req, resp);
                    break;
                case "deleteUser":
                    deleteUser(req, resp);
                    break;
                case "deleteAccount":
                    deleteAccount(req, resp);
                    break;
                case "updateRole":
                    updateRole(req, resp);
                    break;
                default:
                    resp.sendRedirect("admin?action=dashboard");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Integer> stats = adminService.getSystemStats();
        req.setAttribute("stats", stats);
        req.getRequestDispatcher("WEB-INF/admin/dashboard.jsp").forward(req, resp);
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String search = req.getParameter("search");
        String sortBy = req.getParameter("sortBy");
        String order = req.getParameter("order");
        
        List<User> users = userRepo.searchUsers(search, sortBy, order);
        
        req.setAttribute("users", users);
        req.setAttribute("search", search);
        req.setAttribute("sortBy", sortBy);
        req.setAttribute("order", order);
        req.getRequestDispatcher("WEB-INF/admin/users.jsp").forward(req, resp);
    }

    private void listAccounts(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<Account> accounts = accountRepo.findAll();
        req.setAttribute("accounts", accounts);
        req.getRequestDispatcher("WEB-INF/admin/accounts.jsp").forward(req, resp);
    }

    private void showEditUserForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        User user = userRepo.findById(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("WEB-INF/admin/editUser.jsp").forward(req, resp);
    }

    private void showAddUserForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/admin/addUser.jsp").forward(req, resp);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        int userId = Integer.parseInt(req.getParameter("id"));
        userRepo.delete(userId);
        resp.sendRedirect("admin?action=users");
    }

    private void deleteAccount(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int accountId = Integer.parseInt(req.getParameter("id"));
        accountRepo.delete(accountId);
        resp.sendRedirect("admin?action=accounts");
    }

    private void updateRole(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int accountId = Integer.parseInt(req.getParameter("id"));
        String role = req.getParameter("role");
        accountRepo.updateRole(accountId, role);
        resp.sendRedirect("admin?action=accounts");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        try {
            if ("editUser".equals(action)) {
                updateUser(req, resp);
            } else if ("addUser".equals(action)) {
                addUser(req, resp);
            } else {
                doGet(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String dobStr = req.getParameter("dob");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role");

        // Simple validation
        if (accountRepo.findByUsername(username) != null) {
            req.setAttribute("error", "Username đã tồn tại");
            req.getRequestDispatcher("WEB-INF/admin/addUser.jsp").forward(req, resp);
            return;
        }

        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        account.setRole(role);

        int accountId = accountRepo.insert(account);
        if (accountId > 0) {
            User user = new User();
            user.setAccountId(accountId);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);
            if (dobStr != null && !dobStr.isEmpty()) {
                user.setDob(LocalDate.parse(dobStr));
            }
            user.setGender(gender);
            userRepo.insert(user);
            resp.sendRedirect("admin?action=users");
        } else {
            req.setAttribute("error", "Lỗi khi tạo tài khoản");
            req.getRequestDispatcher("WEB-INF/admin/addUser.jsp").forward(req, resp);
        }
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
        String gender = req.getParameter("gender");

        User user = new User();
        user.setUserId(userId);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setDob(dob);
        user.setGender(gender);

        userRepo.update(user);
        resp.sendRedirect("admin?action=users");
    }
}
