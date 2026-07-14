CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(255) NOT NULL,

    email VARCHAR(255) NULL,
    phone VARCHAR(20) NULL,

    role VARCHAR(100) DEFAULT 'Designer',

    profile_image TEXT NULL,

    primary_login ENUM('email', 'phone') NULL,

    otp VARCHAR(10) NULL,
    otp_expiry DATETIME NULL,

    temp_email VARCHAR(255) NULL,
    temp_phone VARCHAR(20) NULL,

    time_zone VARCHAR(100) DEFAULT 'India (GMT+5:30)',

    is_old_phone_verified BOOLEAN DEFAULT FALSE,
    is_old_email_verified BOOLEAN DEFAULT FALSE,

    is_online BOOLEAN DEFAULT FALSE,
    last_seen DATETIME NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    UNIQUE KEY unique_email (email),
    UNIQUE KEY unique_phone (phone)
);
