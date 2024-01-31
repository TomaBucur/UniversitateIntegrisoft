using interviuIntegrisoft.Models;
using interviuIntegrisoft.Services.StudentService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;

namespace interviuIntegrisoft.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        public IStudentService StudentService { get; }

        public StudentController(IStudentService studentService)
        {
            StudentService = studentService;
        }

        [Authorize]
        [HttpGet("GetStudentMateriiNote/{id}")]
        public async Task<ActionResult> GetStudentAndNotes(int id)
        {
            try
            {
                var studentAndNotes = await StudentService.GetStudentMateriiNote(id);

                if (studentAndNotes is null)
                    return NotFound("Studentul nu a fost gasit");

                return Ok(studentAndNotes);
            }
            catch (Exception ex)
            {
                return BadRequest($"An error occurred: {ex.Message}");
            }
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("GetMedieStudent/{id}")]
        public async Task<ActionResult<double>> GetMedieStudent(int id)
        {
            try
            {
                var overallAverage = await StudentService.GetMedieStudent(id);
                return Ok(overallAverage);
            }
            catch (Exception ex)
            {
                return BadRequest($"An error occurred: {ex.Message}");
            }
        }
    }
}
