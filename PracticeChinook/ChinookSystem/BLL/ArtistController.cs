using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using ChinookSystem.Data.Entities;  // Entity classes
using ChinookSystem.DAL;            // Context class
using System.ComponentModel;        // ODS
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class ArtistController
    {
        // Dump the entire artist table
        // This will use EntityFramework access
        // Entity classes will be used to define the data

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Artist> Artist_ListAll()
        {
            // Setup the transaction area
            using (var context = new ChinookContext())
            {
                return context.Artists.ToList();
            }
        }
    }
}
