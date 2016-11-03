using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_EntityMaintenance_TrackCRUD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // This method is the method to direct the handling of ODS exceptions

    // Ensure you have added the assemblies reference Syste.Data.Entity to your Website project
    // To install on an ODS
    // Switch the web page view to Design
    // Select the required ODS (TrackListODS) and open properties
    // Select the event icon
    // Select OnInserted, OnUpdated, OnDeleted, and select method from list
    protected void CheckForException(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MessageUserControl.HandleDataBoundException(e);
    }
}
