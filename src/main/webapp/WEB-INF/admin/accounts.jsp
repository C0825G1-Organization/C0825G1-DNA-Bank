<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Quản lý Accounts - DNA Admin</title>
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                    :root {
                        --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                        --primary-color: #667eea;
                        --secondary-color: #764ba2;
                        --dark: #2d3436;
                    }

                    body {
                        font-family: 'Inter', sans-serif;
                        margin: 0;
                        display: flex;
                        background: #f4f7f6;
                    }

                    .sidebar {
                        width: 280px;
                        height: 100vh;
                        background: #fff;
                        box-shadow: 4px 0 10px rgba(0, 0, 0, 0.05);
                        padding: 2rem;
                        position: fixed;
                    }

                    .sidebar-brand {
                        display: flex;
                        align-items: center;
                        gap: 10px;
                        font-weight: 800;
                        font-size: 1.5rem;
                        color: var(--primary-color);
                        margin-bottom: 3rem;
                        text-decoration: none;
                    }

                    .sidebar-brand span {
                        background: var(--primary-gradient);
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                    }

                    .nav-link {
                        display: flex;
                        align-items: center;
                        gap: 12px;
                        padding: 0.8rem 1.2rem;
                        color: #636e72;
                        text-decoration: none;
                        border-radius: 12px;
                        transition: all 0.3s ease;
                        margin-bottom: 0.5rem;
                    }

                    .nav-link:hover,
                    .nav-link.active {
                        background: var(--primary-gradient);
                        color: white !important;
                        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                    }

                    .main-content {
                        margin-left: 280px;
                        padding: 3rem;
                        width: calc(100% - 280px);
                    }

                    .table-card {
                        background: white;
                        border-radius: 24px;
                        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.02);
                        overflow: hidden;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    th {
                        background: #f8f9fa;
                        padding: 1.2rem;
                        text-align: left;
                        font-weight: 700;
                        color: #636e72;
                        border-bottom: 2px solid #f1f2f6;
                    }

                    td {
                        padding: 1.2rem;
                        border-bottom: 1px solid #f1f2f6;
                        color: #2d3436;
                    }

                    .role-badge {
                        padding: 6px 12px;
                        border-radius: 30px;
                        font-size: 0.8rem;
                        font-weight: 700;
                        text-transform: uppercase;
                    }

                    .role-ADMIN {
                        background: #fee2e2;
                        color: #dc2626;
                    }

                    .role-USER {
                        background: #dcfce7;
                        color: #16a34a;
                    }

                    select {
                        padding: 6px 12px;
                        border-radius: 10px;
                        border: 1px solid #eee;
                        background: #f8f9fa;
                        font-weight: 600;
                        cursor: pointer;
                    }

                    .btn-delete {
                        color: #d32f2f;
                        margin-left: 1rem;
                        text-decoration: none;
                        font-size: 1.1rem;
                    }
                </style>
            </head>

            <body>
                <div class="sidebar">
                    <a href="admin?action=dashboard" class="sidebar-brand">
                        <div
                            style="width: 35px; height: 35px; background: var(--primary-gradient); border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white;">
                            🧬</div>
                        <span>DNA Admin</span>
                    </a>
                    <a href="admin?action=dashboard" class="nav-link"><i class="fas fa-chart-pie"></i> Dashboard</a>
                    <a href="admin?action=users" class="nav-link"><i class="fas fa-users-cog"></i> Quản lý Users</a>
                    <a href="admin?action=accounts" class="nav-link active"><i class="fas fa-user-shield"></i> Quản lý
                        Accounts</a>
                    <hr style="border-top: 1px solid #eee; margin: 2rem 0;">
                    <a href="home?action=logout" class="nav-link text-danger"><i class="fas fa-sign-out-alt"></i> Đăng
                        xuất</a>
                </div>

                <div class="main-content">
                    <h1 class="fw-bold mb-5">Tài khoản Hệ thống</h1>

                    <div class="table-card">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên đăng nhập</th>
                                    <th>Vai trò</th>
                                    <th>Ngày tạo</th>
                                    <th>Đăng nhập cuối</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="acc" items="${accounts}">
                                    <tr>
                                        <td class="fw-bold">#${acc.accountId}</td>
                                        <td class="fw-bold text-primary">${acc.username}</td>
                                        <td>
                                            <span class="role-badge role-${acc.role}">${acc.role}</span>
                                        </td>
                                        <td class="text-muted small">
                                            <fmt:parseDate value="${acc.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                var="parsedCreatedAt" type="both" />
                                            <fmt:formatDate value="${parsedCreatedAt}" pattern="dd/MM/yyyy HH:mm" />
                                        </td>
                                        <td class="text-muted small">
                                            <c:choose>
                                                <c:when test="${not empty acc.lastLogin}">
                                                    <fmt:parseDate value="${acc.lastLogin}"
                                                        pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedLastLogin"
                                                        type="both" />
                                                    <fmt:formatDate value="${parsedLastLogin}"
                                                        pattern="dd/MM/yyyy HH:mm" />
                                                </c:when>
                                                <c:otherwise>
                                                    Chưa từng
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <form action="admin" method="get" class="m-0">
                                                    <input type="hidden" name="action" value="updateRole">
                                                    <input type="hidden" name="id" value="${acc.accountId}">
                                                    <select name="role" onchange="this.form.submit()">
                                                        <option value="USER" ${acc.role=='USER' ? 'selected' : '' }>USER
                                                        </option>
                                                        <option value="ADMIN" ${acc.role=='ADMIN' ? 'selected' : '' }>
                                                            ADMIN
                                                        </option>
                                                    </select>
                                                </form>
                                                <a href="admin?action=deleteAccount&id=${acc.accountId}"
                                                    onclick="return confirm('Xóa tài khoản này?')" class="btn-delete">
                                                    <i class="fas fa-trash-alt"></i>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty accounts}">
                                    <tr>
                                        <td colspan="6" class="text-center py-5 text-muted">Không tìm thấy tài khoản
                                            nào.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </body>

            </html>