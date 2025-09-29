<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/header.css"> 

        <!-- Nhúng Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="header-bg">
            <div class="header-row row-top">
                <div class="container">
                    <div class="row header-top">
                        <div class="col-sm-6">
                            <div class="logo">
                                <a href="home.jsp">
                                    <img src="<%= request.getContextPath() %>/images/logo.png" alt="logo"/>
                                </a>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>

            <div class="header-row row-bottom">
                <div class="container">
                    <div class="row header-menu">
                        <div class="col-8 menu-wrapper">
                            <div class="item"><a href="<%= request.getContextPath() %>/home.jsp"><i class="fa-solid fa-house"></i></a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/home.jsp">Trang chủ</a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/stadiums">Danh sách sản phẩm</a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/intro/introduce.jsp">Laptop</a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/intro/introduce.jsp">Keyboard </a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/intro/policy.jsp">Mouse</a></div>
                            <div class="item"><a href="<%= request.getContextPath() %>/intro/terms.jsp">Accessories</a></div>
                        </div>

                        <div class="col-4 box-account d-flex justify-content-end align-items-center">
                            <%
                                model.User currentUser = (model.User) session.getAttribute("currentUser");
                                if (currentUser != null) {
                            %>
                            <div class="user-info d-flex align-items-center gap-3">
                                <div class="user-name text-white">
                                    <i class="fa-solid fa-user"></i>
                                    <%= currentUser.getFullName() != null ? currentUser.getFullName() : currentUser.getEmail() %>
                                </div>
                                <a href="<%= request.getContextPath() %>/logout" class="btn btn-warning btn-sm">
                                    <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
                                </a>
                            </div>


                            <%
                                } else {
                            %>
                            <div class="account item">
                                <a class="register me-2" href="<%= request.getContextPath() %>/account/register.jsp">Đăng ký</a>
                                <a href="<%= request.getContextPath() %>/account/login.jsp">Đăng nhập</a>
                            </div>
                            <%
                                }
                            %>
                            <div class="search-header item ms-3">
                                <a href="#">
                                    <span>Your Cart</span>
                                    <i class="fa-solid fa-cart-shopping""></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </body>
</html>
