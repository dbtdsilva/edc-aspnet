using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EDC2015_Trabalho2
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CourseTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "/cursos/curso[@Grau='" + CourseTypes.SelectedValue + "' and @Local='" + LocaisTypes.SelectedValue + "']";
        }

        protected void LocaisTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "/cursos/curso[@Grau='" + CourseTypes.SelectedValue + "' and @Local='" + LocaisTypes.SelectedValue + "']";
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            XmlDataSource1.XPath = "/cursos/curso[@Grau='" + CourseTypes.SelectedValue + "' and @Local='" + LocaisTypes.SelectedValue + "']";
        }
    }
}