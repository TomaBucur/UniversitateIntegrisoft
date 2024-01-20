namespace interviuIntegrisoft.Models
{
    public class Grupa
    {
        public int Id { get; set; }
        public string Denumire { get; set; }

        public ICollection<Student> Students { get; set; }
    }
}
