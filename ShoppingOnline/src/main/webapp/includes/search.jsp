<!-- search.jsp -->
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tìm Kiếm Sân Bóng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Stars styling */
            .stars {
                display: flex;
                justify-content: center;
                margin-top: 10px;
                font-size: 24px;
                color: #FFD700;
            }


            /* Line styling */
            .line, .line-under {
                width: 60px;
                height: 3px;
                background-color: #007BFF;
                margin: 10px auto;
                border-radius: 2px;
            }

            .line-under {
                width: 30px;
                height: 2px;
                background-color: #5bc0de;
            }

            /* Search title styling */
            .search-title {
                font-size: 48px; /* Large size for the title */
                font-weight: bold;
                text-align: center;
                color: white; /* White color for the title */
                white-space: nowrap; /* Prevent the title from breaking into a new line */
                margin-top: 20px;
            }

            /* Search subtitle styling */
            .search-subtitle {
                font-size: 18px; /* Smaller size for the subtitle */
                text-align: center;
                color: white; /* White color for the subtitle */
                margin-top: 10px;
                word-wrap: break-word; /* Allow the subtitle to break into multiple lines if needed */
            }

            /* Styling for the search form */
            .search-form {
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: rgba(255, 255, 255, 0.8); /* Slight white background */
                padding: 10px 0px;
                border-radius: 8px;
                margin: 20px 0;
                gap:10px;
                flex-wrap: wrap;
            }

            .search-form input {
                flex: 1 1 auto;
                min-width: 200px;
            }

            .search-form .btn-search {
                white-space: nowrap;
            }

            .search-input-group {
                display: flex;
                align-items: center;
                width: 80%; /* Takes most of the space */
            }

            .search-input {
                margin-right: 10px;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: auto;
            }

            .search-input:last-child {
                margin-right: 0; /* No margin on the last element */
            }

            .form-select {
                width: 200px; /* Set a fixed width for the select element */
            }

            .btn-search {
                padding: 12px 20px;
                font-size: 16px;
                color: white;
                background-color: #ffb300; /* Yellow color for the button */
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-align: center;
            }

            .btn-search:hover {
                background-color: #e69900; /* Slightly darker yellow on hover */
            }

            .search-container {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 2;
                background: rgb(255 255 255 / 0%);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0px 0px rgba(0, 0, 0, 0.2);
                max-width: 90%;
            }










        </style>
    </head>
    <body>
        <div class="container my-5">
            <form action="search" method="get" class="search-form-wrapper text-center">
                <div class="stars">
                    <span class="star left">★</span>
                    <span class="star middle">★</span>
                    <span class="star right">★</span>
                </div>
                <div class="line"></div>
                <div class="line-under"></div>
                <h1 class="search-title">HỆ THỐNG HỖ TRỢ TÌM KIẾM SÂN BẢI NHANH</h1>
                <p class="search-subtitle">Dữ liệu được DatSanDee cập nhật thường xuyên giúp người dùng tìm được sân một cách nhanh nhất</p>

                <div class="search-form">
                    <div class="search-input-group">
                        <!-- Môn thể thao -->
                        <select name="sport" class="form-select search-input" aria-label="Chọn môn thể thao">
                            <option value="">Tất cả môn</option>
                            <option value="football">Bóng đá</option>
                            <option value="basketball">Bóng rổ</option>
                            <option value="badminton">Cầu lông</option>
                            <option value="badminton">Bóng bàn</option>
                            <option value="badminton">Golf</option>
                            <option value="badminton">PickleBall</option>
                            <!-- Các môn thể thao khác -->
                        </select>

                        <!-- Tên sân hoặc địa chỉ -->
                        <input type="text" name="keyword" class="form-control search-input" placeholder="Nhập tên sân hoặc địa chỉ...">

                        <!-- Khu vực -->
                        <input type="text" name="area" class="form-control search-input" placeholder="Nhập khu vực">
                    </div>

                    <button type="submit" class="btn btn-search">Tìm kiếm</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


