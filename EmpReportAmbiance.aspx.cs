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
    public partial class EmpReportAmbiance : System.Web.UI.Page
    {
        string BrncIP, bic;
        int employeeID;
        string empComment;
        string ambiImage;

        DataSet dsBranchData = new DataSet();
        protected void Page_Load(object sender, EventArgs e)
        {
            BrncIP = "172.18.200.173";
            if (!IsPostBack)
            {
                branchInfo();
             
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            employeeID = Convert.ToInt32(txtEmpId.Text.Trim().ToString());
            empComment = txtcomment.Text.ToString();

            string filename = ambimg.FileName.ToString();

            //Save the image path to database
            ambiImage = "empambImage/" + filename.ToString();

            //save the image to server floder
            ambimg.PostedFile.SaveAs(Server.MapPath("~/empambImage/") + filename);

            int brnch = Convert.ToInt32(bic);
         
            SaveEmpAmbianceData(employeeID, empComment, brnch, ambiImage);


        }

        public void SaveEmpAmbianceData(int id, string cmnt, int bic,string imageurl)
        {
            string connstring = ConfigurationManager.ConnectionStrings["mysqlConn"].ToString();

            MySqlConnection connection = new MySqlConnection(connstring);
            MySqlCommand cmdGetUserData = new MySqlCommand("INSERT INTO `empambiancereport` (`empid`, `message`, `bic`, `ambimg`,`status`) VALUES ('"+id+"', '"+cmnt+"', '"+bic+"', '"+imageurl+"','Open');", connection);

            connection.Open();

            int i = cmdGetUserData.ExecuteNonQuery();

            if (i == 0)
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Opps Somthing went wrong... Try Again');", true);


                connection.Close();
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(Page, typeof(Page), "Script", "alert('Report Logged Successfully...');", true);
                txtEmpId.Text = "";
                txtcomment.Text = "";
                connection.Close();
            }

        }

        protected void btnFeedback_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeFeedback.aspx");
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

            connection.Close();
        }
        
    }
}