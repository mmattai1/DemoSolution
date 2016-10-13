using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Microsoft.AspNet.Identity.EntityFramework;    // UserStore, ApplicationDbContext
using Microsoft.AspNet.Identity;                    // UserManager
#endregion

namespace ChinookSystem.Security
{
    public class RoleManager : RoleManager<IdentityRole>
    {
        public RoleManager() : base(new RoleStore<IdentityRole>(new ApplicationDbContext()))
        {

        }

        public void AddChinookRoles()
        {
            foreach(string roleName in SecurityRoles.ChinookSecurityRoles)
            {
                // Check the security tables of the Chinook security system to see if any new role needs to be added to the security table data
                // The first time your application runs, all the roles will be added to the security table data
                // All other times your application runs (start), only new roles in the ChinnoSecurityRoles will be added to the security table data
                if (!Roles.Any(r => r.Name.Equals(roleName)))
                {
                    this.Create(new IdentityRole(roleName));
                }
            }
        }
    }
}
