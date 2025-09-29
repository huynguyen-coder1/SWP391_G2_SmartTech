<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Đăng ký - Datsan247</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
   <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="./css/formlogin.css">
 </head>
<body>


   <div class="container">
       <div class="row justify-content-center mt-5">
           <div class="col-md-8">
               <div class="form-container">
                   <h2 class="text-center">Bạn muốn đăng ký sử dụng phần mềm quản lý sân Datsan247 MIỄN PHÍ?</h2>
                   <form action="/submit_registration" method="POST" class="row">
                       <div class="col-md-4 mb-3">
                           <label for="fullName" class="form-label">Họ & tên *</label>
                           <input type="text" class="form-control" id="fullName" name="fullName" required>
                       </div>
                       <div class="col-md-4 mb-3">
                           <label for="phoneNumber" class="form-label">Số điện thoại *</label>
                           <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                       </div>
                       <div class="col-md-4 mb-3">
                           <label for="email" class="form-label">Email</label>
                           <input type="email" class="form-control" id="email" name="email">
                       </div>
                       <div class="col-md-12 text-center">
                           <button type="submit" class="btn btn-primary">Gửi</button>
                       </div>
                   </form>
               </div>
           </div>
       </div>
   </div>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




