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
    public class PlaylistTrack
    {
        public int PlaylistTrackId { get; set; }
        public int TrackId { get; set; }
        public int? CustomerId { get; set; }
    }
}
