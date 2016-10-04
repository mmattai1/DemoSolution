using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using ChinookSystem.Data.Entities;  // Entity classes
using ChinookSystem.Data.POCOs;     // POCOs classes
using ChinookSystem.DAL;            // Context class
using System.ComponentModel;        // ODS
#endregion

namespace ChinookSystem.BLL
{
    [DataObject]
    public class CustomerController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<RepresentativeCustomers> RepresentativeCustomers_Get(int employeeID)
        {
            using (var context = new ChinookContext())
            {
                var results = from c in context.Customers
                              where c.SupportRepId == employeeID
                              orderby c.LastName, c.LastName
                              select new RepresentativeCustomers
                              {
                                  Name = c.LastName + ", " + c.FirstName,
                                  City = c.City,
                                  State = c.State,
                                  Phone = c.Phone,
                                  Email = c.Email
                              };
                return results.ToList();
            }
        }
    }
}
