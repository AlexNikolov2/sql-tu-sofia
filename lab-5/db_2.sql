CREATE DATABASE CinemaDB;
USE CinemaDB;

CREATE TABLE Cinemas (
    cinema_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Halls (
    hall_id INT PRIMARY KEY AUTO_INCREMENT,
    cinema_id INT,
    hall_number INT NOT NULL,
    status ENUM('Standard', 'VIP', 'Deluxe') NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES Cinemas(cinema_id)
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE Screenings (
    screening_id INT PRIMARY KEY AUTO_INCREMENT,
    hall_id INT,
    movie_id INT,
    screening_time DATETIME NOT NULL,
    tickets_sold INT NOT NULL,
    FOREIGN KEY (hall_id) REFERENCES Halls(hall_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);