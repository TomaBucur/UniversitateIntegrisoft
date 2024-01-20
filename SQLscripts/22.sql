-- 22. Să se mute toți repetenții într-o grupă nouă, grupa E. ( vezi pct. anterior)


INSERT INTO Grupe (Denumire) VALUES ('E');

-- Actualizează studenții cu note sub 5 și asociază-i la grupa 'E'
UPDATE Student
SET GrupaId = (
    SELECT Id
    FROM Grupe
    WHERE Denumire = 'E'
)
WHERE Id IN (
    SELECT DISTINCT S.Id
    FROM Student S
    JOIN Note N ON S.Id = N.StudentId
    WHERE N.NotaObtinuta < 5
);

