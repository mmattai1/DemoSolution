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
    public class EmployeeController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<EmployeeNames> EmployeeNames_Get()
        {
            // Setup the transaction area
            using (var context = new ChinookContext())
            {
                var results = from x in context.Employees
                              orderby x.LastName, x.FirstName
                              select new EmployeeNames
                              {
                                  EmployeeId = x.EmployeeId,
                                  Name = x.LastName + ", " + x.FirstName
                              };
                // The .ToList will actually cause the query to execute
                return results.ToList();
            }
        }
    }
}
