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
    public partial class index : System.Web.UI.Page
    {
        string bic, adminname;
        DataSet dsUerData = new DataSet();
        DataSet dsUerAdminData = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            dsUerAdminData = (DataSet)Session["usrROData"];

            bic = dsUerAdminData.Tables[0].Rows[0]["branch"].ToString();

           
            if (!IsPostBack)
            {
                TotalBranches();
                TotalROs();
                AdminIfo();
            }
        }

        public void AdminIfo()
        {
           
            Image uimage = (Image)Page.Master.FindControl("uimage");

            Label uname = (Label)Page.Master.FindControl("admname");
            uname.Text = dsUerAdminData.Tables[0].Rows[0]["UsrName"].ToString();
            uimage.ImageUrl = dsUerAdminData.Tables[0].Rows[0]["photo"].ToString();

            adminname = uname.Text.ToString();

        }

        public void TotalBranches()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT count(branchbic) FROM syndbranch;", connection);

            connection.Open();

            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);
            lblTotalBranch.Text = dsUerData.Tables[0].Rows[0][0].ToString();
            connection.Close();
        }

        public void TotalROs()
        {

            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("SELECT * FROM syndro;", connection);
            connection.Open();
            MySqlDataAdapter adp = new MySqlDataAdapter();
            adp.SelectCommand = cmdGetUserData;
            adp.Fill(dsUerData);
            lbltotalRO.Text = dsUerData.Tables[0].Rows.Count.ToString();
            connection.Close();
        }


    }
}