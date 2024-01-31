WITH UltimaNota AS (
  SELECT
    N.StudentId,
    N.MaterieId,
    N.Id AS UltimaNotaId,
    ROW_NUMBER() OVER (PARTITION BY N.StudentId, N.MaterieId ORDER BY N.Id DESC) AS Rn
  FROM Note N
)

SELECT
  S.Id,
  S.Nume,
  S.Prenume,
  COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) AS MediaGenerala
FROM Student S
LEFT JOIN UltimaNota UN ON S.Id = UN.StudentId AND UN.Rn = 1
LEFT JOIN Note N ON UN.UltimaNotaId = N.Id
LEFT JOIN Materie M ON N.MaterieId = M.Id
GROUP BY S.Id, S.Nume, S.Prenume
HAVING COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) >= 8.50
ORDER BY S.Id;
