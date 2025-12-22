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
                    background-clip: text;
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

                /* Search & Filter Bar */
                .filter-card {
                    background: white;
                    border-radius: 20px;
                    padding: 1.5rem;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.02);
                    margin-bottom: 2rem;
                }

                .filter-form {
                    display: grid;
                    grid-template-columns: 1fr auto auto;
                    gap: 1.5rem;
                    align-items: end;
                }

                .form-label {
                    font-weight: 700;
                    color: #636e72;
                    margin-bottom: 0.8rem;
                    font-size: 0.9rem;
                    display: block;
                }

                .form-control,
                .form-select {
                    border: 2px solid #f1f2f6;
                    border-radius: 12px;
                    padding: 0.8rem 1.2rem;
                    transition: all 0.3s;
                    font-weight: 500;
                }

                .form-control:focus,
                .form-select:focus {
                    border-color: var(--primary-color);
                    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
                }

                .btn-filter {
                    background: var(--primary-gradient);
                    color: white;
                    border: none;
                    border-radius: 12px;
                    padding: 0.8rem 2rem;
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    transition: all 0.3s;
                }

                .btn-filter:hover {
                    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                    transform: translateY(-2px);
                }

                .sort-link {
                    color: inherit;
                    text-decoration: none;
                    display: flex;
                    align-items: center;
                    gap: 5px;
                }

                .sort-link:hover {
                    color: var(--primary-color);
                }

                .btn-add {
                    background: var(--primary-gradient);
                    color: white;
                    border: none;
                    border-radius: 12px;
                    padding: 0.8rem 1.5rem;
                    font-weight: 700;
                    display: flex;
                    align-items: center;
                    gap: 8px;
                    transition: all 0.3s;
                    text-decoration: none;
                }

                .btn-add:hover {
                    color: white;
                    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                    transform: translateY(-2px);
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
                    <div>
                        <h1 class="fw-bold mb-1">Thông tin Người dùng</h1>
                        <p class="text-muted">Quản lý và tìm kiếm thông tin thành viên hệ thống</p>
                    </div>
                    <a href="admin?action=addUser" class="btn-add">
                        <i class="fas fa-user-plus"></i>
                        Thêm người dùng mới
                    </a>
                </div>

                <!-- Filter Bar -->
                <div class="filter-card">
                    <form action="admin" method="get" class="filter-form" style="grid-template-columns: 1fr auto;">
                        <input type="hidden" name="action" value="users">

                        <div>
                            <label class="form-label">Tìm kiếm</label>
                            <div class="input-group">
                                <span class="input-group-text bg-transparent border-end-0"
                                    style="border-radius: 12px 0 0 12px; border: 2px solid #f1f2f6;">
                                    <i class="fas fa-search text-muted"></i>
                                </span>
                                <input type="text" name="search" class="form-control border-start-0"
                                    placeholder="Tên, email hoặc số điện thoại..." value="${search}">
                            </div>
                        </div>

                        <button type="submit" class="btn-filter">
                            <i class="fas fa-filter"></i>
                            Lọc kết quả
                        </button>
                    </form>
                </div>

                <div class="table-card">
                    <table>
                        <thead>
                            <tr>
                                <th>
                                    <a href="admin?action=users&search=${search}&sortBy=id&order=${sortBy == 'id' && order == 'asc' ? 'desc' : 'asc'}"
                                        class="sort-link">
                                        ID <i
                                            class="fas fa-sort${sortBy == 'id' ? (order == 'asc' ? '-up' : '-down') : ''} small text-muted"></i>
                                    </a>
                                </th>
                                <th>
                                    <a href="admin?action=users&search=${search}&sortBy=name&order=${sortBy == 'name' && order == 'asc' ? 'desc' : 'asc'}"
                                        class="sort-link">
                                        Họ Tên <i
                                            class="fas fa-sort${sortBy == 'name' ? (order == 'asc' ? '-up' : '-down') : ''} small text-muted"></i>
                                    </a>
                                </th>
                                <th>
                                    <a href="admin?action=users&search=${search}&sortBy=email&order=${sortBy == 'email' && order == 'asc' ? 'desc' : 'asc'}"
                                        class="sort-link">
                                        Email <i
                                            class="fas fa-sort${sortBy == 'email' ? (order == 'asc' ? '-up' : '-down') : ''} small text-muted"></i>
                                    </a>
                                </th>
                                <th>Số điện thoại</th>
                                <th>Giới tính</th>
                                <th>
                                    <a href="admin?action=users&search=${search}&sortBy=date&order=${sortBy == 'date' && order == 'asc' ? 'desc' : 'asc'}"
                                        class="sort-link">
                                        Ngày tạo <i
                                            class="fas fa-sort${sortBy == 'date' ? (order == 'asc' ? '-up' : '-down') : ''} small text-muted"></i>
                                    </a>
                                </th>
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