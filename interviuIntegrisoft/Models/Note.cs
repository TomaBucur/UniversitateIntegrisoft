namespace interviuIntegrisoft.Models
{
    public class Note
    {
        public int Id { get; set; }
        public int StudentId { get; set; }
        public int MaterieId { get; set; }
        public int NotaObtinuta { get; set; }

        public Student Student { get; set; }
        public Materie Materie { get; set; }
    }
}
