SELECT
  N.StudentId,
  N.MaterieId,
  N.NotaObtinuta,
  ROW_NUMBER() OVER (PARTITION BY N.StudentId, N.MaterieId ORDER BY N.Id DESC) as RowNum
INTO #TempRanked
FROM
  Note N;

-- Aplică media generală pentru fiecare student folosind datele din tabelul temporar
SELECT
  S.Id,
  CONCAT(S.Nume, ' ', S.Prenume) AS NumeElev,
  ROUND(AVG(CONVERT(float, T.NotaObtinuta)), 1) AS MedieGenerala
FROM
  Student S
LEFT JOIN #TempRanked T ON T.StudentId = S.Id AND T.RowNum = 1
GROUP BY
  S.Id,
  CONCAT(S.Nume, ' ', S.Prenume)
ORDER BY
  S.Id;

-- Șterge tabelul temporar
DROP TABLE #TempRanked;
