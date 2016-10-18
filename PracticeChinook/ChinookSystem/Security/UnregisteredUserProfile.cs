using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChinookSystem.Security
{
    public enum UnregisteredUserType { Undefined, Employee, Customer};

    public class UnregisteredUserProfile
    {
        public int id { get; set; }
        public UnregisteredUserType UserType { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string AssignedUserName { get; set; }
        public string AssignedEmail { get; set; }
    }
}
