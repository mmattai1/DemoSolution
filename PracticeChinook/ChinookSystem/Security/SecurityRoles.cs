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
    public static class SecurityRoles
    {
        public const string WebsiteAdmins = "WebsiteAdmins";
        public const string RegisteredUsers = "RegisteredUsers";
        public const string Staff = "Staff";
        public const string Auditor = "Auditor";

        // Property that is read-only which will return all of the roles in the application
        internal static List<string> ChinookSecurityRoles
        {
            get
            {
                List<string> roleList = new List<string>();
                // Add all of the system roles to the list of roles
                roleList.Add(WebsiteAdmins);
                roleList.Add(RegisteredUsers);
                roleList.Add(Staff);
                roleList.Add(Auditor);
                return roleList;
            }
        }
    }
}
