SELECT TOP 1
  G.Denumire AS Grupa,
  COALESCE(AVG(CONVERT(FLOAT, N.NotaObtinuta)), 0) AS MediaGeneralaGrupa
FROM Grupe G
LEFT JOIN Student S ON G.Id = S.GrupaId
OUTER APPLY (
  SELECT TOP 1
    COALESCE(MAX(N.Id), 0) AS UltimaNotaId
  FROM Note N
  WHERE N.StudentId = S.Id
  Group by N.Id
  ORDER BY N.Id DESC
) UN
LEFT JOIN Note N ON UN.UltimaNotaId = N.Id
GROUP BY G.Denumire
ORDER BY MediaGeneralaGrupa DESC;