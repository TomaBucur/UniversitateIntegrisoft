-- 24. Să se afișeze toți studenții care fac parte din aceeași familie ( au același nume de familie ), după modelul:
/*
	Nume		Prenume
	Ionescu		Andrei
	Ionescu		Andreea

	Rezultat afișat:

	Familia		Frații
	Ionescu		Andrei, Andreea
*/


SELECT
    Nume AS Familia,
    STRING_AGG(Prenume, ', ') AS Fratii
FROM Student
GROUP BY Nume
HAVING COUNT(*) > 1;

