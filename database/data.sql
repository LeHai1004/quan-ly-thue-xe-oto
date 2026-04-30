-- =============================================
-- DATA MẪU - GIAI ĐOẠN 1
-- Hệ thống Quản lý Cho thuê Xe Ô tô
-- =============================================

USE quan_ly_thue_xe_oto;

-- 1. Thêm Users
INSERT INTO Users (username, email, password_hash, role) VALUES
('admin', 'admin@car rental.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin'),
('staff1', 'staff1@carrental.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'staff'),
('customer1', 'customer1@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'customer');

-- 2. Thêm Customers
INSERT INTO Customers (user_id, full_name, phone, cccd, driver_license_number, address) VALUES
(3, 'Nguyễn Văn A', '0912345678', '012345678901', 'DL12345678', 'Đà Nẵng'),
(1, 'Trần Thị B', '0987654321', '098765432109', 'DL98765432', 'Hà Nội');

-- 3. Thêm loại xe
INSERT INTO Vehicle_Categories (name, description) VALUES
('Sedan', 'Xe sedan 4-5 chỗ'),
('SUV', 'Xe SUV gầm cao'),
('MPV', 'Xe đa dụng 7 chỗ'),
('Luxury', 'Xe cao cấp');

-- 4. Thêm xe
INSERT INTO Vehicles (license_plate, make, model, year, color, category_id, seats, daily_rate, deposit_amount, status) VALUES
('29A-12345', 'Toyota', 'Camry', 2023, 'Trắng', 1, 5, 1200000, 5000000, 'available'),
('29B-67890', 'Honda', 'CR-V', 2024, 'Đen', 2, 5, 1500000, 7000000, 'available'),
('29C-11122', 'Toyota', 'Innova', 2022, 'Bạc', 3, 7, 1300000, 6000000, 'rented'),
('29D-33445', 'Mercedes', 'C300', 2023, 'Xám', 4, 5, 2500000, 10000000, 'available');

-- 5. Thêm Booking mẫu
INSERT INTO Bookings (booking_code, customer_id, vehicle_id, pickup_date, return_date, total_amount, status) VALUES
('BK20260501A', 1, 1, '2026-05-10 08:00:00', '2026-05-15 20:00:00', 6000000, 'confirmed');

-- 6. Thêm Rental mẫu
INSERT INTO Rentals (booking_id, customer_id, vehicle_id, actual_pickup_date, total_fee, status) VALUES
(1, 1, 1, '2026-05-10 08:30:00', 6000000, 'active');

-- 7. Thêm Payment mẫu
INSERT INTO Payments (rental_id, amount, payment_method, status) VALUES
(1, 6000000, 'VNPay', 'paid');