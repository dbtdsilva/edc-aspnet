using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TechGeeks.Models;

namespace TechGeeks.Account
{
    public partial class EditProfile : System.Web.UI.Page
    {
        public ApplicationUser currentUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            var manager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(new ApplicationDbContext()));
            currentUser = manager.FindById(System.Web.HttpContext.Current.User.Identity.GetUserId());
        }
    }
}