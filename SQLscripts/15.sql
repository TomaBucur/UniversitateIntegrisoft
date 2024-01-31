--Notele se introduc în ordinea din listă, 
--	ultima înregistrare reprezentând situația curentă la materia respectivă.
-- 15. Să se calculeze media generală a fiecărui student ( vezi ** ).
select
	S.Id,
	concat(S.Nume, ' ', S.Prenume) as NumeElev,
	Round(AVG(convert(float, N.NotaObtinuta)),1) as MedieGenerala
from Student S
LEFT JOIN (
	SELECT
		N.StudentId,
		N.MaterieId,
		MAX(N.Id) as UltimaNotaId
	from Note N
	group by N.StudentId, N.MaterieId
) UN on UN.StudentId = S.Id
left join Note N on UN.UltimaNotaId = N.Id
group by S.Id, concat(S.Nume, ' ', S.Prenume) 
order by S.Id



