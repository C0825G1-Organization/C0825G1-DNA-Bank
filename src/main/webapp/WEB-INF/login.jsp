<%-- Created by IntelliJ IDEA. User: Sinh Date: 12/18/2025 Time: 8:46 AM To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đăng nhập - DNA Bank</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css"
                    rel="stylesheet">
                <style>
                    :root {
                        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    }

                    body {
                        background: var(--primary-gradient);
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }

                    .login-card {
                        max-width: 450px;
                        width: 100%;
                    }

                    .logo-icon {
                        width: 60px;
                        height: 60px;
                        background: var(--primary-gradient);
                        border-radius: 15px;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        font-size: 2rem;
                        color: white;
                        margin-bottom: 1rem;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="login-card mx-auto">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-5">
                                <div class="text-center mb-4">
                                    <div class="logo-icon mx-auto">🧬</div>
                                    <h2 class="fw-bold mb-2">DNA Bank</h2>
                                    <p class="text-muted">Đăng nhập để tìm kiếm người thân</p>
                                </div>

                                <!-- Alert Messages -->
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                    </div>
                                </c:if>

                                <c:if test="${not empty success}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        <i class="bi bi-check-circle-fill me-2"></i>${success}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                    </div>
                                </c:if>

                                <!-- Login Form -->
                                <form action="${pageContext.request.contextPath}/login" method="post">
                                    <div class="mb-3">
                                        <label for="username" class="form-label fw-semibold">Username</label>
                                        <input type="text" class="form-control form-control-lg" id="username"
                                            name="username" value="${username}" required autofocus>
                                    </div>

                                    <div class="mb-4">
                                        <label for="password" class="form-label fw-semibold">Password</label>
                                        <input type="password" class="form-control form-control-lg" id="password"
                                            name="password" required>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                                        <i class="bi bi-box-arrow-in-right me-2"></i>Đăng nhập
                                    </button>
                                </form>

                            </div>
                        </div>

                        <p class="text-center text-white mt-3 small">
                            © 2024 DNA Bank. Hệ thống tìm kiếm người thân qua ADN.
                        </p>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>