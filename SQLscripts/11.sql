
-- 11. Să se afișeze grupele care au cel puțin 5 studenți

Select G.Denumire, Count(S.Id) as NumarStudenti from Grupe G
join Student S on S.GrupaId = G.Id
Group By G.Denumire
Having Count(S.Id) >= 5
