-- 20. Să se afișeze studenții și numărul de examinări la fiecare materie în parte.



SELECT
  S.Id AS StudentId,
  S.Nume,
  S.Prenume,
  M.Nume AS Materie,
  COUNT(N.Id) AS NumarExaminari
FROM Student S
JOIN Note N ON S.Id = N.StudentId
JOIN Materie M ON N.MaterieId = M.Id
GROUP BY S.Id, S.Nume, S.Prenume, M.Nume
ORDER BY S.Id, M.Nume;
