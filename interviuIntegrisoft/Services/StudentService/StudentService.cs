using interviuIntegrisoft.Data;
using interviuIntegrisoft.Models;
using interviuIntegrisoft.Models.DTOs;
using Microsoft.EntityFrameworkCore;

namespace interviuIntegrisoft.Services.StudentService
{
    public class StudentService : IStudentService
    {

        private readonly DataContext _context;

        public StudentService(DataContext context)
        {
            _context = context;
        }

        public async Task<double> GetMedieStudent(int studentId)
        {
             var studentAndNotes = await _context.Student
                .Include(s => s.Notes)
                .ThenInclude(n => n.Materie)
                .Where(s => s.Id == studentId)
                .Select(s => new
                {
                    Student = new
                    {
                        Id = s.Id,
                        Nume = s.Nume,
                        Prenume = s.Prenume
                    },
                    MateriiSiNote = s.Notes.Select(n => new
                    {
                        Materie = n.Materie.Nume,
                        NotaObtinuta = n.NotaObtinuta
                    })
                })
                .FirstOrDefaultAsync();

            if (studentAndNotes == null)
            {
                throw new InvalidOperationException("Student not found");
            }

            var overallAverage = studentAndNotes.MateriiSiNote
                .GroupBy(mn => mn.Materie)
                .Select(group => group.OrderByDescending(mn => mn.NotaObtinuta).First().NotaObtinuta)
                .Average();

            return overallAverage;
        }


        public async Task<StudentSiNotaDTO> GetStudentMateriiNote(int studentId)
        {
            var studentSiNote = await _context.Student
                .Include(s => s.Notes)
                .ThenInclude(n => n.Materie)
                .Where(s => s.Id == studentId)
                .Select(s => new StudentSiNotaDTO
                {
                    Student = new StudentDTO
                    {
                        Id = s.Id,
                        Nume = s.Nume,
                        Prenume = s.Prenume
                    },
                    MateriiSiNote = s.Notes.Select(n => new MaterieSiNotaDTO
                    {
                        Materie = n.Materie.Nume,
                        NotaObtinuta = n.NotaObtinuta
                    }).ToList()
                })
                .FirstOrDefaultAsync();
            return studentSiNote;
        }
    }
}
