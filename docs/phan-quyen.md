\# PHÂN QUYỀN NGƯỜI DÙNG - HỆ THỐNG QUẢN LÝ CHO THUÊ XE Ô TÔ



\## 1. Các vai trò (Roles)



| Role       | Mô tả                              | Quyền hạn chính |

|------------|------------------------------------|-----------------|

| \*\*Admin\*\*  | Quản trị viên cao nhất             | Toàn quyền hệ thống |

| \*\*Staff\*\*  | Nhân viên quản lý                 | Quản lý xe và đơn hàng |

| \*\*Customer\*\* | Khách hàng thuê xe               | Chỉ sử dụng chức năng đặt xe |



\## 2. Chi tiết quyền của từng Role



\### Admin

\- Quản lý tất cả Users (thêm, sửa, xóa, khóa tài khoản)

\- Quản lý Vehicle Categories và Vehicles (thêm/sửa/xóa xe)

\- Xem, chỉnh sửa tất cả Bookings và Rentals

\- Quản lý thanh toán và báo cáo doanh thu

\- Quản lý Promotions và Coupons

\- Xem logs hệ thống



\### Staff

\- Xem danh sách xe và cập nhật trạng thái xe (available, rented, maintenance)

\- Xác nhận Booking → chuyển thành Rental

\- Xử lý giao xe và nhận xe (ghi nhận km, tình trạng xe)

\- Xem lịch sử thuê của khách hàng

\- Xử lý thanh toán tại quầy

\- Không được xóa dữ liệu quan trọng



\### Customer

\- Đăng ký / Đăng nhập tài khoản

\- Xem danh sách xe có sẵn

\- Đặt xe (Booking)

\- Xem lịch sử đặt xe và thuê xe của bản thân

\- Thanh toán online

\- Đánh giá xe sau khi thuê



\## 3. Bảng Users và Role

\- Tất cả người dùng được lưu trong bảng `Users`

\- Cột `role` là ENUM: `'admin'`, `'staff'`, `'customer'`

\- Mặc định khi đăng ký là `customer`



\## 4. Ghi chú

\- Sau này có thể mở rộng quyền chi tiết hơn bằng bảng Permission riêng nếu cần.

\- Phân quyền sẽ được kiểm soát ở Backend (chưa làm ở giai đoạn 1).



\---

Cập nhật: 30/04/2026

