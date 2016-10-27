using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using Microsoft.AspNet.Identity.EntityFramework;    // UserStore, ApplicationDbContext
using Microsoft.AspNet.Identity;                    // UserManager
using System.ComponentModel;
using ChinookSystem.DAL;
using ChinookSystem.Data.Entities;
#endregion

namespace ChinookSystem.Security
{
    [DataObject]
    public class UserManager : UserManager<ApplicationUser>
    {
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }

        #region Constants
        // The basic minimum information needed for an ASP.NET user is: username, password, and an email
        private const string STR_WEBMASTER_USERNAME = "WebMaster";
        private const string STR_DEFAULT_PASSWORD = "Pa$$word1";
        // The "{0}" will be replaced with the respective username
        private const string STR_EMAIL_FORMAT = "{0}@Chinook.ca";
        // The generic username will be made up of entity's firstname and lastname
        private const string STR_USERNAME_FORMAT = "{0}.{1}";
        #endregion

        // Code to add a generic webmaster for the application
        public void AddWebMaster()
        {
            if (!Users.Any(u => u.UserName.Equals(STR_WEBMASTER_USERNAME)))
            {
                var webmasterAccount = new ApplicationUser()
                {
                    UserName = STR_WEBMASTER_USERNAME,
                    Email = string.Format(STR_EMAIL_FORMAT, STR_WEBMASTER_USERNAME)
                };
                // Adds to the User table
                this.Create(webmasterAccount, STR_DEFAULT_PASSWORD);

                // Add to appropriate role
                this.AddToRole(webmasterAccount.Id, SecurityRoles.WebsiteAdmins);
            }
        } //eom

        // Read
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<UnregisteredUserProfile> ListAllUnregisteredUsers()
        {
            using (var context = new ChinookContext())
            {
                // Get the list of registered employees, this will come from the AspNetUser table <ApplicationUser>, where the int? Employee attribute has a value
                // Using .ToList() will place the results of your Linq query nto memory
                var RegisteredEmployees = (from emp in Users
                                          where emp.EmployeeId.HasValue
                                          select emp.EmployeeId).ToList();

                // Compare the registered employee list to the user table Employees, extra the Employees that are not registered
                var UnregisteredEmployees = (from emp in context.Employees
                                            where !RegisteredEmployees.Any(eid => emp.EmployeeId == eid)
                                            select new UnregisteredUserProfile()
                                            {
                                                id = emp.EmployeeId,
                                                FirstName = emp.FirstName,
                                                LastName = emp.LastName,
                                                UserType = UnregisteredUserType.Employee
                                            }).ToList();

                // Get the list of registered customers, this will come from the AspNetUser table <ApplicationUser>, where the int? Customer attribute has a value
                var RegisteredCustomers = (from cus in Users
                                          where cus.EmployeeId.HasValue
                                          select cus.EmployeeId).ToList();

                // Compare the registered employee list to the user table Employees, extra the Employees that are not registered
                var UnregisteredCustomers = (from cus in context.Customers
                                            where !RegisteredCustomers.Any(cid => cus.CustomerId == cid)
                                            select new UnregisteredUserProfile()
                                            {
                                                id = cus.CustomerId,
                                                FirstName = cus.FirstName,
                                                LastName = cus.LastName,
                                                UserType = UnregisteredUserType.Customer
                                            }).ToList();

                // Make one dataset out of the two unregistered user types
                return UnregisteredEmployees.Union(UnregisteredCustomers).ToList();
            }
        } //eom

        public void RegisterUser(UnregisteredUserProfile userInfo)
        {
            // One could randomly generate a password

            // Create a new AspNetUser instance based on ApplicationUser
            var newUserAccount = new ApplicationUser()
            {
                UserName = userInfo.AssignedUserName,
                Email = userInfo.AssignedEmail
            };

            // Determine and assign the user id based on type
            switch (userInfo.UserType)
            {
                case UnregisteredUserType.Customer:
                    newUserAccount.CustomerId = userInfo.id;
                    break;
                case UnregisteredUserType.Employee:
                    newUserAccount.EmployeeId = userInfo.id;
                    break;
            }

            // Create the user account
            this.Create(newUserAccount, STR_DEFAULT_PASSWORD);

            // Assign the user to a role of RegisteredUser or Staff
            switch (userInfo.UserType)
            {
                case UnregisteredUserType.Customer:
                    this.AddToRole(newUserAccount.Id, SecurityRoles.RegisteredUsers);
                    break;
                case UnregisteredUserType.Employee:
                    this.AddToRole(newUserAccount.Id, SecurityRoles.Staff);
                    break;
            }

        } //eom

        //Create the UserProfile needed for the security form tab user CRUD
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<UserProfile> ListAllUsers()
        {
            var rm = new RoleManager();
            var results = from person in Users.ToList()
                          select new UserProfile()
                          {
                              UserId = person.Id,                                                       // Security table
                              UserName = person.UserName,                                               // Security table
                              Email = person.Email,                                                     // Security table
                              EmailConfirmed = person.EmailConfirmed,                                   // Security table
                              CustomerId = person.CustomerId,                                           // Applicaton User, security table
                              EmployeeId = person.EmployeeId,                                           // Applicaton User, security table
                              RoleMemberships = person.Roles.Select(r => rm.FindById(r.RoleId).Name)    //Security table
                          };
            // Obtain the first and last name of the users
            using (var context = new ChinookContext())
            {
                Employee eTemp;
                Employee cTemp;
                foreach (var person in results)
                {
                    if (person.EmployeeId.HasValue)
                    {
                        eTemp = context.Employees.Find(person.EmployeeId);
                        person.FirstName = eTemp.FirstName;
                        person.LastName = eTemp.LastName;
                    }
                    else if (person.CustomerId.HasValue)
                    {
                        cTemp = context.Employees.Find(person.EmployeeId);
                        person.FirstName = cTemp.FirstName;
                        person.LastName = cTemp.LastName;
                    }
                    else
                    {
                        //person.FirstName = new
                    }
                }

                return results.ToList();
            }
        } //eom

        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public void AddUser(UserProfile userInfo)
        {
            // Create an instance representing the new user
            var UserAcccout = new ApplicationUser();

        }
    } //eoc
} //eon
