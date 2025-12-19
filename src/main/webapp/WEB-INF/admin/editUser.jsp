<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Chỉnh sửa Người dùng - DNA Admin</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                :root {
                    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    --primary-color: #667eea;
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
                }

                .main-content {
                    margin-left: 280px;
                    padding: 3rem;
                    width: calc(100% - 280px);
                }

                .form-card {
                    background: white;
                    border-radius: 24px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.02);
                    padding: 3rem;
                    max-width: 800px;
                    margin: 0 auto;
                }

                .form-label {
                    font-weight: 700;
                    color: #636e72;
                    margin-bottom: 0.5rem;
                }

                .form-control {
                    border-radius: 12px;
                    padding: 0.8rem 1.2rem;
                    border: 1px solid #f1f2f6;
                    background: #f8f9fa;
                }

                .form-control:focus {
                    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
                    border-color: var(--primary-color);
                }

                .btn-save {
                    background: var(--primary-gradient);
                    color: white;
                    border: none;
                    padding: 1rem 2rem;
                    border-radius: 12px;
                    font-weight: 800;
                    width: 100%;
                    margin-top: 2rem;
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
                <div class="mb-5">
                    <a href="admin?action=users" class="text-decoration-none text-muted mb-3 d-inline-block"><i
                            class="fas fa-arrow-left me-2"></i> Quay lại danh sách</a>
                    <h1 class="fw-bold">Chỉnh sửa Người dùng</h1>
                </div>

                <div class="form-card">
                    <form action="admin" method="post">
                        <input type="hidden" name="action" value="editUser">
                        <input type="hidden" name="userId" value="${user.userId}">

                        <div class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label">Họ Tên</label>
                                <input type="text" name="fullName" class="form-control" value="${user.fullName}"
                                    required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control" value="${user.email}" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Số điện thoại</label>
                                <input type="text" name="phone" class="form-control" value="${user.phone}">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Giới tính</label>
                                <select name="gender" class="form-select form-control">
                                    <option value="M" ${user.gender=='M' || user.gender=='Nam' ? 'selected' : '' }>Nam
                                    </option>
                                    <option value="F" ${user.gender=='F' || user.gender=='Nữ' ? 'selected' : '' }>Nữ
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Ngày sinh</label>
                                <input type="date" name="dob" class="form-control" value="${user.dob}" required>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">Địa chỉ</label>
                                <textarea name="address" class="form-control" rows="3">${user.address}</textarea>
                            </div>
                        </div>

                        <button type="submit" class="btn-save">Lưu thay đổi</button>
                    </form>
                </div>
            </div>
        </body>

        </html>