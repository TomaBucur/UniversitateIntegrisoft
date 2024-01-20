-- 19. Să se afișeze studentul care a susținut cele mai multe examinări la aceeași materie.


SELECT TOP 1
    S.Id AS StudentId,
    S.Nume,
    S.Prenume,
    N.MaterieId,
    COUNT(*) AS NumarExaminari
FROM Note N
JOIN Student S ON N.StudentId = S.Id
GROUP BY S.Id, S.Nume, S.Prenume, N.MaterieId
ORDER BY NumarExaminari DESC;


