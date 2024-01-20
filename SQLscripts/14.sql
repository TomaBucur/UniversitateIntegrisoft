-- 14. Să se afișeze studenții care au urmat și cursuri opționale 
	--( au notă la mai mult de 3 materii ).

select S.Nume, S.Prenume, count(N.Id) as NumarMaterii from Student S
join Note N on N.StudentId = S.Id
Group by S.Nume, S.Prenume
having count(N.Id) > 3


