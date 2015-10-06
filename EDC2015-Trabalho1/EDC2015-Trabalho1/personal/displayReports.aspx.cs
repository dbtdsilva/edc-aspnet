using EDC2015_Trabalho1.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Web;

namespace EDC2015_Trabalho1.personal
{
    public partial class displayReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            var currentUser = manager.FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());

            SqlDataSource1.SelectParameters["UserName"].DefaultValue = currentUser.FullName;
        }
    }
}