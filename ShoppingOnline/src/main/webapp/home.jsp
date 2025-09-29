<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Football Field Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

    <style>
        body {
            font-family: "Roboto", sans-serif;
            background: #f8f9fa;
        }
        .header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        main {
            margin-top: 120px;
        }
        .container h2 {
            font-weight: 700;
            margin-bottom: 40px;
            text-align: left;
        }
        .product-card {
            border: 1px solid #eee;
            padding: 15px;
            text-align: center;
            position: relative;
            background: #fff;
            transition: all 0.3s ease;
        }
        .product-card:hover {
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transform: translateY(-5px);
        }
        .product-label {
            position: absolute;
            top: 10px;
            left: 10px;
        }
        .product-label .sale {
            background: red;
            color: #fff;
            padding: 2px 6px;
            margin-right: 5px;
            font-size: 12px;
        }
        .product-label .new {
            background: #c00;
            color: #fff;
            padding: 2px 6px;
            font-size: 12px;
        }
        .product-img img {
            width: 100%;
            height: auto;
        }
        .category {
            color: #999;
            margin: 10px 0 5px;
            font-size: 13px;
        }
        .product-name {
            font-size: 16px;
            font-weight: bold;
        }
        .price {
            font-size: 14px;
            margin: 8px 0;
        }
        .price .new-price {
            color: red;
            font-weight: bold;
        }
        .price .old-price {
            text-decoration: line-through;
            color: #aaa;
            margin-left: 5px;
        }
        .rating i {
            color: #ff9800;
        }
        .product-actions {
            margin-top: 12px;
        }
        .product-actions i {
            margin: 0 8px;
            cursor: pointer;
            font-size: 16px;
            color: #333;
        }
        .product-actions i:hover {
            color: red;
        }
    </style>
</head>
<body>
<div class="header">
    <%@ include file="/includes/header.jsp" %>
</div>

<main>
    <div class="container">
        <h2>NEW PRODUCTS</h2>
        <div class="row g-4">
            <!-- Product Item -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <div class="product-label">
                        <span class="sale">-30%</span>
                        <span class="new">NEW</span>
                    </div>
                    <div class="product-img">
                        <img src="./images/P-01.png" alt="Product">
                    </div>
                    <p class="category">CATEGORY</p>
                    <h3 class="product-name">PRODUCT NAME GOES HERE</h3>
                    <p class="price">
                        <span class="new-price">$980.00</span>
                        <span class="old-price">$990.00</span>
                    </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <div class="product-actions">
                        <i class="fa-regular fa-heart"></i>
                        <i class="fa-solid fa-cart-shopping"></i>
                        <i class="fa-regular fa-eye"></i>
                    </div>
                </div>
            </div>
            <!-- /Product Item -->

            <!-- Copy thêm 3 sản phẩm nữa để đủ 4 cái -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <div class="product-label">
                        <span class="new">NEW</span>
                    </div>
                    <div class="product-img">
                        <img src="./images/P-02.png" alt="Product">
                    </div>
                    <p class="category">CATEGORY</p>
                    <h3 class="product-name">ANOTHER PRODUCT</h3>
                    <p class="price">
                        <span class="new-price">$850.00</span>
                    </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <div class="product-actions">
                        <i class="fa-regular fa-heart"></i>
                        <i class="fa-solid fa-cart-shopping"></i>
                        <i class="fa-regular fa-eye"></i>
                    </div>
                </div>
            </div>

            <!-- Product Item -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <div class="product-label">
                        <span class="sale">-30%</span>
                    </div>
                    <div class="product-img">
                        <img src="./images/P-03.png" alt="Product">
                    </div>
                    <p class="category">CATEGORY</p>
                    <h3 class="product-name">THIRD PRODUCT</h3>
                    <p class="price">
                        <span class="new-price">$600.00</span>
                        <span class="old-price">$750.00</span>
                    </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                    <div class="product-actions">
                        <i class="fa-regular fa-heart"></i>
                        <i class="fa-solid fa-cart-shopping"></i>
                        <i class="fa-regular fa-eye"></i>
                    </div>
                </div>
            </div>

            <!-- Product Item -->
            <div class="col-md-3 col-sm-6">
                <div class="product-card">
                    <div class="product-img">
                        <img src="./images/P-04.png" alt="Product">
                    </div>
                    <p class="category">CATEGORY</p>
                    <h3 class="product-name">FOURTH PRODUCT</h3>
                    <p class="price">
                        <span class="new-price">$1200.00</span>
                    </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </div>
                    <div class="product-actions">
                        <i class="fa-regular fa-heart"></i>
                        <i class="fa-solid fa-cart-shopping"></i>
                        <i class="fa-regular fa-eye"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@ include file="/includes/footer.jsp" %>
</body>
</html>
