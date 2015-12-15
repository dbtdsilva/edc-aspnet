using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechGeeks.Models;

namespace TechGeeks.Admin
{

    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("DropDownList1");

                    Models.ApplicationDbContext context = new ApplicationDbContext();
                    var roleStore = new RoleStore<IdentityRole>(context);

                    var myRoles = new List<string>();

                    var roleMgr = new RoleManager<IdentityRole>(roleStore);
                    foreach (var role in roleMgr.Roles.ToList())
                    {
                        myRoles.Add(role.Name);
                    }
                    ddList.DataSource = myRoles;
                    ddList.DataBind();

                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["role"].ToString();
                }
            }
        }

        protected void UserRoleGrid_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            e.Cancel = true;
        }
    }
}