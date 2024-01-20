

-- 13. Să se afișeze materiile la care nu s-a dat niciodată examen.

select M.Nume, count(N.Id) as numarNote 
from Materie M
left join Note N on N.MaterieId = M.Id
group by M.Nume
having count(N.Id) = 0