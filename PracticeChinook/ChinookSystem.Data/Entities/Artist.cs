using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
#endregion

namespace ChinookSystem.Data.Entities
{
    // [Table("sqltablename")]
    [Table("Artists")]
    public class Artist
    {
        // PKey annotation is optional
        // Default assumes identity SQL table
        // Default assumes property name ends with ID or Id and SQL PKey ends the same
        // Otherwise [Key] is needed
        // Non-identity PKeys, compound PKeys, PKeys not ending in ID or Id

        // Class properties map to SQL table attributes
        // Properties should be named the same as table attributes
        // Properties should be in the same order as table attributes for ease of maintenance
        [Key]
        public int ArtistId { get; set; }
        public string Name { get; set; }

        // Navigation properties for use by Linq
        // Use the DB ERD to determine the relationships
        // These properties will be of type virtual
        // There are two types of navigation properties
        // Properties that point to "children" (many) use ICollection<T> as the datatype
        // Properties that point to "parent" (one) use ParentClassName as the datatype

        public virtual ICollection<Album> Albums { get; set; }
    }
}
