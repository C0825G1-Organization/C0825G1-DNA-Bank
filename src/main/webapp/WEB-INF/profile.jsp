<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hồ Sơ Cá Nhân - DNA Bank</title>
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

                .hero-title {
                    font-size: 2.5rem;
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

                .info-label {
                    font-size: 0.875rem;
                    color: #6c757d;
                    margin-bottom: 0.25rem;
                }

                .info-value {
                    font-weight: 600;
                    color: #333;
                }

                .locus-card {
                    transition: all 0.3s ease;
                    border: 1px solid #e0e0e0;
                }

                .locus-card:hover {
                    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.2);
                    transform: translateY(-2px);
                }

                .allele-badge {
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: white;
                    padding: 0.4rem 1rem;
                    border-radius: 8px;
                    font-weight: 600;
                    font-size: 0.9rem;
                    display: inline-block;
                    min-width: 60px;
                }

                .table> :not(caption)>*>* {
                    padding: 1rem 0.75rem;
                }

                .table-hover tbody tr:hover {
                    background-color: rgba(102, 126, 234, 0.05);
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
                                <img src="https://ui-avatars.com/api/?name=${not empty sessionScope.fullName ? sessionScope.fullName : 'User'}&background=667eea&color=fff"
                                    alt="User" class="rounded-circle dropdown-toggle" width="40" height="40"
                                    style="border: 2px solid #667eea; cursor: pointer;" id="userDropdown"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 rounded-3 mt-2"
                                    aria-labelledby="userDropdown" style="min-width: 250px;">
                                    <li class="px-3 py-2 border-bottom">
                                        <div class="d-flex align-items-center gap-2">
                                            <img src="https://ui-avatars.com/api/?name=${not empty sessionScope.fullName ? sessionScope.fullName : 'User'}&background=667eea&color=fff"
                                                alt="User" class="rounded-circle" width="40" height="40">
                                            <div>
                                                <div class="fw-bold">${not empty sessionScope.fullName ?
                                                    sessionScope.fullName : 'Người dùng'}</div>
                                                <div class="small text-muted">${not empty sessionScope.username ?
                                                    sessionScope.username : 'Chưa đăng nhập'}</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li><a class="dropdown-item py-2" href="home?action=profile"><i
                                                class="bi bi-person me-2"></i>Hồ sơ cá nhân</a></li>
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
                <!-- Hero Section -->
                <div class="text-center mb-5">
                    <h1 class="hero-title mb-3">Hồ Sơ Cá Nhân</h1>
                    <p class="hero-subtitle mx-auto" style="max-width: 700px;">
                        Thông tin chi tiết về tài khoản và dữ liệu ADN của bạn
                    </p>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Success Message -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle-fill me-2"></i>${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Info Message -->
                <c:if test="${not empty infoMessage}">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        <i class="bi bi-info-circle-fill me-2"></i>${infoMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- User Information Card -->
                <div class="card shadow-lg border-0 rounded-4 mb-4">
                    <div class="card-body p-4">
                        <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                            <div class="card-gradient-icon">
                                <i class="bi bi-person-fill"></i>
                            </div>
                            <div class="flex-grow-1">
                                <div class="text-primary fw-semibold small">Thông tin cá nhân</div>
                                <div class="fw-bold fs-5">${not empty user ? user.fullName : 'Chưa cập nhật'}</div>
                            </div>
                            <button type="button" class="btn btn-outline-primary rounded-3" id="editBtn"
                                onclick="toggleEditMode()">
                                <i class="bi bi-pencil-square me-2"></i>Chỉnh sửa
                            </button>
                        </div>

                        <!-- View Mode -->
                        <div id="viewMode">
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-envelope"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Email</div>
                                            <div class="info-value">${not empty user.email ? user.email : 'Chưa cập
                                                nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-telephone"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Số điện thoại</div>
                                            <div class="info-value">${not empty user.phone ? user.phone : 'Chưa cập
                                                nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-calendar-event"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Ngày sinh</div>
                                            <div class="info-value">${not empty user.dob ? user.formattedDob : 'Chưa cập
                                                nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-gender-ambiguous"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Giới tính</div>
                                            <div class="info-value">${not empty user.gender ? user.gender : 'Chưa cập
                                                nhật'}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="d-flex align-items-start gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-geo-alt"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Địa chỉ</div>
                                            <div class="info-value">${not empty user.address ? user.address : 'Chưa cập
                                                nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-clock-history"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Ngày đăng ký</div>
                                            <div class="info-value">${not empty user.createdAt ? user.createdAt : 'Chưa
                                                cập
                                                nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Edit Mode -->
                        <form action="home?action=updateProfile" method="post" id="editMode" style="display: none;">
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <label for="fullName" class="form-label">Họ và tên</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                        value="${user.fullName}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                        value="${user.email}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" value="${user.phone}"
                                        required pattern="[0-9]{10,11}">
                                    <small class="text-muted">Định dạng: 10-11 chữ số</small>
                                </div>
                                <div class="col-md-6">
                                    <label for="dob" class="form-label">Ngày sinh</label>
                                    <input type="date" class="form-control" id="dob" name="dob" value="${user.dob}"
                                        required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Giới tính</label>
                                    <div class="d-flex gap-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gender" id="genderMale"
                                                value="M" ${user.gender=='M' ? 'checked' : '' } required>
                                            <label class="form-check-label" for="genderMale">
                                                <i class="bi bi-gender-male text-primary"></i> Nam
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="gender" id="genderFemale"
                                                value="F" ${user.gender=='F' ? 'checked' : '' } required>
                                            <label class="form-check-label" for="genderFemale">
                                                <i class="bi bi-gender-female text-danger"></i> Nữ
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <textarea class="form-control" id="address" name="address" rows="3"
                                        required>${user.address}</textarea>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary rounded-3">
                                        <i class="bi bi-check-circle me-2"></i>Lưu thay đổi
                                    </button>
                                    <button type="button" class="btn btn-outline-secondary rounded-3 ms-2"
                                        onclick="toggleEditMode()">
                                        <i class="bi bi-x-circle me-2"></i>Hủy
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- DNA Sample Information Card -->
                <c:if test="${not empty dnaSample}">
                    <div class="card shadow-lg border-0 rounded-4 mb-4">
                        <div class="card-body p-4">
                            <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                                <div class="card-gradient-icon">🧬</div>
                                <div class="flex-grow-1">
                                    <div class="text-primary fw-semibold small">Mẫu ADN của bạn</div>
                                    <div class="fw-bold fs-5">ID: ${dnaSample.sampleId}</div>
                                </div>
                                <span class="badge bg-success-subtle text-success px-3 py-2 rounded-pill">
                                    Đã xác minh
                                </span>
                            </div>

                            <div class="row g-4">
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-calendar-check"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Ngày xét nghiệm</div>
                                            <div class="info-value">${not empty dnaSample.testDate ? dnaSample.testDate
                                                : 'Chưa cập nhật'}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="detail-icon">
                                            <i class="bi bi-shield-check"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="info-label">Trạng thái phân tích</div>
                                            <div class="info-value text-success">Hoàn thành</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!-- DNA Locus Results -->
                <c:choose>
                    <c:when test="${not empty locusResults}">
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-4">
                                <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                                    <div class="card-gradient-icon"
                                        style="width: 50px; height: 50px; font-size: 1.2rem;">
                                        <i class="bi bi-diagram-3"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h4 class="mb-0 fw-bold">Kết Quả 16 Đoạn Gen STR</h4>
                                        <p class="text-muted small mb-0">Thông tin chi tiết về các allele của bạn</p>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table class="table table-hover align-middle">
                                        <thead class="table-light">
                                            <tr>
                                                <th style="width: 10%;" class="text-center">STT</th>
                                                <th style="width: 30%;">Tên Gen</th>
                                                <th style="width: 30%;" class="text-center">Allele 1</th>
                                                <th style="width: 30%;" class="text-center">Allele 2</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="locus" items="${locusResults}" varStatus="status">
                                                <tr>
                                                    <td class="text-center">
                                                        <span class="badge bg-light text-dark">${locus.locusId}</span>
                                                    </td>
                                                    <td>
                                                        <strong
                                                            class="text-primary">${locusNames[locus.locusId]}</strong>
                                                    </td>
                                                    <td class="text-center">
                                                        <span class="allele-badge">${locus.allele1}</span>
                                                    </td>
                                                    <td class="text-center">
                                                        <span class="allele-badge">${locus.allele2}</span>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-5 text-center">
                                <div class="display-1 opacity-25 mb-3">🧬</div>
                                <h5 class="mb-3">Chưa có dữ liệu ADN</h5>
                                <p class="text-muted mb-4">Bạn chưa upload mẫu ADN của mình. Hãy upload để tham gia tìm
                                    kiếm người thân.</p>
                                <a href="home?action=upload" class="btn btn-primary rounded-3">
                                    <i class="bi bi-upload me-2"></i>Upload mẫu ADN
                                </a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                function toggleEditMode() {
                    const viewMode = document.getElementById('viewMode');
                    const editMode = document.getElementById('editMode');
                    const editBtn = document.getElementById('editBtn');

                    if (viewMode.style.display === 'none') {
                        // Switch to view mode
                        viewMode.style.display = 'block';
                        editMode.style.display = 'none';
                        editBtn.innerHTML = '<i class="bi bi-pencil-square me-2"></i>Chỉnh sửa';
                    } else {
                        // Switch to edit mode
                        viewMode.style.display = 'none';
                        editMode.style.display = 'block';
                        editBtn.innerHTML = '<i class="bi bi-eye me-2"></i>Xem';
                    }
                }

                // Set max date for DOB (must be in the past)
                const dobInput = document.getElementById('dob');
                if (dobInput) {
                    const today = new Date().toISOString().split('T')[0];
                    dobInput.setAttribute('max', today);
                }
            </script>
        </body>

        </html>