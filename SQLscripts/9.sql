
-- 9. Să se afișeze studenții din provincie.
Select * from Student 
join Orase on Student.OrasResedintaId = Orase.Id
where Orase.Denumire != 'Bucuresti';