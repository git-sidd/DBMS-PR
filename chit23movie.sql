-- Create ACTOR table
CREATE TABLE ACTOR (
    Act_id INT PRIMARY KEY,
    Act_Name VARCHAR(100),
    Act_Gender VARCHAR(10)
);

-- Insert dummy data into ACTOR table
INSERT INTO ACTOR (Act_id, Act_Name, Act_Gender) VALUES
(1, 'Aamir Khan', 'Male'),
(2, 'Deepika Padukone', 'Female'),
(3, 'Shah Rukh Khan', 'Male'),
(4, 'Priyanka Chopra', 'Female'),
(5, 'Ranbir Kapoor', 'Male');

-- Create DIRECTOR table
CREATE TABLE DIRECTOR (
    Dir_id INT PRIMARY KEY,
    Dir_Name VARCHAR(100),
    Dir_Phone VARCHAR(20)
);

-- Insert dummy data into DIRECTOR table
INSERT INTO DIRECTOR (Dir_id, Dir_Name, Dir_Phone) VALUES
(1, 'Rajkumar Hirani', '9876543210'),
(2, 'Sanjay Leela Bhansali', '9123456789'),
(3, 'Karan Johar', '9887654321');

-- Create MOVIES table
CREATE TABLE MOVIES (
    Mov_id INT PRIMARY KEY,
    Mov_Title VARCHAR(200),
    Mov_Year INT,
    Mov_Lang VARCHAR(20),
    Dir_id INT,
    FOREIGN KEY (Dir_id) REFERENCES DIRECTOR(Dir_id)
);

-- Insert dummy data into MOVIES table
INSERT INTO MOVIES (Mov_id, Mov_Title, Mov_Year, Mov_Lang, Dir_id) VALUES
(1, '3 Idiots', 2009, 'Hindi', 1),
(2, 'Padmaavat', 2018, 'Hindi', 2),
(3, 'Kabhi Khushi Kabhie Gham', 2001, 'Hindi', 3),
(4, 'Barfi!', 2012, 'Hindi', 1),
(5, 'Zindagi Na Milegi Dobara', 2011, 'Hindi', 1);

-- Create MOVIE_CAST table
CREATE TABLE MOVIE_CAST (
    Act_id INT,
    Mov_id INT,
    Role VARCHAR(100),
    PRIMARY KEY (Act_id, Mov_id),
    FOREIGN KEY (Act_id) REFERENCES ACTOR(Act_id),
    FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id)
);

-- Insert dummy data into MOVIE_CAST table
INSERT INTO MOVIE_CAST (Act_id, Mov_id, Role) VALUES
(1, 1, 'Farhan Qureshi'),
(2, 1, 'Raju Rastogi'),
(3, 3, 'Rahul Raichand'),
(4, 2, 'Rani Padmavati'),
(5, 4, 'Barfi');

-- Create RATING table
CREATE TABLE RATING (
    Mov_id INT,
    Rev_Stars INT,
    FOREIGN KEY (Mov_id) REFERENCES MOVIES(Mov_id)
);

-- Insert dummy data into RATING table
INSERT INTO RATING (Mov_id, Rev_Stars) VALUES
(1, 4),
(2, 5),
(3, 3),
(4, 4),
(5, 4);
