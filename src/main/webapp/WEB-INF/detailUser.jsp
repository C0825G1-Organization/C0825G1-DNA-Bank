<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chi Tiết Người Dùng - DNA Bank</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
            <style>
                :root {
                    --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    --primary-color: #667eea;
                    --secondary-color: #764ba2;
                }

                body {
                    background: var(--primary-gradient);
                    min-height: 100vh;
                }

                .navbar {
                    background: rgba(255, 255, 255, 0.95) !important;
                    backdrop-filter: blur(10px);
                    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
                }

                .logo-icon {
                    width: 32px;
                    height: 32px;
                    background: var(--primary-gradient);
                    border-radius: 8px;
                    display: inline-flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                }

                .profile-header {
                    background: var(--primary-gradient);
                    color: white;
                    padding: 3rem 0;
                    border-radius: 20px 20px 0 0;
                }

                .profile-avatar {
                    width: 120px;
                    height: 120px;
                    border: 5px solid white;
                    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
                }

                .info-card {
                    background: white;
                    border-radius: 15px;
                    padding: 1.5rem;
                    margin-bottom: 1.5rem;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                    transition: all 0.3s ease;
                }

                .info-card:hover {
                    box-shadow: 0 4px 20px rgba(102, 126, 234, 0.15);
                    transform: translateY(-2px);
                }

                .info-label {
                    color: #6c757d;
                    font-size: 0.875rem;
                    font-weight: 500;
                    margin-bottom: 0.25rem;
                }

                .info-value {
                    color: #212529;
                    font-size: 1rem;
                    font-weight: 600;
                }

                .icon-box {
                    width: 45px;
                    height: 45px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    border-radius: 12px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: white;
                    font-size: 1.2rem;
                }

                .badge-status {
                    padding: 0.5rem 1rem;
                    border-radius: 50px;
                    font-weight: 600;
                }

                .section-title {
                    font-size: 1.25rem;
                    font-weight: 700;
                    color: #212529;
                    margin-bottom: 1.5rem;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                }

                .section-title::before {
                    content: '';
                    width: 4px;
                    height: 24px;
                    background: var(--primary-gradient);
                    border-radius: 2px;
                }

                .btn-gradient {
                    background: var(--primary-gradient);
                    border: none;
                    color: white;
                    padding: 0.75rem 2rem;
                    border-radius: 10px;
                    font-weight: 600;
                    transition: all 0.3s ease;
                }

                .btn-gradient:hover {
                    transform: translateY(-2px);
                    box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
                    color: white;
                }
            </style>
        </head>

        <body>
            <!-- Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light sticky-top">
                <div class="container-fluid px-4">
                    <a class="navbar-brand d-flex align-items-center gap-2 fw-bold text-primary" href="home">
                        <span class="logo-icon">🧬</span>
                        DNA Bank
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="home">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="home?action=dashboard">Kết quả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="home?action=upload">Upload mẫu ADN</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hỗ trợ</a>
                            </li>
                        </ul>
                        <div class="d-flex align-items-center gap-3">
                            <div class="dropdown">
                                <img src="https://ui-avatars.com/api/?name=User&background=667eea&color=fff" alt="User"
                                    class="rounded-circle dropdown-toggle" width="40" height="40"
                                    style="border: 2px solid #667eea; cursor: pointer;" id="userDropdown"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 rounded-3 mt-2"
                                    aria-labelledby="userDropdown" style="min-width: 250px;">
                                    <li class="px-3 py-2 border-bottom">
                                        <div class="d-flex align-items-center gap-2">
                                            <img src="https://ui-avatars.com/api/?name=User&background=667eea&color=fff"
                                                alt="User" class="rounded-circle" width="40" height="40">
                                            <div>
                                                <div class="fw-bold">Người dùng</div>
                                                <div class="small text-muted">user@example.com</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a class="dropdown-item py-2" href="home?action=profile"><i
                                                class="bi bi-person me-2"></i>Hồ sơ cá nhân</a></li>
                                    <li>
<%--                                    <li><a class="dropdown-item py-2" href="#"><i class="bi bi-gear me-2"></i>Cài--%>
<%--                                            đặt</a></li>--%>
<%--                                    <li><a class="dropdown-item py-2" href="#"><i--%>
<%--                                                class="bi bi-question-circle me-2"></i>Trợ giúp</a></li>li--%>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item py-2 text-danger" href="home?action=logout"><i
                                                class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <div class="container py-5">
                <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
                    <!-- Profile Header -->
                    <div class="profile-header text-center">
                        <c:choose>
                            <c:when test="${user.gender == 'Nam' || user.gender == 'male'}">
                                <img src="https://ui-avatars.com/api/?name=${user.fullName}&background=667eea&color=fff&size=120"
                                    alt="${user.fullName}" class="rounded-circle profile-avatar mb-3">
                            </c:when>
                            <c:otherwise>
                                <img src="https://ui-avatars.com/api/?name=${user.fullName}&background=764ba2&color=fff&size=120"
                                    alt="${user.fullName}" class="rounded-circle profile-avatar mb-3">
                            </c:otherwise>
                        </c:choose>
                        <h2 class="fw-bold mb-2">${user.fullName}</h2>
                        <p class="mb-3 opacity-75">
                            <i class="bi bi-envelope me-2"></i>${user.email != null ? user.email : 'Chưa cập nhật'}
                        </p>
                        <span class="badge badge-status bg-success">
                            <i class="bi bi-check-circle me-1"></i>Đã xác minh
                        </span>
                    </div>

                    <!-- Profile Content -->
                    <div class="card-body p-4 p-md-5">
                        <!-- Personal Information Section -->
                        <div class="section-title">
                            <i class="bi bi-person-circle"></i>
                            Thông tin cá nhân
                        </div>

                        <div class="row g-4 mb-5">
                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-person"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Họ và tên</div>
                                            <div class="info-value">${user.fullName}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-calendar-event"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Ngày sinh</div>
                                            <div class="info-value">${user.dob != null ? user.dob : 'Chưa cập nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <c:choose>
                                                <c:when test="${user.gender == 'Nam' || user.gender == 'male'}">
                                                    <i class="bi bi-gender-male"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="bi bi-gender-female"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Giới tính</div>
                                            <div class="info-value">
                                                <c:choose>
                                                    <c:when test="${user.gender == 'Nam' || user.gender == 'male'}">
                                                        Nam
                                                    </c:when>
                                                    <c:otherwise>
                                                        Nữ
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-telephone"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Số điện thoại</div>
                                            <div class="info-value">${user.phone != null ? user.phone : 'Chưa cập nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-geo-alt"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Địa chỉ</div>
                                            <div class="info-value">${user.address != null ? user.address : 'Chưa cập
                                                nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-envelope"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Email</div>
                                            <div class="info-value">${user.email != null ? user.email : 'Chưa cập nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-clock-history"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Ngày đăng ký</div>
                                            <div class="info-value">${user.createdAt != null ? user.createdAt : 'Chưa
                                                cập nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- DNA Information Section -->
                        <div class="section-title">
                            <i class="bi bi-file-earmark-medical"></i>
                            Thông tin ADN
                        </div>

                        <div class="row g-4 mb-4">
                            <div class="col-md-6">
                                <div class="info-card">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="icon-box">
                                            <i class="bi bi-fingerprint"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Mã ADN</div>
                                            <div class="info-value">DNA-2024-VN-${user.userId != null ? user.userId :
                                                '000000'}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%-- <div class="col-md-6">--%>
                                <%-- <div class="info-card">--%>
                                    <%-- <div class="d-flex align-items-center gap-3">--%>
                                        <%-- <div class="icon-box">--%>
                                            <%-- <i class="bi bi-shield-check"></i>--%>
                                                <%-- </div>--%>
                                                    <%-- <div class="flex-grow-1">--%>
                                                        <%-- <div class="info-label">Trạng thái phân tích
                        </div>--%>
                        <%-- <div class="info-value text-success">Hoàn thành
                    </div>--%>
                    <%-- </div>--%>
                        <%-- </div>--%>
                            <%-- </div>--%>
                                <%-- </div>--%>

                                    <%-- <div class="col-md-6">--%>
                                        <%-- <div class="info-card">--%>
                                            <%-- <div class="d-flex align-items-center gap-3">--%>
                                                <%-- <div class="icon-box">--%>
                                                    <%-- <i class="bi bi-people"></i>--%>
                                                        <%-- </div>--%>
                                                            <%-- <div class="flex-grow-1">--%>
                                                                <%-- <div class="info-label">Số lượng khớp
                </div>--%>
                <%-- <div class="info-value">12 người thân
            </div>--%>
            <%-- </div>--%>
                <%-- </div>--%>
                    <%-- </div>--%>
                        <%-- </div>--%>

                            <%-- <div class="col-md-6">--%>
                                <%-- <div class="info-card">--%>
                                    <%-- <div class="d-flex align-items-center gap-3">--%>
                                        <%-- <div class="icon-box">--%>
                                            <%-- <i class="bi bi-graph-up"></i>--%>
                                                <%-- </div>--%>
                                                    <%-- <div class="flex-grow-1">--%>
                                                        <%-- <div class="info-label">Độ chính xác</div>--%>
                                                            <%-- <div class="info-value">99.8%</div>--%>
                                                                <%-- </div>--%>
                                                                    <%-- </div>--%>
                                                                        <%-- </div>--%>
                                                                            <%-- </div>--%>
                                                                                <%-- </div>--%>

                                                                                    <!-- Action Buttons -->
                                                                                    <div
                                                                                        class="d-flex flex-wrap gap-3 justify-content-center mt-5">
                                                                                        <a href="home"
                                                                                            class="btn btn-gradient">
                                                                                            <i
                                                                                                class="bi bi-arrow-left me-2"></i>Quay
                                                                                            lại
                                                                                        </a>
                                                                                        <%-- <button
                                                                                            class="btn btn-outline-primary px-4 py-2 rounded-3">--%>
                                                                                            <%-- <i
                                                                                                class="bi bi-pencil me-2"></i>Chỉnh
                                                                                                sửa thông tin--%>
                                                                                                <%-- </button>--%>
                                                                                                    <%-- <button
                                                                                                        class="btn btn-outline-success px-4 py-2 rounded-3">--%>
                                                                                                        <%-- <i
                                                                                                            class="bi bi-download me-2"></i>Tải
                                                                                                            báo cáo
                                                                                                            ADN--%>
                                                                                                            <%--
                                                                                                                </button>--%>
                                                                                    </div>
                                                                                    </div>
                                                                                    </div>
                                                                                    </div>

                                                                                    <script
                                                                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>