using interviuIntegrisoft.Models;
using Microsoft.EntityFrameworkCore;

namespace interviuIntegrisoft.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
            
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {            
            modelBuilder.Entity<Student>()
                .HasOne(s => s.Grupa)
                .WithMany(g => g.Students)
                .HasForeignKey(s => s.GrupaId);

            modelBuilder.Entity<Student>()
                .HasOne(s => s.OrasResedinta)
                .WithMany()
                .HasForeignKey(s => s.OrasResedintaId);

            modelBuilder.Entity<Note>()
                .HasOne(n => n.Student)
                .WithMany(s => s.Notes)
                .HasForeignKey(n => n.StudentId);

            modelBuilder.Entity<Note>()
                .HasOne(n => n.Materie)
                .WithMany()
                .HasForeignKey(n => n.MaterieId);           
        }

        public DbSet<Student> Student { get; set; }
        public DbSet<Oras> Orase { get; set; }
        public DbSet<Grupa> Grupe { get; set; }
        public DbSet<Materie> Materie { get; set; }
        public DbSet<Note> Note { get; set; }
    

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);
            optionsBuilder.UseSqlServer("Server=.\\SQLExpress;Database=Universitate;Trusted_connection=true;TrustServerCertificate=true");
        }
        
    }
}
