DECLARE @CelMaiSlabStudent TABLE (
    StudentId INT,
    NumeElev NVARCHAR(MAX),
    MedieGenerala FLOAT
);

INSERT INTO @CelMaiSlabStudent

    select
      top 1 
      S.Id as StudentId,
      concat(S.Nume, ' ', S.Prenume) as NumeElev,
      Round(AVG(convert(float, N.NotaObtinuta)), 1) as MedieGenerala
    from Student S
      LEFT JOIN (
        SELECT
          N.StudentId,
          N.MaterieId,
          MAX(N.Id) as UltimaNotaId
        from Note N
        group by
          N.StudentId,
          N.MaterieId
      ) UN on UN.StudentId = S.Id
      left join Note N on UN.UltimaNotaId = N.Id
    group by
      S.Id,
      concat(S.Nume, ' ', S.Prenume)
    order by MedieGenerala asc
  
DELETE N
FROM Note N
INNER JOIN @CelMaiSlabStudent CMS ON N.StudentId = CMS.StudentId;

DELETE S
FROM Student S
INNER JOIN @CelMaiSlabStudent CMS ON S.Id = CMS.StudentId;