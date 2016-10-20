using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Microsoft.AspNet.Identity.EntityFramework;    // UserStore, ApplicationDbContext
using Microsoft.AspNet.Identity;                    // UserManager
using System.ComponentModel;
#endregion

namespace ChinookSystem.Security
{
    [DataObject]
    public class RoleManager : RoleManager<IdentityRole>
    {
        public RoleManager() : base(new RoleStore<IdentityRole>(new ApplicationDbContext()))
        {

        } //eom

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
        } //eom

        // Read
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<RoleProfile> ListAllRoles()
        {
            var usermgr = new UserManager();

            // At points one requires data to be in memory for use by other queries
            // Here the data from the property in RoleManager needs to be brought into memory for use by my Linq query
            var results = from role in Roles.ToList()
                          select new RoleProfile()
                          {
                              RoleId = role.Id,
                              RoleName = role.Name,
                              UserNames = role.Users.Select(r => usermgr.FindById(r.UserId).UserName)
                          };

            return results.ToList();
        } //eom

        // Insert
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddRole(RoleProfile role)
        {
            // Business logic validation
            // New role names cannot already exist
            if (!this.RoleExists(role.RoleName))
            {
                this.Create(new IdentityRole(role.RoleName));
            }
        } //eom

        // Delete
        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public void RemoveRole(RoleProfile role)
        {
            this.Delete(this.FindById(role.RoleId));
        } //eom
    } //eoc
} //eon
