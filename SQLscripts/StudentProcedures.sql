-- Procedura pentru stergere Student si Note cu Id-ul introdus
-- Creeaza procedura stocata cu parametru
CREATE PROCEDURE StergeStudentCuNote
    @StudentId INT
AS
BEGIN
    DELETE FROM Note WHERE StudentId = @StudentId;

    DELETE FROM Student WHERE Id = @StudentId;
END;
GO

-- Executa procedura si se primeste id-ul studentului
    -- DECLARE @IdStudent INT;
-- Exemplu de utilizare a procedurii stocate:
        -- SET @IdStudent = 1;
        -- EXEC StergeStudentCuNote @StudentId = @IdStudent;

