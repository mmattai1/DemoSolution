using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additonal Namespaces
using System.ComponentModel; //ODS
using ChinookSystem.Data.Entities;
using ChinookSystem.Data.POCOs;
using ChinookSystem.DAL;
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class TrackController
    {
        // Select that will return the entire collection of records for the Entity, all attributes
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Track> ListTracks()
        {
            using (var context = new ChinookContext())
            {
                return context.Tracks.ToList();
            }
        }

        // Add which will insert a new instance into the table collection
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddTrack(Track trackInfo)
        {
            using (var context = new ChinookContext())
            {
                // Review the iif
                trackInfo.Composer = string.IsNullOrEmpty(trackInfo.Composer) ? null : trackInfo.Composer;

                // Add
                context.Tracks.Add(trackInfo);

                // Save the changes
                context.SaveChanges();
            }
        }

        // Update which will update an existing instance in the table collection
        [DataObjectMethod(DataObjectMethodType.Update, true)]
        public void UpdateTrack(Track trackInfo)
        {
            using (var context = new ChinookContext())
            {
                // Review the iif
                trackInfo.Composer = string.IsNullOrEmpty(trackInfo.Composer) ? null : trackInfo.Composer;

                // Update
                context.Entry(trackInfo).State = System.Data.Entity.EntityState.Modified;

                // Save the changes
                context.SaveChanges();
            }
        }

        // Delete which will remove an existing instance from the table collection
        [DataObjectMethod(DataObjectMethodType.Update, true)]
        public void DeleteTrack(Track trackInfo)
        {
            using (var context = new ChinookContext())
            {
                // Delete
                DeleteTrack(trackInfo);
            }
        }

        public void DeleteTrack(int trackID)
        {
            using (var context = new ChinookContext())
            {
                // Find the existing instance from the table
                var existing = context.Tracks.Find(trackID);

                // Remove the instance
                context.Tracks.Remove(existing);

                // Save the changes
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<ForeignKeyList> TrackList()
        {
            using (var context = new ChinookContext())
            {
                var results = from x in context.Tracks
                              orderby x.Name
                              select new ForeignKeyList()
                              {
                                  PFKeyIdentifier = x.TrackId,
                                  DisplayText = x.Name
                              };
                return results.ToList();
            }
        }
    }
}
