-- 23. Cel mai slab student este exmatriculat. Să se șteargă studentul din baza de date.




-- Șterge notele asociate studentului
DELETE FROM Note
WHERE StudentId = (
    SELECT TOP 1 S.Id
    FROM Student S
    LEFT JOIN Note N ON S.Id = N.StudentId
    GROUP BY S.Id
    ORDER BY COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) ASC
);

-- Șterge studentul
DELETE FROM Student
WHERE Id = (
    SELECT TOP 1 S.Id
    FROM Student S
    LEFT JOIN Note N ON S.Id = N.StudentId
    GROUP BY S.Id
    ORDER BY COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) ASC
);