<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Upload Thông Tin ADN - DNA Bank</title>
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

        .section-icon {
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

        .form-label {
          font-weight: 600;
          color: #333;
          margin-bottom: 0.5rem;
        }

        .form-control:focus,
        .form-select:focus {
          border-color: var(--primary-color);
          box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.25);
        }

        .btn-primary {
          background: var(--primary-gradient);
          border: none;
          padding: 0.75rem 2rem;
          font-weight: 600;
          transition: all 0.3s ease;
        }

        .btn-primary:hover {
          transform: translateY(-2px);
          box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .required-mark {
          color: #dc3545;
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
                <a class="nav-link" href="#">Kết quả</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" href="home?action=upload">Upload mẫu ADN</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Hỗ trợ</a>
              </li>
            </ul>
            <div class="d-flex align-items-center gap-3">
              <div class="dropdown">
                <img src="https://ui-avatars.com/api/?name=User&background=667eea&color=fff" alt="User"
                  class="rounded-circle dropdown-toggle" width="40" height="40"
                  style="border: 2px solid #667eea; cursor: pointer;" id="userDropdown" data-bs-toggle="dropdown"
                  aria-expanded="false">
                <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0 rounded-3 mt-2"
                  aria-labelledby="userDropdown" style="min-width: 250px;">
                  <li class="px-3 py-2 border-bottom">
                    <div class="d-flex align-items-center gap-2">
                      <img src="https://ui-avatars.com/api/?name=User&background=667eea&color=fff" alt="User"
                        class="rounded-circle" width="40" height="40">
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
                  <li><a class="dropdown-item py-2" href="#"><i class="bi bi-question-circle me-2"></i>Trợ giúp</a></li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>
                  <li><a class="dropdown-item py-2 text-danger" href="#"><i class="bi bi-box-arrow-right me-2"></i>Đăng
                      xuất</a></li>
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
          <h1 class="hero-title mb-3">Upload Thông Tin ADN</h1>
          <p class="hero-subtitle mx-auto" style="max-width: 700px;">
            Điền thông tin cá nhân và tải lên dữ liệu ADN của bạn để tham gia vào hệ thống tìm kiếm người thân
          </p>
        </div>

        <!-- Alert Messages -->
        <c:if test="${not empty successMessage}">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="bi bi-check-circle-fill me-2"></i>${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
        </c:if>

        <!-- Upload Form -->
        <form action="home?action=upload" method="post" id="uploadForm">
          <div class="row g-4">
            <!-- Personal Information Section -->
            <div class="col-lg-6">
              <div class="card shadow-lg border-0 rounded-4 h-100">
                <div class="card-body p-4">
                  <div class="d-flex align-items-center gap-3 mb-4">
                    <div class="section-icon">
                      <i class="bi bi-person-fill"></i>
                    </div>
                    <h4 class="mb-0 fw-bold">Thông Tin Cá Nhân</h4>
                  </div>

                  <!-- Full Name -->
                  <div class="mb-3">
                    <label for="fullName" class="form-label">
                      Họ và Tên <span class="required-mark">*</span>
                    </label>
                    <input type="text" class="form-control" id="fullName" name="fullName" required
                      placeholder="Nhập họ và tên đầy đủ">
                  </div>

                  <!-- Email -->
                  <div class="mb-3">
                    <label for="email" class="form-label">
                      Email <span class="required-mark">*</span>
                    </label>
                    <input type="email" class="form-control" id="email" name="email" required
                      placeholder="example@email.com">
                  </div>

                  <!-- Phone -->
                  <div class="mb-3">
                    <label for="phone" class="form-label">
                      Số Điện Thoại <span class="required-mark">*</span>
                    </label>
                    <input type="tel" class="form-control" id="phone" name="phone" required placeholder="0912345678"
                      pattern="[0-9]{10,11}">
                    <small class="text-muted">Định dạng: 10-11 chữ số</small>
                  </div>

                  <!-- Date of Birth -->
                  <div class="mb-3">
                    <label for="dob" class="form-label">
                      Ngày Sinh <span class="required-mark">*</span>
                    </label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                  </div>

                  <!-- Gender -->
                  <div class="mb-3">
                    <label class="form-label">
                      Giới Tính <span class="required-mark">*</span>
                    </label>
                    <div class="d-flex gap-4">
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Nam" required>
                        <label class="form-check-label" for="genderMale">
                          <i class="bi bi-gender-male text-primary"></i> Nam
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Nữ"
                          required>
                        <label class="form-check-label" for="genderFemale">
                          <i class="bi bi-gender-female text-danger"></i> Nữ
                        </label>
                      </div>
                    </div>
                  </div>

                  <!-- Address -->
                  <div class="mb-3">
                    <label for="address" class="form-label">
                      Địa Chỉ <span class="required-mark">*</span>
                    </label>
                    <textarea class="form-control" id="address" name="address" rows="3" required
                      placeholder="Nhập địa chỉ đầy đủ (số nhà, đường, phường/xã, quận/huyện, tỉnh/thành phố)"></textarea>
                  </div>
                </div>
              </div>
            </div>

            <!-- DNA Information & File Upload Section -->
            <div class="col-lg-6">
              <!-- DNA Test Information -->
              <div class="card shadow-lg border-0 rounded-4 mb-4">
                <div class="card-body p-4">
                  <div class="d-flex align-items-center gap-3 mb-4">
                    <div class="section-icon">
                      <i class="bi bi-clipboard2-pulse"></i>
                    </div>
                    <h4 class="mb-0 fw-bold">Thông Tin Xét Nghiệm</h4>
                  </div>

                  <!-- Sample ID (Auto-generated display) -->
                  <div class="mb-3">
                    <label class="form-label">Mã Mẫu ADN</label>
                    <div class="input-group">
                      <span class="input-group-text bg-light">
                        <i class="bi bi-fingerprint"></i>
                      </span>
                      <input type="text" class="form-control bg-light"
                        value="DNA-2024-VN-${java.time.LocalDateTime.now().format(java.time.format.DateTimeFormatter.ofPattern('yyyyMMddHHmmss'))}"
                        readonly>
                    </div>
                    <small class="text-muted">Mã tự động được tạo khi upload</small>
                  </div>

                  <!-- Test Date -->
                  <div class="mb-3">
                    <label for="testDate" class="form-label">
                      Ngày Xét Nghiệm <span class="required-mark">*</span>
                    </label>
                    <input type="date" class="form-control" id="testDate" name="testDate" required>
                    <small class="text-muted">Ngày lấy mẫu/xét nghiệm ADN</small>
                  </div>
                </div>
              </div>

              <!-- DNA Markers Section -->
              <div class="card shadow-lg border-0 rounded-4 mt-4">
                <div class="card-body p-4">
                  <div class="d-flex align-items-center gap-3 mb-4">
                    <div class="section-icon">
                      <i class="bi bi-diagram-3"></i>
                    </div>
                    <h4 class="mb-0 fw-bold">16 Đoạn Gen STR</h4>
                  </div>
                  <p class="text-muted small mb-4">Nhập giá trị allele cho mỗi đoạn gen (ví dụ: 29, 30)</p>

                  <div class="row g-3">
                    <!-- Locus 1: D3S1358 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">1. D8S1179</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus1_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus1_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 2: vWA -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">2. D21S11</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus2_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus2_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 3: D16S539 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">3. D7S820</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus3_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus3_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 4: D2S1338 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">4. CSF1PO</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus4_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus4_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 5: D8S1179 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">5. D3S1358</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus5_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus5_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 6: D21S11 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">6. TH01</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus6_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus6_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 7: D18S51 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">7. D13S317</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus7_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus7_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 8: D19S433 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">8. D16S539</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus8_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus8_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 9: TH01 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">9. D2S1338</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus9_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus9_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 10: FGA -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">10. D19S433</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus10_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus10_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 11: D22S1045 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">11. vWA</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus11_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus11_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 12: D5S818 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">12. TPOX</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus12_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus12_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 13: D13S317 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">13. D18S51</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus13_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus13_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 14: D7S820 -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">14. AMEL</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus14_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus14_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 15: CSF1PO -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">15. D5S818</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus15_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus15_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>

                    <!-- Locus 16: TPOX -->
                    <div class="col-md-6">
                      <label class="form-label fw-semibold small">16. FGA</label>
                      <div class="input-group input-group-sm">
                        <input type="text" class="form-control" name="locus16_allele1" placeholder="Allele 1" required>
                        <span class="input-group-text">-</span>
                        <input type="text" class="form-control" name="locus16_allele2" placeholder="Allele 2" required>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Submit Button -->
          <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary btn-lg rounded-3">
              <i class="bi bi-upload me-2"></i>Upload Thông Tin ADN
            </button>
            <a href="home" class="btn btn-outline-secondary btn-lg rounded-3 ms-3">
              <i class="bi bi-x-circle me-2"></i>Hủy
            </a>
          </div>
        </form>
      </div>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
      <script>
        // Form validation
        document.getElementById('uploadForm').addEventListener('submit', (e) => {
          const phone = document.getElementById('phone').value;
          const phonePattern = /^[0-9]{10,11}$/;

          if (!phonePattern.test(phone)) {
            e.preventDefault();
            alert('Số điện thoại phải có 10-11 chữ số');
            return false;
          }
        });

        // Set max date for DOB (must be in the past)
        const dobInput = document.getElementById('dob');
        const today = new Date().toISOString().split('T')[0];
        dobInput.setAttribute('max', today);

        // Set max date for test date (cannot be in the future)
        const testDateInput = document.getElementById('testDate');
        testDateInput.setAttribute('max', today);
      </script>
    </body>

    </html>