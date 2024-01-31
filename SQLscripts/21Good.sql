WITH UltimeleNote AS (
  SELECT
    N.StudentId,
    N.MaterieId,
    N.Id AS UltimaNotaId,
    ROW_NUMBER() OVER (PARTITION BY N.StudentId, N.MaterieId ORDER BY N.Id DESC) AS Rn
  FROM Note N
)

SELECT
  concat(S.Nume, ' ',S.Prenume),
  UN.MaterieId,
  N.NotaObtinuta,
  MAX(UltimaNotaId) AS UltimaNotaId
FROM UltimeleNote UN
join Note N on N.Id = UN.UltimaNotaId
join Student S on S.Id = N.StudentId
GROUP BY concat(S.Nume, ' ',S.Prenume), UN.StudentId, UN.MaterieId, N.NotaObtinuta
HAVING MAX(Rn) = COUNT(*) and N.NotaObtinuta < 5
ORDER BY concat(S.Nume, ' ',S.Prenume);
