using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace EDC2015_Trabalho2
{
    public partial class Properties : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource1.DataFile));
            XmlElement oProperty = xdoc.SelectSingleNode("/properties/property[@nregister=" + e.OldValues["nregister"] + "]") as XmlElement;
            oProperty.Attributes["type"].Value = e.NewValues["type"].ToString();
            oProperty.Attributes["nregister"].Value = e.NewValues["nregister"].ToString();

            XmlElement oValue = oProperty.SelectSingleNode("value") as XmlElement;
            oValue.Attributes["cost"].Value = e.NewValues["cost"].ToString();
            oValue.Attributes["currency"].Value = e.NewValues["currency"].ToString();

            XmlElement oAddress = oProperty.SelectSingleNode("address") as XmlElement;
            oAddress.Attributes["city"].Value = e.NewValues["city"].ToString();
            oAddress.Attributes["street"].Value = e.NewValues["street"].ToString();
            oAddress.Attributes["port"].Value = e.NewValues["port"].ToString();
            xdoc.Save(Server.MapPath(XmlDataSource1.DataFile));

            e.Cancel = true;

            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource1.DataFile));
            XmlElement oProperty = xdoc.SelectSingleNode("/properties/property[@nregister=" + e.Values["nregister"] + "]") as XmlElement;
            xdoc.DocumentElement.RemoveChild(oProperty);
            xdoc.Save(Server.MapPath(XmlDataSource1.DataFile));

            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource1.DataFile));
            XmlElement oProperties = xdoc.SelectSingleNode("/properties") as XmlElement;
            
            XmlElement oProperty = xdoc.CreateElement("property");
            XmlAttribute aType = xdoc.CreateAttribute("type");
            XmlAttribute aRegister = xdoc.CreateAttribute("nregister");
            aType.Value = (GridView1.FooterRow.FindControl("newType") as TextBox).Text;
            aRegister.Value = (GridView1.FooterRow.FindControl("newNRegister") as TextBox).Text;
            oProperty.Attributes.Append(aType);
            oProperty.Attributes.Append(aRegister);

            XmlElement oValue = xdoc.CreateElement("value");
            XmlAttribute aCost = xdoc.CreateAttribute("cost");
            XmlAttribute aCurrency = xdoc.CreateAttribute("currency");
            aCost.Value = (GridView1.FooterRow.FindControl("newCost") as TextBox).Text;
            aCurrency.Value = (GridView1.FooterRow.FindControl("newCurrency") as TextBox).Text;
            oValue.Attributes.Append(aCost);
            oValue.Attributes.Append(aCurrency);

            XmlElement oAddress = xdoc.CreateElement("address");
            XmlAttribute aCity = xdoc.CreateAttribute("city");
            XmlAttribute aStreet = xdoc.CreateAttribute("street");
            XmlAttribute aPort = xdoc.CreateAttribute("port");
            aCity.Value = (GridView1.FooterRow.FindControl("newCity") as TextBox).Text;
            aStreet.Value = (GridView1.FooterRow.FindControl("newStreet") as TextBox).Text;
            aPort.Value = (GridView1.FooterRow.FindControl("newPort") as TextBox).Text;
            oAddress.Attributes.Append(aCity);
            oAddress.Attributes.Append(aStreet);
            oAddress.Attributes.Append(aPort);

            oProperty.AppendChild(oValue);
            oProperty.AppendChild(oAddress);
            oProperties.AppendChild(oProperty);
            //xdoc.DocumentElement.AppendChild(oProperty);
            xdoc.Save(Server.MapPath(XmlDataSource1.DataFile));
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource1.DataFile));
            XmlElement oOwner = xdoc.SelectSingleNode("/properties/property[@nregister=" + e.OldValues["nregister"] + "]/"+
                "owners/owner[@taxnumber=" + e.OldValues["taxnumber"]+"]") as XmlElement;
            oOwner.Attributes["taxnumber"].Value = e.NewValues["taxnumber"].ToString();

            XmlElement oPurchase = oOwner.SelectSingleNode("purchase") as XmlElement;
            oPurchase.Attributes["date"].Value = e.NewValues["date"].ToString();

            XmlElement oName = oOwner.SelectSingleNode("name") as XmlElement;
            oName.Attributes["firstname"].Value = e.NewValues["firstname"].ToString();
            oName.Attributes["lastname"].Value = e.NewValues["lastname"].ToString();
            xdoc.Save(Server.MapPath(XmlDataSource1.DataFile));

            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource2.DataFile));
            XmlElement oOwner = xdoc.SelectSingleNode("/properties/property/owners/owner[@taxnumber=" + e.Values["taxnumber"] + "]") as XmlElement;
            oOwner.ParentNode.RemoveChild(oOwner);
            xdoc.Save(Server.MapPath(XmlDataSource2.DataFile));

            e.Cancel = true;
            Response.Redirect(Request.RawUrl);
        }

        protected void InsertButton_PropertyOwner_Click(object sender, EventArgs e)
        {
            XmlDocument xdoc = new XmlDocument();
            xdoc.Load(Server.MapPath(XmlDataSource2.DataFile));
            
            XmlElement oProperties = xdoc.SelectSingleNode("/properties/property[@nregister=" +
                 (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]") as XmlElement;

            if (oProperties == null)
            {
                // Handle error when "Register Number" of property doesnt exist yet.
            }
            else
            {
                XmlElement owners = xdoc.SelectSingleNode("/properties/property[@nregister=" +
                    (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]/owners") as XmlElement;
                if (owners == null)
                {
                    owners = xdoc.CreateElement("owners");
                    oProperties.AppendChild(owners);
                }
                else if (owners.ChildNodes.Count != 0)
                {
                    XmlElement lastOwnerPurchase = xdoc.SelectSingleNode("/properties/property[@nregister=" +
                        (GridView2.FooterRow.FindControl("newOwnerRegister") as TextBox).Text + "]/owners"+
                        "/owner[last()]/purchase") as XmlElement;
                    XmlAttribute aSold = xdoc.CreateAttribute("sold");
                    aSold.Value = (GridView2.FooterRow.FindControl("newDate") as TextBox).Text;
                    lastOwnerPurchase.Attributes.Append(aSold);
                }

                XmlElement newOwner = xdoc.CreateElement("owner");
                XmlAttribute aTaxnumber = xdoc.CreateAttribute("taxnumber");
                aTaxnumber.Value = (GridView2.FooterRow.FindControl("newTaxNumber") as TextBox).Text;
                newOwner.Attributes.Append(aTaxnumber);

                XmlElement oPurchase = xdoc.CreateElement("purchase");
                XmlAttribute aDate = xdoc.CreateAttribute("date");
                aDate.Value = (GridView2.FooterRow.FindControl("newDate") as TextBox).Text;
                oPurchase.Attributes.Append(aDate);

                XmlElement oName = xdoc.CreateElement("name");
                XmlAttribute aFirstName = xdoc.CreateAttribute("firstname");
                XmlAttribute aLastName = xdoc.CreateAttribute("lastname");
                aFirstName.Value = (GridView2.FooterRow.FindControl("newFirstName") as TextBox).Text;
                aLastName.Value = (GridView2.FooterRow.FindControl("newLastName") as TextBox).Text;
                oName.Attributes.Append(aFirstName);
                oName.Attributes.Append(aLastName);

                newOwner.AppendChild(oPurchase);
                newOwner.AppendChild(oName);
                owners.AppendChild(newOwner);

                xdoc.Save(Server.MapPath(XmlDataSource2.DataFile));
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void search_Click(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "properties/property[@taxnumber='" + taxNumber.Text+"']";
        }

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            XmlDataSource3.XPath = "properties/property[@taxnumber='" + taxNumber.Text + "']";
        }

    }
}