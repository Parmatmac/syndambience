using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace SyndAmbiance
{
    public partial class ROLogin : System.Web.UI.Page
    {

        string userid = null;
        string password = null;
        DataSet dsUerData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            userid = txtUsrId.Text.ToString().Trim();
            password = txtUsrPass.Text.ToString().Trim();

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT a.usrid, a.UsrName,a.usrpass,a.photo, a.branch, b.branchname FROM user as a  join syndbranch as b where a.branch=b.branchbic and a.usrid='" + userid + "' and usrpass='" + password + "'", connection);

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);


            //string branch = dsUerData.Tables[0].Rows[0]["branch"].ToString();


            Session["usrROData"] = dsUerData;

            // Session["adminBranch"] = branch.ToString();

            if (dsUerData.Tables[0].Rows.Count > 0)
            {
                //System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert(' Welcome : " + dsUerData.Tables[0].Rows[0]["uname"].ToString() + "..!!');", true);
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Username or password incorrect. Please Try again..!!');", true);

            }


        }
    }
}