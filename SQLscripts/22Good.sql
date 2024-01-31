WITH UltimaNota AS (
  SELECT
    StudentId,
    MaterieId,
    NotaObtinuta,
    ROW_NUMBER() OVER (PARTITION BY StudentId, MaterieId ORDER BY Id DESC) AS RowNum
  FROM Note
)
INSERT INTO Grupe (Denumire) VALUES ('E');

UPDATE Student
SET GrupaId = (
    SELECT Id
    FROM Grupe
    WHERE Denumire = 'E'
)

WHERE Id IN (
    SELECT DISTINCT
      S.Id AS StudentId,
      CONCAT(S.Nume, ' ', S.Prenume) as NumeElev,
      M.Nume,
      UN.NotaObtinuta
    FROM Student S
    LEFT JOIN UltimaNota UN ON S.Id = UN.StudentId AND UN.RowNum = 1
    JOIN Materie M on M.Id = UN.MaterieId
    WHERE UN.NotaObtinuta < 5
);

