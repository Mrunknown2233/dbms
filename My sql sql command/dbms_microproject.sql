
-- Create a table for tests
CREATE TABLE Tests (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    Subject VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Score INT NOT NULL
);
INSERT INTO Tests (Subject, Date, Score) VALUES
('Mathematics', '2024-10-01', 85),
('Science', '2024-10-02', 90),
('History', '2024-10-03', 78),
('Literature', '2024-10-04', 88);

select * from Tests;