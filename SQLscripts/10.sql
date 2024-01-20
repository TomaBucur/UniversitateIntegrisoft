-- 10. Să se afișeze orașele care nu au nici un student încris.

select 
	O.Id as OrasId, 
	O.Denumire as NumeOras
from Orase O
left join Student S on O.Id = S.OrasResedintaId
where S.Id is null;
