package com.codegym.dna_bank.controller;

import com.codegym.dna_bank.entity.DNALocusResult;
import com.codegym.dna_bank.entity.DNASample;
import com.codegym.dna_bank.entity.User;
import com.codegym.dna_bank.repository.DNALocusResultRepository;
import com.codegym.dna_bank.repository.DNASampleRepository;
import com.codegym.dna_bank.service.DNALocusResultService;
import com.codegym.dna_bank.service.DNASampleService;
import com.codegym.dna_bank.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "dnaServlet", urlPatterns = {"", "/", "/home"})
public class DNAServlet extends HttpServlet {
    private final UserService userService = new UserService();
    private final DNALocusResultService locusResultService = new DNALocusResultService();
    private final DNASampleService sampleService = new DNASampleService();

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
        resp.setCharacterEncoding("UTF-8");
        
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "upload":
                try {
                    // Extract form parameters
                    String fullName = req.getParameter("fullName");
                    String email = req.getParameter("email");
                    String phone = req.getParameter("phone");
                    String dobString = req.getParameter("dob");
                    String gender = req.getParameter("gender");
                    String address = req.getParameter("address");
                    String testDateString = req.getParameter("testDate");
                    
                    // Validate required fields
                    if (fullName == null || fullName.trim().isEmpty() ||
                        email == null || email.trim().isEmpty() ||
                        phone == null || phone.trim().isEmpty() ||
                        dobString == null || dobString.trim().isEmpty() ||
                        gender == null || gender.trim().isEmpty() ||
                        address == null || address.trim().isEmpty() ||
                        testDateString == null || testDateString.trim().isEmpty()) {
                        
                        req.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin bắt buộc!");
                        req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                        return;
                    }
                    
                    // Parse dates
                    LocalDate dob = LocalDate.parse(dobString);
                    LocalDate testDate = LocalDate.parse(testDateString);
                    
                    // Create User object
                    User user = new User();
                    user.setFullName(fullName);
                    user.setEmail(email);
                    user.setPhone(phone);
                    user.setDob(dob);
                    user.setGender(gender);
                    user.setAddress(address);
                    user.setAccountId(null);
                    
                    // Save user to database
                    boolean userSaved = userService.save(user);
                    
                    if (!userSaved) {
                        req.setAttribute("errorMessage", "Có lỗi xảy ra khi lưu thông tin người dùng!");
                        req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                        return;
                    }
                    
                    // Get the saved user ID (we need to retrieve it from database)
                    // For now, we'll get the last inserted user - in production, use RETURNING clause or last_insert_id
                    List<User> users = userService.findAll();
                    Integer userId = users.get(users.size() - 1).getUserId();
                    
                    // Create DNA Sample
                    DNASample dnaSample = new DNASample();
                    dnaSample.setUserId(userId);
                    dnaSample.setGender(gender);
                    dnaSample.setTestDate(testDate);

                    Integer sampleId = sampleService.insert(dnaSample);
                    
                    if (sampleId == null) {
                        req.setAttribute("errorMessage", "Có lỗi xảy ra khi lưu mẫu ADN!");
                        req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                        return;
                    }
                    
                    // Extract and save DNA locus results
                    List<DNALocusResult> locusResults = new ArrayList<>();
                    
                    for (int i = 1; i <= 16; i++) {
                        String allele1 = req.getParameter("locus" + i + "_allele1");
                        String allele2 = req.getParameter("locus" + i + "_allele2");
                        
                        if (allele1 != null && !allele1.trim().isEmpty() && 
                            allele2 != null && !allele2.trim().isEmpty()) {
                            
                            DNALocusResult locusResult = new DNALocusResult();
                            locusResult.setSampleId(sampleId);
                            locusResult.setLocusId(i);
                            locusResult.setAllele1(allele1.trim());
                            locusResult.setAllele2(allele2.trim());
                            locusResults.add(locusResult);
                        }
                    }
                    
                    // Save all locus results in batch
                    boolean locusSaved = locusResultService.insertBatch(locusResults);
                    
                    if (locusSaved) {
                        // Success - redirect to home with success message
                        req.getSession().setAttribute("successMessage", "Upload thông tin ADN và 16 đoạn gen thành công!");
                        resp.sendRedirect("home");
                    } else {
                        req.setAttribute("errorMessage", "Có lỗi xảy ra khi lưu thông tin đoạn gen!");
                        req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                    req.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
                    req.getRequestDispatcher("WEB-INF/upload.jsp").forward(req, resp);
                }
                break;
                
            default:
                resp.sendRedirect("home");
                break;
        }
    }
}
