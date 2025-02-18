-- Database Creation
CREATE DATABASE RealTimeDataProcessing;
USE RealTimeDataProcessing;

-- Sensors Table
CREATE TABLE Sensors (
    SensorID INT PRIMARY KEY AUTO_INCREMENT,
    SensorName VARCHAR(100),
    Location VARCHAR(100)
);

-- Readings Table
CREATE TABLE Readings (
    ReadingID INT PRIMARY KEY AUTO_INCREMENT,
    SensorID INT,
    Value DECIMAL(10,2),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SensorID) REFERENCES Sensors(SensorID) ON DELETE CASCADE
);

-- Logs Table
CREATE TABLE Logs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    SensorID INT,
    EventType VARCHAR(50),
    EventDescription TEXT,
    EventTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SensorID) REFERENCES Sensors(SensorID) ON DELETE CASCADE
);
-- DML: Insert 20 records into Sensors
INSERT INTO Sensors (SensorName, Location) VALUES
('Temperature Sensor', 'Room 101'),
('Humidity Sensor', 'Room 102'),
('Pressure Sensor', 'Room 103'),
('CO2 Sensor', 'Room 104'),
('Smoke Detector', 'Room 105'),
('Light Sensor', 'Room 106'),
('Motion Sensor', 'Room 107'),
('Sound Sensor', 'Room 108'),
('Gas Sensor', 'Room 109'),
('UV Sensor', 'Room 110'),
('Infrared Sensor', 'Room 111'),
('Vibration Sensor', 'Room 112'),
('Magnetometer', 'Room 113'),
('Radar Sensor', 'Room 114'),
('Proximity Sensor', 'Room 115'),
('Water Level Sensor', 'Room 116'),
('Soil Moisture Sensor', 'Room 117'),
('pH Sensor', 'Room 118'),
('Turbidity Sensor', 'Room 119'),
('Thermocouple Sensor', 'Room 120');

-- Insert 20 records into Readings
INSERT INTO Readings (SensorID, Value) VALUES
(1, 22.5), (2, 60.3), (3, 1013.2), (4, 400.1), (5, 0.02),
(6, 300.5), (7, 25.8), (8, 70.2), (9, 50.6), (10, 95.4),
(11, 40.3), (12, 88.1), (13, 33.7), (14, 20.5), (15, 99.9),
(16, 65.2), (17, 75.5), (18, 82.1), (19, 45.3), (20, 55.7);

-- Insert 20 records into Logs
INSERT INTO Logs (SensorID, EventType, EventDescription) VALUES
(1, 'Alert', 'Temperature exceeded threshold'),
(2, 'Warning', 'Humidity level dropping'),
(3, 'Info', 'Pressure reading normal'),
(4, 'Alert', 'High CO2 levels detected'),
(5, 'Warning', 'Smoke detected'),
(6, 'Info', 'Light intensity stable'),
(7, 'Alert', 'Motion detected in restricted area'),
(8, 'Warning', 'High sound level detected'),
(9, 'Alert', 'Gas leak detected'),
(10, 'Info', 'UV exposure normal'),
(11, 'Warning', 'Infrared sensor triggered'),
(12, 'Alert', 'High vibration levels detected'),
(13, 'Info', 'Magnetometer reading stable'),
(14, 'Warning', 'Radar detection anomaly'),
(15, 'Alert', 'Proximity breach detected'),
(16, 'Info', 'Water level within range'),
(17, 'Warning', 'Soil moisture low'),
(18, 'Alert', 'pH levels out of range'),
(19, 'Info', 'Turbidity level normal'),
(20, 'Warning', 'Thermocouple overheating');

-- DQL: Fetch all sensor data
SELECT * FROM Sensors;

-- Filtering Operations
SELECT * FROM Readings WHERE Value > 50;
SELECT * FROM Logs WHERE EventType = 'Alert';

-- Aggregation Functions
SELECT COUNT(*) FROM Sensors;
SELECT AVG(Value) FROM Readings;
SELECT COUNT(*) FROM Logs WHERE EventType = 'Warning';

-- Sorting Data
SELECT * FROM Readings ORDER BY Value DESC;

-- Pattern Matching
SELECT * FROM Sensors WHERE SensorName LIKE 'T%';

-- UNION Operation
SELECT SensorName FROM Sensors UNION SELECT EventType FROM Logs;

-- Joins
-- INNER JOIN
SELECT Sensors.SensorName, Readings.Value FROM Sensors 
INNER JOIN Readings ON Sensors.SensorID = Readings.SensorID;

-- LEFT JOIN
SELECT Sensors.SensorName, Logs.EventType FROM Sensors 
LEFT JOIN Logs ON Sensors.SensorID = Logs.SensorID;

-- RIGHT JOIN
SELECT Sensors.SensorName, Logs.EventType FROM Sensors 
RIGHT JOIN Logs ON Sensors.SensorID = Logs.SensorID;





