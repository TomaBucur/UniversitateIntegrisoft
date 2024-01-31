WITH UltimaNota AS (
    SELECT
      N.StudentId,
      COALESCE(MAX(N.Id), 0) AS UltimaNotaId
    FROM Note N
    GROUP BY N.StudentId
  )
SELECT
  TOP 1 G.Denumire AS Grupa,
  COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) AS MediaGeneralaGrupa
FROM Grupe G
  LEFT JOIN Student S ON G.Id = S.GrupaId
  LEFT JOIN UltimaNota UN ON S.Id = UN.StudentId
  LEFT JOIN Note N ON UN.UltimaNotaId = N.Id
GROUP BY G.Denumire
ORDER BY MediaGeneralaGrupa DESC;