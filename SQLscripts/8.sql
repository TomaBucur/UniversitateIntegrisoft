-- 8. Să se afișeze studenții cu 2 prenume (prenumele conține caracterul blanc sau - ( liniuță) ).


select * from Student
where Prenume LIKE '%-%' OR Prenume LIKE '% %'
