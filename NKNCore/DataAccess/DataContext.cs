using Microsoft.EntityFrameworkCore;
using NKNCore.Modals;

namespace NKNCore.DataAccess
{
    public class DataContext : DbContext
    {
        public DataContext (DbContextOptions<DataContext> options) : base(options) { }
         
        public DbSet<User> Users { get; set; }

        public DbSet<Member> members { get; set; }  

    }
}
