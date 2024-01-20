-- 21. Să se afișeze studenții repetenți (au picat cel puțin o materie ).



SELECT DISTINCT
  S.Id AS StudentId,
  S.Nume,
  S.Prenume,
  N.NotaObtinuta
FROM Student S
JOIN Note N ON S.Id = N.StudentId
WHERE N.NotaObtinuta < 5;
