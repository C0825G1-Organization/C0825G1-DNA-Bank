package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "dnaServlet", urlPatterns = {"", "/", "/home"})
public class DNAServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "":
            case "/":
            case "/home":
                try {
                    List<User> users = userService.findAll();
                    req.setAttribute("users", users);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
                break;

            case "upload":
                req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                break;

            case "detail":
                String userIdParam = req.getParameter("userId");
                if (userIdParam != null && !userIdParam.isEmpty()) {
                    try {
                        int userId = Integer.parseInt(userIdParam);
                        User user = userService.findById(userId);

                        if (user != null) {
                            req.setAttribute("user", user);
                            req.getRequestDispatcher("WEB-INF/detailUser.jsp").forward(req, resp);
                        } else {
                            resp.sendRedirect("home");
                        }
                    } catch (NumberFormatException e) {
                        resp.sendRedirect("home");
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
                else {
                    resp.sendRedirect("home");
                }
                break;

            case "profile":
                break;
            default:
                req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
//
//        switch (action) {
//            case 'upload':
//
//        }
    }
}
