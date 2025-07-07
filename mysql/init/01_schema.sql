-- 'example' 테이블 생성
CREATE TABLE example (
                         id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         created_at DATETIME,
                         updated_at DATETIME
);

-- 지정된 데이터 삽입
INSERT INTO example (id, created_at, updated_at)
VALUES (1, '2025-07-07 13:30:00', '2025-07-07 13:30:00');