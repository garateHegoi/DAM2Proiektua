using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ChessGame.Models;
using Microsoft.Data.SqlClient;
using System.Data.Common;

namespace ChessGame.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }
        public DbSet<ChessGame.Models.game>? game { get; set; }

    }
}