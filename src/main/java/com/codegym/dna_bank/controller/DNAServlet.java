package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.Customer;
import com.codegym.dna_bank.service.CustomerService;

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
    private final CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "":
            case "/":
            case "/home":
                try {
                    List<Customer> customers = customerService.findAll();
                    req.setAttribute("customers", customers);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
                break;

            default:
                req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}
