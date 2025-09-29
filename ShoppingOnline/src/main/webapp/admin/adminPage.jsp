<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<p>TEST: ${totalUsers}</p>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Quản Trị</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                color: #333;
            }

            .main-content {
                margin-left: 280px;
                padding: 30px;
                min-height: 100vh;
            }

            .header {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                padding: 20px 30px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }

            .header h2 {
                color: #333;
                font-weight: 700;
                font-size: 32px;
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 25px;
                margin-bottom: 40px;
            }

            .stat-card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                padding: 30px;
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                position: relative;
                overflow: hidden;
                transition: all 0.3s ease;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(90deg, #667eea, #764ba2);
            }

            .stat-card.primary::before {
                background: linear-gradient(90deg, #667eea, #764ba2);
            }

            .stat-card.success::before {
                background: linear-gradient(90deg, #56ab2f, #a8e6cf);
            }

            .stat-card.warning::before {
                background: linear-gradient(90deg, #f093fb, #f5576c);
            }

            .stat-card.danger::before {
                background: linear-gradient(90deg, #4facfe, #00f2fe);
            }

            .stat-icon {
                width: 60px;
                height: 60px;
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                color: white;
                margin-bottom: 20px;
            }

            .stat-card.primary .stat-icon {
                background: linear-gradient(135deg, #667eea, #764ba2);
            }

            .stat-card.success .stat-icon {
                background: linear-gradient(135deg, #56ab2f, #a8e6cf);
            }

            .stat-card.warning .stat-icon {
                background: linear-gradient(135deg, #f093fb, #f5576c);
            }

            .stat-card.danger .stat-icon {
                background: linear-gradient(135deg, #4facfe, #00f2fe);
            }

            .stat-title {
                font-size: 14px;
                color: #666;
                margin-bottom: 10px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .stat-value {
                font-size: 32px;
                font-weight: 700;
                color: #333;
                margin-bottom: 10px;
            }

            .stat-change {
                font-size: 12px;
                color: #28a745;
                font-weight: 600;
            }

            .card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border-radius: 20px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                overflow: hidden;
            }

            .card-header {
                padding: 25px 30px;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .card-header h5 {
                font-size: 20px;
                font-weight: 700;
                color: #333;
            }

            .card-body {
                padding: 30px;
            }

            .table {
                width: 100%;
                border-collapse: collapse;
                background: transparent;
            }

            .table th,
            .table td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            }

            .table th {
                background: rgba(102, 126, 234, 0.1);
                font-weight: 600;
                color: #333;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .table tr:hover {
                background: rgba(102, 126, 234, 0.05);
            }

            .badge {
                padding: 6px 12px;
                border-radius: 20px;
                font-size: 12px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .badge.success {
                background: linear-gradient(135deg, #56ab2f, #a8e6cf);
                color: white;
            }

            .badge.pending {
                background: linear-gradient(135deg, #f093fb, #f5576c);
                color: white;
            }

            .btn {
                padding: 8px 16px;
                border: none;
                border-radius: 8px;
                font-size: 12px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                cursor: pointer;
                transition: all 0.3s ease;
                text-decoration: none;
                display: inline-block;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            }

            .btn-primary {
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
            }

            .btn-info {
                background: linear-gradient(135deg, #4facfe, #00f2fe);
                color: white;
            }

            .btn-success {
                background: linear-gradient(135deg, #56ab2f, #a8e6cf);
                color: white;
            }

            .btn-danger {
                background: linear-gradient(135deg, #f093fb, #f5576c);
                color: white;
            }

            .btn-outline {
                background: transparent;
                border: 2px solid #667eea;
                color: #667eea;
            }

            .btn-outline:hover {
                background: #667eea;
                color: white;
            }

            .progress-container {
                background: rgba(0, 0, 0, 0.1);
                border-radius: 15px;
                height: 30px;
                overflow: hidden;
                margin-top: 20px;
            }

            .progress-bar {
                height: 100%;
                background: linear-gradient(90deg, #667eea, #764ba2);
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                font-weight: 600;
                transition: width 0.3s ease;
            }

            .chart-placeholder {
                height: 200px;
                background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
                border-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #666;
                font-style: italic;
                margin-bottom: 20px;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                    padding: 20px;
                }

                .stats-grid {
                    grid-template-columns: 1fr;
                }

                .card-header {
                    flex-direction: column;
                    gap: 15px;
                    align-items: flex-start;
                }

                .table-responsive {
                    overflow-x: auto;
                }
            }

            .fade-in {
                animation: fadeIn 0.6s ease-in;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        </style>
    </head>
    <body>

        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header fade-in">
                <h2><i class="fas fa-tachometer-alt"></i> Thống Kê Tổng Quan</h2>
            </div>

            <!-- Thống kê -->
            <div class="stats-grid fade-in">
                <div class="stat-card primary">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-title">Tổng Người Dùng</div>
                    <div class="stat-value">${totalUsers}</div>
                    <div class="stat-change">↗ +12% so với tháng trước</div>
                </div>
                <div class="stat-card success">
                    <div class="stat-icon">
                        <i class="fas fa-futbol"></i>
                    </div>
                    <div class="stat-title">Sân Vận Động</div>
                    <div class="stat-value">${totalStadiums}</div>
                    <div class="stat-change">↗ +3 sân mới</div>
                </div>
                <div class="stat-card warning">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-title">Doanh Thu Hôm Nay</div>
                    <div class="stat-value">₫${totalRevenue}</div>
                    <div class="stat-change">↗ +25% so với hôm qua</div>
                </div>
                <div class="stat-card danger">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-plus"></i>
                    </div>
                    <div class="stat-title">Đơn Mới Nhất</div>
                    <div class="stat-value">${newOrders}</div>
                    <div class="stat-change">↗ +4 đơn trong giờ qua</div>
                </div>
            </div>

            <!-- Đơn đặt sân gần đây -->
            <div class="card fade-in">
                <div class="card-header">
                    <h5><i class="fas fa-calendar-check"></i> Đơn Đặt Sân Mới Nhất</h5>
                    <a href="${pageContext.request.contextPath}/allbookings" class="btn btn-outline">Xem tất cả</a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Khách Hàng</th>
                                    <th>Sân</th>
                                    <th>Thời Gian</th>
                                    <th>Trạng Thái</th>
                                    <th>Hành Động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${recentBookings}">
                                    <tr>
                                        <td><strong>#${b.bookingID}</strong></td>
                                        <td>
                                            <div><strong>${b.user.fullName}</strong><br><small>${b.user.email}</small></div>
                                        </td>
                                        <td>${b.stadium.name}</td>
                                        <td>
                                            <fmt:formatDate value="${b.bookingDate}" pattern="dd/MM/yyyy"/>
                                            <br><small>(Chưa có thời gian cụ thể)</small>
                                        </td>
                                        <td>
                                            <span class="badge ${b.status eq 'Completed' ? 'success' : 'pending'}">
                                                ${b.status}
                                            </span>
                                        </td>
                                        <td>
<!--                                            <a href="bookingdetail?id=${b.bookingID}" class="btn btn-info">Chi tiết</a>
                                            <a href="cancelbooking?id=${b.bookingID}" class="btn btn-danger">Hủy</a>-->
                                            <form action="${pageContext.request.contextPath}/bookingdetail" method="get" style="display:inline;">
                                                <input type="hidden" name="id" value="${b.bookingID}">
                                                <button type="submit" class="btn btn-info">Chi tiết</button>
                                            </form>

                                            <form action="${pageContext.request.contextPath}/cancelbooking" method="post" style="display:inline;" onsubmit="return confirm('Xác nhận hủy đơn này?');">
                                                <input type="hidden" name="id" value="${b.bookingID}">
                                                <button type="submit" class="btn btn-danger">Hủy</button>
                                            </form>


                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ doanh thu -->
            <div class="card fade-in">
                <div class="card-header">
                    <h5><i class="fas fa-chart-line"></i> Thống Kê Doanh Thu Tuần Này</h5>
                </div>
                <div class="card-body">
                    <canvas id="weeklyRevenueChart" height="100"></canvas>
                </div>
            </div>


            <!-- Tài khoản đăng ký gần đây -->
            <div class="card fade-in">
                <div class="card-header">
                    <h5><i class="fas fa-user-plus"></i> Tài Khoản Đăng Ký Gần Đây</h5>
                    <a href="${pageContext.request.contextPath}/admin/userManagement.jsp" class="btn btn-outline">Quản Lý Người Dùng</a>
                </div>
                <div class="card-body" style="cursor: pointer;" 
                     onclick="location.href = '${pageContext.request.contextPath}/admin/userManagement.jsp'">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Họ Tên</th>
                                    <th>Email</th>
                                    <th>Vai Trò</th>
                                    <th>Ngày Đăng Ký</th>
                                    <th>Trạng Thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="u" items="${recentUsers}">
                                    <tr>
                                        <td>
                                            <div style="display: flex; align-items: center;">
                                                <div style="width: 40px; height: 40px; background: linear-gradient(135deg, #667eea, #764ba2); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold; margin-right: 12px;">
                                                    ${fn:toUpperCase(fn:substring(u.fullName, 0, 1))}
                                                </div>
                                                <strong>${u.fullName}</strong>
                                            </div>
                                        </td>
                                        <td>${u.email}</td>
                                        <td>
                                            <span class="badge ${u.role eq 'Admin' ? 'danger' : (u.role eq 'FieldOwner' ? 'pending' : 'success')}">
                                                ${u.role}
                                            </span>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${u.createdAt}" pattern="yyyy-MM-dd" />
                                        </td>
                                        <td>
                                            <i class="fas fa-circle" style="color: ${u.status eq 'Active' ? '#28a745' : '#dc3545'}; font-size: 8px;"></i>
                                            ${u.status eq 'Active' ? 'Hoạt động' : 'Ngưng hoạt động'}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

        <!-- JS Ripple Animation -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Ripple effect on button click
                const buttons = document.querySelectorAll('.btn');
                buttons.forEach(btn => {
                    btn.addEventListener('click', function (e) {
                        if (!this.classList.contains('btn-outline')) {
                            e.preventDefault();
                        }
                        const ripple = document.createElement('span');
                        const rect = this.getBoundingClientRect();
                        const size = Math.max(rect.width, rect.height);
                        ripple.style.cssText = `
                            position: absolute;
                            width: ${size}px;
                            height: ${size}px;
                            background: rgba(255, 255, 255, 0.6);
                            border-radius: 50%;
                            left: ${e.clientX - rect.left - size / 2}px;
                            top: ${e.clientY - rect.top - size / 2}px;
                            transform: scale(0);
                            animation: ripple 0.6s ease-out;
                            pointer-events: none;
                        `;
                        this.appendChild(ripple);

                        setTimeout(() => ripple.remove(), 600);
                    });
                });
            });

            // Animation keyframes
            const style = document.createElement('style');
            style.textContent = `
                @keyframes ripple {
                    to {
                        transform: scale(2);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        </script>

        <script>
            // Tạo nhãn ngày trong tuần
            const labels = [
            <c:forEach var="entry" items="${weeklyRevenueStats}" varStatus="loop">
            '${entry.key}'<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
            ];

            // Tạo dữ liệu doanh thu tương ứng
            const data = [
            <c:forEach var="entry" items="${weeklyRevenueStats}" varStatus="loop">
                ${entry.value}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
            ];

            // Khởi tạo biểu đồ
            window.addEventListener('DOMContentLoaded', function () {
                const ctx = document.getElementById('weeklyRevenueChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Doanh thu (VNĐ)',
                                data: data,
                                backgroundColor: 'rgba(75, 192, 192, 0.6)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1,
                                borderRadius: 6
                            }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        const value = context.raw || 0;
                                        return value.toLocaleString('vi-VN') + ' ₫';
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return value.toLocaleString('vi-VN') + ' ₫';
                                    }
                                }
                            }
                        }
                    }
                });
            });
        </script>

    </body>
</html>