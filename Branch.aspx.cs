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
    public partial class Branch : System.Web.UI.Page
    {
        string BrncIP, bic;
        DataSet dsBranchData = new DataSet();
        DataSet dsUserData = new DataSet();
        DataSet dsStaffData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            BrncIP = "172.18.200.173";
            if (!IsPostBack)
            {
                branchInfo();
                BranchAdminData();
                BranchStaffData();
            }
        }

        public void branchInfo()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT a.branchimage,a.branchbic,a.branchname,a.robic, b.roname,b.zone,c.zonename,a.branchip FROM syndbranch as a inner join syndro as b inner join syndzone as c where a.robic=b.robic and b.zone=c.zonebic and a.branchip='" + BrncIP + "';", connection);

            connection.Open();

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsBranchData);

            bic = dsBranchData.Tables[0].Rows[0]["branchbic"].ToString();
            string branchName = dsBranchData.Tables[0].Rows[0]["branchbic"].ToString() + " - " + dsBranchData.Tables[0].Rows[0]["branchname"].ToString();
            lblbranch.Text = branchName;

            branchImage.ImageUrl = dsBranchData.Tables[0].Rows[0]["branchimage"].ToString();

            lblzone.Text = dsBranchData.Tables[0].Rows[0]["zonename"].ToString();

            lblro.Text = dsBranchData.Tables[0].Rows[0]["roname"].ToString();

          
            connection.Close();
        }


        public void BranchAdminData()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM syndambiance.user where branch='"+bic+"'", connection);

            connection.Open();

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUserData);

            grdAdminData.DataSource = dsUserData;
            grdAdminData.DataBind();

            connection.Close();
        }

        public void BranchStaffData()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM staffinfo where branch='" + bic + "'", connection);

            connection.Open();

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsStaffData);

            BranchstaffInfo.DataSource = dsStaffData;
            BranchstaffInfo.DataBind();

            connection.Close();
        }


    }
}