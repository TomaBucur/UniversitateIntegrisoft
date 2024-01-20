using System.Text.RegularExpressions;

namespace interviuIntegrisoft.Models
{
    public class Student
    {
        public int Id { get; set; }
        public int GrupaId { get; set; }
        public int OrasResedintaId { get; set; }
        public string Nume { get; set; }
        public string Prenume { get; set; }

        public Grupa Grupa { get; set; }
        public Oras OrasResedinta { get; set; }

        public ICollection<Note> Notes { get; set; }
    }
}
