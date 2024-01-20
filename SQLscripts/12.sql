
-- 12. Să se afișeze numele grupei care are cei mai mulți studenți.


select top 1 G.Denumire, count(S.Id) as numarStudenti
from Student S
join Grupe G on S.GrupaId = G.Id
group by G.Denumire
order by numarStudenti desc