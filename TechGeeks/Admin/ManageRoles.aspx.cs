using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechGeeks.Admin
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayRolesInGrid();
        }
        private void DisplayRolesInGrid()
        {
            //RoleList.DataSource = Roles.GetAllRoles();
            //RoleList.DataBind();
        }
    }
}