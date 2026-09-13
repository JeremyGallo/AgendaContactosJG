using AgendaContactosJG.Models;
using Microsoft.EntityFrameworkCore;

namespace AgendaContactosJG.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public DbSet<Contacto> Contactos { get; set; }
}