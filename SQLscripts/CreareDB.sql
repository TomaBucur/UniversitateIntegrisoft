
CREATE DATABASE Universitate COLLATE SQL_Romanian_CP1250_CS_AS;
GO

-- Switch to the newly created database
USE Universitate;
GO

-- Tabela "Orase"

    CREATE TABLE Orase (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Denumire NVARCHAR(50) COLLATE SQL_Romanian_CP1250_CS_AS
    );


-- Tabela "Grupe"
CREATE TABLE Grupe (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Denumire NVARCHAR(15) COLLATE SQL_Romanian_CP1250_CS_AS
);

-- Tabela "Student"
CREATE TABLE Student (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    GrupaId INT FOREIGN KEY REFERENCES Grupe(Id),
    OrasResedintaId INT FOREIGN KEY REFERENCES Orase(Id),
    Nume NVARCHAR(50) COLLATE SQL_Romanian_CP1250_CS_AS,
    Prenume NVARCHAR(50) COLLATE SQL_Romanian_CP1250_CS_AS
);

-- Tabela "Materie"
CREATE TABLE Materie (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nume NVARCHAR(50) COLLATE SQL_Romanian_CP1250_CS_AS
);

-- Tabela "Note"
CREATE TABLE Note (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    StudentId INT FOREIGN KEY REFERENCES Student(Id),
    MaterieId INT FOREIGN KEY REFERENCES Materie(Id),
    NotaObtinuta INT
);
ALTER TABLE Student ADD CONSTRAINT FK_Student_Grupe FOREIGN KEY (GrupaId) REFERENCES Grupe(Id);
ALTER TABLE Student ADD CONSTRAINT FK_Student_Oras FOREIGN KEY (OrasResedintaId) REFERENCES Orase(Id);

ALTER TABLE Note ADD CONSTRAINT FK_Note_Student FOREIGN KEY (StudentId) REFERENCES Student(Id);
ALTER TABLE Note ADD CONSTRAINT FK_Note_Materie FOREIGN KEY (MaterieId) REFERENCES Materie(Id);

-- Inserare Orase
INSERT INTO Orase (Denumire) VALUES
('Ploiesti'), --1
('Pitesti'), --2
('Constanta'), --3
('Bucuresti'), --4
('Calarasi'), --5
('Iasi'), --6
('Slobozia'), --7
('Sibiu'), --8
('Cluj-Napoca'), --9
('Brasov'), --10
('Fetesti'), --11
('Satu-Mare'), --12
('Oradea'),  --13
('Cernavoda'); --14

-- Inserare Grupe
INSERT INTO Grupe (Denumire) VALUES
('A'),
('B'),
('C'),
('D');

-- Inserare Studenti
INSERT INTO Student (GrupaId, OrasResedintaId, Nume, Prenume) VALUES
-- Popescu Mihai
(1, 1, 'Popescu', 'Mihai'), --ok
-- Ionescu Andrei
(1, 4, 'Ionescu', 'Andrei'), --ok
-- Ionescu Andreea
(1, 3, 'Ionescu', 'Andreea'), --ok
-- Dinu Nicolae
(1, 5, 'Dinu Nicolae', 'Nicolae'), --ok
-- Constantin Ionuț
(2, 14, 'Constantin', 'Ionuț'), --ok
-- Simion Mihai
(2, 6, 'Simion', 'Mihai'), --ok
-- Constantinescu Ana-Maria
(2, 14, 'Constantinescu', 'Ana-Maria'), --ok
-- Amăriuței Eugen
(2, 6, 'Amăriuței', 'Eugen'), --ok
-- Știrbei Alexandru
(2, 8, 'Știrbei', 'Alexandru'), --ok
-- Dumitru Angela
(3, 10, 'Dumitru', 'Angela'), --ok
-- Dumitrache Ion
(3, 13, 'Dumitrache', 'Ion'), --ok
-- Șerban Maria-Magdalena
(3, 13, 'Șerban', 'Maria-Magdalena'), --ok
-- Chelaru Violeta
(3, 9, 'Chelaru', 'Violeta'), --ok
-- Sandu Daniel
(3, 9, 'Sandu', 'Daniel'), --ok
-- Marinache Alin
(4, 12, 'Marinache', 'Alin'), --ok
-- Panait Vasile
(4, 12, 'Panait', 'Vasile'), --ok
-- Popa Mirela
(4, 11, 'Popa', 'Mirela'), --ok
-- Dascălu Daniel Ștefan
(4, 11, 'Dascălu Daniel', 'Ștefan'), --ok
-- Georgescu Marian
(4, 11, 'Georgescu', 'Marian'), --ok
-- Dumitrașcu Marius
(4, 1, 'Dumitrașcu', 'Marius'), --ok
-- Dinu Ionela
(4, 4, 'Dinu Ionela', 'Ionela'); --ok

-- Inserare Materii
INSERT INTO Materie (Nume) VALUES
('Chimie'), --1
('Geometrie'), --2
('Algebra'), --3
('Statistica'), --4
('Trigonometrie'), --5
('Muzica'), --6
('Desen'), --7
('Sport'), --8
('Filozofie'), --9
('Literatura'),--10
('Engleza'), --11
('Fizica'), --12
('Franceza'); --13

-- Inserare Note
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Popescu Mihai ok
(1, 1, 7), -- Chimie
(1, 12, 4), -- Fizica
(1, 13, 7), -- Franceză
(1, 12, 6); -- Fizică               
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES

-- Ionescu Andrei ok
(2, 3, 5), -- Algebră
(2, 4, 9), -- Statistică
(2, 6, 6), -- Muzică
(2, 12, 9), -- Fizică
(2, 1, 10), -- Chimie
(2, 8, 8); -- Sport
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES

-- Ionescu Andreea ok
(3, 8, 1), -- Sport
(3, 10, 2), -- Literatură
(3, 13, 9), -- Franceză
(3, 8, 5), -- Sport
(3, 10, 4), -- Literatură
(3, 10, 7); -- Literatură
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES

-- Dinu Nicolae ok
(4, 1, 8), -- Chimie
(4, 3, 9), -- Algebră
(4, 4, 10); -- Statistică
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Constantin Ionuț done
(5, 3, 10), -- Algebră
(5, 8, 10), -- Sport
(5, 12, 8); -- Fizică
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Simion Mihai done
(6, 12, 8), -- Fizică
(6, 3, 8), -- Algebră
(6, 8, 3), -- Sport
(6, 8, 3), -- Sport
(6, 8, 1), -- Sport
(6, 8, 1); -- Sport
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Constantinescu Ana-Maria done
(7, 8, 5), -- Sport
(7, 12, 8), -- Fizică
(7, 3, 2), -- Algebră
(7, 3, 5); -- Algebră
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Amăriuței Eugen done
(8, 3, 9), -- Algebră
(8, 8, 10), -- Sport
(8, 13, 7); -- Franceză
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Știrbei Alexandru done
(9, 1, 9), -- Chimie
(9, 12, 2), -- Fizică
(9, 8, 1), -- Sport
(9, 12, 2), -- Fizica
(9, 12, 5), -- Fizica
(9, 8, 6); -- Sport
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Dumitru Angela done
(10, 7, 9), -- Desen
(10, 9, 7), -- Filozofie
(10, 11, 9); -- Engleză
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Dumitrache Ion done
(11, 7, 8), -- Desen
(11, 4, 2), -- Statistică
(11, 9, 7), -- Filozofie
(11, 4, 6); -- Statistica
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Șerban Maria-Magdalena done
(12, 11, 7), -- Engleză
(12, 9, 4), -- Filozofie
(12, 7, 8), -- Desen
(12, 9, 4), -- Filozofie
(12, 9, 4); -- Filozofie
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Chelaru Violeta done
(13, 13, 1), -- Franceză
(13, 7, 3), -- Desen
(13, 11, 10), -- Engleză
(13, 13, 6), -- Franceza
(13, 7, 1); -- Desen
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Sandu Daniel done
(14, 7, 3), -- Desen
(14, 9, 9), -- Filozofie
(14, 13, 4), -- Franceză
(14, 7, 8), -- Desen
(14, 13, 5); -- Franceză
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Marinache Alin done
(15, 7, 7), -- Desen
(15, 12, 8), -- Fizică
(15, 11, 5); -- Engleză
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Panait Vasile done
(16, 8, 5), -- Sport
(16, 7, 7), -- Desen
(16, 4, 10), -- Statistică
(16, 12, 8), -- Fizica
(16, 10, 6), -- Literatura
(16, 9, 9); -- Filozofie
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Popa Mirela done
(17, 11, 3), -- Engleză
(17, 9, 6), -- Filozofie
(17, 7, 6), -- Desen
(17, 11, 6); -- Engleza
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Dascălu Daniel Ștefan done
(18, 12, 4), -- Fizică
(18, 13, 9), -- Franceză
(18, 4, 10), -- Statistică
(18, 12, 2), -- Fizică
(18, 12, 1), -- Fizică
(18, 12, 3), -- Fizică
(18, 12, 5); -- Fizică
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Georgescu Marian done
(19, 13, 10), -- Franceză
(19, 11, 10), -- Engleză
(19, 12, 8); -- Fizică
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Dumitrașcu Marius done
(20, 8, 5), -- Sport
(20, 3, 6), -- Algebră
(20, 1, 2), -- Chimie
(20, 1, 2), -- Chimie
(20, 1, 5); -- Chimie
INSERT INTO Note (StudentId, MaterieId, NotaObtinuta) VALUES
-- Dinu Ionela done
(21, 6, 9), -- Muzică
(21, 10, 8), -- Literatură
(21, 8, 8); -- Sport

SELECT * FROM Orase;
SELECT * FROM Grupe;
SELECT * FROM Student;
SELECT * FROM Materie;
SELECT * FROM Note;