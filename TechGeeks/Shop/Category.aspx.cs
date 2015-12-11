using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechGeeks.Shop
{
    public partial class Category : System.Web.UI.Page
    {
        private string category;
        protected void Page_Load(object sender, EventArgs e)
        {
            string category = Page.RouteData.Values["category"] as string;
            categoryTitle.Text = category;
        }

        public string getCategory
        {
            get { return category; }
        }
    }
}