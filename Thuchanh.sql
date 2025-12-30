DROP DATABASE IF EXISTS elearning_db;
CREATE DATABASE elearning_db;
USE elearning_db;

CREATE TABLE student (
  student_id VARCHAR(20) PRIMARY KEY,
  full_name  VARCHAR(100) NOT NULL,
  dob        DATE NOT NULL,
  email      VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE teacher (
  teacher_id VARCHAR(20) PRIMARY KEY,
  full_name  VARCHAR(100) NOT NULL,
  email      VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE course (
  course_id   VARCHAR(20) PRIMARY KEY,
  course_name VARCHAR(120) NOT NULL,
  short_desc  VARCHAR(255),
  sessions    INT NOT NULL,
  teacher_id  VARCHAR(20) NOT NULL,
  CHECK (sessions > 0),
  CONSTRAINT fk_course_teacher
    FOREIGN KEY (teacher_id)
    REFERENCES teacher(teacher_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE enrollment (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id    VARCHAR(20) NOT NULL,
  course_id     VARCHAR(20) NOT NULL,
  enroll_date   DATE NOT NULL,
  CONSTRAINT uq_enrollment UNIQUE (student_id, course_id),
  CONSTRAINT fk_enroll_student
    FOREIGN KEY (student_id)
    REFERENCES student(student_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT fk_enroll_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE result (
  student_id  VARCHAR(20) NOT NULL,
  course_id   VARCHAR(20) NOT NULL,
  mid_score   DECIMAL(4,2) NOT NULL,
  final_score DECIMAL(4,2) NOT NULL,
  CHECK (mid_score BETWEEN 0 AND 10),
  CHECK (final_score BETWEEN 0 AND 10),
  PRIMARY KEY (student_id, course_id),
  CONSTRAINT fk_result_enroll
    FOREIGN KEY (student_id, course_id)
    REFERENCES enrollment(student_id, course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO student VALUES
('SV101', 'Hoàng Minh Đức',  '2004-02-18', 'duc.sv101@uni.edu'),
('SV102', 'Nguyễn Thị Hạnh', '2005-06-09', 'hanh.sv102@uni.edu'),
('SV103', 'Phạm Quốc Bảo',   '2004-12-22', 'bao.sv103@uni.edu'),
('SV104', 'Lê Thu Trang',    '2005-03-14', 'trang.sv104@uni.edu'),
('SV105', 'Đỗ Anh Tuấn',     '2004-08-30', 'tuan.sv105@uni.edu');

INSERT INTO teacher VALUES
('GV101', 'TS. Nguyễn Văn Hòa',  'hoa.gv101@uni.edu'),
('GV102', 'ThS. Trịnh Minh Anh', 'anh.gv102@uni.edu'),
('GV103', 'TS. Phạm Đức Khải',   'khai.gv103@uni.edu'),
('GV104', 'ThS. Lê Ngọc Mai',    'mai.gv104@uni.edu');

INSERT INTO course VALUES
('C101', 'Nhập môn CNTT',  'Tổng quan ngành CNTT', 10, 'GV101'),
('C102', 'Cơ sở dữ liệu',  'SQL, ERD, chuẩn hóa',  12, 'GV102'),
('C103', 'Lập trình C',    'C cơ bản & nâng cao',  14, 'GV103'),
('C104', 'Lập trình Web',  'HTML, CSS, JavaScript',15, 'GV104');

INSERT INTO enrollment (student_id, course_id, enroll_date) VALUES
('SV101', 'C101', '2025-09-01'),
('SV101', 'C102', '2025-09-02'),
('SV102', 'C101', '2025-09-01'),
('SV102', 'C103', '2025-09-03'),
('SV103', 'C102', '2025-09-02'),
('SV103', 'C104', '2025-09-04'),
('SV104', 'C103', '2025-09-03'),
('SV105', 'C104', '2025-09-04');

INSERT INTO result VALUES
('SV101', 'C101', 7.0, 8.0),
('SV101', 'C102', 6.5, 7.5),
('SV102', 'C101', 8.0, 8.5),
('SV102', 'C103', 7.5, 8.0),
('SV103', 'C102', 9.0, 9.2),
('SV103', 'C104', 6.8, 7.0),
('SV104', 'C103', 8.2, 8.8),
('SV105', 'C104', 5.5, 6.0);

SELECT * FROM student;
SELECT * FROM teacher;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM result;
