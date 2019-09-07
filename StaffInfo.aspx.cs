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
    public partial class StaffInfo : System.Web.UI.Page
    {
        string bic;
        DataSet dsUerData = new DataSet();
        DataSet dsUerAdminData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            dsUerAdminData = (DataSet)Session["usrData"];

            bic = dsUerAdminData.Tables[0].Rows[0]["branch"].ToString();

            //  admBranch.Text = Session["adminBranch"].ToString();


            admBranch.Text = bic + " - " + dsUerAdminData.Tables[0].Rows[0]["branchname"].ToString(); ;

            if (!IsPostBack)
            {
                branchStaffList();
                AdminIfo();
            }
        }


        public void AdminIfo()
        {
            Label ubic = (Label)Page.Master.FindControl("BranchBic");
            ubic.Text = bic;
            Image uimage = (Image)Page.Master.FindControl("uimage");

            Label uname = (Label)Page.Master.FindControl("admname");
            uname.Text = dsUerAdminData.Tables[0].Rows[0]["UsrName"].ToString();
            uimage.ImageUrl = dsUerAdminData.Tables[0].Rows[0]["photo"].ToString();

        }


        public void branchStaffList()
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM staffinfo where branch='" + bic + "'", connection);

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);

            BranchstaffInfo.DataSource = dsUerData;
            BranchstaffInfo.DataBind();
        }
    }
}