using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

#region Additional Namespaces
using ChinookSystem.Security;
#endregion

public partial class Admin_Security_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RefreshAll(object sender, EventArgs e)
    {
        DataBind();
    }

    protected void UnregisterdUserGridView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        // Position the GridView too the row that was selected
        UnregisteredUsersGridView.SelectedIndex = e.NewSelectedIndex;

        // Create shortcut variable that physically points to the selected row
        GridViewRow agvrow = UnregisteredUsersGridView.SelectedRow;

        // Do we have a row
        if (agvrow != null)
        {
            // Access the TextBox fields and retrieve their contents
            // Use the method .FindControl("control_name") as control_type
            // This will point to the control, then you can access the control using the control's access method
            string userName = (agvrow.FindControl("AssignedUserName") as TextBox).Text;
            string email = (agvrow.FindControl("AssignedEmail") as TextBox).Text;

            // Load these 2 fields and the rest of the GridView row data into an UnregisteredUserProfile instance

            // Create and fill a new instance of an object
            UnregisteredUserProfile user = new UnregisteredUserProfile()
            {
                id = int.Parse(UnregisteredUsersGridView.SelectedDataKey.Value.ToString()),                         // originally an object
                UserType = (UnregisteredUserType)Enum.Parse(typeof(UnregisteredUserType), agvrow.Cells[1].Text),    // .Cells[index] points to a display only column
                FirstName = agvrow.Cells[2].Text,
                LastName = agvrow.Cells[3].Text,
                AssignedUserName = userName,
                AssignedEmail = email
            };

            // register the user
            UserManager sysmgr = new UserManager();
            sysmgr.RegisterUser(user); ;
            DataBind();
        }
    }
}
