<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>DNAConnect - Tìm Kiếm Người Thân</title>
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

                .nav-link {
                    position: relative;
                    color: #555 !important;
                    font-weight: 500;
                }

                .nav-link::after {
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    width: 0;
                    height: 2px;
                    background: var(--primary-color);
                    transition: width 0.3s ease;
                }

                .nav-link:hover::after {
                    width: 100%;
                }

                .notification-badge {
                    position: absolute;
                    top: -5px;
                    right: -5px;

                }

                .hero-title {
                    font-size: 3rem;
                    font-weight: 700;
                    color: white;
                    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
                }

                .hero-subtitle {
                    color: rgba(255, 255, 255, 0.95);
                    font-size: 1.1rem;
                }

                .card-gradient-icon {
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

                .detail-icon {
                    width: 40px;
                    height: 40px;
                    background: #f0f4ff;
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: var(--primary-color);
                }

                .progress-gradient {
                    background: var(--primary-gradient);
                }

                .hover-shadow:hover {
                    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.2) !important;
                    transform: translateY(-2px);
                }

                @media (max-width: 768px) {
                    .hero-title {
                        font-size: 2rem;
                    }
                }
            </style>
        </head>

        <body>
            <!-- Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light sticky-top">
                <div class="container-fluid px-4">
                    <a class="navbar-brand d-flex align-items-center gap-2 fw-bold text-primary" href="#">
                        <span class="logo-icon">🧬</span>
                        DNA Bank
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Kết quả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Upload mẫu ADN</a>
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
                                    <li><a class="dropdown-item py-2" href="#"><i class="bi bi-person me-2"></i>Hồ sơ cá
                                            nhân</a></li>
                                    <li><a class="dropdown-item py-2" href="#"><i class="bi bi-gear me-2"></i>Cài
                                            đặt</a></li>
                                    <li><a class="dropdown-item py-2" href="#"><i
                                                class="bi bi-question-circle me-2"></i>Trợ giúp</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item py-2 text-danger" href="#"><i
                                                class="bi bi-box-arrow-right me-2"></i>Đăng xuất</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <div class="container py-5">
                <!-- Hero Section -->
                <div class="text-center mb-5">
                    <h1 class="hero-title mb-3">Tìm Kiếm Người Thân</h1>
                    <p class="hero-subtitle mx-auto" style="max-width: 700px;">
                        Khám phá mối quan hệ gia đình dựa trên phân tích ADN của bạn. Kết nối với những người có chung
                        huyết thống.
                    </p>
                </div>

                <!-- DNA Profile Card -->
                <div class="card shadow-lg border-0 rounded-4 mb-4">
                    <div class="card-body p-4">
                        <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                            <div class="card-gradient-icon">🧬</div>
                            <div class="flex-grow-1">
                                <div class="text-primary fw-semibold small">Mẫu ADN của bạn</div>
                                <div class="fw-bold fs-5">ID: DNA-2024-VN-847291</div>
                            </div>
                            <span class="badge bg-success-subtle text-success px-3 py-2 rounded-pill">
                                Đã xác minh
                            </span>
                        </div>

                        <div class="row g-4 mb-4">
                            <div class="col-md-6">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="detail-icon">
                                        <i class="bi bi-calendar-event"></i>
                                    </div>
                                    <div>
                                        <div class="text-muted small">Ngày đăng ký</div>
                                        <div class="fw-semibold">15/11/2024</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="detail-icon">
                                        <i class="bi bi-file-earmark-text"></i>
                                    </div>
                                    <div>
                                        <div class="text-muted small">Trạng thái phân tích</div>
                                        <div class="fw-semibold">Hoàn thành</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Search Results Section with Filters -->
                <div class="row g-4">
                    <!-- Left Column - Filters -->
                    <div class="col-lg-3">
                        <div class="card shadow-lg border-0 rounded-4 sticky-top" style="top: 100px;">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4 d-flex align-items-center gap-2">
                                    <i class="bi bi-funnel text-primary"></i>
                                    Bộ lọc tìm kiếm
                                </h5>

                                <!-- Province Filter -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-muted">Tỉnh/Thành phố</label>
                                    <select class="form-select">
                                        <option selected>Tất cả</option>
                                        <option value="hanoi">Hà Nội</option>
                                        <option value="hcm">TP. Hồ Chí Minh</option>
                                        <option value="danang">Đà Nẵng</option>
                                        <option value="haiphong">Hải Phòng</option>
                                        <option value="cantho">Cần Thơ</option>
                                    </select>
                                </div>

                                <!-- Age Filter -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-muted">Độ tuổi</label>
                                    <select class="form-select">
                                        <option selected>Tất cả</option>
                                        <option value="0-18">0-18 tuổi</option>
                                        <option value="19-30">19-30 tuổi</option>
                                        <option value="31-45">31-45 tuổi</option>
                                        <option value="46-60">46-60 tuổi</option>
                                        <option value="60+">Trên 60 tuổi</option>
                                    </select>
                                </div>

                                <!-- Gender Filter -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-muted">Giới tính</label>
                                    <select class="form-select">
                                        <option selected>Tất cả</option>
                                        <option value="male">Nam</option>
                                        <option value="female">Nữ</option>
                                    </select>
                                </div>

                                <!-- Apply Button -->
                                <button class="btn btn-primary w-100 rounded-3">
                                    <i class="bi bi-search me-2"></i>
                                    Áp dụng bộ lọc
                                </button>

                                <!-- Reset Button -->
                                <button class="btn btn-outline-secondary w-100 rounded-3 mt-2">
                                    <i class="bi bi-arrow-clockwise me-2"></i>
                                    Đặt lại
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column - Search Results -->
                    <div class="col-lg-9">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-4">
                                <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                                    <div class="card-gradient-icon" style="width: 40px; height: 40px; font-size: 1rem;">
                                        <i class="bi bi-search"></i>
                                    </div>
                                    <h2 class="mb-0 fw-bold fs-4">Kết quả tìm kiếm</h2>
                                    <span class="text-muted small ms-auto">Hiện thị ${users.size()} kết quả</span>
                                </div>

                                <!-- Results List -->
                                <div class="row g-3">
                                    <c:choose>
                                        <c:when test="${empty users}">
                                            <!-- Empty State -->
                                            <div class="col-12">
                                                <div class="text-center py-5">
                                                    <div class="display-1 opacity-25 mb-3">🔍</div>
                                                    <p class="text-muted">Chưa có kết quả tìm kiếm. Hệ thống đang phân
                                                        tích dữ liệu ADN.</p>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Dynamic Result Cards from Database -->
                                            <c:forEach var="user" items="${users}" varStatus="status">
                                                <div class="col-12">
                                                    <div class="card border hover-shadow"
                                                        style="transition: all 0.3s ease;">
                                                        <div class="card-body p-3">
                                                            <div class="row align-items-center g-3">
                                                                <div class="col-auto">
                                                                    <div class="card-gradient-icon"
                                                                        style="width: 50px; height: 50px; font-size: 1.2rem;">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${user.gender == 'Nam' || user.gender == 'male'}">
                                                                                👨
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                👩
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <h6 class="mb-1 fw-bold">${user.fullName}
                                                                    </h6>
                                                                    <div
                                                                        class="d-flex flex-wrap gap-3 small text-muted">
                                                                        <span><i
                                                                                class="bi bi-geo-alt me-1"></i>${user.address}</span>
                                                                        <span><i
                                                                                class="bi bi-calendar me-1"></i>${user.dob}</span>
                                                                        <span>
                                                                            <c:choose>
                                                                                <c:when
                                                                                    test="${user.gender == 'Nam' || user.gender == 'male'}">
                                                                                    <i
                                                                                        class="bi bi-gender-male me-1"></i>Nam
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <i
                                                                                        class="bi bi-gender-female me-1"></i>Nữ
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <span
                                                                        class="badge bg-success-subtle text-success px-3 py-2">
                                                                        ID: ${user.userId != null ?
                                                                        user.userId : status.index + 1}
                                                                    </span>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <a href="home?action=detail&userId=${user.userId}"
                                                                        class="btn btn-sm btn-outline-primary rounded-3">
                                                                        Xem chi tiết
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>