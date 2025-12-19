<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Quản lý Users - DNA Admin</title>
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

                .btn-action {
                    width: 35px;
                    height: 35px;
                    border-radius: 10px;
                    border: none;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    transition: all 0.2s;
                    text-decoration: none;
                }

                .btn-edit {
                    background: #e3f2fd;
                    color: #1976d2;
                }

                .btn-edit:hover {
                    background: #1976d2;
                    color: white;
                }

                .btn-delete {
                    background: #ffebee;
                    color: #d32f2f;
                }

                .btn-delete:hover {
                    background: #d32f2f;
                    color: white;
                }

                .gender-badge {
                    padding: 6px 12px;
                    border-radius: 30px;
                    font-size: 0.8rem;
                    font-weight: 700;
                }

                .gender-M {
                    background: #eef2ff;
                    color: #4361ee;
                }

                .gender-F {
                    background: #fff1f2;
                    color: #f43f5e;
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
                <a href="admin?action=users" class="nav-link active"><i class="fas fa-users-cog"></i> Quản lý Users</a>
                <a href="admin?action=accounts" class="nav-link"><i class="fas fa-user-shield"></i> Quản lý Accounts</a>
                <hr style="border-top: 1px solid #eee; margin: 2rem 0;">
                <a href="home?action=logout" class="nav-link text-danger"><i class="fas fa-sign-out-alt"></i> Đăng
                    xuất</a>
            </div>

            <div class="main-content">
                <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold">Thông tin Người dùng</h1>
                </div>

                <div class="table-card">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Họ Tên</th>
                                <th>Email</th>
                                <th>Số điện thoại</th>
                                <th>Giới tính</th>
                                <th>Ngày tạo</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td class="fw-bold">#${user.userId}</td>
                                    <td class="fw-bold">${user.fullName}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>
                                    <td>
                                        <span class="gender-badge gender-${user.gender}">${user.gender == 'M' ? 'Nam' :
                                            'Nữ'}</span>
                                    </td>
                                    <td class="text-muted small">${user.createdAt}</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="admin?action=editUser&id=${user.userId}"
                                                class="btn-action btn-edit">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="admin?action=deleteUser&id=${user.userId}"
                                                onclick="return confirm('Xóa người dùng này?')"
                                                class="btn-action btn-delete">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>

        </html>