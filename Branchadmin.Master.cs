using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SyndAmbiance
{
    public partial class Branchadmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //  DataSet admData = new DataSet();

           // if (Session["ItemsInCart"] != null)
           // { 
           //     admData=(DataSet)Session["ItemsInCart"];

           //     BranchBic.Text = admData.Tables[0].Rows[0]["branch"].ToString();
           // }
           //// admnBranch.Text = Session["ItemsInCart"].ToString();
        }
    }
}