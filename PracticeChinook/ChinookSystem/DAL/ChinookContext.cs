using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.Data.Entity;
using ChinookSystem.Data.Entities;
#endregion

namespace ChinookSystem.DAL
{
    // Internal for security reasons
    // Access restricted to within the component library
    // Inherit DbContext for EntityFramework (System.Data.Entity)
    internal class ChinookContext : DbContext
    {
        // Pass the connection string to the DbContext using the :base() initializer
        public ChinookContext() : base("ChinookDB")
        {

        }

        // Setup DbSet properties
        public DbSet<Artist> Artists { get; set; }
        public DbSet<Album> Albums { get; set; }
        public DbSet<Track> Tracks { get; set; }
        public DbSet<MediaType> MediaTypes { get; set; }
    }
}
