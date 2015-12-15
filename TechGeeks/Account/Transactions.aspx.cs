using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechGeeks.Account
{
    public partial class Transactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["userid"].DefaultValue = Context.User.Identity.GetUserId();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Feedback")
            {
                string constring = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                using (SqlCommand cmd = new SqlCommand("sp_insertReview", con))
                {
                    var a = GridView1.FindControl("modal" + e.CommandArgument);
                    var b = GridView1.FindControl("data");
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ProductId", e.CommandArgument);
                    cmd.Parameters.AddWithValue("@UserId", Context.User.Identity.GetUserId());
                    cmd.Parameters.AddWithValue("@Review", ((TextBox) GridView1.FindControl("modal" + e.CommandArgument).FindControl("data")).Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}