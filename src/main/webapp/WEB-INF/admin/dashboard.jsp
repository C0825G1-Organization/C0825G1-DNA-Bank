<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Dashboard - DNA Bank</title>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                :root {
                    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    --primary-color: #667eea;
                    --secondary-color: #764ba2;
                    --dark: #2d3436;
                    --light: #f8f9fa;
                }

                body {
                    font-family: 'Inter', system-ui, -apple-system, sans-serif;
                    background: #f4f7f6;
                    margin: 0;
                    display: flex;
                }

                .sidebar {
                    width: 280px;
                    height: 100vh;
                    background: #fff;
                    box-shadow: 4px 0 10px rgba(0, 0, 0, 0.05);
                    padding: 2rem;
                    position: fixed;
                    z-index: 1000;
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
                    font-weight: 500;
                }

                .nav-link:hover,
                .nav-link.active {
                    background: var(--primary-gradient);
                    color: white !important;
                    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                }

                .nav-link i {
                    font-size: 1.1rem;
                }

                .main-content {
                    margin-left: 280px;
                    padding: 3rem;
                    width: calc(100% - 280px);
                }

                .page-header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 3rem;
                }

                .page-title {
                    font-weight: 800;
                    color: var(--dark);
                    margin: 0;
                }

                .stats-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
                    gap: 1.5rem;
                    margin-bottom: 3rem;
                }

                .stat-card {
                    background: white;
                    padding: 1.5rem;
                    border-radius: 20px;
                    display: flex;
                    align-items: center;
                    gap: 1.5rem;
                    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.02);
                    transition: transform 0.3s ease;
                }

                .stat-card:hover {
                    transform: translateY(-5px);
                }

                .stat-icon {
                    width: 60px;
                    height: 60px;
                    background: var(--primary-gradient);
                    border-radius: 15px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                    font-size: 1.5rem;
                }

                .stat-info h3 {
                    font-weight: 800;
                    font-size: 1.8rem;
                    margin: 0;
                    color: var(--dark);
                }

                .stat-info p {
                    color: #b2bec3;
                    margin: 0;
                    font-size: 0.9rem;
                    font-weight: 600;
                }

                .welcome-card {
                    background: white;
                    padding: 3rem;
                    border-radius: 24px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.03);
                    text-align: center;
                }

                .welcome-card h2 {
                    font-weight: 800;
                    margin-bottom: 1rem;
                    color: var(--dark);
                }

                .welcome-card p {
                    color: #636e72;
                    max-width: 600px;
                    margin: 0 auto;
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
                <a href="admin?action=dashboard" class="nav-link active"><i class="fas fa-chart-pie"></i> Dashboard</a>
                <a href="admin?action=users" class="nav-link"><i class="fas fa-users-cog"></i> Quản lý Users</a>
                <a href="admin?action=accounts" class="nav-link"><i class="fas fa-user-shield"></i> Quản lý Accounts</a>
                <hr style="border-top: 1px solid #eee; margin: 2rem 0;">
                <a href="home?action=logout" class="nav-link text-danger"><i class="fas fa-sign-out-alt"></i> Đăng
                    xuất</a>
            </div>

            <div class="main-content">
                <div class="page-header">
                    <div>
                        <p class="text-muted small mb-1">Tổng quan hệ thống</p>
                        <h1 class="page-title">Hệ thống Quản trị</h1>
                    </div>
                    <div class="d-flex align-items-center gap-3 bg-white p-3 rounded-4 shadow-sm">
                        <img src="https://ui-avatars.com/api/?name=${sessionScope.username}&background=667eea&color=fff"
                            class="rounded-circle" width="40" height="40">
                        <div class="small">
                            <div class="fw-bold">${sessionScope.username}</div>
                            <div class="text-muted">Quản trị viên</div>
                        </div>
                    </div>
                </div>

                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-user-circle"></i></div>
                        <div class="stat-info">
                            <h3>${stats.totalUsers}</h3>
                            <p>Tổng Users</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-shield-alt"></i></div>
                        <div class="stat-info">
                            <h3>${stats.totalAccounts}</h3>
                            <p>Tổng Accounts</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-dna"></i></div>
                        <div class="stat-info">
                            <h3>${stats.totalSamples}</h3>
                            <p>Mẫu ADN</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon"><i class="fas fa-sync"></i></div>
                        <div class="stat-info">
                            <h3>${stats.totalComparisons}</h3>
                            <p>Lượt so sánh</p>
                        </div>
                    </div>
                </div>

                <div class="welcome-card">
                    <div class="display-1 mb-4">✨</div>
                    <h2>Chào mừng quay lại, ${sessionScope.username}!</h2>
                </div>
            </div>
        </body>

        </html>