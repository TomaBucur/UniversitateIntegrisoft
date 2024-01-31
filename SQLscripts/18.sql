-- 18. Să se afișeze studenții care nu au promovat materia "Chimie" de la prima examinare, dar au promovat ulterior.

SELECT Distinct
  S.Id AS StudentId,
  S.Nume,
  S.Prenume,
  N1.NotaObtinuta AS NotaPrimaExaminare,
  N2.NotaObtinuta AS NotaExaminareUlterioara
FROM Student S
JOIN Note N1 ON S.Id = N1.StudentId AND N1.MaterieId = (SELECT Id FROM Materie WHERE Nume = 'Chimie')
JOIN Note N2 ON S.Id = N2.StudentId AND N2.MaterieId = (SELECT Id FROM Materie WHERE Nume = 'Chimie') AND N2.NotaObtinuta >= 5
WHERE N1.NotaObtinuta < 5
ORDER BY S.Id;
