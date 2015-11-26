using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho3
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Feeds_SelectedIndexChanged(object sender, EventArgs e)
        {
            XmlDocument doc = XmlDataSource1.GetXmlDocument();
            var node = doc.SelectSingleNode("/feeds/feed[@name='" + Feeds.SelectedValue + "']");
            XmlDataSourceDynamic.DataFile = node.Attributes["url"].Value.ToString();
            XmlDataSourceDynamic.DataBind();

            XmlDocument feed = new XmlDocument();
            feed.Load(node.Attributes["url"].Value.ToString());
            var urlnode = feed.SelectSingleNode("/rss/channel/image/url");
            if (urlnode != null && urlnode.InnerText != "")
            {
                logo.ImageUrl = urlnode.InnerText;
                logo.DataBind();
            } else
            {
                logo.ImageUrl = "~/Content/noimage.png";
                logo.DataBind();
            }

            Xml1.Document = feed;
            Xml1.DataBind();
        }
        
        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
        }

        protected void XmlDataSourceDynamic_Load(object sender, EventArgs e)
        {
            //Feeds_SelectedIndexChanged(sender, e);
        }
    }
}