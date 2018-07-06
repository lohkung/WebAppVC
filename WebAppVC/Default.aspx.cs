using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppVC
    
{
    public partial class Default : System.Web.UI.Page
    {
        practiceEntities edm = new practiceEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            for(int i = 1; i<=5; i++)
            {
                Response.Write("<font size="+ i + ">Hello ASP.NET 4.6 VC#" + "</font><br/>");

            }
            div1.Style["color"] = "blue"; 

            if (Page.IsPostBack == true)
            {
                Response.Write(txtData.Text);

                Response.Write(ListBox1.SelectedItem.Text);
            }

            var order = from o in edm.Orders select o;
            if (order.Count() > 0)
            {
                foreach(var o in order.ToList())
                {
                    Response.Write(o.OrderNumber);
                    
                    Response.Write(o.Person.FirstName);

                    Response.Write("<br/>");
                }
               
            }
            var obj = from o in edm.Orders
                      from p in edm.Persons
                      where o.PersonID == p.ID
                      select new
                      {
                          OrderId = o.OrderID,
                          PersonName = p.FirstName + " " + p.LastName
                      };


            foreach (var o in obj.ToList())
            {
                Response.Write(o.OrderId);

                Response.Write(o.PersonName);

                Response.Write("<br/>");
            }

        }

        protected void cmdCheck_Click(object sender, EventArgs e)
        {
            Response.Write(txtData.Text);
        }
    }
}