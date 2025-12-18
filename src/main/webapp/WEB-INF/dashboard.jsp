<%-- Created by IntelliJ IDEA. User: Sinh Date: 12/18/2025 Time: 8:49 AM To change this template use File | Settings |
    File Templates. --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Dashboard - DNA Bank</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css"
                        rel="stylesheet">
                    <style>
                        :root {
                            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                            --primary-color: #667eea;
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

                        .relative-card {
                            transition: all 0.3s ease;
                        }

                        .relative-card:hover {
                            transform: translateY(-4px);
                            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3) !important;
                        }
                    </style>
                </head>

                <body>
                    <!-- Navigation -->
                    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
                        <div class="container-fluid px-4">
                            <a class="navbar-brand d-flex align-items-center gap-2 fw-bold text-primary"
                                href="${pageContext.request.contextPath}/dashboard">
                                <span class="logo-icon">🧬</span>
                                DNA Bank
                            </a>
                            <div class="d-flex align-items-center gap-3">
                                <span class="text-muted">Xin chào, <strong>${currentUser.fullName}</strong></span>
                                <a href="${pageContext.request.contextPath}/login"
                                    class="btn btn-outline-danger btn-sm">
                                    <i class="bi bi-box-arrow-right me-1"></i>Đăng xuất
                                </a>
                            </div>
                        </div>
                    </nav>

                    <div class="container py-5">
                        <!-- User Info Card -->
                        <div class="card shadow-lg border-0 rounded-4 mb-4">
                            <div class="card-body p-4">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="card-gradient-icon">
                                        <c:choose>
                                            <c:when test="${currentUser.gender == 'M'}">👨</c:when>
                                            <c:otherwise>👩</c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h4 class="mb-1 fw-bold">${currentUser.fullName}</h4>
                                        <div class="d-flex flex-wrap gap-3 small text-muted">
                                            <span><i class="bi bi-geo-alt me-1"></i>${currentUser.address}</span>
                                            <span><i class="bi bi-calendar me-1"></i>
                                                ${currentUser.formattedDob}
                                            </span>
                                            <span><i class="bi bi-envelope me-1"></i>${currentUser.email}</span>
                                        </div>
                                    </div>
                                    <span class="badge bg-success-subtle text-success px-3 py-2 rounded-pill fs-6">
                                        ID: ${currentUser.userId}
                                    </span>
                                </div>
                            </div>
                        </div>

                        <!-- Results Section -->
                        <div class="card shadow-lg border-0 rounded-4">
                            <div class="card-body p-4">
                                <div class="d-flex align-items-center gap-3 mb-4">
                                    <div class="card-gradient-icon"
                                        style="width: 50px; height: 50px; font-size: 1.2rem;">
                                        <i class="bi bi-people-fill"></i>
                                    </div>
                                    <div>
                                        <h3 class="mb-0 fw-bold">Kết quả tìm kiếm người thân</h3>
                                        <p class="text-muted mb-0">Hệ thống đã tự động so sánh DNA của bạn với tất cả
                                            người dùng</p>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${matchCount == 0}">
                                        <!-- No Results -->
                                        <div class="text-center py-5">
                                            <div class="display-1 opacity-25 mb-3">😔</div>
                                            <h5 class="text-muted">Chưa tìm thấy người thân</h5>
                                            <p class="text-muted">Hệ thống không tìm thấy ai có quan hệ huyết thống với
                                                bạn trong database hiện tại.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- Match Count -->
                                        <div class="alert alert-success d-flex align-items-center mb-4" role="alert">
                                            <i class="bi bi-check-circle-fill fs-4 me-3"></i>
                                            <div>
                                                <strong>Tìm thấy ${matchCount} người có quan hệ huyết thống!</strong>
                                                <p class="mb-0 small">Hệ thống đã so sánh và phát hiện mối quan hệ gen
                                                    di truyền.</p>
                                            </div>
                                        </div>

                                        <!-- Relatives List -->
                                        <div class="row g-4">
                                            <c:forEach var="result" items="${relatives}" varStatus="status">
                                                <c:set var="relativeUser"
                                                    value="${relativeUsers[result.comparisonId]}" />

                                                <div class="col-12">
                                                    <div class="card border-0 shadow relative-card">
                                                        <div class="card-body p-4">
                                                            <div class="row align-items-center g-3">
                                                                <!-- Avatar -->
                                                                <div class="col-auto">
                                                                    <div class="card-gradient-icon"
                                                                        style="width: 70px; height: 70px; font-size: 2rem;">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${relativeUser.gender == 'M'}">👨
                                                                            </c:when>
                                                                            <c:otherwise>👩</c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>

                                                                <!-- User Info -->
                                                                <div class="col">
                                                                    <h5 class="mb-2 fw-bold">${relativeUser.fullName}
                                                                    </h5>
                                                                    <div
                                                                        class="d-flex flex-wrap gap-3 small text-muted mb-2">
                                                                        <span><i
                                                                                class="bi bi-geo-alt me-1"></i>${relativeUser.address}</span>
                                                                        <span><i class="bi bi-calendar me-1"></i>
                                                                            ${relativeUser.formattedDob}
                                                                        </span>
                                                                    </div>

                                                                    <!-- Relationship Badge -->
                                                                    <c:choose>
                                                                        <c:when
                                                                            test="${result.relationship == 'Cha-Con'}">
                                                                            <span
                                                                                class="badge bg-success-subtle text-success px-3 py-2">
                                                                                <i
                                                                                    class="bi bi-heart-fill me-1"></i>${result.relationship}
                                                                            </span>
                                                                        </c:when>
                                                                        <c:when
                                                                            test="${result.relationship == 'Anh chị em'}">
                                                                            <span
                                                                                class="badge bg-info-subtle text-info px-3 py-2">
                                                                                <i
                                                                                    class="bi bi-people-fill me-1"></i>${result.relationship}
                                                                            </span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span
                                                                                class="badge bg-warning-subtle text-warning px-3 py-2">
                                                                                <i
                                                                                    class="bi bi-question-circle-fill me-1"></i>${result.relationship}
                                                                            </span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>

                                                                <!-- Statistics -->
                                                                <div class="col-auto text-end">
                                                                    <div class="mb-2">
                                                                        <div class="text-muted small">CPI</div>
                                                                        <div class="fw-bold fs-5 text-primary">
                                                                            <fmt:formatNumber
                                                                                value="${result.paternityIndex}"
                                                                                pattern="#,###.##" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="mb-2">
                                                                        <div class="text-muted small">Độ tương đồng
                                                                        </div>
                                                                        <div class="fw-bold text-success">
                                                                            <fmt:formatNumber
                                                                                value="${result.similarityPercent}"
                                                                                pattern="#.##" />%
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-muted small">Locus khớp</div>
                                                                        <div class="fw-bold">${result.matchedLocus}/15
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Info Box -->
                        <div class="card shadow-lg border-0 rounded-4 mt-4">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-info-circle-fill text-primary me-2"></i>
                                    Giải thích chỉ số
                                </h5>
                                <ul class="mb-0">
                                    <li class="mb-2"><strong>CPI (Combined Paternity Index):</strong> Chỉ số xác định
                                        quan hệ cha-con. CPI > 10,000 = Chắc chắn có quan hệ.</li>
                                    <li class="mb-2"><strong>Độ tương đồng:</strong> Tỷ lệ % khả năng có quan hệ huyết
                                        thống.</li>
                                    <li><strong>Locus khớp:</strong> Số vị trí gen (STR markers) có allele chung giữa 2
                                        người.</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>