using interviuIntegrisoft.Models;
using interviuIntegrisoft.Models.DTOs;

namespace interviuIntegrisoft.Services.StudentService
{
    public interface IStudentService
    {
        Task<StudentSiNotaDTO> GetStudentMateriiNote(int studentId);
        Task<double> GetMedieStudent(int studentId);

    }
}
