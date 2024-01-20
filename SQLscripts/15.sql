--Notele se introduc în ordinea din listă, 
--	ultima înregistrare reprezentând situația curentă la materia respectivă.
-- 15. Să se calculeze media generală a fiecărui student ( vezi ** ).
SELECT
  S.Id,
  S.Nume,
  S.Prenume,
  COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) AS MediaGenerala
FROM Student S
LEFT JOIN (
  SELECT
    N.StudentId,
    N.MaterieId,
    MAX(N.Id) AS UltimaNotaId
  FROM Note N
  GROUP BY N.StudentId, N.MaterieId
) UN ON S.Id = UN.StudentId
LEFT JOIN Note N ON UN.UltimaNotaId = N.Id
LEFT JOIN Materie M ON N.MaterieId = M.Id
GROUP BY S.Id, S.Nume, S.Prenume
ORDER BY S.Id;


