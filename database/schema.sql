-- =============================================
-- HỆ THỐNG QUẢN LÝ CHO THUÊ XE Ô TÔ
-- SCHEMA DATABASE - GIAI ĐOẠN 1
-- Ngày tạo: 30/04/2026
-- =============================================

CREATE DATABASE IF NOT EXISTS quan_ly_thue_xe_oto;
USE quan_ly_thue_xe_oto;

-- 1. Bảng Users (Tài khoản chung)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'staff', 'customer') NOT NULL DEFAULT 'customer',
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2. Bảng Customers (Thông tin chi tiết khách hàng)
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    cccd VARCHAR(20),
    driver_license_number VARCHAR(30),
    driver_license_expiry DATE,
    address TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE SET NULL
);

-- 3. Loại xe
CREATE TABLE Vehicle_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL COMMENT 'Sedan, SUV, MPV, Luxury...',
    description TEXT
);

-- 4. Bảng Xe
CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    license_plate VARCHAR(20) UNIQUE NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR,
    color VARCHAR(30),
    category_id INT,
    seats INT DEFAULT 4,
    daily_rate DECIMAL(12,2) NOT NULL,
    deposit_amount DECIMAL(12,2) NOT NULL,
    status ENUM('available', 'rented', 'maintenance', 'unavailable') DEFAULT 'available',
    images TEXT COMMENT 'JSON hoặc danh sách link ảnh',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Vehicle_Categories(category_id)
);

-- 5. Booking (Đặt xe trước)
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_code VARCHAR(20) UNIQUE NOT NULL,
    customer_id INT,
    vehicle_id INT,
    pickup_date DATETIME NOT NULL,
    return_date DATETIME NOT NULL,
    total_amount DECIMAL(12,2),
    status ENUM('pending', 'confirmed', 'cancelled', 'completed') DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- 6. Rentals (Hợp đồng thuê thực tế)
CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NULL,
    customer_id INT,
    vehicle_id INT,
    actual_pickup_date DATETIME,
    actual_return_date DATETIME,
    total_fee DECIMAL(12,2),
    status ENUM('active', 'completed', 'overdue', 'cancelled') DEFAULT 'active',
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id)
);

-- 7. Payments (Thanh toán)
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT,
    amount DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(50),
    status ENUM('pending', 'paid', 'failed', 'refunded') DEFAULT 'pending',
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);

-- Index để tối ưu tìm kiếm
CREATE INDEX idx_vehicles_status ON Vehicles(status);
CREATE INDEX idx_bookings_dates ON Bookings(pickup_date, return_date);
CREATE INDEX idx_customers_phone ON Customers(phone);